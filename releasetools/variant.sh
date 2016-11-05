#!/sbin/sh
 
set -e
 
# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
mount -r -t ext4 /dev/block/platform/msm_sdcc.1/by-name/LTALabel /lta-label
variant=`ls /lta-label/*.html | sed s/.*-elabel-// | sed s/-row.html// | tr -d '\n\r' | tr '[a-z]' '[A-Z]'`
umount /lta-label
 
# Set the variant as a prop
touch /system/vendor/build.prop
echo ro.fxp.variant=${variant} >> /system/vendor/build.prop

# Set Correct product name
touch /system/vendor/build.prop
if [ "${variant}" = "D2403" || "${variant}" = "D2406" ]; then
    echo "ro.product.name=Xperia M2 Aqua" >> /system/vendor/build.prop
    setprop ro.telephony.ril.config=simactivation
    setprop ro.telephony.default_network=9
if [ "${variant}" = "D2302" ]; then
    echo "ro.product.name=Xperia M2 Dual" >> /system/vendor/build.prop
    setprop persist.radio.multisim.config=dsds
    setprop ro.telephony.ril.config=simactivation,sim2gsmonly
    setprop ro.telephony.default_network=0,1
if [ "${variant}" = "D2305" ]; then
    echo "ro.product.name=Xperia M2 3G" >> /system/vendor/build.prop
    setprop ro.telephony.ril.config=simactivation
    setprop ro.telephony.default_network=0,1
else
    echo "ro.product.name=Xperia M2" >> /system/vendor/build.prop
    setprop ro.telephony.ril.config=simactivation
    setprop ro.telephony.default_network=9
fi
exit 0
