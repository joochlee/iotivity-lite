/*
 // Copyright (c) 2016 Intel Corporation
 //
 // Licensed under the Apache License, Version 2.0 (the "License");
 // you may not use this file except in compliance with the License.
 // You may obtain a copy of the License at
 //
 //      http://www.apache.org/licenses/LICENSE-2.0
 //
 // Unless required by applicable law or agreed to in writing, software
 // distributed under the License is distributed on an "AS IS" BASIS,
 // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 // See the License for the specific language governing permissions and
 // limitations under the License.
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <contiki-conf.h>

#ifdef __cplusplus
extern "C"
{
#endif

/* Time resolution */
#include <stdint.h>
typedef uint64_t oc_clock_time_t;
#define OC_CLOCK_CONF_TICKS_PER_SECOND CLOCK_CONF_SECOND

#define OC_BYTES_POOL_SIZE (900)
#define OC_INTS_POOL_SIZE (4)
#define OC_DOUBLES_POOL_SIZE (4)

/* Server-side parameters */
/* Maximum number of server resources */
#define OC_MAX_APP_RESOURCES (1)

/* Common paramters */
/* Maximum size of request/response PDUs */
#define OC_MAX_APP_DATA_SIZE (600)

/* Maximum number of concurrent requests */
#define OC_MAX_NUM_CONCURRENT_REQUESTS (2)

/* Maximum number of nodes in a payload tree structure */
#define OC_MAX_NUM_REP_OBJECTS (70)

/* Number of devices on the OCF platform */
#define OC_MAX_NUM_DEVICES (1)

#define OC_MAX_NUM_ENDPOINTS (4)

/* Security layer */
/* Maximum number of authorized clients */
#define OC_MAX_NUM_SUBJECTS (1)

/* Maximum number of concurrent DTLS sessions */
#define OC_MAX_DTLS_PEERS (1)

/* Max inactivity timeout before tearing down DTLS connection */
#define OC_DTLS_INACTIVITY_TIMEOUT (10)

#ifdef __cplusplus
}
#endif

#endif /* CONFIG_H */
