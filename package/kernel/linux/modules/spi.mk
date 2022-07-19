#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

SPI_MENU:=SPI Support

define KernelPackage/mmc-spi
  SUBMENU:=$(SPI_MENU)
  TITLE:=MMC/SD over SPI Support
  DEPENDS:=+kmod-mmc +kmod-lib-crc-itu-t +kmod-lib-crc7
  KCONFIG:=CONFIG_MMC_SPI \
          CONFIG_SPI=y \
          CONFIG_SPI_MASTER=y
  FILES:=\
	$(if $(CONFIG_OF),$(LINUX_DIR)/drivers/mmc/host/of_mmc_spi.ko) \
	$(LINUX_DIR)/drivers/mmc/host/mmc_spi.ko
  AUTOLOAD:=$(call AutoProbe,$(if $(CONFIG_OF),of_mmc_spi) mmc_spi)
endef

define KernelPackage/mmc-spi/description
 Kernel support for MMC/SD over SPI
endef

$(eval $(call KernelPackage,mmc-spi))


define KernelPackage/spi-bitbang
  SUBMENU:=$(SPI_MENU)
  TITLE:=Serial Peripheral Interface bitbanging library
  KCONFIG:=CONFIG_SPI_BITBANG \
          CONFIG_SPI=y \
          CONFIG_SPI_MASTER=y
  FILES:=$(LINUX_DIR)/drivers/spi/spi-bitbang.ko
endef

define KernelPackage/spi-bitbang/description
 This package contains the SPI bitbanging library
endef

$(eval $(call KernelPackage,spi-bitbang))


define KernelPackage/spi-gpio
  SUBMENU:=$(SPI_MENU)
  TITLE:=GPIO-based bitbanging SPI Master
  DEPENDS:=@GPIO_SUPPORT +kmod-spi-bitbang
  KCONFIG:=CONFIG_SPI_GPIO
  FILES:=$(LINUX_DIR)/drivers/spi/spi-gpio.ko
  AUTOLOAD:=$(call AutoProbe,spi-gpio)
endef

define KernelPackage/spi-gpio/description
 This package contains the GPIO-based bitbanging SPI Master
endef

$(eval $(call KernelPackage,spi-gpio))

define KernelPackage/spi-dev
  SUBMENU:=$(SPI_MENU)
  TITLE:=User mode SPI device driver
  KCONFIG:=CONFIG_SPI_SPIDEV \
          CONFIG_SPI=y \
          CONFIG_SPI_MASTER=y
  FILES:=$(LINUX_DIR)/drivers/spi/spidev.ko
  AUTOLOAD:=$(call AutoProbe,spidev)
endef

define KernelPackage/spi-dev/description
 This package contains the user mode SPI device driver
endef

$(eval $(call KernelPackage,spi-dev))

define KernelPackage/ili-9341
  SUBMENU:=$(SPI_MENU)
  TITLE:=FB driver for the ILI9341 LCD Controller
  KCONFIG:=CONFIG_STAGING=y \
			CONFIG_FB_TFT=y \
			CONFIG_LCD_PLATFORM=y \
			CONFIG_BACKLIGHT_PWM=y \
			CONFIG_FB_TFT_FBTFT_DEVICE=y \
			CONFIG_FB_TFT_ILI9341=y
endef

define KernelPackage/ili-9341/description
	Generic Framebuffer support for ILI9341
endef
$(eval $(call KernelPackage,ili-9341))

define KernelPackage/st7789v
  SUBMENU:=$(SPI_MENU)
  TITLE:=FB driver for the ST7789V LCD Controller
  KCONFIG:=CONFIG_STAGING=y \
			CONFIG_FB_TFT=y \
			CONFIG_LCD_PLATFORM=y \
			CONFIG_BACKLIGHT_PWM=y \
			CONFIG_FB_TFT_FBTFT_DEVICE=y \
			CONFIG_LCD_CLASS_DEVICE=y \
			CONFIG_FB_TFT_ST7789V=y
endef

define KernelPackage/st7789v/description
	Generic Framebuffer support for ST7789V
endef
$(eval $(call KernelPackage,st7789v))

define KernelPackage/st7796
  SUBMENU:=$(SPI_MENU)
  TITLE:=FB driver for the st7796 LCD Controller
  KCONFIG:=CONFIG_STAGING=y \
			CONFIG_FB_TFT=y \
			CONFIG_LCD_PLATFORM=y \
			CONFIG_BACKLIGHT_PWM=y \
			CONFIG_FB_TFT_FBTFT_DEVICE=y \
			CONFIG_LCD_CLASS_DEVICE=y \
			CONFIG_FB_TFT_ST7796=y
endef

define KernelPackage/st7796/description
	Generic Framebuffer support for st7796
endef
$(eval $(call KernelPackage,st7796))