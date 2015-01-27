#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Include common makefile
$(call inherit-product, device/softwinner/polaris-common/polaris-common.mk)

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/softwinner/polarisc1/kernel:kernel \
	device/softwinner/polarisc1/modules/modules/nand.ko:root/nand.ko \
	device/softwinner/polarisc1/init.sun8i.rc:root/init.sun8i.rc \
	device/softwinner/polarisc1/ueventd.sun8i.rc:root/ueventd.sun8i.rc \
	device/softwinner/polarisc1/initlogo.rle:root/initlogo.rle  \
	device/softwinner/polarisc1/media/bootanimation.zip:system/media/bootanimation.zip \
	device/softwinner/polarisc1/media/boot.wav:system/media/boot.wav \
	device/softwinner/polarisc1/media/bootlogo.bmp:system/media/bootlogo.bmp \
	device/softwinner/polarisc1/media/initlogo.bmp:system/media/initlogo.bmp \
	device/softwinner/polarisc1/fstab.sun8i:root/fstab.sun8i \
	device/softwinner/polarisc1/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml
    
# rtl8723au bt fw and nvram
PRODUCT_COPY_FILES += \
  device/softwinner/polaris-common/hardware/realtek/bluetooth/rtl8723au/firmware/rtk8723a:system/etc/firmware/rtk8723a \
  device/softwinner/polaris-common/hardware/realtek/bluetooth/rtl8723au/firmware/rtk8723_bt_config:system/etc/firmware/rtk8723_bt_config
  

#key and tp config file
PRODUCT_COPY_FILES += \
	device/softwinner/polarisc1/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
	device/softwinner/polarisc1/configs/tp.idc:system/usr/idc/tp.idc \
	device/softwinner/polarisc1/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery randisk
PRODUCT_COPY_FILES += \
    device/softwinner/polarisc1/modules/modules/disp.ko:disp.ko \
    device/softwinner/polarisc1/modules/modules/sunxi-keyboard.ko:sunxi-keyboard.ko \
    device/softwinner/polarisc1/modules/modules/lcd.ko:lcd.ko \
    device/softwinner/polarisc1/modules/modules/gt82x.ko:gt82x.ko \
    device/softwinner/polarisc1/modules/modules/ft5x_ts.ko:ft5x_ts.ko \
    device/softwinner/polarisc1/modules/modules/gt9xx_ts.ko:gt9xx_ts.ko \
    device/softwinner/polarisc1/modules/modules/gslX680.ko:gslX680.ko \
    device/softwinner/polarisc1/modules/modules/gslX680new.ko:gslX680new.ko \
    device/softwinner/polarisc1/modules/modules/gt818_ts.ko:gt818_ts.ko \
    device/softwinner/polarisc1/modules/modules/gt9xxf_ts.ko:gt9xxf_ts.ko \
    device/softwinner/polarisc1/modules/modules/aw5306_ts.ko:aw5306_ts.ko \
    device/softwinner/polarisc1/modules/modules/sw-device.ko:sw-device.ko

#vold config
PRODUCT_COPY_FILES += \
	device/softwinner/polarisc1/vold.fstab:system/etc/vold.fstab \
	device/softwinner/polarisc1/recovery.fstab:recovery.fstab 
# camera
PRODUCT_COPY_FILES += \
	device/softwinner/polarisc1/configs/camera.cfg:system/etc/camera.cfg \
	device/softwinner/polarisc1/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
#	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	device/softwinner/polaris-common/rild/ip-down:system/etc/ppp/ip-down \
	device/softwinner/polaris-common/rild/ip-up:system/etc/ppp/ip-up \
	device/softwinner/polaris-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/softwinner/polaris-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/softwinner/polaris-common/rild/call-pppd:system/xbin/call-pppd \
	device/softwinner/polaris-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/softwinner/polaris-common/rild/apns-conf_sdk.xml:system/etc/apns-conf.xml \
	device/softwinner/polaris-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/softwinner/polaris-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Asia/Shanghai \
	persist.sys.language=zh \
	persist.sys.country=CN  \
	ro.product.8723a_bt.used = true

#GPS Feature
PRODUCT_PACKAGES +=  gps.polaris
BOARD_USES_GPS_TYPE := simulator
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# evb logger
PRODUCT_COPY_FILES += \
       device/softwinner/polarisc1/tools/logger.sh:system/bin/logger.sh

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb \
	ro.udisk.lable=Polaris \
	ro.font.scale=1.0 \
	ro.hwa.force=true \
	rw.logger=0 \
	ro.sys.bootfast=true\
	ro.mem.opt=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.product.firmware=v1.0

$(call inherit-product-if-exists, device/softwinner/polarisc1/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/softwinner/polarisc1/overlay
PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := mdpi hdpi 
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_NAME := full_907
PRODUCT_DEVICE := 907

TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 800

