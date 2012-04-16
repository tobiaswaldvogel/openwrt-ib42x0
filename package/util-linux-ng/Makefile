#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=util-linux
PKG_MAJOR_VERSION=2.21
PKG_MINOR_VERSION=.1
PKG_VERSION:=$(PKG_MAJOR_VERSION)$(PKG_MINOR_VERSION)
PKG_RELEASE:=4
PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@KERNEL/linux/utils/$(PKG_NAME)/v$(PKG_MAJOR_VERSION)


PKG_BUILD_DEPENDS=libncurses

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += --disable-use-tty-group --libdir=/usr/lib

define Package/util-linux/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://www.kernel.org/pub/linux/utils/util-linux-ng/
endef

define Package/fdisk
$(call Package/util-linux/Default)
  TITLE:=Partition table manipulation utility
  SUBMENU=disc
endef

define Package/fdisk/description
 This package contains a utility for managing disk partition tables.
endef

define Package/cfdisk
$(call Package/util-linux/Default)
  SUBMENU:=disc
  TITLE:=Partition table manipulation utility
  DEPENDS:= +libncurses
endef

define Package/cfdisk/description
 This package contains a utility for managing disk partition tables.
endef

define Package/sfdisk
$(call Package/util-linux/Default)
  TITLE:=Partition table manipulation utility (Command-line)
  SUBMENU=disc
endef

define Package/sfdisk/description
 This package contains a utility for managing disk partition tables using command-line only.
endef

define Package/losetup
$(call Package/util-linux/Default)
  TITLE:=Loopback devices setup and control utility
endef

define Package/losetup/description
 This package contains a utility for managing loopback devices.
endef

define Package/mount-utils
$(call Package/util-linux/Default)
  TITLE:=Devices mount/unmounting utilities
  DEPENDS+= +libblkid +libuuid
endef

define Package/mount-utils/description
 This package contains utilities to mount/unmount devices.
endef

define Package/swap-utils
$(call Package/util-linux/Default)
  SUBMENU:=disc
  TITLE:=Swap space management utilities
  DEPENDS+= +libblkid +libuuid
endef

define Package/swap-utils/description
 This package contains a collection of tools for managing swap space:
 - mkswap
 - swapon
 - swapoff
endef

define Package/hwclock
$(call Package/util-linux/Default)
  TITLE:=Utilities for managing the hardware clock
endef

define Package/hwclock/description
 This package contains a utility for managing the hardware clock.
endef

define Package/flock
$(call Package/util-linux/Default)
  TITLE:=Manage file locks from shell scripts
endef

define Package/flock/description
  This package contains a utility for managing file locks from shell scripts.
endef

define Package/setterm
$(call Package/util-linux/Default)
  TITLE:=Tool for setting terminal attributes
  SUBMENU:=Terminal
  DEPENDS:= +libncurses
endef

define Package/setterm/description
  This package contains a utility for setting terminal attributes
endef

define Package/script
$(call Package/util-linux/Default)
  TITLE:=Make typescript of terminal session
  SUBMENU=Terminal
endef

define Package/script/description
 Script makes a typescript of everything printed on your terminal.
 http://linux.die.net/man/1/script
endef

define Package/libuuid
$(call Package/util-linux/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=DCE compatible Universally Unique Identifier library
endef

define Package/libuuid/description
 Library for generating DCE compatible Universally Unique Identifiers.
endef

define Package/uuidgen
$(call Package/util-linux)
  DEPENDS:=+libuuid
  TITLE:=Command line utility to create a new UUID value
endef

define Package/uuidgen/description
 uuidgen program creates a new universally unique identifier (UUID)
 using the libuuid library. The new UUID can reasonably be considered
 unique among all UUIDs created on the local system, and among UUIDs
 created on other systems in the past and in the future.
endef

define Package/libblkid
$(call Package/util-linux/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Block device id library
endef

define Package/libblkid/description
 The blkid library which allows system programs like fsck and mount to
 quickly and easily find block devices by filesystem UUID and LABEL.
endef

define Package/blkid
$(call Package/util-linux)
  TITLE:=Command-line utility to locate/print block device attributes
  DEPENDS:=+libuuid +libblkid +libext2fs +libcom_err +libpthread
endef

define Package/fdisk/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/fdisk $(1)/sbin/
endef

define Package/cfdisk/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/cfdisk $(1)/sbin/
endef

define Package/sfdisk/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/sfdisk $(1)/usr/sbin/
endef

define Package/losetup/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/losetup $(1)/sbin/
endef

define Package/mount-utils/install
	$(INSTALL_DIR) $(1)/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{u,}mount $(1)/bin
endef

define Package/swap-utils/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/mkswap $(PKG_INSTALL_DIR)/usr/sbin/swapon $(1)/sbin/
	ln -sf swapon $(1)/sbin/swapoff
endef

define Package/hwclock/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/hwclock $(1)/sbin/
endef

define Package/flock/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/flock $(1)/usr/bin/
endef

define Package/setterm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/setterm $(1)/usr/bin/
endef

define Package/script/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/script $(1)/usr/bin/
endef

define Package/libblkid/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libblkid.so.* $(1)/usr/lib/
endef

define Package/libuuid/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libuuid.so.* $(1)/usr/lib/
endef

define Package/blkid/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/blkid $(1)/usr/sbin/
endef

define Package/uuidgen/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/uuidgen $(1)/usr/bin/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{blkid,uuid}.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(SED) 's,/usr,${STAGING_DIR}/usr,g' $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/blkid.pc
	$(SED) 's,/usr,${STAGING_DIR}/usr,g' $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/uuid.pc
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/{blkid,uuid}.pc $(1)/usr/lib/pkgconfig/
endef

$(eval $(call BuildPackage,fdisk))
$(eval $(call BuildPackage,cfdisk))
$(eval $(call BuildPackage,sfdisk))
$(eval $(call BuildPackage,losetup))
$(eval $(call BuildPackage,mount-utils))
$(eval $(call BuildPackage,swap-utils))
$(eval $(call BuildPackage,hwclock))
$(eval $(call BuildPackage,flock))
$(eval $(call BuildPackage,setterm))
$(eval $(call BuildPackage,script))
$(eval $(call BuildPackage,libblkid))
$(eval $(call BuildPackage,libuuid))
$(eval $(call BuildPackage,blkid))
$(eval $(call BuildPackage,uuidgen))
