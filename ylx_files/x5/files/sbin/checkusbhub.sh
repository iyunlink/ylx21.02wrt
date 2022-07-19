#!/bin/sh

check_usbhub(){
    if ! lsusb|grep -q '05e3:';then
        [ ! -d /sys/class/gpio/gpio454 ] && {
        echo 454 > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio454/direction
        }
        echo 0 > /sys/class/gpio/gpio454/value
        sleep 5
        echo 1 > /sys/class/gpio/gpio454/value

        # echo 0 > /sys/class/leds/modem/brightness
        # sleep 2
        # echo 1 > /sys/class/leds/modem/brightness
    fi
}

while true;
do
    check_usbhub
    sleep 5
done