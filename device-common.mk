#
# Copyright (C) 2010 The Android Open Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/walton/primof3i/kernel
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    drm.service.enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/walton/primof3i/ueventd.rc:root/ueventd.rc \
    device/walton/primof3i/init.usb.rc:root/init.usb.rc \
    device/walton/primof3i/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/walton/primof3i/modules/ccci.ko:system/lib/modules/ccci.ko \
    device/walton/primof3i/modules/ccci_plat.ko:system/lib/modules/ccci_plat.ko \
    device/walton/primof3i/modules/devapc.ko:system/lib/modules/devapc.ko \
    device/walton/primof3i/modules/devinfo.ko:system/lib/modules/devinfo.ko \
    device/walton/primof3i/modules/hid-logitech-dj.ko:system/lib/modules/hid-logitech-dj.ko \
    device/walton/primof3i/modules/mtk_fm_drv.ko:system/lib/modules/mtk_fm_drv.ko \
    device/walton/primof3i/modules/mtk_stp_bt.ko:system/lib/modules/mtk_stp_bt.ko \
    device/walton/primof3i/modules/mtk_stp_gps.ko:system/lib/modules/mtk_stp_gps.ko \
    device/walton/primof3i/modules/mtk_stp_wmt.ko:system/lib/modules/mtk_stp_wmt.ko \
    device/walton/primof3i/modules/mtk_wmt_wifi.ko:system/lib/modules/mtk_wmt_wifi.ko \
    device/walton/primof3i/modules/scsi_tgt.ko:system/lib/modules/scsi_tgt.ko \
    device/walton/primof3i/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/walton/primof3i/modules/sec.ko:system/lib/modules/sec.ko \
    device/walton/primof3i/modules/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko \
    device/walton/primof3i/modules/wlan.ko:system/lib/modules/wlan.ko \
    device/walton/primof3i/modules/wlan_mt6582.ko:system/lib/modules/

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_COPY_FILES += \
    device/walton/primof3i/Generic.kl:system/usr/keylayout/Generic.kl \
	device/walton/primof3i/Generic.kcm:system/usr/keylayout/Generic.kcm

PRODUCT_PACKAGES := \
    audio_policy.default \
    audio.primary.default \
    camera.default \
    gps.default \
    gralloc.default \
    keystore.default \
    libaudio.r_submix.default \
    libaudio.usb.default \
    lights.default \
    local_time.default \
    power.default \
    sensors.default \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    mkmtkbootimg

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/walton/primof3i/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
#PRODUCT_COPY_FILES += \
#    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \


WIFI_BAND := 802_11_BG
# $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
