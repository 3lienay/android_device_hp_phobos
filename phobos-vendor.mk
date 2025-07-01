# Herda blobs do Shield Tablet
$(call inherit-product, vendor/nvidia/shield/shieldtablet.mk)
$(call inherit-product, vendor/nvidia/shield/t40s.mk)

# Copia APENAS os blobs específicos do phobos para vendor
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/hp/phobos/proprietary_phobos/vendor,$(TARGET_COPY_OUT_VENDOR))
    device/hp/phobos/proprietary_phobos/vendor/bin/update_mac.sh:$(TARGET_COPY_OUT_VENDOR)/bin/update_mac.sh \
    device/hp/phobos/proprietary_phobos/vendor/etc/init/init.phobos.wifi.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.phobos.wifi.rc
