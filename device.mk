#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Is tablet
TARGET_IS_TABLET := true

# Use prebuilt kernel
TARGET_USE_PREBUILT_KERNEL := false

# Add Gapps
TARGET_ADD_GAPPS := false

# Inherit from sm8250-common
$(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

# Camera
PRODUCT_PACKAGES += \
    libMegviiFacepp-0.5.2 \
    libmegface \
    libpiex_shim

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    vendor.xiaomi.hardware.fx.tunnel@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor

# Parts
PRODUCT_PACKAGES += \
    MiPadParts

PRODUCT_PACKAGES += \
    vendor.xiaomi_enuma.peripherals@1.0-service.default

# Remove unused packages
PRODUCT_PACKAGES += \
    RemovePackages

# Rootdir
PRODUCT_PACKAGES += \
    init.enuma.rc

# RRO Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayEnuma \
    FrameworkResOverlayEnuma \
    LineageSDKOverlayEnuma \
    NetworkStackOverlayMIUI \
    SettingsOverlayEnuma \
    SettingsProviderOverlayEnuma \
    SystemUIOverlayEnuma

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils-prd \
    qti_telephony_utils_prd.xml

PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.6.vendor

# Wlan fix for stock kernel
ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
PRODUCT_PACKAGES += \
    firmware_qca6390_WCNSS_qcom_cfg.ini_symlink \
    firmware_qca6390_wlan_mac.bin_symlink
endif

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/enuma/enuma-vendor.mk)

# Inherit from Gapps
ifeq ($(TARGET_ADD_GAPPS),true)
    $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
endif
