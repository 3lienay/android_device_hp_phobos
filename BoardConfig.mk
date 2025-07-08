include device/hp/tegra4-common/BoardConfigCommon.mk

PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := false
WITH_DEXPREOPT := false
ANDROID_COMPILE_WITH_JACK := false
TARGET_INIT_VENDOR_RC := device/hp/phobos/rootdir/init.dalmore.rc

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := phobos

# Kernel
TARGET_PREBUILT_KERNEL := device/hp/phobos/zImage-dtb
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_CMDLINE := console=ttyS0,115200n8 androidboot.hardware=phobos \
                        androidboot.bootdevice=sdhci-tegra.3 \
                        tegraid=40.0.0.00.00 \
                        vpr_resize \
                        gpt \
                        androidboot.selinux=permissive \
                        firmware_class.path=/system/vendor/firmware

BOARD_KERNEL_SEPARATED_DT := false
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBIMAGE_PARTITION_SIZE := 4194304
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5385142272
BOARD_FLASH_BLOCK_SIZE := 4096

# File Systems
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_ROOT_OUT := device/hp/phobos/recovery/root
TARGET_RECOVERY_FSTAB := device/hp/phobos/rootdir/etc/fstab.dalmore
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := "roboto_15x24.h"

# system.prop
TARGET_SYSTEM_PROP := device/hp/phobos/system.prop

# Graphics
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_USE_BGRA_8888 := true
TARGET_USES_HWC2 := false  # Tegra 4 não suporta HWC2
USE_OPENGL_RENDERER := true

# Mesa3D
BOARD_USE_MESA3D := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hp/phobos/bluetooth

# Wi-Fi
WIFI_DRIVER_MODULE_PATH := "/system/vendor/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME := "dhd"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

# Tela
TARGET_SCREEN_WIDTH := 1920
TARGET_SCREEN_HEIGHT := 1080

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# ==================================================
# Treble Configs (non-Treble device)
# ==================================================
PRODUCT_FULL_TREBLE := false
BOARD_VNDK_VERSION :=

# ==================================================
# SELinux
# ==================================================
BOARD_SEPOLICY_M4DEFS := \
    lineage_common=true \
    enable_camera=true \
    enable_graphics=true \
    tegra_platform=true

BOARD_SEPOLICY_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_RECOVERY_SEPOLICY_IGNORE_NEVERALLOWS := true
