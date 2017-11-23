# Copyright 2014 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/eagle/overlay

# Device etc
PRODUCT_COPY_FILES := \
    device/sony/eagle/rootdir/system/vendor/etc/mixer_paths.xml:system/vendor/etc/mixer_paths.xml \
    device/sony/eagle/rootdir/system/etc/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf \
    device/sony/eagle/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/eagle/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/eagle/rootdir/system/etc/wifimactool.sh:system/etc/wifimactool.sh
# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Device Init
PRODUCT_PACKAGES += \
    fstab.eagle \
    init.recovery.eagle \
    init.eagle \
    ueventd.eagle

# Sensors
PRODUCT_COPY_FILES += \
    device/sony/eagle/rootdir/system/etc/_hals.conf:system/vendor/etc/sensors/_hals.conf

 PRODUCT_PACKAGES += \
    sensors.msm8226

# Lights
PRODUCT_PACKAGES += \
    lights.eagle

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.eagle

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.eagle

# Camera shim packages
PRODUCT_PACKAGES += \
    libshim_camera \
    libatomic_camera

# BoringSSL
PRODUCT_PACKAGES += \
   libboringssl-compat

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    ro.usb.pid_suffix=1B8

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yukon/platform.mk)
$(call inherit-product, vendor/sony/eagle/eagle-vendor.mk)
