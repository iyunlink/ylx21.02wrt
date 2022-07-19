#!/bin/sh

path13="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.2"
path12="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.2"

path23="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.3"
path22="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.3"

path33="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.4"
path32="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.4"

path43="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb4/4-1/4-1.1"
path42="/sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.1"

path53="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb6/6-4"
path52="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-4"

path63="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb6/6-3"
path62="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-3"

path73="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb6/6-2"
path72="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-2"

path83="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb6/6-1"
path82="/sys/devices/platform/soc/20000000.pci/pci0000:00/0000:00:00.0/0000:01:00.0/usb5/5-1"

dev1="NULL"
dev2="NULL"
dev3="NULL"
dev4="NULL"
dev5="NULL"
dev6="NULL"
dev7="NULL"
dev8="NULL"
netdevice1="NULL"
netdevice2="NULL"
netdevice3="NULL"
netdevice4="NULL"
netdevice5="NULL"
netdevice6="NULL"
netdevice7="NULL"
netdevice8="NULL"

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

if ls $path53 > /dev/null 2>&1;then
    pid5=`cat $path53/idProduct`
    vid5=`cat $path53/idVendor`
    path5="$path53"
elif ls $path52 > /dev/null 2>&1;then
    pid5=`cat $path52/idProduct`
    vid5=`cat $path52/idVendor`
    path5="$path52"
else
    pid5=
    vid5=
fi

if ls $path63 > /dev/null 2>&1;then
    pid6=`cat $path63/idProduct`
    vid6=`cat $path63/idVendor`
    path6="$path63"
elif ls $path62 > /dev/null 2>&1;then
    pid6=`cat $path62/idProduct`
    vid6=`cat $path62/idVendor`
    path6="$path62"
else
    pid6=
    vid6=
fi

if ls $path73 > /dev/null 2>&1;then
    pid7=`cat $path73/idProduct`
    vid7=`cat $path73/idVendor`
    path7="$path73"
elif ls $path72 > /dev/null 2>&1;then
    pid7=`cat $path72/idProduct`
    vid7=`cat $path72/idVendor`
    path7="$path72"
else
    pid7=
    vid7=
fi

if ls $path83 > /dev/null 2>&1;then
    pid8=`cat $path83/idProduct`
    vid8=`cat $path83/idVendor`
    path8="$path83"
elif ls $path82 > /dev/null 2>&1;then
    pid8=`cat $path82/idProduct`
    vid8=`cat $path82/idVendor`
    path8="$path82"
else
    pid8=
    vid8=
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
        atcmd1="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid2}P${pid2}.dCmd")"
        uci set config4g.4G1.atcmd="$atcmd1"
    else
        uci set config4g.4G1.atcmd=""
    fi
    uci set config4g.4G1.tty="$dev1"
    uci set config4g.4G1.tool="$CM1"
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

[ -n "$pid5" ] && {
    CM5="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid5}P${pid5}.dMothed")"
    netindex5="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid5}P${pid5}.netDev")"
    atindex5="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid5}P${pid5}.atDev")"
    model5="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid5}P${pid5}.name")"

    netdevice5=`ls $path5/${path5##*/}:${netindex5}/net`
    DEVICENAME5=`ls $path5/${path5##*/}:${atindex5}/|grep ttyUSB`
    dev5="/dev/$DEVICENAME5"

    if [ "$CM5" = "at"  ];then
        atcmd5="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid5}P${pid5}.dCmd")"
        uci set config4g.4G4.atcmd="$atcmd5"
    else
        uci set config4g.4G4.atcmd=""
    fi
    uci set config4g.4G4.tty="$dev5"
    uci set config4g.4G4.tool="$CM5"
    uci commit config4g
}

[ -n "$pid6" ] && {
    CM6="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid6}P${pid6}.dMothed")"
    netindex6="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid6}P${pid6}.netDev")"
    atindex6="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid6}P${pid6}.atDev")"
    model6="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid6}P${pid6}.name")"

    netdevice6=`ls $path6/${path6##*/}:${netindex6}/net`
    DEVICENAME6=`ls $path6/${path6##*/}:${atindex6}/|grep ttyUSB`
    dev6="/dev/$DEVICENAME6"

    if [ "$CM6" = "at"  ];then
        atcmd6="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid6}P${pid6}.dCmd")"
        uci set config4g.4G5.atcmd="$atcmd6"
    else
        uci set config4g.4G5.atcmd=""
    fi
    uci set config4g.4G5.tty="$dev6"
    uci set config4g.4G5.tool="$CM6"
    uci commit config4g
}

