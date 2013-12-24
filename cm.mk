## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := primof3i

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/walton/primof3i/device_primof3i.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := primof3i
PRODUCT_NAME := cm_primof3i
PRODUCT_BRAND := WALTON
PRODUCT_MODEL := Primo F3i
PRODUCT_MANUFACTURER := walton
