LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_WHOLE_STATIC_LIBRARIES := libavformat libavcodec libavutil libpostproc libswscale
LOCAL_MODULE := ffmpeg
#FFMPEG_OBJ_PATH := `cygpath -m "$(LOCAL_PATH)/../../obj/local/armeabi"`
#LOCAL_LDLIBS := -L$(call host-path, $(FFMPEG_OBJ_PATH))
#LOCAL_LDLIBS += -lavformat -lavcodec -lavutil -lswscale -lpostproc
include $(BUILD_SHARED_LIBRARY)
include $(call all-makefiles-under,$(LOCAL_PATH))