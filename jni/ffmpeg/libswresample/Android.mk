LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../av.mk
LOCAL_SRC_FILES := $(FFFILES)
LOCAL_C_INCLUDES :=  \
 $(LOCAL_PATH)  \
 $(LOCAL_PATH)/..
LOCAL_CFLAGS += $(FFCFLAGS)
LOCAL_SHARED_LIBRARIES := libavutil
LOCAL_MODULE := $(FFNAME)
include $(BUILD_SHARED_LIBRARY)
