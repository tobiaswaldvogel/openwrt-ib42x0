#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/rtc-gemini
  SUBMENU:=$(OTHER_MENU)
  TITLE:=Gemini RTC driver
  DEPENDS:=@TARGET_ib42x0
  KCONFIG:=CONFIG_RTC_DRV_GEMINI
  FILES:=$(LINUX_DIR)/drivers/rtc/rtc-gemini.ko
  AUTOLOAD:=$(call AutoLoad,05,rtc-gemini)
endef

define KernelPackage/rtc-gemini/description
 Gemini RTC driver
endef

$(eval $(call KernelPackage,rtc-gemini))
