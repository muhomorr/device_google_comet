#
# Copyright 2021 The Android Open-Source Project
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
#

TARGET_LINUX_KERNEL_VERSION := 6.1

$(call inherit-product, device/google/zumapro/factory_common.mk)
$(call inherit-product, device/google/comet/device-comet.mk)
include device/google/comet/audio/comet/factory-audio-tables.mk

PRODUCT_NAME := factory_comet
PRODUCT_DEVICE := comet
PRODUCT_MODEL := Factory build on Comet
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Google

# default BDADDR for EVB only
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.bluetooth.evb_bdaddr="22:22:22:33:44:55"

# Override to factory SDK
SOONG_CONFIG_NAMESPACES += gpssdk
SOONG_CONFIG_gpssdk += sdkv1
SOONG_CONFIG_gpssdk_sdkv1 := true

SOONG_CONFIG_NAMESPACES += gpssdk
SOONG_CONFIG_gpssdk += gpsmcuversion
SOONG_CONFIG_gpssdk_gpsmcuversion := gpsv1_$(TARGET_BUILD_VARIANT)

SOONG_CONFIG_NAMESPACES += gpssdk
SOONG_CONFIG_gpssdk += gpsconf
SOONG_CONFIG_gpssdk_gpsconf := factory

# Factory binary of camera
PRODUCT_PACKAGES += fatp_ct3_wide_hat_tool fatp_ct3_tele_hat_tool fatp_ct3_ultrawide_hat_tool
