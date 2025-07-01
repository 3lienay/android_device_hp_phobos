LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := vendor_symlink
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)
LOCAL_PREBUILT_MODULE_FILE := /dev/null
include $(BUILD_PREBUILT)

$(TARGET_OUT)/vendor:
	@echo "Creating vendor symlink..."
	rm -rf $@
	ln -sf /vendor $@

