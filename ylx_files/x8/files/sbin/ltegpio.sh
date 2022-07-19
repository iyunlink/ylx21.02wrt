#!/bin/sh 

for i in `seq 1 8`
do 
echo 0 > /sys/class/gpio/lte$i/value
done
sleep 2
for i in `seq 1 8`
do 
echo 1 > /sys/class/gpio/lte$i/value
done

sleep 25

/sbin/checkmodem.sh &