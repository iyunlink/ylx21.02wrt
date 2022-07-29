#!/bin/sh

if [ "`fw_printenv hver|cut -d"=" -f2`"x = "v3"x -o "`fw_printenv hver|cut -d"=" -f2`"x = "v2"x ];then
    path13="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.1"
    path12="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.1"

    path23="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.2"
    path22="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.2"

    path33="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.3"
    path32="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.3"

    path43="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.4"
    path42="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.4"
else
    path13="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.2"
    path12="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.2"

    path23="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.4"
    path22="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.4"

    path33="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.3"
    path32="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.3"

    path43="/sys/devices/platform/soc/70f8800.usb3/7000000.dwc3/xhci-hcd.0.auto/usb2/1-1"
    path42="/sys/devices/platform/soc/70f8800.usb2/7000000.dwc3/xhci-hcd.0.auto/usb1/1-1"
fi

dev1="NULL"
dev2="NULL"
dev3="NULL"
dev4="NULL"
netdevice1="NULL"
netdevice2="NULL"
netdevice3="NULL"
netdevice4="NULL"

if ls $path13 > /dev/null 2>&1;then
    pid1=`cat $path13/idProduct`
    vid1=`cat $path13/idVendor`
    path1="$path13"
elif ls $path12 > /dev/null 2>&1;then
    pid1=`cat $path12/idProduct`
    vid1=`cat $path12/idVendor`
    path1="$path12"
else
    pid1=
    vid1=
fi

if ls $path23 > /dev/null 2>&1;then
    pid2=`cat $path23/idProduct`
    vid2=`cat $path23/idVendor`
    path2="$path23"
elif ls $path22 > /dev/null 2>&1;then
    pid2=`cat $path22/idProduct`
    vid2=`cat $path22/idVendor`
    path2="$path22"
else
    pid2=
    vid2=
fi

if ls $path33 > /dev/null 2>&1;then
    pid3=`cat $path33/idProduct`
    vid3=`cat $path33/idVendor`
    path3="$path33"
elif ls $path32 > /dev/null 2>&1;then
    pid3=`cat $path32/idProduct`
    vid3=`cat $path32/idVendor`
    path3="$path32"
else
    pid3=
    vid3=
fi

if ls $path43 > /dev/null 2>&1;then
    pid4=`cat $path43/idProduct`
    vid4=`cat $path43/idVendor`
    path4="$path43"
elif ls $path42 > /dev/null 2>&1;then
    pid4=`cat $path42/idProduct`
    vid4=`cat $path42/idVendor`
    path4="$path42"
else
    pid4=
    vid4=
fi

# echo pid1:$pid1,pid2:$pid2,pid3:$pid3,pid4:$pid4

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

[ -n "$pid3" ] && {
    CM3="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid3}P${pid3}.dMothed")"
    netindex3="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid3}P${pid3}.netDev")"
    atindex3="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid3}P${pid3}.atDev")"
    model3="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid3}P${pid3}.name")"

    netdevice3=`ls $path3/${path3##*/}:${netindex3}/net`
    DEVICENAME3=`ls $path3/${path3##*/}:${atindex3}/|grep ttyUSB`
    dev3="/dev/$DEVICENAME3"

    if [ "$CM3" = "at"  ];then
        atcmd3="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid3}P${pid3}.dCmd")"
        uci set config4g.4G2.atcmd="$atcmd3"
    else
        uci set config4g.4G2.atcmd=""
    fi
    uci set config4g.4G2.tty="$dev3"
    uci set config4g.4G2.tool="$CM3"
    uci commit config4g
}

