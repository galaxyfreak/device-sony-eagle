# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Inherit from device config
$(call inherit-product, device/sony/eagle/aosp_d2303.mk)

# Inherit CM specific telephony.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME="D2303"
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT="Sony/D2303/D2303:4.4.4/18.3.1.C.0.21/2n9_bg:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="D2303-user 18.3.1.C.0.21 2n9_bg release-keys"

PRODUCT_NAME := cm_eagle
PRODUCT_DEVICE := eagle
PRODUCT_MODEL := Xperia M2
