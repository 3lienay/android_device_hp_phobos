# Inherit base Android
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device identifiers
PRODUCT_MANUFACTURER := HP
PRODUCT_BRAND := HP
PRODUCT_DEVICE := phobos
PRODUCT_NAME := lineage_phobos
PRODUCT_MODEL := Slate 21

# Audio packages (os blobs são gerenciados pelo blobs.mk)
PRODUCT_PACKAGES += \
    audio.primary.tegra4 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Graphics configuration (os blobs EGL/GLES estão no blobs.mk)
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := vendor/hp/phobos/proprietary/vendor/lib/egl/egl.cfg

# Essential graphics packages
PRODUCT_PACKAGES += \
    hwcomposer.tegra4 \
    libnvrm \
    libnvrm_graphics

# Media packages (codecs são gerenciados pelo blobs.mk)
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libnvomx

# Media configs (arquivos XML personalizados)
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/hp/phobos/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/hp/phobos/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# WiFi packages (firmware está no blobs.mk)
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    device/hp/phobos/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Bluetooth package (blobs estão no blobs.mk)
PRODUCT_PACKAGES += \
    libbt-vendor

PRODUCT_COPY_FILES += \
    device/hp/phobos/configs/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true \
    wifi.interface=wlan0 \
    ro.bt.bdaddr_path=/sys/module/bdaddress/parameters/bdaddress \
    persist.tegra.nvmmlite=1 \
    ro.media.dec.jpeg.memcap=20000000

# Legacy binaries
TARGET_ENABLE_NON_PIE_SUPPORT := true

# Kernel properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0
