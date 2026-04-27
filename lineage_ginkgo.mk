#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
TARGET_INCLUDE_AXFX := true
TARGET_ENABLE_BLUR := true
# Camera information (multiple sensors supported)
AXION_CAMERA_REAR_INFO := 48,8,2,2
AXION_CAMERA_FRONT_INFO := 13
# Maintainer name (underscores become spaces in the UI)
AXION_MAINTAINER := 𖤐iseeniick
# Processor name (underscores become spaces)
AXION_PROCESSOR := Snapdragon_665_Mobile_Platform
# Charging
BYPASS_CHARGE_SUPPORTED := false
# BCR
TARGET_PREBUILT_BCR := true
# LineageOS apps
ifneq ($(WITH_GMS),true)
TARGET_INCLUDES_LOS_PREBUILTS := true
endif

# Inherit from ginkgo device
$(call inherit-product, device/xiaomi/ginkgo/device.mk)

PRODUCT_NAME := lineage_ginkgo
PRODUCT_DEVICE := ginkgo
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 8

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := xiaomi/ginkgo_eea/ginkgo:11/RKQ1.201004.002/V12.5.12.0.RCOEUXM:user/release-keys

# CPU Governor
PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := schedutil
PERF_ANIM_OVERRIDE := true

# RAM - 4GB do not enable low ram
TARGET_IS_LOW_RAM := false

# Refresh rate
TARGET_SUPPORTED_REFRESH_RATES := 60

# ScrollOptimizer
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.perf.scroll_opt=true \
    persist.sys.perf.scroll_opt.heavy_app=2

# Doze
TARGET_DOZE_TAP_PULSE_SUPPORTED := true
TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED := true
TARGET_DOZE_PICKUP_PULSE_SUPPORTED := true

# Surface Flinger - Blur Support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.supports_background_blur=true
