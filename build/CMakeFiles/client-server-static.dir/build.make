# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jclee/Development/Matter/WS_Matter/iotivity-lite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build

# Include any dependencies generated for this target.
include CMakeFiles/client-server-static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/client-server-static.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/client-server-static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/client-server-static.dir/flags.make

# Object files for target client-server-static
client__server__static_OBJECTS =

# External object files for target client-server-static
client__server__static_EXTERNAL_OBJECTS = \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_compare.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_format.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_parse.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_valid.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/port/common/oc_ip.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_etimer.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_list.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_memb.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_mmem.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_process.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_secure_string.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/util/oc_timer.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_tm.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/client/oc_client_cb.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_base64.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_blockwise.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_bridge.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_buffer.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_client_api.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_client_role.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_clock.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_collection.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_core_res.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_discovery.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_endpoint.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_enums.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_event_callback.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_events.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_helpers.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_introspection.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_log.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_main.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_mnt.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_network_events.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_push.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_rep.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_rep_encode.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_rep_to_json.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_resource.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_resource_factory.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_ri.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_ri_server.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_server_api.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_session_events.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_storage.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_swupdate.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_tcp.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_udp.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_uuid.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/api/oc_vod_map.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/coap.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/coap_signal.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/engine.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/observe.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/oscore.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/separate.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/messaging/coap/transactions.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/abort.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/clock.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/dns.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/ipadapter.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/ipcontext.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/netsocket.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/random.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/socklistener.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/storage.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/tcpadapter.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/tcpcontext.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/port/linux/tcpsession.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_acl.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_ael.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_audit.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_certs.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_certs_validate.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_cred.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_csr.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_doxm.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_entropy.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_keypair.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_oscore_context.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_oscore_crypto.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_oscore_engine.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_pki.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_pstat.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_roles.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_sdi.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_security.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_sp.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_store.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_svr.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_tls.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_obt.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_obt_certs.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_obt_otm_cert.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_obt_otm_justworks.c.o" \
"/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-obj.dir/security/oc_obt_otm_randompin.c.o"

libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_compare.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_format.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_parse.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_valid.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/port/common/oc_ip.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_etimer.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_list.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_memb.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_mmem.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_process.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_secure_string.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/util/oc_timer.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/common-obj.dir/api/c-timestamp/timestamp_tm.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/client/oc_client_cb.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_base64.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_blockwise.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_bridge.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_buffer.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_client_api.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_client_role.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_clock.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_collection.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_core_res.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_discovery.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_endpoint.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_enums.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_event_callback.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_events.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_helpers.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_introspection.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_log.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_main.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_mnt.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_network_events.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_push.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_rep.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_rep_encode.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_rep_to_json.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_resource.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_resource_factory.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_ri.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_ri_server.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_server_api.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_session_events.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_storage.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_swupdate.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_tcp.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_udp.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_uuid.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/api/oc_vod_map.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/coap.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/coap_signal.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/engine.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/observe.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/oscore.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/separate.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/messaging/coap/transactions.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/abort.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/clock.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/dns.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/ipadapter.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/ipcontext.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/netsocket.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/random.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/socklistener.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/storage.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/tcpadapter.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/tcpcontext.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/port/linux/tcpsession.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_acl.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_ael.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_audit.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_certs.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_certs_validate.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_cred.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_csr.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_doxm.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_entropy.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_keypair.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_oscore_context.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_oscore_crypto.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_oscore_engine.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_pki.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_pstat.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_roles.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_sdi.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_security.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_sp.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_store.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_svr.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_tls.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_obt.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_obt_certs.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_obt_otm_cert.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_obt_otm_justworks.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-obj.dir/security/oc_obt_otm_randompin.c.o
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-static.dir/build.make
libiotivity-lite-client-server-static.a: CMakeFiles/client-server-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking C static library libiotivity-lite-client-server-static.a"
	$(CMAKE_COMMAND) -P CMakeFiles/client-server-static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client-server-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/client-server-static.dir/build: libiotivity-lite-client-server-static.a
.PHONY : CMakeFiles/client-server-static.dir/build

CMakeFiles/client-server-static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/client-server-static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/client-server-static.dir/clean

CMakeFiles/client-server-static.dir/depend:
	cd /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jclee/Development/Matter/WS_Matter/iotivity-lite /home/jclee/Development/Matter/WS_Matter/iotivity-lite /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build /home/jclee/Development/Matter/WS_Matter/iotivity-lite/build/CMakeFiles/client-server-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/client-server-static.dir/depend

