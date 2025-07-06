$(call inherit-product, build/make/target/product/treble_common.mk)

# Especificar que é não-Treble
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := false

# Herda configurações comuns do Tegra4
$(call inherit-product, device/hp/tegra4-common/tegra4.mk)

# Herda configs LineageOS comuns
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Herda blobs proprietários (incluindo os do Tegra4)
$(call inherit-product, device/hp/phobos/blobs.mk)

BUILD_WITH_JACK := false

PRODUCT_SOONG_NAMESPACES := device/hp/phobos

# Informações do dispositivo
PRODUCT_BRAND := HP
PRODUCT_MODEL := Slate 21
PRODUCT_MANUFACTURER := HP
PRODUCT_DEVICE := phobos
PRODUCT_NAME := lineage_phobos

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/hp/phobos/overlay

# Permissões
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.accessory.xml

# Copiar arquivos init
PRODUCT_COPY_FILES += \
    device/hp/phobos/rootdir/etc/fstab.dalmore:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.dalmore \
    device/hp/phobos/rootdir/init.dalmore.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.dalmore.rc \
    device/hp/phobos/rootdir/init.dalmore.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.dalmore.usb.rc \
    device/hp/phobos/rootdir/init.environ.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.environ.rc \
    device/hp/phobos/rootdir/init.hdcp.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.hdcp.rc \
    device/hp/phobos/rootdir/init.lineage.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.lineage.rc \
    device/hp/phobos/rootdir/init.lineage.superuser.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.lineage.superuser.rc \
    device/hp/phobos/rootdir/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rc \
    device/hp/phobos/rootdir/init.trace.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.trace.rc \
    device/hp/phobos/rootdir/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.usb.rc \
    device/hp/phobos/rootdir/init.ussrd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.ussrd.rc \
    device/hp/phobos/rootdir/init.zygote32.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.zygote32.rc \
    device/hp/phobos/rootdir/ueventd.dalmore.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc \
    device/hp/phobos/ueventd.rc:$(TARGET_COPY_OUT_ROOT)/ueventd.rc

# Copiar init de recovery
PRODUCT_COPY_FILES += \
    device/hp/phobos/recovery/root/init.recovery.phobos.rc:$(TARGET_RECOVERY_ROOT_OUT)/init.recovery.$(TARGET_DEVICE).rc

# Dependências do recovery
PRODUCT_PACKAGES += \
    recovery_log \
    busybox

# Copiar versão do SELinux
PRODUCT_COPY_FILES += \
    device/hp/phobos/sepolicy/selinux_version:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/selinux_version

# Bootanimation
PRODUCT_COPY_FILES += \
    device/hp/phobos/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

# Pacotes essenciais (CORRIGIDOS)
PRODUCT_PACKAGES += \
    power.phobos \
    audio.primary.tegra \
    sensors.phobos \
    android.hardware.health@2.0-service \
    LineageParts \
    LineageSettingsProvider

# Propriedades de sistema
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    wifi.interface=wlan0 \
    ro.audio.monitorRotation=true \
    ro.nvidia.opensource=0 \
    ro.radio.noril=true \
    ro.opengles.version=196608 \
    wifi.supplicant_scan_interval=180 \
    persist.sys.usb.config=mtp,adb \
    ro.config.low_ram=false \
    persist.sys.force_highendgfx=true \
    ro.hardware.vulkan=tegra \
    ro.sys.fw.dex2oat_thread_count=4 \
    ro.hardware.audio.primary=tegra4 \
    ro.hardware.gralloc=tegra4 \
    ro.hardware.hwcomposer=tegra4

# Características
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_FULL_TREBLE_OVERRIDE := false

# Diretórios de sepolicy
BOARD_SEPOLICY_DIRS += device/hp/phobos/sepolicy

# Configurações de Dalvik
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# Dependência de CPU features
$(call add-dependency, cpufeatures, prebuilts/ndk)

# Configurações de Wi-Fi
PRODUCT_COPY_FILES += \
    device/hp/phobos/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/wpa_supplicant.conf
