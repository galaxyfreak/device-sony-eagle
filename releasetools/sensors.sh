#!/bin/bash
id=`cat /sys/class/magnetic/magnetic/ping`
if [ $id == "0x30:0x06" ]
then
	echo ro.sensors.sensorsecond=true >> /system/build.prop
fi
exit 0
