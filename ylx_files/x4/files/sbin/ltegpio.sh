#!/bin/sh 

#aw9523b i2c gpio control-- i2c addr is 0x58
# i2cdump -y -f 0 0x58

# #p1 output mode
# i2cset -y -f 0 0x58 0x05 0x0
# #p0 output mode
# i2cset -y -f 0 0x58 0x04 0x0

# #P1_0-3 lte power up  (output high )
# i2cset -y -f 0 0x58 0x02 0xf

# #P1_4-7 4*lte reset (output low)
# i2cset -y -f 0 0x58 0x03 0xf0
# # lte1 power up
# i2cset -y -f 0 0x58 0x03 0xf8 
# # wait lte modem up to avoid kernel crash
# sleep 5
# # lte1,lte2 power up
# i2cset -y -f 0 0x58 0x03 0xfc  
# sleep 5
# # lte1,lte2,lte3 power up
# i2cset -y -f 0 0x58 0x03 0xfe  
# sleep 5
# # lte1,lte2,lte3,lte4 power up
# i2cset -y -f 0 0x58 0x03 0xff 

for i in `seq 1 4`
do
echo 0 > /sys/class/gpio/lte$i/value
done

sleep 2

for i in `seq 1 4`
do
echo 1 > /sys/class/gpio/lte$i/value
sleep 1
done

sleep 25

/sbin/checkmodem.sh &