# Herda configurações completas do dispositivo
$(call inherit-product, device/hp/phobos/device.mk)

# Identificação do dispositivo
PRODUCT_NAME := lineage_phobos
PRODUCT_DEVICE := phobos
PRODUCT_BRAND := HP
PRODUCT_MANUFACTURER := Hewlett-Packard
PRODUCT_MODEL := Slate 21

# Propriedades específicas do LineageOS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.lineage.device=phobos \
    ro.cwm.enable_key_repeat=true \
    drm.service.enabled=true \
    ro.adb.secure=0 \
    ro.tegracore.setupwizard=false

# Configurações AAPT (otimizadas para display de 1280x720)
PRODUCT_AAPT_CONFIG := normal large mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi hdpi

# Localização padrão
PRODUCT_LOCALES := en_US

# Configurações multi-usuário
PRODUCT_PROPERTY_OVERRIDES += \
    fw.max_users=8 \
    fw.show_multiuserui=1 \
    persist.sys.usb.config=mtp \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH)

# Otimizações de build
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true

# Herda configurações comuns do LineageOS
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inclui pacotes essenciais
PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    LineageParts \
    Updater

# Permissões adicionais
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml
