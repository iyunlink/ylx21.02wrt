#!/bin/sh

pid1=`cat /sys/devices/platform/soc/60f8800.usb2/6000000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.2/idProduct`
pid2=`cat /sys/devices/platform/soc/60f8800.usb2/6000000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.1/idProduct`
pid3=`cat /sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.0.auto/usb1/1-1/1-1.2/idProduct`
pid4=`cat /sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.0.auto/usb1/1-1/1-1.1/idProduct`


case $pid1 in
    f601)
        dev1=`ls /sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.0.auto/usb1/1-1/1-1.1/1-1.1:1.1/ |grep tty`
        dev1="/dev/$dev1"
        band1=`at_tool at+sgcellinfo -d $dev1|grep BAND|awk -F: '{print $2}'`
    ;;
esac

case $pid2 in
    f601)
        dev2=`ls /sys/devices/platform/soc/60f8800.usb2/6000000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.1/3-1.1:1.1/ |grep tty`
        dev2="/dev/$dev2"
        band2=`at_tool at+sgcellinfo -d $dev2|grep BAND|awk -F: '{print $2}'`
    ;;
esac

case $pid3 in
    f601)
        dev3=`ls /sys/devices/platform/soc/8af8800.usb3/8a00000.dwc3/xhci-hcd.0.auto/usb1/1-1/1-1.2/1-1.2:1.1/ |grep tty`
        dev3="/dev/$dev3"
        band3=`at_tool at+sgcellinfo -d $dev3|grep BAND|awk -F: '{print $2}'`
    ;;
esac

case $pid4 in
    f601)
        dev4=`ls /sys/devices/platform/soc/60f8800.usb2/6000000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.2/3-1.2:1.1/ |grep tty`
        dev4="/dev/$dev4"
        band4=`at_tool at+sgcellinfo -d $dev4|grep BAND|awk -F: '{print $2}'`
    ;;
esac

