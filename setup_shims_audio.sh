#!/bin/bash

set -e

BASE_DIR="android/lineage/device/hp/phobos"
SHIMS_DIR="$BASE_DIR/shims"
AUDIO_DIR="$BASE_DIR/audio"

echo "[1/6] Criando pasta de shims..."
mkdir -p "$SHIMS_DIR"

echo "[2/6] Criando arquivos C++ de shims..."
cat > "$SHIMS_DIR/audio_shim.cpp" <<EOF
extern "C" uint32_t get_output_latency() {
    return 0;
}
EOF

cat > "$SHIMS_DIR/sensors_shim.cpp" <<EOF
extern "C" int sensors_poll_context_poll(...) {
    return 0;
}
EOF

cat > "$SHIMS_DIR/camera_shim.cpp" <<EOF
extern "C" int camera_device_open(...) {
    return 0;
}
EOF

echo "[3/6] Criando Android.mk dos shims..."
cat > "$SHIMS_DIR/Android.mk" <<EOF
LOCAL_PATH := \$(call my-dir)

include \$(CLEAR_VARS)
LOCAL_MODULE := libshim_audio
LOCAL_SRC_FILES := audio_shim.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_VENDOR_MODULE := true
include \$(BUILD_SHARED_LIBRARY)

include \$(CLEAR_VARS)
LOCAL_MODULE := libshim_sensors
LOCAL_SRC_FILES := sensors_shim.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_VENDOR_MODULE := true
include \$(BUILD_SHARED_LIBRARY)

include \$(CLEAR_VARS)
LOCAL_MODULE := libshim_camera
LOCAL_SRC_FILES := camera_shim.cpp
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES := libc
LOCAL_VENDOR_MODULE := true
include \$(BUILD_SHARED_LIBRARY)
EOF

echo "[4/6] Criando audio_policy.conf..."
mkdir -p "$AUDIO_DIR"
cat > "$AUDIO_DIR/audio_policy.conf" <<EOF
audio_hw_modules {
  primary {
    outputs {
      primary {
        sampling_rates 44100
        channel_masks AUDIO_CHANNEL_OUT_STEREO
        formats AUDIO_FORMAT_PCM_16_BIT
        devices AUDIO_DEVICE_OUT_SPEAKER
        flags AUDIO_OUTPUT_FLAG_PRIMARY
      }
    }
    inputs {
      primary {
        sampling_rates 8000
        channel_masks AUDIO_CHANNEL_IN_MONO
        formats AUDIO_FORMAT_PCM_16_BIT
        devices AUDIO_DEVICE_IN_BUILTIN_MIC
      }
    }
  }
}
EOF

echo "[5/6] Verificando Android.mk principal..."
DEVICE_MK="$BASE_DIR/Android.mk"
if ! grep -q "include \$(call all-subdir-makefiles)" "$DEVICE_MK"; then
    echo -e "\ninclude \$(call all-subdir-makefiles)" >> "$DEVICE_MK"
    echo "→ Adicionado include para subdiretórios ao Android.mk"
else
    echo "→ Android.mk já inclui os subdiretórios"
fi

echo "[6/6] Atualizando device.mk com PRODUCT_PACKAGES..."
DEVICE_MK2="$BASE_DIR/device.mk"
for MODULE in libshim_audio libshim_camera libshim_sensors; do
    if ! grep -q "$MODULE" "$DEVICE_MK2"; then
        echo "PRODUCT_PACKAGES += $MODULE" >> "$DEVICE_MK2"
        echo "→ Adicionado $MODULE ao device.mk"
    else
        echo "→ $MODULE já está em device.mk"
    fi
done

echo "✅ Script finalizado com sucesso!"
