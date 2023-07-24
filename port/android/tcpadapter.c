/****************************************************************************
 *
 * Copyright 2018 Samsung Electronics All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"),
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 *
 ****************************************************************************/

#define __USE_GNU

#include "api/oc_message_internal.h"
#include "api/oc_session_events_internal.h"
#include "api/oc_tcp_internal.h"
#include "ipcontext.h"
#include "messaging/coap/coap.h"
#include "oc_endpoint.h"
#include "oc_session_events.h"
#include "port/oc_assert.h"
#include "port/oc_log_internal.h"
#include "tcpadapter.h"
#include "util/oc_memb.h"
#include <arpa/inet.h>
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <net/if.h>
#include <stdlib.h>
#include <unistd.h>

#include <android/api-level.h>
#if !defined(__ANDROID_API__) || __ANDROID_API__ == 10000
#error __ANDROID_API__ not defined
#endif
#include <arpa/inet.h>
#if __ANDROID_API__ >= 24
#include <ifaddrs.h>
#define OC_GETIFADDRS getifaddrs
#define OC_FREEIFADDRS freeifaddrs
#else
#include "ifaddrs-android.h"
#define OC_GETIFADDRS android_getifaddrs
#define OC_FREEIFADDRS android_freeifaddrs
#endif /* __ANDROID_API__ >= 24 */

#ifdef OC_TCP

#define OC_TCP_LISTEN_BACKLOG 3

#define TLS_HEADER_SIZE 5

#define DEFAULT_RECEIVE_SIZE                                                   \
  (COAP_TCP_DEFAULT_HEADER_LEN + COAP_TCP_MAX_EXTENDED_LENGTH_LEN)

#define LIMIT_RETRY_CONNECT 5

#define TCP_CONNECT_TIMEOUT 5

typedef struct tcp_session
{
  struct tcp_session *next;
  ip_context_t *dev;
  oc_endpoint_t endpoint;
  int sock;
  tcp_csm_state_t csm_state;
} tcp_session_t;

OC_LIST(session_list);
OC_MEMB(tcp_session_s, tcp_session_t, OC_MAX_TCP_PEERS);

static int
configure_tcp_socket(int sock, struct sockaddr_storage *sock_info)
{
  int reuse = 1;
  if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &reuse, sizeof(reuse)) == -1) {
    OC_ERR("setting reuseaddr option %d", errno);
    return -1;
  }
  if (bind(sock, (struct sockaddr *)sock_info, sizeof(*sock_info)) == -1) {
    OC_ERR("binding socket %d", errno);
    return -1;
  }
  if (listen(sock, OC_TCP_LISTEN_BACKLOG) == -1) {
    OC_ERR("listening socket %d", errno);
    return -1;
  }

  return 0;
}

static int
get_assigned_tcp_port(int sock, struct sockaddr_storage *sock_info)
{

  socklen_t socklen = sizeof(*sock_info);
  if (getsockname(sock, (struct sockaddr *)sock_info, &socklen) == -1) {
    OC_ERR("obtaining socket information %d", errno);
    return -1;
  }

  return 0;
}

static long
get_interface_index(int sock)
{
  struct sockaddr_storage addr;
  socklen_t socklen = sizeof(addr);
  if (getsockname(sock, (struct sockaddr *)&addr, &socklen) == -1) {
    OC_ERR("failed obtaining socket information %d", errno);
    return -1;
  }

  struct ifaddrs *ifs = NULL;
  if (OC_GETIFADDRS(&ifs) < 0) {
    OC_ERR("failed querying interfaces: %d", errno);
    return -1;
  }

  unsigned if_index = 0;
  for (struct ifaddrs *interface = ifs; interface != NULL;
       interface = interface->ifa_next) {
    if ((interface->ifa_flags & IFF_UP) == 0 ||
        (interface->ifa_flags & IFF_LOOPBACK) != 0)
      continue;

    if (addr.ss_family != interface->ifa_addr->sa_family) {
      continue;
    }
    if (addr.ss_family == AF_INET6) {
      struct sockaddr_in6 *a = (struct sockaddr_in6 *)interface->ifa_addr;
      struct sockaddr_in6 *b = (struct sockaddr_in6 *)&addr;
      if (memcmp(a->sin6_addr.s6_addr, b->sin6_addr.s6_addr, 16) == 0) {
        if_index = if_nametoindex(interface->ifa_name);
        if (if_index == 0) {
          OC_ERR("failed obtaining interface(%s) index: %d",
                 interface->ifa_name, (int)errno);
          OC_FREEIFADDRS(ifs);
          return -1;
        }
        break;
      }
    }
#ifdef OC_IPV4
    else if (addr.ss_family == AF_INET) {
      struct sockaddr_in *a = (struct sockaddr_in *)interface->ifa_addr;
      struct sockaddr_in *b = (struct sockaddr_in *)&addr;
      if (a->sin_addr.s_addr == b->sin_addr.s_addr) {
        unsigned if_index = if_nametoindex(interface->ifa_name);
        if (if_index == 0) {
          OC_ERR("failed obtaining interface(%s) index: %d",
                 interface->ifa_name, (int)errno);
          OC_FREEIFADDRS(ifs);
          return -1;
        }
        break;
      }
    }
#endif /* OC_IPV4 */
  }

  OC_FREEIFADDRS(ifs);
  return if_index;
}

