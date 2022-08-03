#!/bin/sh

path1="/sys/devices/platform/1e1c0000.xhci/usb2/2-1"
dev1="NULL"
netdevice1="NULL"


if ls $path1 > /dev/null 2>&1;then
    pid1=`cat $path1/idProduct`
    vid1=`cat $path1/idVendor`
else
    pid1=
    vid1=
fi

[ -n "$pid1" ] && {
    CM1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid1}P${pid1}.dMothed")"
    netindex1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid1}P${pid1}.netDev")"
    atindex1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid1}P${pid1}.atDev")"
    model1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid1}P${pid1}.name")"

    netdevice1=`ls $path1/${path1##*/}:${netindex1}/net`
    DEVICENAME1=`ls $path1/${path1##*/}:${atindex1}/|grep ttyUSB`
    dev1="/dev/$DEVICENAME1"

    if [ "$CM1" = "at"  ];then
        atcmd1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid1}P${pid1}.dCmd")"
        uci set config4g.4G.atcmd="$atcmd1"
    else
        uci set config4g.4G.atcmd=""
    fi
    uci set config4g.4G.tty="$dev1"
    uci set config4g.4G.tool="$CM1"
    uci commit config4g
}


uci set network.lte1.device="${netdevice1}"
uci set config4g.4G.netdevice="$netdevice1"
uci set 4g.modem1.device="$dev1"
uci set 4g.modem1.vidpid="V${vid1}P${pid1}"
uci set config4g.4G.vidpid="V${vid1}P${pid1}"
uci set 4g.modem1.model="$model1"


uci commit 4g
uci commit config4g
uci commit network

/etc/init.d/config4g restart &
ifup lte1 


