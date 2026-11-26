FDEVICE="cypfq"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   export TARGET_DEVICE_ALT="cypfq"
   export ALLOW_MISSING_DEPENDENCIES=true
   export LC_ALL="C"
   export FOX_AB_DEVICE=1
   export FOX_VIRTUAL_AB_DEVICE=1
   export FOX_RECOVERY_BOOT_PARTITION="/dev/block/bootdevice/by-name/boot"
   export FOX_USE_BASH_SHELL=1
   export FOX_ASH_IS_BASH=1
   export FOX_USE_TAR_BINARY=1
   export FOX_USE_SED_BINARY=1
   export FOX_USE_XZ_UTILS=1
   export OF_ENABLE_LPTOOLS=1
   export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
   export OF_USE_GREEN_LED=0
   export OF_FLASHLIGHT_ENABLE=0
   export OF_MAINTAINER="cypfq-build"
fi
