# blobs.mk para HP Slate 21 (phobos) - Reorganizado para corresponder ao tree

# ==================================================
# 1. Binários essenciais (proprietary/bin)
# ==================================================
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/bin/btmacwriter:system/bin/btmacwriter \
    vendor/hp/phobos/proprietary/bin/input_cfboost_init.sh:system/bin/input_cfboost_init.sh \
    vendor/hp/phobos/proprietary/bin/rm_ts_server:system/bin/rm_ts_server \
    vendor/hp/phobos/proprietary/bin/tf_daemon:system/bin/tf_daemon \
    vendor/hp/phobos/proprietary/bin/ussr_setup.sh:system/bin/ussr_setup.sh

# ==================================================
# 2. Configurações do sistema (proprietary/etc)
# ==================================================
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/hp/phobos/proprietary/etc/enctune.conf:system/etc/enctune.conf \
    vendor/hp/phobos/proprietary/etc/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    vendor/hp/phobos/proprietary/etc/nvcamera.conf:system/etc/nvcamera.conf \
    vendor/hp/phobos/proprietary/etc/nvram.txt:system/etc/nvram.txt \
    vendor/hp/phobos/proprietary/etc/nvram_4334.txt:system/etc/nvram_4334.txt \
    vendor/hp/phobos/proprietary/etc/thermalhal.xml:system/etc/thermalhal.xml

# Firmwares e HDCP (recursivo)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/etc/firmware,system/etc/firmware) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/etc/hdcpsrm,system/etc/hdcpsrm)

# ==================================================
# 3. Input devices (proprietary/usr)
# ==================================================
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/usr/idc,system/usr/idc) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/usr/keylayout,system/usr/keylayout)

# ==================================================
# 4. Bibliotecas principais (proprietary/lib)
# ==================================================
# Bibliotecas do sistema
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/lib/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
    vendor/hp/phobos/proprietary/lib/libaudioavp.so:system/lib/libaudioavp.so \
    vendor/hp/phobos/proprietary/lib/libcgdrv.so:system/lib/libcgdrv.so \
    vendor/hp/phobos/proprietary/lib/libnvos.so:system/lib/libnvos.so \
    vendor/hp/phobos/proprietary/lib/libnvrm.so:system/lib/libnvrm.so \
    vendor/hp/phobos/proprietary/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    vendor/hp/phobos/proprietary/lib/libnvomx.so:system/lib/libnvomx.so \
    vendor/hp/phobos/proprietary/lib/libnvavp.so:system/lib/libnvavp.so \
    vendor/hp/phobos/proprietary/lib/libnvmmlite.so:system/lib/libnvmmlite.so \
    vendor/hp/phobos/proprietary/lib/libussrd.so:system/lib/libussrd.so

# Bibliotecas de hardware (hw)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/lib/hw,system/lib/hw)

# ==================================================
# 5. Componentes de vídeo e gráficos (proprietary/vendor)
# ==================================================
# EGL
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so

# Implementações GLES
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/libGLESv1_CM_tegra_impl.so:system/lib/libGLESv1_CM_tegra_impl.so \
    vendor/hp/phobos/proprietary/vendor/lib/libGLESv2_tegra_impl.so:system/lib/libGLESv2_tegra_impl.so

# ==================================================
# 6. Firmware e bibliotecas vendor (sem partição vendor)
# ==================================================
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/vendor/firmware,system/vendor/firmware) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/vendor/lib,system/vendor/lib)

# Power Management
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/hw/power.phobos.so:system/vendor/lib/hw/power.phobos.so

# ==================================================
# 7. BLOCOS DO TEGRA4 (INTEGRAÇÃO ESSENCIAL)
# ==================================================
# Bibliotecas gráficas avançadas
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvddk_2d_v2.so:system/vendor/lib/libnvddk_2d_v2.so \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvglsi.so:system/vendor/lib/libnvglsi.so

# Componentes de áudio/mídia
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libaudioavp.so:system/vendor/lib/libaudioavp.so \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvcapaudioservice.so:system/vendor/lib/libnvcapaudioservice.so

# Codecs e processamento de vídeo
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvomxilclient.so:system/vendor/lib/libnvomxilclient.so \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvtvmr.so:system/vendor/lib/libnvtvmr.so

# Segurança e DRM
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra4/proprietary/vendor/lib/libtsechdcp.so:system/vendor/lib/libtsechdcp.so

# ==================================================
# 8. Bibliotecas opcionais (somente se necessário)
# ==================================================
# Descomente apenas se precisar destes componentes:
# PRODUCT_COPY_FILES += \
#    vendor/nvidia/tegra4/proprietary/vendor/lib/libnvfusebypass.so:system/vendor/lib/libnvfusebypass.so \
#    vendor/nvidia/tegra4/proprietary/vendor/lib/libsecure_hdcp_up.so:system/vendor/lib/libsecure_hdcp_up.so