[ -n "$pid7" ] && {
    CM7="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid7}P${pid7}.dMothed")"
    netindex7="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid7}P${pid7}.netDev")"
    atindex7="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid7}P${pid7}.atDev")"
    model7="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid7}P${pid7}.name")"

    netdevice7=`ls $path7/${path7##*/}:${netindex7}/net`
    DEVICENAME7=`ls $path7/${path7##*/}:${atindex7}/|grep ttyUSB`
    dev7="/dev/$DEVICENAME7"

    if [ "$CM7" = "at"  ];then
        atcmd7="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid7}P${pid7}.dCmd")"
        uci set config4g.4G6.atcmd="$atcmd7"
    else
        uci set config4g.4G6.atcmd=""
    fi
    uci set config4g.4G6.tty="$dev7"
    uci set config4g.4G6.tool="$CM7"
    uci commit config4g
}

[ -n "$pid8" ] && {
    CM8="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid8}P${pid8}.dMothed")"
    netindex8="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid8}P${pid8}.netDev")"
    atindex8="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid8}P${pid8}.atDev")"
    model8="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid8}P${pid8}.name")"

    netdevice8=`ls $path8/${path8##*/}:${netindex8}/net`
    DEVICENAME8=`ls $path8/${path8##*/}:${atindex8}/|grep ttyUSB`
    dev8="/dev/$DEVICENAME8"

    if [ "$CM8" = "at"  ];then
        atcmd8="$(cat /etc/config/modem.json|jsonfilter -e "@.V${vid8}P${pid8}.dCmd")"
        uci set config4g.4G7.atcmd="$atcmd8"
    else
        uci set config4g.4G7.atcmd=""
    fi
    uci set config4g.4G7.tty="$dev8"
    uci set config4g.4G7.tool="$CM8"
    uci commit config4g
}


uci set network.lte1.device="${netdevice1}"
uci set network.lte2.device="${netdevice2}"
uci set network.lte3.device="${netdevice3}"
uci set network.lte4.device="${netdevice4}"
uci set network.lte5.device="${netdevice5}"
uci set network.lte6.device="${netdevice6}"
uci set network.lte7.device="${netdevice7}"
uci set network.lte8.device="${netdevice8}"

uci set config4g.4G.netdevice="$netdevice1"
uci set config4g.4G1.netdevice="$netdevice2"
uci set config4g.4G2.netdevice="$netdevice3"
uci set config4g.4G3.netdevice="$netdevice4"
uci set config4g.4G4.netdevice="$netdevice5"
uci set config4g.4G5.netdevice="$netdevice6"
uci set config4g.4G6.netdevice="$netdevice7"
uci set config4g.4G7.netdevice="$netdevice8"

uci set 4g.modem1.device="$dev1"
uci set 4g.modem2.device="$dev2"
uci set 4g.modem3.device="$dev3"
uci set 4g.modem4.device="$dev4"
uci set 4g.modem5.device="$dev6"
uci set 4g.modem6.device="$dev6"
uci set 4g.modem7.device="$dev7"
uci set 4g.modem8.device="$dev8"

uci set 4g.modem1.vidpid="V${vid1}P${pid1}"
uci set 4g.modem2.vidpid="V${vid2}P${pid2}"
uci set 4g.modem3.vidpid="V${vid3}P${pid3}"
uci set 4g.modem4.vidpid="V${vid4}P${pid4}"
uci set 4g.modem5.vidpid="V${vid5}P${pid5}"
uci set 4g.modem6.vidpid="V${vid6}P${pid6}"
uci set 4g.modem7.vidpid="V${vid7}P${pid7}"
uci set 4g.modem8.vidpid="V${vid8}P${pid8}"

uci set 4g.modem1.model="$model1"
uci set 4g.modem2.model="$model2"
uci set 4g.modem3.model="$model3"
uci set 4g.modem4.model="$model4"
uci set 4g.modem5.model="$model5"
uci set 4g.modem6.model="$model6"
uci set 4g.modem7.model="$model7"
uci set 4g.modem8.model="$model8"

uci set lte_info.card1.ethName="$netdevice1"
uci set lte_info.card2.ethName="$netdevice2"
uci set lte_info.card3.ethName="$netdevice3"
uci set lte_info.card4.ethName="$netdevice4"
uci set lte_info.card5.ethName="$netdevice5"
uci set lte_info.card6.ethName="$netdevice6"
uci set lte_info.card7.ethName="$netdevice7"
uci set lte_info.card8.ethName="$netdevice8"

uci set lte_info.card1.ttyName="$dev1"
uci set lte_info.card2.ttyName="$dev2"
uci set lte_info.card3.ttyName="$dev3"
uci set lte_info.card4.ttyName="$dev4"
uci set lte_info.card5.ttyName="$dev5"
uci set lte_info.card6.ttyName="$dev6"
uci set lte_info.card7.ttyName="$dev7"
uci set lte_info.card8.ttyName="$dev8"

uci commit lte_info
uci commit 4g
uci commit config4g
uci commit network

cp /etc/config/lte_info /tmp/lte_info
/etc/init.d/config4g restart &
/etc/init.d/net_ttyipq restart &
/etc/init.d/lv_exampleipq restart &

(sleep 5;/etc/init.d/shadowsocksr restart) &

