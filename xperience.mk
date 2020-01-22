# Inherit some common XPerience stuff.
$(call inherit-product, vendor/xperience/config/common_full_phone.mk)
#$(call inherit-product, device/xperience/sepolicy/common/sepolicy.mk)
-include vendor/xperience/build/core/config.mk

IS_XPERIENCE := true

# Boot animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 1920

# QCOM includes

PRODUCT_SOONG_NAMESPACES += \
    hardware/google/av \
    hardware/google/interfaces

#allow override encrypt
PRODUCT_PROPERTY_OVERRIDES += \
ro.crypto.allow_encrypt_override = true

#call tcmiface in boot
PRODUCT_PACKAGES += tcmiface
PRODUCT_BOOT_JARS += tcmiface

# whitelisted app
PRODUCT_COPY_FILES += \
    device/qcom/common/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

PRODUCT_COPY_FILES += \
    device/qcom/common/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

PRODUCT_PACKAGES := \
    AccountAndSyncSettings \
    DeskClock \
    AlarmProvider \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    DrmProvider \
    Email \
    LatinIME \
    netutils-wrapper-1.0 \
    Provision \
    Protips \
    QuickSearchBox \
    Settings \
    Sync \
    SystemUI \
    CalendarProvider \
    SyncProvider \
    SoundRecorder \
    IM \
    SnapdragonGallery \

#to fix network related NPE
# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# framework detect libs
PRODUCT_PACKAGES += libvndfwk_detect_jni.qti
PRODUCT_PACKAGES += libqti_vndfwk_detect

PRODUCT_PACKAGES += android.hidl.manager@1.0-java
PRODUCT_PACKAGES += liboemaids_system
###################################################################################
# Pickup blobs to satisfy LMKD
$(call inherit-product-if-exists, vendor/qcom/common/performance/perf-common.mk)
###################################################################################

###################################################################################
-include vendor/qcom/defs/board-defs/system/*.mk
$(call inherit-product-if-exists, vendor/qcom/defs/product-defs/system/*.mk)
###################################################################################