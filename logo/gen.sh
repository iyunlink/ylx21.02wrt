#!/bin/sh

# sudo apt-get install netpbm
# pngtopnm jz2440.png > jz2440.pnm
# pnmquant 224 jz2440.pnm > logo224.pnm
# pnmtoplainpnm logo224.pnm > logo_linux_clut224.ppm

for png in `ls *.png`
do
  pngtopnm $png > $png.pnm
  pnmquant 224 $png.pnm > $png.qnt
  pnmtoplainpnm $png.qnt > logo_linux_clut224.ppm.${png%.*}
done

rm -rf *.pnm *.qnt