void
oc_tcp_add_socks_to_fd_set(ip_context_t *dev)
{
  FD_SET(dev->tcp.server_sock, &dev->rfds);
#ifdef OC_SECURITY
  FD_SET(dev->tcp.secure_sock, &dev->rfds);
#endif /* OC_SECURITY */

#ifdef OC_IPV4
  FD_SET(dev->tcp.server4_sock, &dev->rfds);
#ifdef OC_SECURITY
  FD_SET(dev->tcp.secure4_sock, &dev->rfds);
#endif /* OC_SECURITY */
#endif /* OC_IPV4 */
  FD_SET(dev->tcp.connect_pipe[0], &dev->rfds);
}

static void
free_tcp_session(tcp_session_t *session)
{
  oc_list_remove(session_list, session);

  if (!oc_session_events_disconnect_is_ongoing()) {
    oc_session_end_event(&session->endpoint);
  }

  FD_CLR(session->sock, &session->dev->rfds);

  ssize_t len = 0;
  do {
    uint8_t dummy_value = 0xef;
    len = write(session->dev->tcp.connect_pipe[1], &dummy_value, 1);
  } while (len == -1 && errno == EINTR);

  close(session->sock);

  oc_memb_free(&tcp_session_s, session);

  OC_DBG("freed TCP session");
}

static int
add_new_session(int sock, ip_context_t *dev, oc_endpoint_t *endpoint,
                tcp_csm_state_t state)
{
  long if_index = get_interface_index(sock);
  if (if_index == -1) {
    OC_ERR("could not obtain interface index");
    return -1;
  }

  tcp_session_t *session = oc_memb_alloc(&tcp_session_s);
  if (!session) {
    OC_ERR("could not allocate new TCP session object");
    return -1;
  }

  endpoint->interface_index = (unsigned)if_index;

  session->dev = dev;
  memcpy(&session->endpoint, endpoint, sizeof(oc_endpoint_t));
  session->endpoint.next = NULL;
  session->sock = sock;
  session->csm_state = state;

  oc_list_add(session_list, session);

  if (!(endpoint->flags & SECURED)) {
    oc_session_start_event(endpoint);
  }

  OC_DBG("recorded new TCP session");
  return 0;
}

static int
accept_new_session(ip_context_t *dev, int fd, fd_set *setfds,
                   oc_endpoint_t *endpoint)
{
  struct sockaddr_storage receive_from;
  socklen_t receive_len = sizeof(receive_from);

  int new_socket = accept(fd, (struct sockaddr *)&receive_from, &receive_len);
  if (new_socket < 0) {
    OC_ERR("failed to accept incoming TCP connection");
    return -1;
  }
  OC_DBG("accepted incomming TCP connection");

  if (endpoint->flags & IPV6) {
    struct sockaddr_in6 *r = (struct sockaddr_in6 *)&receive_from;
    memcpy(endpoint->addr.ipv6.address, r->sin6_addr.s6_addr,
           sizeof(r->sin6_addr.s6_addr));
    endpoint->addr.ipv6.scope = r->sin6_scope_id;
    endpoint->addr.ipv6.port = ntohs(r->sin6_port);
#ifdef OC_IPV4
  } else if (endpoint->flags & IPV4) {
    struct sockaddr_in *r = (struct sockaddr_in *)&receive_from;
    memcpy(endpoint->addr.ipv4.address, &r->sin_addr.s_addr,
           sizeof(r->sin_addr.s_addr));
    endpoint->addr.ipv4.port = ntohs(r->sin_port);
#endif /* !OC_IPV4 */
  }

  FD_CLR(fd, setfds);

  if (add_new_session(new_socket, dev, endpoint, CSM_NONE) < 0) {
    OC_ERR("could not record new TCP session");
    close(new_socket);
    return -1;
  }

  FD_SET(new_socket, &dev->rfds);

  return 0;
}

