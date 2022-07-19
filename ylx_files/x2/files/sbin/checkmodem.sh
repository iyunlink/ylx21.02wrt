#!/bin/sh

path1="/sys/devices/platform/ahb/1b000000.usb/usb1/1-1/1-1.4"
path2="/sys/devices/platform/ahb/1b000000.usb/usb1/1-1/1-1.3"

dev1="NULL"
dev2="NULL"

netdevice3="NULL"
netdevice4="NULL"

if ls $path1 > /dev/null 2>&1;then
    pid1=`cat $path1/idProduct`
    vid1=`cat $path1/idVendor`
else
    pid1=
    vid1=
fi

if ls $path2 > /dev/null 2>&1;then
    pid2=`cat $path2/idProduct`
    vid2=`cat $path2/idVendor`
else
    pid2=
    vid2=
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

[ -n "$pid2" ] && {
    CM2="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.dMothed")"
    netindex2="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.netDev")"
    atindex2="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.atDev")"
    model2="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.name")"

    netdevice2=`ls $path2/${path2##*/}:${netindex2}/net`
    DEVICENAME2=`ls $path2/${path2##*/}:${atindex2}/|grep ttyUSB`
    dev2="/dev/$DEVICENAME2"

    if [ "$CM2" = "at"  ];then
        atcmd2="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.dCmd")"
        uci set config4g.4G1.atcmd="$atcmd2"
    else
        uci set config4g.4G1.atcmd=""
    fi
    uci set config4g.4G1.tty="$dev2"
    uci set config4g.4G1.tool="$CM2"
    uci commit config4g
}


uci set network.lte1.device="${netdevice1}"
uci set network.lte2.device="${netdevice2}"

uci set config4g.4G.netdevice="$netdevice1"
uci set config4g.4G1.netdevice="$netdevice2"

uci set 4g.modem1.device="$dev1"
uci set 4g.modem2.device="$dev2"

uci set 4g.modem1.vidpid="V${vid1}P${pid1}"
uci set 4g.modem2.vidpid="V${vid2}P${pid2}"

uci set config4g.4G.vidpid="V${vid1}P${pid1}"
uci set config4g.4G1.vidpid="V${vid2}P${pid2}"

uci set 4g.modem1.model="$model1"
uci set 4g.modem2.model="$model2"

uci commit 4g
uci commit config4g
uci commit network

/etc/init.d/config4g restart &
ifup lte1 
ifup lte2

