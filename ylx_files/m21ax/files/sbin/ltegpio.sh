#!/bin/sh 

echo 0 > /sys/class/gpio/powerlte/value
sleep 2
echo 1 > /sys/class/gpio/powerlte/value

sleep 30
/sbin/checkmodem.sh 
# 