static tcp_session_t *
find_session_by_endpoint(const oc_endpoint_t *endpoint)
{
  tcp_session_t *session = oc_list_head(session_list);
  while (session != NULL &&
         oc_endpoint_compare(&session->endpoint, endpoint) != 0) {
    session = session->next;
  }

  if (!session) {
    OC_DBG("could not find ongoing TCP session for");
    OC_LOGipaddr(*endpoint);
    OC_DBG("%s", "");
    return NULL;
  }
  OC_DBG("found TCP session for");
  OC_LOGipaddr(*endpoint);
  OC_DBG("%s", "");
  return session;
}

static tcp_session_t *
get_ready_to_read_session(fd_set *setfds)
{
  tcp_session_t *session = oc_list_head(session_list);
  while (session != NULL && !FD_ISSET(session->sock, setfds)) {
    session = session->next;
  }

  if (!session) {
    OC_ERR("could not find any open ready-to-read session");
    return NULL;
  }
  return session;
}

static size_t
get_total_length_from_header(oc_message_t *message, oc_endpoint_t *endpoint)
{
  size_t total_length = 0;
  if (endpoint->flags & SECURED) {
    //[3][4] bytes in tls header are tls payload length
    total_length =
      TLS_HEADER_SIZE + (size_t)((message->data[3] << 8) | message->data[4]);
  } else {
    total_length = coap_tcp_get_packet_size(message->data);
  }

  return total_length;
}

