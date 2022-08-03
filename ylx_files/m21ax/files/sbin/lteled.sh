#!/bin/sh 

echo "timer" > /sys/class/leds/lte/trigger
echo 500  > /sys/class/leds/lte/delay_off
echo 500  > /sys/class/leds/lte/delay_on

sleep 8

echo "netdev" > /sys/class/leds/lte/trigger

netdevice1=`uci get config4g.4G.netdevice`
echo "$netdevice1" > /sys/class/leds/lte/device_name

echo 1 > /sys/class/leds/lte/link
echo 1 > /sys/class/leds/lte/tx
echo 1 > /sys/class/leds/lte/rx



# 