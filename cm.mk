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

# Bootanimation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
DEVICE_RESOLUTION := 540x960

# Assert
TARGET_OTA_ASSERT_DEVICE := D2303,D2403,eagle

# Inherit AOSP Yukon common device parts
$(call inherit-product, device/sony/eagle/aosp_d2303.mk)

# Inherit Omni GSM telephony parts
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Exclude these from build.prop, they are set by libinit
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.model

# Override Product Name for CM
PRODUCT_NAME := cm_eagle
