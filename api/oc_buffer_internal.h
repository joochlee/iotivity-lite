/****************************************************************************
 *
 * Copyright 2022 Daniel Adam, All Rights Reserved.
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

#ifndef OC_BUFFER_INTERNAL_H
#define OC_BUFFER_INTERNAL_H

#include "api/oc_tcp_internal.h"
#include "port/oc_connectivity.h"
#include "util/oc_features.h"
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Start the message buffer handler process
 */
void oc_message_buffer_handler_start(void);

/**
 * @brief Stop the message buffer handler process
 */
void oc_message_buffer_handler_stop(void);

/**
 * @brief Allocate incoming message of given size.
 *
 * @note \p size is ignored of the data buffer is statically allocated
 *
 * @param size size of the message
 * @return oc_message_t* message with allocated buffer
 * @return NULL on error
 */
oc_message_t *oc_message_allocate_with_size(size_t size);

/**
 * @brief Allocate message.
 *
 * @return oc_message_t* the CoAP message
 * @return NULL on error
 */
oc_message_t *oc_message_allocate_outgoing(void);

/**
 * @brief Allocate outgoing message of given size.
 *
 * @note \p size is ignored of the data buffer is statically allocated
 *
 * @param size size of the message
 * @return oc_message_t* message with allocated buffer
 * @return NULL on error
 */
oc_message_t *oc_message_allocate_outgoing_with_size(size_t size);

/**
 * @brief Get size of the message buffer
 *
 * The size of the buffer depends on compilation options (it may be static or
 * dynamic and have differing sizes).
 *
 * @return size_t size of the message buffer
 */
size_t oc_message_buffer_size(void);

#ifdef OC_HAS_FEATURE_TCP_ASYNC_CONNECT
/**
 * @brief finish connecting tcp session
 *
 * @param event on tcp connect event
 */
void oc_tcp_connect_session(oc_tcp_on_connect_event_t *event);
#endif /* OC_HAS_FEATURE_TCP_ASYNC_CONNECT */

#ifdef OC_SECURITY
/**
 * @brief close all tls session for the specific device
 *
 * @param device the device index
 */
void oc_close_all_tls_sessions_for_device(size_t device);
#endif /* OC_SECURITY */

#ifdef __cplusplus
}
#endif

#endif /* OC_BUFFER_INTERNAL_H */
