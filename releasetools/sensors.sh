#!/sbin/sh

DIR="/system/vendor/lib/hw"
ID=$(cat /sys/class/magnetic/magnetic/ping)

if [ "$ID" == "0x30:0x06" ]
then
	mount -w -t ext4 /dev/block/platform/msm_sdcc.1/by-name/system /system
	rm -f $DIR/sensors.eagle.so
	mv $DIR/sensorsecond.eagle.so $DIR/sensors.eagle.so
fi
exit 0
