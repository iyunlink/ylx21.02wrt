#!/bin/sh 

echo 0 > /sys/class/gpio/sim1switch/value
echo 0 > /sys/class/gpio/sim2switch/value

echo 0 > /sys/class/gpio/lte1/value
echo 0 > /sys/class/gpio/lte2/value
sleep 1
echo 1 > /sys/class/gpio/lte1/value
sleep 1
echo 1 > /sys/class/gpio/lte2/value

sleep 30
/sbin/checkmodem.sh 
# 