adapter_receive_state_t
oc_tcp_receive_message(ip_context_t *dev, fd_set *fds, oc_message_t *message)
{
  pthread_mutex_lock(&dev->tcp.mutex);

#define ret_with_code(status)                                                  \
  ret = status;                                                                \
  goto oc_tcp_receive_message_done

  adapter_receive_state_t ret = ADAPTER_STATUS_ERROR;
  message->endpoint.device = dev->device;

  if (FD_ISSET(dev->tcp.server_sock, fds)) {
    message->endpoint.flags = IPV6 | TCP | ACCEPTED;
    if (accept_new_session(dev, dev->tcp.server_sock, fds, &message->endpoint) <
        0) {
      OC_ERR("accept new session fail");
      ret_with_code(ADAPTER_STATUS_ERROR);
    }
    ret_with_code(ADAPTER_STATUS_ACCEPT);
#ifdef OC_SECURITY
  } else if (FD_ISSET(dev->tcp.secure_sock, fds)) {
    message->endpoint.flags = IPV6 | SECURED | TCP | ACCEPTED;
    if (accept_new_session(dev, dev->tcp.secure_sock, fds, &message->endpoint) <
        0) {
      OC_ERR("accept new session fail");
      ret_with_code(ADAPTER_STATUS_ERROR);
    }
    ret_with_code(ADAPTER_STATUS_ACCEPT);
#endif /* OC_SECURITY */
#ifdef OC_IPV4
  } else if (FD_ISSET(dev->tcp.server4_sock, fds)) {
    message->endpoint.flags = IPV4 | TCP | ACCEPTED;
    if (accept_new_session(dev, dev->tcp.server4_sock, fds,
                           &message->endpoint) < 0) {
      OC_ERR("accept new session fail");
      ret_with_code(ADAPTER_STATUS_ERROR);
    }
    ret_with_code(ADAPTER_STATUS_ACCEPT);
#ifdef OC_SECURITY
  } else if (FD_ISSET(dev->tcp.secure4_sock, fds)) {
    message->endpoint.flags = IPV4 | SECURED | TCP | ACCEPTED;
    if (accept_new_session(dev, dev->tcp.secure4_sock, fds,
                           &message->endpoint) < 0) {
      OC_ERR("accept new session fail");
      ret_with_code(ADAPTER_STATUS_ERROR);
    }
    ret_with_code(ADAPTER_STATUS_ACCEPT);
#endif /* OC_SECURITY */
#endif /* OC_IPV4 */
  } else if (FD_ISSET(dev->tcp.connect_pipe[0], fds)) {
    ssize_t len = read(dev->tcp.connect_pipe[0], message->data, OC_PDU_SIZE);
    if (len < 0) {
      OC_ERR("read error! %d", errno);
      ret_with_code(ADAPTER_STATUS_ERROR);
    }
    FD_CLR(dev->tcp.connect_pipe[0], fds);
    ret_with_code(ADAPTER_STATUS_NONE);
  }

  // find session.
  tcp_session_t *session = get_ready_to_read_session(fds);
  if (!session) {
    OC_DBG("could not find TCP session socket in fd set");
    ret_with_code(ADAPTER_STATUS_NONE);
  }

  // receive message.
  size_t total_length = 0;
  size_t want_read = DEFAULT_RECEIVE_SIZE;
  message->length = 0;
  do {
    int count =
      recv(session->sock, message->data + message->length, want_read, 0);
    if (count < 0) {
      OC_ERR("recv error! %d", errno);

      free_tcp_session(session);

      ret_with_code(ADAPTER_STATUS_ERROR);
    } else if (count == 0) {
      OC_DBG("peer closed TCP session\n");

      free_tcp_session(session);

      ret_with_code(ADAPTER_STATUS_NONE);
    }

    OC_DBG("recv(): %d bytes.", count);
    message->length += (size_t)count;
    want_read -= (size_t)count;

    if (total_length == 0) {
      memcpy(&message->endpoint, &session->endpoint, sizeof(oc_endpoint_t));
#ifdef OC_SECURITY
      if (message->endpoint.flags & SECURED) {
        message->encrypted = 1;
      }
#endif /* OC_SECURITY */
      if (!oc_tcp_is_valid_header(message)) {
        OC_ERR("invalid header");
        free_tcp_session(session);
        ret_with_code(ADAPTER_STATUS_ERROR);
      }
      total_length = get_total_length_from_header(message, &session->endpoint);
      // check to avoid buffer overflow
      if (total_length > oc_message_buffer_size()) {
        OC_ERR(
          "total receive length(%zu) is bigger than message buffer size(%zu)",
          total_length, oc_message_buffer_size());
        free_tcp_session(session);
        ret_with_code(ADAPTER_STATUS_ERROR);
      }
      OC_DBG("tcp packet total length : %zu bytes.", total_length);

      want_read = total_length - (size_t)count;
    }
  } while (total_length > message->length);

  if (!oc_tcp_is_valid_message(message)) {
    free_tcp_session(session);
    return ADAPTER_STATUS_ERROR;
  }

  FD_CLR(session->sock, fds);
  ret = ADAPTER_STATUS_RECEIVE;

oc_tcp_receive_message_done:
  pthread_mutex_unlock(&dev->tcp.mutex);
#undef ret_with_code
  return ret;
}

void
oc_tcp_end_session(ip_context_t *dev, const oc_endpoint_t *endpoint)
{
  pthread_mutex_lock(&dev->tcp.mutex);
  tcp_session_t *session = find_session_by_endpoint(endpoint);
  if (session) {
    free_tcp_session(session);
  }
  pthread_mutex_unlock(&dev->tcp.mutex);
}

static int
get_session_socket(const oc_endpoint_t *endpoint)
{
  int sock = -1;
  const tcp_session_t *session = find_session_by_endpoint(endpoint);
  if (!session) {
    return -1;
  }

  sock = session->sock;
  return sock;
}

