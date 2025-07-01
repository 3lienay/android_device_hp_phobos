# device/hp/phobos/dtbimage/Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := dtbimage
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_INTERMEDIATES)
LOCAL_SRC_FILES := ../../phobos/dtb.img
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
