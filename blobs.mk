# blobs.mk para HP Slate 21 (phobos)

# ==================================================
# 1. Binários essenciais
# ==================================================
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/bin/btmacwriter:system/bin/btmacwriter \
    vendor/hp/phobos/proprietary/bin/input_cfboost_init.sh:system/bin/input_cfboost_init.sh \
    vendor/hp/phobos/proprietary/bin/rm_ts_server:system/bin/rm_ts_server \
    vendor/hp/phobos/proprietary/bin/tf_daemon:system/bin/tf_daemon \
    vendor/hp/phobos/proprietary/bin/ussr_setup.sh:system/bin/ussr_setup.sh

# ==================================================
# 2. Configurações do sistema
# ==================================================
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/etc/audio_effects.conf:system/etc/audio_effects.conf \
    vendor/hp/phobos/proprietary/etc/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    vendor/hp/phobos/proprietary/etc/nvcamera.conf:system/etc/nvcamera.conf \
    vendor/hp/phobos/proprietary/etc/nvram_4334.txt:system/etc/nvram_4334.txt \
    vendor/hp/phobos/proprietary/etc/thermalhal.xml:system/etc/thermalhal.xml

# ==================================================
# 3. Firmwares e HDCP
# ==================================================
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/etc/firmware,system/etc/firmware) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/etc/hdcpsrm,system/etc/hdcpsrm)

# ==================================================
# 4. Input devices
# ==================================================
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/usr/idc,system/usr/idc) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/usr/keylayout,system/usr/keylayout)

# ==================================================
# 5. Bibliotecas do sistema
# ==================================================
# Bibliotecas principais
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/lib/libnvomx.so:system/lib/libnvomx.so \
    vendor/hp/phobos/proprietary/lib/libnvavp.so:system/lib/libnvavp.so \
    vendor/hp/phobos/proprietary/lib/libnvmmlite.so:system/lib/libnvmmlite.so \
    vendor/hp/phobos/proprietary/lib/libussrd.so:system/lib/libussrd.so

# Bibliotecas de hardware
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/lib/hw,system/lib/hw)

# ==================================================
# 6. Componentes de vídeo e gráficos
# ==================================================
# Configuração EGL
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# Bibliotecas EGL
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    vendor/hp/phobos/proprietary/vendor/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so

# Implementações GLES
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/libGLESv1_CM_tegra_impl.so:system/lib/libGLESv1_CM_tegra_impl.so \
    vendor/hp/phobos/proprietary/vendor/lib/libGLESv2_tegra_impl.so:system/lib/libGLESv2_tegra_impl.so

# ==================================================
# 7. Componentes de vendor (sem partição vendor)
# ==================================================
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/vendor/firmware,system/vendor/firmware) \
    $(call find-copy-subdir-files,*,vendor/hp/phobos/proprietary/vendor/lib,system/vendor/lib) \

# ==================================================
# 8. Power Management
# ==================================================
PRODUCT_COPY_FILES += \
    vendor/hp/phobos/proprietary/vendor/lib/hw/power.phobos.so:system/vendor/lib/hw/power.phobos.so

# ==================================================
# 9. HERDA BLOCOS DO TEGRA4 (ESSENCIAL!)
# ==================================================
# Inclui blobs específicos do hardware Tegra4
PRODUCT_COPY_FILES += \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libaudioavp.so:system/vendor/lib/libaudioavp.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libfcamdng.so:system/vendor/lib/libfcamdng.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvblit.so:system/vendor/lib/libnvblit.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvcam_imageencoder.so:system/vendor/lib/libnvcam_imageencoder.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvcamerahdr.so:system/vendor/lib/libnvcamerahdr.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvcapaudioservice.so:system/vendor/lib/libnvcapaudioservice.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvddk_2d_v2.so:system/vendor/lib/libnvddk_2d_v2.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvddk_vic.so:system/vendor/lib/libnvddk_vic.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvfusebypass.so:system/vendor/lib/libnvfusebypass.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvmm_camera_v3.so:system/vendor/lib/libnvmm_camera_v3.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvodm_query.so:system/vendor/lib/libnvodm_query.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvoice.so:system/vendor/lib/libnvoice.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libnvtvmr.so:system/vendor/lib/libnvtvmr.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libsecure_hdcp_up.so:system/vendor/lib/libsecure_hdcp_up.so \
    vendor/android_vendor_nvidia_tegra4/proprietary/vendor/lib/libtsechdcp.so:system/vendor/lib/libtsechdcp.so