static int
connect_nonb(int sockfd, const struct sockaddr *r, int r_len, int nsec)
{
  int error;
  socklen_t len;
  fd_set rset, wset;
  struct timeval tval;

  int flags = fcntl(sockfd, F_GETFL, 0);
  if (flags < 0) {
    OC_ERR("failed to get file descriptor flags (error=%d)", (int)errno);
    return -1;
  }

  if (fcntl(sockfd, F_SETFL, flags | O_NONBLOCK) < 0) {
    OC_ERR("failed to add O_NONBLOCK to file descriptor flags (error=%d)",
           (int)errno);
    return -1;
  }

  int n;
  if ((n = connect(sockfd, (struct sockaddr *)r, r_len)) < 0) {
    if (errno != EINPROGRESS) {
      OC_ERR("failed to connect to address (error=%d)", (int)errno);
      return -1;
    }
  }

  /* Do whatever we want while the connect is taking place. */
  if (n == 0) {
    goto done; /* connect completed immediately */
  }

  FD_ZERO(&rset);
  FD_SET(sockfd, &rset);
  wset = rset;
  tval.tv_sec = nsec;
  tval.tv_usec = 0;

  if ((n = select(sockfd + 1, &rset, &wset, NULL, nsec ? &tval : NULL)) == 0) {
    /* timeout */
    return -1;
  }

  if (!FD_ISSET(sockfd, &rset) && !FD_ISSET(sockfd, &wset)) {
    OC_ERR("select error: sockfd not set");
    return -1;
  }
  len = sizeof(error);
  if (getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &error, &len) < 0) {
    OC_ERR("get socket options error: %d", (int)errno);
    return -1; /* Solaris pending error */
  }
  if (error != 0) {
    OC_ERR("socket error: %d", error);
    return -1;
  }

done:
  if (fcntl(sockfd, F_SETFL, flags) < 0) {
    OC_ERR("failed restore original file descriptor flags (error=%d)",
           (int)errno);
    return -1;
  }
  return 0;
}

static int
initiate_new_session(ip_context_t *dev, oc_endpoint_t *endpoint,
                     const struct sockaddr_storage *receiver)
{
  int sock = -1;
  uint8_t retry_cnt = 0;

  while (retry_cnt < LIMIT_RETRY_CONNECT) {
    if (endpoint->flags & IPV6) {
      sock = socket(AF_INET6, SOCK_STREAM, IPPROTO_TCP);
#ifdef OC_IPV4
    } else if (endpoint->flags & IPV4) {
      sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
#endif
    }

    if (sock < 0) {
      OC_ERR("could not create socket for new TCP session");
      return -1;
    }

    socklen_t receiver_size = sizeof(*receiver);
    if (connect_nonb(sock, (struct sockaddr *)receiver, receiver_size,
                     TCP_CONNECT_TIMEOUT) == 0) {
      break;
    }

    close(sock);
    retry_cnt++;
    OC_DBG("connect failed, retry(%d)", retry_cnt);
  }

  if (retry_cnt >= LIMIT_RETRY_CONNECT) {
    OC_ERR("could not initiate TCP connection");
    return -1;
  }

  OC_DBG("successfully initiated TCP connection");

  if (add_new_session(sock, dev, endpoint, CSM_SENT) < 0) {
    OC_ERR("could not record new TCP session");
    close(sock);
    return -1;
  }

  FD_SET(sock, &dev->rfds);

  ssize_t len = 0;
  do {
    uint8_t dummy_value = 0xef;
    len = write(dev->tcp.connect_pipe[1], &dummy_value, 1);
  } while (len == -1 && errno == EINTR);

  OC_DBG("signaled network event thread to monitor the newly added session\n");

  return sock;
}

int
oc_tcp_send_buffer(ip_context_t *dev, oc_message_t *message,
                   const struct sockaddr_storage *receiver)
{
  pthread_mutex_lock(&dev->tcp.mutex);
  int send_sock = get_session_socket(&message->endpoint);

  size_t bytes_sent = 0;
  if (send_sock < 0) {
    if (message->endpoint.flags & ACCEPTED) {
      OC_ERR("connection was closed");
      goto oc_tcp_send_buffer_done;
    }
    if ((send_sock = initiate_new_session(dev, &message->endpoint, receiver)) <
        0) {
      OC_ERR("could not initiate new TCP session");
      goto oc_tcp_send_buffer_done;
    }
  }

  do {
    ssize_t send_len = send(send_sock, message->data + bytes_sent,
                            message->length - bytes_sent, 0);
    if (send_len < 0) {
      OC_WRN("send() returned errno %d", errno);
      goto oc_tcp_send_buffer_done;
    }
    bytes_sent += send_len;
  } while (bytes_sent < message->length);

  OC_DBG("Sent %zd bytes", bytes_sent);
oc_tcp_send_buffer_done:
  pthread_mutex_unlock(&dev->tcp.mutex);

  if (bytes_sent == 0) {
    return -1;
  }

  return bytes_sent;
}

