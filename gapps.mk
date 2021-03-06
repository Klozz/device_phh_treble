ifneq ($(wildcard vendor/opengapps),)
PRODUCT_COPY_FILES += \
	device/phh/treble/empty-permission.xml:system/etc/permissions/com.google.android.camera2.xml \
	device/phh/treble/empty-permission.xml:system/etc/permissions/com.google.android.camera.experimental2015.xml \
	device/phh/treble/empty-permission.xml:system/etc/permissions/com.google.android.camera.experimental2016.xml \
	device/phh/treble/empty-permission.xml:system/etc/permissions/com.google.android.camera.experimental2017.xml

DEVICE_PACKAGE_OVERLAYS += device/phh/treble/overlay-gapps
GAPPS_VARIANT := pico
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
PRODUCT_PACKAGES += \
       Chrome \
       CalculatorGoogle \
       PrebuiltDeskClockGoogle \
       CalendarGooglePrebuilt \
       LatinImeGoogle \
       phh-overrides

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif

#Pixel Experience gapps
ifneq ($(wildcard vendor/gapps),)
IS_PHONE := true
$(call inherit-product,vendor/gapps/config.mk)
PRODUCT_PACKAGES += \
       phh-overrides
endif
