# Boot animation
TARGET_SCREEN_HEIGHT	:= 960
TARGET_SCREEN_WIDTH	:= 540

TARGET_KERNEL_CONFIG := aosp_yukon_eagle_defconfig

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/eagle/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit LineageOS common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Fingerprint for eagle (from stock)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D2303
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/D2303/D2303:4.4.4/18.3.1.C.0.21/2n9_bg:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="D2303-user 18.3.1.C.0.21 2n9_bg release-keys"

# Assert
TARGET_OTA_ASSERT_DEVICE := D2302,D2303,D2305,D2306,D2403,D2406,eagle

# Override Product Name for LineageOS
PRODUCT_NAME		:= lineage_eagle
PRODUCT_DEVICE		:= eagle
PRODUCT_MODEL		:= Xperia M2
PRODUCT_BRAND		:= Sony
PRODUCT_MANUFACTURER	:= Sony
