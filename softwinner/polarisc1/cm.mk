#
# Copyright (C) 2011 The Android Open-Source Project
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
# Inherit device configuration
$(call inherit-product, device/softwinner/polarisc1/full_polarisc1.mk)
$(call inherit-product, device/softwinner/polarisc1/polarisc1.mk)

# Inherit some common CyanogenMod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME   := cm_polarisc1
PRODUCT_BRAND  := Allwinner
PRODUCT_DEVICE := polarisc1
PRODUCT_MODEL  := polarisc1
PRODUCT_MANUFACTURER := Asus
PRODUCT_RELEASE_NAME := polarisc1


UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi TARGET_DEVICE=grouper BUILD_FINGERPRINT="google/nakasi/grouper:4.3.1/JLS36I/402395:user/release-keys" PRIVATE_BUILD_DESC="nakasi-user 4.3.1 JLS36I 402395 release-keys"

# Allow ADB (to access dev settings)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0 ro.secure=0 ro.allow.mock.location=1 service.adb.enable=1 persist.sys.usb.config=mass_storage ro.debuggable=1 persist.service.adb.enable=1 rild.libpath=/system/lib/liballwinner-ril.so
