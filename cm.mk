# Inherit device configuration for phobos.
$(call inherit-product, device/hp/phobos/cuzao_leitado_phobos.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="hp/mars/phobos:4.4.2/KOT49H/17r25.1-011-11-WW:user/release-keys" \
    PRIVATE_BUILD_DESC="mars-user 4.4.2 KOT49H 17r25.1-011-11-WW release-keys"

PRODUCT_NAME := cuzao_leitado_phobos
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/etc/init.rc:system/etc/init.rc \
    device/hp/phobos/rootdir/etc/init.dalmore.rc:system/etc/init.dalmore.rc \
    device/hp/phobos/rootdir/etc/init.dalmore.usb.rc:system/etc/init.dalmore.usb.rc \
    device/hp/phobos/rootdir/etc/fstab.dalmore:system/etc/fstab.dalmore \
    device/hp/phobos/rootdir/etc/ueventd.dalmore.rc:system/etc/ueventd.rc \
    device/hp/phobos/rootdir/etc/default.prop:default.prop

