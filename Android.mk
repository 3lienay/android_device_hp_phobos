# Android.mk para o dispositivo HP Phobos
# Localizado em device/hp/phobos/Android.mk

# Apenas inclua se estiver construindo para este dispositivo
ifneq ($(filter phobos,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

# Inclua todos os makefiles neste diretório
include $(call all-makefiles-under,$(LOCAL_PATH))

endif # TARGET_DEVICE