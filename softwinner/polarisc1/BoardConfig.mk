# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/softwinner/polaris-common/BoardConfigCommon.mk
# Beware: set only prebuilt OR source+config
TARGET_PREBUILT_KERNEL := device/softwinner/polarisc1/kernel
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=8 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += ion_reserve=80M

#Means 3 x screens
AW_WEBKIT_TILES := 36

# bt default config
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/softwinner/polarisc1/bluetooth

#recovery
TARGET_RECOVERY_UI_LIB := librecovery_ui_polaris_c1
SW_BOARD_TOUCH_RECOVERY :=true
SW_BOARD_RECOVERY_CHAR_HEIGHT := 60
SW_BOARD_RECOVERY_CHAR_WIDTH  := 12
#/bootloader/recovery/minui/roboto_23x41.h,chose for change font size
SW_BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

# 1. realtek wifi configuration
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

#    SW_BOARD_USR_WIFI := rtl8188eu
#    BOARD_WLAN_DEVICE := rtl8188eu

    SW_BOARD_USR_WIFI := rtl8723au
    BOARD_WLAN_DEVICE := rtl8723au
endif

# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_RTK := true
SW_BOARD_HAVE_BLUETOOTH_NAME := rtl8723au