[ -n "$pid4" ] && {
    CM4="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid4}P${pid4}.dMothed")"
    netindex4="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid4}P${pid4}.netDev")"
    atindex4="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid4}P${pid4}.atDev")"
    model4="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid4}P${pid4}.name")"

    netdevice4=`ls $path4/${path4##*/}:${netindex4}/net`
    DEVICENAME4=`ls $path4/${path4##*/}:${atindex4}/|grep ttyUSB`
    dev4="/dev/$DEVICENAME4"

    if [ "$CM4" = "at"  ];then
        atcmd4="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid4}P${pid4}.dCmd")"
        uci set config4g.4G3.atcmd="$atcmd4"
    else
        uci set config4g.4G3.atcmd=""
    fi
    uci set config4g.4G3.tty="$dev4"
    uci set config4g.4G3.tool="$CM4"
    uci commit config4g
}
# echo netdevice1:$netdevice1,netdevice2:$netdevice2,netdevice3:$netdevice3,netdevice4:$netdevice4

case "$pid1" in
    0620)
    uci set network.lte1.device="${netdevice1}_1"
    ;;
    *)
    uci set network.lte1.device="${netdevice1}"
    ;;
esac
case "$pid2" in
    0620)
    uci set network.lte2.device="${netdevice2}_1"
    ;;
    *)
    uci set network.lte2.device="${netdevice2}"
    ;;
esac
case "$pid3" in
    0620)
    uci set network.lte3.device="${netdevice3}_1"
    ;;
    *)
    uci set network.lte3.device="${netdevice3}"
    ;;
esac
case "$pid4" in
    0620)
    uci set network.lte4.device="${netdevice4}_1"
    ;;
    *)
    uci set network.lte4.device="${netdevice4}"
    ;;
esac

/etc/init.d/config4g stop
ifdown lte1
ifdown lte2
ifdown lte3
ifdown lte4
[ -f /sys/class/net/$netdevice1/qmi/raw_ip ] && echo Y > /sys/class/net/$netdevice1/qmi/raw_ip
[ -f /sys/class/net/$netdevice2/qmi/raw_ip ] && echo Y > /sys/class/net/$netdevice2/qmi/raw_ip
[ -f /sys/class/net/$netdevice3/qmi/raw_ip ] && echo Y > /sys/class/net/$netdevice3/qmi/raw_ip
[ -f /sys/class/net/$netdevice1/qmi/raw_ip ] && echo Y > /sys/class/net/$netdevice4/qmi/raw_ip

uci set config4g.4G.netdevice="$netdevice1"
uci set config4g.4G1.netdevice="$netdevice2"
uci set config4g.4G2.netdevice="$netdevice3"
uci set config4g.4G3.netdevice="$netdevice4"

uci set 4g.modem1.device="$dev1"
uci set 4g.modem2.device="$dev2"
uci set 4g.modem3.device="$dev3"
uci set 4g.modem4.device="$dev4"

uci set 4g.modem1.vidpid="V${vid1}P${pid1}"
uci set 4g.modem2.vidpid="V${vid2}P${pid2}"
uci set 4g.modem3.vidpid="V${vid3}P${pid3}"
uci set 4g.modem4.vidpid="V${vid4}P${pid4}"

uci set 4g.modem1.model="$model1"
uci set 4g.modem2.model="$model2"
uci set 4g.modem3.model="$model3"
uci set 4g.modem4.model="$model4"

uci set lte_info.card1.ethName="$netdevice1"
uci set lte_info.card2.ethName="$netdevice2"
uci set lte_info.card3.ethName="$netdevice3"
uci set lte_info.card4.ethName="$netdevice4"

uci set lte_info.card1.ttyName="$dev1"
uci set lte_info.card2.ttyName="$dev2"
uci set lte_info.card3.ttyName="$dev3"
uci set lte_info.card4.ttyName="$dev4"

uci commit lte_info
uci commit 4g
uci commit config4g
uci commit network

cp /etc/config/lte_info /tmp/lte_info
/etc/init.d/config4g restart 
/etc/init.d/net_ttyipq restart 
/etc/init.d/lv_exampleipq restart
ifup lte1
ifup lte2
ifup lte3
ifup lte4

(sleep 5;/etc/init.d/shadowsocksr restart) &

