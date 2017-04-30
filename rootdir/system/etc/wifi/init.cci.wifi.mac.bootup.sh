#!/system/bin/sh
# Copyright (c) 2015, Compal Electronics, Inc.
# All Rights, including trade secret rights, Reserved.
# 
# This script is part of the solution which gets WiFi mac address from TA partition,
# and writes this mac address into configuration file.
# This solution is used only in Qualcomm Mobile platform with WCN36x0 connectivity solution.
# 
# This script is used to execute wifimactool when system bootup.
#

LOG_TAG="wifimac-bootup"
LOG_NAME="${0}:"

defwifimac="000AF58989FF"

loge ()
{
  /system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

rm /data/misc/wifi/WCNSS_qcom_cfg.ini

#cfg_size=`ls -s /data/misc/wifi/WCNSS_qcom_cfg.ini`

if [ ! -e /data/misc/wifi/WCNSS_qcom_cfg.ini ] || [[ $cfg_size == 0* ]]; then
    cp /system/etc/wifi/WCNSS_qcom_cfg.ini \
	/data/misc/wifi/WCNSS_qcom_cfg.ini
    chown system:wifi /data/misc/wifi/WCNSS_qcom_cfg.ini
    chmod 660 /data/misc/wifi/WCNSS_qcom_cfg.ini
    rm /system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini
    ln -s /data/misc/wifi/WCNSS_qcom_cfg.ini /system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini
    loge "config file checking, file non exist or size zero, re-copy config file"
fi


logi "Start to read WiFi Mac address from TA partition when system bootup"
/system/bin/wifimactool -t

case $? in

    0)
    logi "ok! read WiFi Mac address from TA done."
    ;;

    *)
    loge "fail! something wrong!"
    ;;

esac

logi "start to get wifi mac address property."

wifimacstring=`getprop persist.sys.wifi.ta.mac`

if [ "$wifimacstring" = "" ]; then
    logi "wifi mac address property does not exist yet! use defaut wifi mac address."
    useDefWifimac="true"
else
    logi "wifi mac address property exist! -> $wifimacstring"
    useDefWifimac="false"
fi

logi "start wifimactool check procedure"

if [ "$useDefWifimac" = "true" ]; then
    /system/bin/wifimactool -c $defwifimac -d
else
    /system/bin/wifimactool -c $wifimacstring -d
fi

case $? in

    0)
    logi "ok! wifimactool check procedure done."
    ;;

    *)
    loge "fail! something wrong!"
    ;;

esac

exit 0
