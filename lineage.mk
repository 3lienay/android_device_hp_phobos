# Inherit full device configuration
$(call inherit-product, device/hp/phobos/device.mk)

# Inherit common LineageOS tablet configuration
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Override inherited variables
PRODUCT_NAME := lineage_phobos
PRODUCT_DEVICE := phobos
PRODUCT_BRAND := HP
PRODUCT_MANUFACTURER := Hewlett-Packard
PRODUCT_MODEL := Slate 21

# Device characteristics
PRODUCT_CHARACTERISTICS := tablet

# AAPT configurations
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi hdpi

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.device=phobos \
    ro.sf.lcd_density=240 \
    ro.adb.secure=0 \
    ro.radio.noril=yes \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.config.low_ram=false

# Default locales
PRODUCT_LOCALES := en_US

# Multi-user support
PRODUCT_PROPERTY_OVERRIDES += \
    fw.max_users=8 \
    fw.show_multiuserui=1

# Dexpreopt optimizations
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

# Essential packages
PRODUCT_PACKAGES += \
    Updater \
    LineageParts \
    LineageSettingsProvider

# NVIDIA Tegra specific fixes
PRODUCT_COPY_FILES := \
    $(filter-out %/init.tegra.rc %/audio_policy.conf, $(PRODUCT_COPY_FILES))

# Treble support
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH)
