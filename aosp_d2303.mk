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

TARGET_KERNEL_CONFIG := aosp_yukon_eagle_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/msm8226

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/eagle/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_COPY_FILES += \
    device/sony/eagle/releasetools/sensors.sh:install/bin/sensors.sh \
    device/sony/eagle/releasetools/variant.sh:install/bin/variant.sh

# Product attributes
PRODUCT_NAME := aosp_d2303
PRODUCT_DEVICE := eagle
PRODUCT_MODEL := Xperia M2
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