#ifdef OC_IPV4
static int
tcp_connectivity_ipv4_init(ip_context_t *dev)
{
  OC_DBG("Initializing TCP adapter IPv4 for device %zd", dev->device);

  memset(&dev->tcp.server4, 0, sizeof(struct sockaddr_storage));
  struct sockaddr_in *l = (struct sockaddr_in *)&dev->tcp.server4;
  l->sin_family = AF_INET;
  l->sin_addr.s_addr = INADDR_ANY;
  l->sin_port = 0;

#ifdef OC_SECURITY
  memset(&dev->tcp.secure4, 0, sizeof(struct sockaddr_storage));
  struct sockaddr_in *sm = (struct sockaddr_in *)&dev->tcp.secure4;
  sm->sin_family = AF_INET;
  sm->sin_addr.s_addr = INADDR_ANY;
  sm->sin_port = 0;
#endif /* OC_SECURITY */

  dev->tcp.server4_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

  if (dev->tcp.server4_sock < 0) {
    OC_ERR("creating TCP server socket");
    return -1;
  }

#ifdef OC_SECURITY
  dev->tcp.secure4_sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
  if (dev->tcp.secure4_sock < 0) {
    OC_ERR("creating TCP secure socket");
    return -1;
  }
#endif /* OC_SECURITY */

  if (configure_tcp_socket(dev->tcp.server4_sock, &dev->tcp.server4) < 0) {
    OC_ERR("set socket option in server socket");
    return -1;
  }

  if (get_assigned_tcp_port(dev->tcp.server4_sock, &dev->tcp.server4) < 0) {
    OC_ERR("get port for server socket");
    return -1;
  }
  dev->tcp.port4 = ntohs(((struct sockaddr_in *)&dev->tcp.server4)->sin_port);

#ifdef OC_SECURITY
  if (configure_tcp_socket(dev->tcp.secure4_sock, &dev->tcp.secure4) < 0) {
    OC_ERR("set socket option in secure socket");
    return -1;
  }

  if (get_assigned_tcp_port(dev->tcp.secure4_sock, &dev->tcp.secure4) < 0) {
    OC_ERR("get port for secure socket");
    return -1;
  }
  dev->tcp.tls4_port =
    ntohs(((struct sockaddr_in *)&dev->tcp.secure4)->sin_port);
#endif /* OC_SECURITY */

  OC_DBG("Successfully initialized TCP adapter IPv4 for device %zd",
         dev->device);

  return 0;
}
#endif /* OC_IPV4 */

static int
set_nonblock_socket(int sockfd)
{
  int flags = fcntl(sockfd, F_GETFL, 0);
  if (flags < 0) {
    return -1;
  }

  return fcntl(sockfd, F_SETFL, flags | O_NONBLOCK);
}

