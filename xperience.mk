# Inherit some common XPerience stuff.
$(call inherit-product, vendor/xperience/config/common_full_phone.mk)
$(call inherit-product, device/qcom/sepolicy/sepolicy.mk)
-include vendor/xperience/build/core/config.mk

IS_XPERIENCE := true

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920