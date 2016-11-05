#!/sbin/sh
 
set -e
 
# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
mount -r -t ext4 /dev/block/platform/msm_sdcc.1/by-name/LTALabel /lta-label
variant=`ls /lta-label/*.html | sed s/.*-elabel-// | sed s/-row.html// | tr -d '\n\r' | tr '[a-z]' '[A-Z]'`
umount /lta-label

# Delete old build.prop
if [ -f /system/vendor/build.prop ]; then
   rm /system/vendor/build.prop
fi

# Set the variant as a prop
touch /system/vendor/build.prop
echo ro.fxp.variant=${variant} >> /system/vendor/build.prop

# Set Correct product name and radio capabilities
if [ "${variant}" = "D2403" ] || [ "${variant}" = "D2406" ]; then
    echo "ro.product.model=Xperia M2 Aqua" >> /system/vendor/build.prop
    echo "ro.telephony.ril.config=simactivation" >> /system/vendor/build.prop
    echo "ro.telephony.default_network=9" >> /system/vendor/build.prop
fi
if [ "${variant}" = "D2302" ]; then
    echo "ro.product.model=Xperia M2 Dual" >> /system/vendor/build.prop
    echo "persist.radio.multisim.config=dsds" >> /system/vendor/build.prop
    echo "ro.telephony.ril.config=simactivation,sim2gsmonly" >> /system/vendor/build.prop
    echo "ro.telephony.default_network=0,1" >> /system/vendor/build.prop
fi
if [ "${variant}" = "D2305" ]; then
    echo "ro.product.model=Xperia M2 3G" >> /system/vendor/build.prop
    echo "ro.telephony.ril.config=simactivation" >> /system/vendor/build.prop
    echo "ro.telephony.default_network=0,1" >> /system/vendor/build.prop
fi
if [ "${variant}" = "D2303" ] || [ "${variant}" = "D2306" ]; then
    echo "ro.product.model=Xperia M2" >> /system/vendor/build.prop
    echo "ro.telephony.ril.config=simactivation" >> /system/vendor/build.prop
    echo "ro.telephony.default_network=9" >> /system/vendor/build.prop
fi

# Fix permissions
chmod 0644 /system/vendor/build.prop

exit 0
