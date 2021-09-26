# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

#opensslcrypto
include $(CLEAR_VARS)
LOCAL_MODULE := opensslcrypto
LOCAL_SRC_FILES := lib/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

#opensslssl
include $(CLEAR_VARS)
LOCAL_MODULE := opensslssl
LOCAL_SRC_FILES := lib/$(TARGET_ARCH_ABI)/libssl.a
include $(PREBUILT_STATIC_LIBRARY)

_NDK_BITS := 32
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
_NDK_BITS := 64
endif
ifeq ($(TARGET_ARCH_ABI),x86_64)
_NDK_BITS := 64
endif

#sqlcipher
include $(CLEAR_VARS)
LOCAL_MODULE := sqlcipher
LOCAL_SRC_FILES := sqlite3.c
LOCAL_CFLAGS += -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2
LOCAL_CPPFLAGS += -std=c++11 -DSQLITE_HAS_CODEC -DSQLITE_TEMP_STORE=2
// -DHAVE_INTTYPES_H: refer to jni.h, have primative type match up java equivalents

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/include/sqlcipher

LOCAL_STATIC_LIBRARIES := opensslcrypto opensslssl
LOCAL_LDLIBS += -llog -lz -latomic

#rm duplicate code, only valid under armeabi
ifeq ($(TARGET_ARCH_ABI),armeabi)
  LOCAL_LDFLAGS += -Wl,--icf=safe
endif


#ifeq ($(TARGET_ARCH_ABI),x86)
#LOCAL_SRC_FILES += 3rd_party/protobuf/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
#endif
#ifeq ($(TARGET_ARCH_ABI),x86_64)
#LOCAL_SRC_FILES += 3rd_party/protobuf/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
#endif

include $(BUILD_SHARED_LIBRARY)
