# Herda configuração completa do dispositivo
$(call inherit-product, device/hp/phobos/device.mk)

# Herda configuração comum de tablet WiFi-only do LineageOS
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Sobrescreve variáveis herdadas
PRODUCT_NAME := lineage_phobos
PRODUCT_DEVICE := phobos
PRODUCT_BRAND := HP
PRODUCT_MANUFACTURER := Hewlett-Packard
PRODUCT_MODEL := Slate 21

# Características do dispositivo (já definido no device.mk - REMOVIDO)
# PRODUCT_CHARACTERISTICS := tablet

# Configurações AAPT (otimizadas)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := mdpi hdpi

# Propriedades de sistema específicas
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.device=phobos \
    ro.sf.lcd_density=240 \
    ro.adb.secure=0 \
    ro.radio.noril=yes \
    ro.config.low_ram=false \
    ro.tegracore.setupwizard=false

# Locais padrão
PRODUCT_LOCALES := en_US

# Suporte multi-usuário
PRODUCT_PROPERTY_OVERRIDES += \
    fw.max_users=8 \
    fw.show_multiuserui=1

# Otimizações Dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true  # Reduz uso de memória

# Pacotes essenciais do LineageOS
PRODUCT_PACKAGES += \
    Updater \
    LineageParts \
    LineageSettingsProvider

# Suporte Treble (já definido no device.mk - REMOVIDO)
# PRODUCT_FULL_TREBLE_OVERRIDE := true
# PRODUCT_VENDOR_MOVE_ENABLED := true

# Nível de patch de segurança
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH)