#!/bin/sh

#
lastbuild=`cat lastbuild`

btime=`date +%Y-%m-%d`
case $1 in
     x5emmc)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x5/x5.config .config
         cp ylx_files/x5/files/ . -rf
         make package/base-files/clean V=s
         make package/link4all/lvglipq_x8/clean V=s
         cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         cp ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5-axp2402.emmc.dts ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5.dts
         make V=s $2
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-sysupgrade.bin firm/$btime-x5emmc.bin
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-factory.ubi  firm/$btime-x5emmc.ubi
      ;;
       x5)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x5/x5.config .config
         cp ylx_files/x5/files/ . -rf
         make package/base-files/clean V=s
         make package/link4all/lvglipq_x8/clean V=s
         cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         cp ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5-axp2402.dts ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5.dts
         make V=s $2
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-sysupgrade.bin firm/$btime-x5.bin
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-factory.ubi  firm/$btime-x5.ubi
      ;;
      x5sw7203)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x5/x5.sw7203.config .config
         cp ylx_files/x5/files/ . -rf
         make package/base-files/clean V=s
         make package/link4all/lvglipq_x8/clean V=s
         cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         cp ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5-sw7203.dts ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5.dts
         make V=s $2
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-sysupgrade.bin firm/$btime-x5sw7203.bin
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-factory.ubi  firm/$btime-x5sw7203.ubi
      ;;
      x5sw7203emmc)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x5/x5.sw7203.config .config
         cp ylx_files/x5/files/ . -rf
         make package/base-files/clean V=s
         make package/link4all/lvglipq_x8/clean V=s
         cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         cp ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5-sw7203.emmc.dts ./build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/arch/arm64/boot/dts/qcom/ipq6018-x5.dts
         make V=s $2
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-sysupgrade.bin firm/$btime-x5sw7203emmc.bin
         cp bin/targets/ipq60xx/generic/x5-21.02-v1.0-ipq60xx-generic-ylx_x5-squashfs-nand-factory.ubi  firm/$btime-x5sw7203emmc.ubi
      ;;
      x511)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x511/x511.config .config
         cp ylx_files/x511/files/ . -rf
         make package/base-files/clean V=s
         #cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq60xx/generic/x511-21.02-v1.0-ipq60xx-generic-ylx_x511-squashfs-nand-factory.ubi firm/$btime-x511.bin
      ;;
      q60)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/q60/q60.config .config
         cp ylx_files/q60/files/ . -rf
         make package/base-files/clean V=s
         #cp logo/logo_linux_clut224.ppm.5g build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq60xx/generic/q60-21.02-v1.0-ipq60xx-generic-ylx_q60-squashfs-nand-factory.ubi firm/$btime-q60.bin
      ;;
      x8)
         if [ "$lastbuild" = "ipq60xx" ];then
            echo "last build target is also ipq60xx"
         else
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.ipq60xx.tar.gz -C package/kernel/
         fi
         echo "ipq60xx" > lastbuild   
         rm -rf files
         cp ylx_files/x8/x8.config .config
         cp ylx_files/x8/files/ . -rf
         make package/base-files/clean V=s
         make package/link4all/lvglipq/clean V=s
         cp logo/logo_linux_clut224.ppm.fengj build_dir/target-aarch64_cortex-a53_musl/linux-ipq60xx_generic/linux-5.4.164/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq60xx/generic/x8-21.02-v1.0-ipq60xx-generic-ylx_x8-squashfs-nand-factory.ubi firm/$btime-x8.ubi
         cp bin/targets/ipq60xx/generic/x8-21.02-v1.0-ipq60xx-generic-ylx_x8-squashfs-nand-sysupgrade.bin firm/$btime-x8.bin
      ;;
      x2)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ath79" > lastbuild
         if [ "$2" = "bond" ];then
            cp ylx_files/x2/x2.bond.config .config
            cp ylx_files/x2/manage1.bond.asp ylx_files/x2/files/www/manage1.asp
         elif [ "$2" = "mwan3" ];then
            cp ylx_files/x2/x2.mwan3.config .config
            cp ylx_files/x2/manage1.mwan3.asp ylx_files/x2/files/www/manage1.asp
         elif [ "$2" = "trojan" ];then
            cp ylx_files/x2/x2.trojan.config .config
            cp ylx_files/x2/manage1.bond.asp ylx_files/x2/files/www/manage1.asp
         elif [ "$2" = "bond_mwan3" ];then
            cp ylx_files/x2/x2.bond_mwan3.config .config
            cp ylx_files/x2/manage1.bond.asp ylx_files/x2/files/www/manage1.asp
         else
            echo "please input bond or mwan3"
            exit 1
         fi
         rm -rf files
         cp ylx_files/x2/files/ . -rf
         make package/base-files/clean V=s
         make V=s $3
         
         if [ "$2" = "bond" ];then
            cp bin/targets/ath79/generic/x2-21.02-v1.0-ath79-generic-ylx_x2-squashfs-sysupgrade.bin firm/$btime-x2.bond.bin
         elif [ "$2" = "mwan3" ];then
            cp bin/targets/ath79/generic/x2-21.02-v1.0-ath79-generic-ylx_x2-squashfs-sysupgrade.bin firm/$btime-x2.mwan3.bin
         elif [ "$2" = "trojan" ];then
            cp bin/targets/ath79/generic/x2-21.02-v1.0-ath79-generic-ylx_x2-squashfs-sysupgrade.bin firm/$btime-x2.trojan.bin
         elif [ "$2" = "bond_mwan3" ];then
            cp bin/targets/ath79/generic/x2-21.02-v1.0-ath79-generic-ylx_x2-squashfs-sysupgrade.bin firm/$btime-x2.bond_mwan3.bin
         else
            echo "please input bond or mwan3"
            exit 1
         fi
         ;;
      x2_zwpy)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ath79" > lastbuild

         cp ylx_files/x2/zwpy.config .config
         rm -rf files
         cp ylx_files/x2/files/ . -rf
         cp ylx_files/x2/zwpy/* files -rf
         make package/base-files/clean V=s
         make V=s $2
         cp bin/targets/ath79/generic/t421-21.02-v1.0-ath79-generic-ylx_x2-squashfs-sysupgrade.bin firm/$btime-x2_zwpy.bin
         ;;
      x4)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ipq40xx" > lastbuild  
         rm -rf files
         cp ylx_files/x4/x4.config .config
         cp ylx_files/x4/files/ . -rf
         make package/base-files/clean V=s
         cp logo/logo_linux_clut224.ppm.mine build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-ipq40xx_generic/linux-5.4.179/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-sysupgrade.bin firm/$btime-x4-m4pro.bin
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-factory.ubi firm/$btime-x4-m4pro.ubi
      ;;
      x4_aodun)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ipq40xx" > lastbuild  
         rm -rf files
         cp ylx_files/x4/x4.config .config
         cp ylx_files/x4/files/ . -rf
         cp ylx_files/x4/aodun/* files/ -rf
         make package/base-files/clean V=s
         cp logo/logo_linux_clut224.ppm.aodun build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-ipq40xx_generic/linux-5.4.179/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-sysupgrade.bin firm/$btime-x4-aodun.bin
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-factory.ubi firm/$btime-x4-aodun.ubi
      ;;
      x4_zhongxing)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ipq40xx" > lastbuild  
         rm -rf files
         cp ylx_files/x4/x4.config .config
         cp ylx_files/x4/files/ . -rf
         cp ylx_files/x4/zhongxing/* files/ -rf
         make package/base-files/clean V=s
         cp logo/logo_linux_clut224.ppm.linux build_dir/target-arm_cortex-a7+neon-vfpv4_musl_eabi/linux-ipq40xx_generic/linux-5.4.179/drivers/video/logo/logo_linux_clut224.ppm
         make V=s $2
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-sysupgrade.bin firm/$btime-x4-zhongxing.bin
         cp bin/targets/ipq40xx/generic/x4-21.02-v1.0-ipq40xx-generic-m4pro-squashfs-nand-factory.ubi firm/$btime-x4-zhongxing.ubi
      ;;
       m21ax)
         if [ "$lastbuild" = "ipq60xx" ];then
            rm -rf package/kernel/mac80211
            tar zxvf package/kernel/mac80211.orig.tar.gz -C package/kernel/
         else
            echo "last build target is not x5"
         fi
         echo "ramips" > lastbuild  
         rm -rf files
         cp ylx_files/m21ax/m21ax.config .config
         cp ylx_files/m21ax/files/ . -rf
         make package/base-files/clean V=s
         make V=s $2
         cp bin/targets/ramips/mt7621/openwrt-ramips-mt7621-ylx_m21ax-squashfs-sysupgrade.bin firm/$btime-m21ax.bin
      ;;
     *)
        echo "please input ./build.sh x5/x5sw7203/x511/q60/x8/x2/x4/x4_aodun/x4_zhongxing [-j4]."
        ;;
esac
