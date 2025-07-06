# Herda configuração completa do dispositivo
$(call inherit-product, device/hp/phobos/device.mk)

# Sobrescreve variáveis herdadas
PRODUCT_NAME := lineage_phobos
PRODUCT_DEVICE := phobos
PRODUCT_BRAND := HP
PRODUCT_MANUFACTURER := Hewlett-Packard
PRODUCT_MODEL := Slate 21

# Propriedades específicas do LineageOS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.cwm.enable_key_repeat=true \
    drm.service.enabled=true \
    ro.lineage.device=phobos \
    ro.adb.secure=0 \
    ro.tegracore.setupwizard=false

# Configurações AAPT (otimizadas) - Mantido pois são específicas para este build
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi hdpi

# Locais padrão
PRODUCT_LOCALES := en_US

# Suporte multi-usuário
PRODUCT_PROPERTY_OVERRIDES += \
    fw.max_users=8 \
    fw.show_multiuserui=1

# Otimizações Dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true

# Nível de patch de segurança
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH)

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp