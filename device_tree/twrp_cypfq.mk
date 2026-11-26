# OrangeFox / TWRP product para moto g51 5G (cypfq)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Dispositivo con particiones dinamicas (super) y A/B virtual
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Control de slots A/B (si el modulo no existe en el manifest, ALLOW_MISSING_DEPENDENCIES lo tolera)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_DEVICE := cypfq
PRODUCT_NAME := twrp_cypfq
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g51 5G
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := moto g51 5G