int
oc_tcp_connectivity_init(ip_context_t *dev)
{
  OC_DBG("Initializing TCP adapter for device %zd", dev->device);

  if (pthread_mutex_init(&dev->tcp.mutex, NULL) != 0) {
    oc_abort("error initializing TCP adapter mutex");
  }

  memset(&dev->tcp.server, 0, sizeof(struct sockaddr_storage));
  struct sockaddr_in6 *l = (struct sockaddr_in6 *)&dev->tcp.server;
  l->sin6_family = AF_INET6;
  l->sin6_addr = in6addr_any;
  l->sin6_port = 0;

#ifdef OC_SECURITY
  memset(&dev->tcp.secure, 0, sizeof(struct sockaddr_storage));
  struct sockaddr_in6 *sm = (struct sockaddr_in6 *)&dev->tcp.secure;
  sm->sin6_family = AF_INET6;
  sm->sin6_addr = in6addr_any;
  sm->sin6_port = 0;
#endif /* OC_SECURITY */

  dev->tcp.server_sock = socket(AF_INET6, SOCK_STREAM, IPPROTO_TCP);

  if (dev->tcp.server_sock < 0) {
    OC_ERR("creating TCP server socket");
    return -1;
  }

#ifdef OC_SECURITY
  dev->tcp.secure_sock = socket(AF_INET6, SOCK_STREAM, IPPROTO_TCP);
  if (dev->tcp.secure_sock < 0) {
    OC_ERR("creating TCP secure socket");
    return -1;
  }
#endif /* OC_SECURITY */

  if (configure_tcp_socket(dev->tcp.server_sock, &dev->tcp.server) < 0) {
    OC_ERR("set socket option in server socket");
    return -1;
  }

  if (get_assigned_tcp_port(dev->tcp.server_sock, &dev->tcp.server) < 0) {
    OC_ERR("get port for server socket");
    return -1;
  }
  dev->tcp.port = ntohs(((struct sockaddr_in *)&dev->tcp.server)->sin_port);

#ifdef OC_SECURITY
  if (configure_tcp_socket(dev->tcp.secure_sock, &dev->tcp.secure) < 0) {
    OC_ERR("set socket option in secure socket");
    return -1;
  }

  if (get_assigned_tcp_port(dev->tcp.secure_sock, &dev->tcp.secure) < 0) {
    OC_ERR("get port for secure socket");
    return -1;
  }
  dev->tcp.tls_port = ntohs(((struct sockaddr_in *)&dev->tcp.secure)->sin_port);
#endif /* OC_SECURITY */

#ifdef OC_IPV4
  if (tcp_connectivity_ipv4_init(dev) != 0) {
    OC_ERR("Could not initialize IPv4 for TCP");
  }
#endif /* OC_IPV4 */

  if (pipe(dev->tcp.connect_pipe) < 0) {
    OC_ERR("Could not initialize connection pipe");
    return -1;
  }
  if (set_nonblock_socket(dev->tcp.connect_pipe[0]) < 0) {
    OC_ERR("Could not set non-block connect_pipe[0]");
    return -1;
  }

  OC_DBG("=======tcp port info.========");
  OC_DBG("  ipv6 port   : %u", dev->tcp.port);
#ifdef OC_SECURITY
  OC_DBG("  ipv6 secure : %u", dev->tcp.tls_port);
#endif
#ifdef OC_IPV4
  OC_DBG("  ipv4 port   : %u", dev->tcp.port4);
#ifdef OC_SECURITY
  OC_DBG("  ipv4 secure : %u", dev->tcp.tls4_port);
#endif
#endif

  OC_DBG("Successfully initialized TCP adapter for device %zd", dev->device);

  return 0;
}

void
oc_tcp_connectivity_shutdown(ip_context_t *dev)
{
  close(dev->tcp.server_sock);

#ifdef OC_IPV4
  close(dev->tcp.server4_sock);
#endif /* OC_IPV4 */

#ifdef OC_SECURITY
  close(dev->tcp.secure_sock);
#ifdef OC_IPV4
  close(dev->tcp.secure4_sock);
#endif /* OC_IPV4 */
#endif /* OC_SECURITY */

  close(dev->tcp.connect_pipe[0]);
  close(dev->tcp.connect_pipe[1]);

  tcp_session_t *session = (tcp_session_t *)oc_list_head(session_list), *next;
  while (session != NULL) {
    next = session->next;
    if (session->endpoint.device == dev->device) {
      free_tcp_session(session);
    }
    session = next;
  }

  pthread_mutex_destroy(&dev->tcp.mutex);

  OC_DBG("oc_tcp_connectivity_shutdown for device %zd", dev->device);
}

int
oc_tcp_connection_state(const oc_endpoint_t *endpoint)
{
  if (find_session_by_endpoint(endpoint) != NULL) {
    return OC_TCP_SOCKET_STATE_CONNECTED;
  }
  return -1;
}

tcp_csm_state_t
oc_tcp_get_csm_state(const oc_endpoint_t *endpoint)
{
  if (!endpoint) {
    return CSM_ERROR;
  }

  tcp_session_t *session = find_session_by_endpoint(endpoint);
  if (!session) {
    return CSM_NONE;
  }

  return session->csm_state;
}

int
oc_tcp_update_csm_state(const oc_endpoint_t *endpoint, tcp_csm_state_t csm)
{
  if (!endpoint) {
    return -1;
  }

  tcp_session_t *session = find_session_by_endpoint(endpoint);
  if (!session) {
    return -1;
  }

  session->csm_state = csm;
  return 0;
}
#endif /* OC_TCP */
