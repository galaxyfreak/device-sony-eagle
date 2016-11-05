#!/sbin/sh
 
set -e
 
# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
mount -r -t ext4 /dev/block/platform/msm_sdcc.1/by-name/LTALabel /lta-label
variant=`ls /lta-label/*.html | sed s/.*-elabel-// | sed s/-row.html// | tr -d '\n\r'`
umount /lta-label
 
# Set the variant as a prop
touch /system/vendor/build.prop
echo ro.fxp.variant=${variant} >> /system/vendor/build.prop
 
exit 0
