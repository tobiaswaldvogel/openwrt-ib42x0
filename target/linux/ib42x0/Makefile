#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=ib42x0
BOARDNAME:=IB4220 and IB4210 (CS351x)
FEATURES:=squashfs
CFLAGS:=-Os -pipe -march=armv4 -mtune=fa526 -fno-caller-saves
MAINTAINER:=Imre Kaloz <kaloz@openwrt.org>

LINUX_VERSION=3.2.14

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
