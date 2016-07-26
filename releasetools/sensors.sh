#!/bin/bash
id=`cat /sys/class/magnetic/magnetic/ping`
if [ $id == "0x30:0x06" ]
then
	rm -f /system/lib/hw/sensors.msm8226.so
	mv /system/lib/hw/sensorsecond.msm8226.so /system/lib/hw/sensors.msm8226.so
fi
exit 0
