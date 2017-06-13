#!/system/bin/sh
 
/system/bin/wifimactool -t
 
wifimacstring=`getprop persist.sys.wifi.ta.mac`
 
    echo $wifimacstring|sed 's/\(..\)/\1:/g;s/:$//' >  /sys/devices/fb000000.qcom,wcnss-wlan/wcnss_mac_addr
 
exit 0
