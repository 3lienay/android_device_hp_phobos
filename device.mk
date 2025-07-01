# Common configurations FIRST
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)
$(call inherit-product, build/target/product/non_ab_device.mk)
$(call inherit-product, device/nvidia/tegra-common/tegra.mk)

# Then vendor blobs
$(call inherit-product-if-exists, vendor/nvidia/shield/shield-vendor.mk)
$(call inherit-product-if-exists, vendor/hp/phobos/phobos-vendor.mk)

PRODUCT_SOONG_NAMESPACES := \
    device/hp/phobos

# Then explicitly include prebuilt
$(call add-dependency, cpufeatures, prebuilts/ndk)

TARGET_HAS_BORINGSSL := true

LOCAL_C_INCLUDES += \
    external/boringssl/src/include/openssl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true

PRODUCT_PACKAGES += libc++_shared
PRODUCT_PACKAGES += \
    libcne \
    libcneutils \
    libcnefeatureconfig
# Sobre o dispositivo
PRODUCT_BRAND := HP
PRODUCT_MODEL := Slate 21
PRODUCT_MANUFACTURER := HP
PRODUCT_DEVICE := phobos
PRODUCT_NAME := lineage_phobos

# BoringSSL substitui o OpenSSL
PRODUCT_PACKAGES += \
    libssl \
    libcrypto

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/hp/phobos/overlay

# Permissões
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

# Init scripts
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/etc/init/init.phobos.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.phobos.rc \
    device/hp/phobos/rootdir/etc/init/init.phobos.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.phobos.usb.rc

# Ueventd e file_contexts
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/etc/ueventd.phobos.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    device/hp/phobos/rootdir/etc/selinux/file_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/file_contexts

# Fstab
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/etc/fstab.phobos:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.phobos

# Recovery
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/init.recovery.phobos.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.$(TARGET_DEVICE).rc

# Configurações de áudio
PRODUCT_COPY_FILES += \
    device/hp/phobos/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf

# Propriedades do sistema
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.tegracore.version=tegra114 \
    wifi.interface=wlan0 \
    ro.audio.monitorRotation=true \
    persist.tegra.nvmmlite=1 \
    ro.nvidia.opensource=0 \
    ro.radio.noril=true

# Configurações de gráficos
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.opengles.version=196608

# Configurações de rede
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=180 \
    net.bt.name=Android

# Configurações de depuração
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.debuggable=1

# Configurações de performance
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=false \
    persist.sys.force_highendgfx=true

# Pacotes adicionais
PRODUCT_PACKAGES += \
    thermal_monitor

# Configurações do Dalvik/ART
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Habilita Widevine DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Configurações específicas do Tegra
PRODUCT_PACKAGES += \
    power.tegra \
    audio.primary.tegra \
    sensors.phobos

# Health service padrão
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service

# Configurações do bootanimation
PRODUCT_COPY_FILES += \
    device/hp/phobos/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

# Permite instalação de apps de terceiros via ADB
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0

# Always preopt extracted APKs
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Use a profile based boot image
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Configurações de segurança
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Habilita suporte a Vulkan
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=tegra

# Configurações de câmera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_treble=true

# Configurações do sistema de arquivos
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=4

# Configurações de rede Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.profile.asha.central.enabled?=true \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true

# Habilita otimizações dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false

# Define que este é um dispositivo de baixa RAM
PRODUCT_CHARACTERISTICS := tablet

# Habilita suporte a treble
PRODUCT_FULL_TREBLE_OVERRIDE := false

# Configurações específicas do LineageOS
PRODUCT_PACKAGES += \
    LineageParts \
    LineageSettingsProvider

# Força o uso de blobs do Phobos para componentes críticos
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.audio.primary=tegra4 \
    ro.hardware.gralloc=tegra4 \
    ro.hardware.hwcomposer=tegra4

# Propriedades específicas para compatibilidade
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nvidia.device=phobos \
    ro.nvidia.platform=tn8

BOARD_VENDOR_SEPOLICY_DIRS += \
    device/hp/phobos/sepolicy/vendor

# Vendor security patches
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=$(PLATFORM_SECURITY_PATCH)
