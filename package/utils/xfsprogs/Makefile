# 
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xfsprogs
PKG_RELEASE:=1
PKG_VERSION:=3.1.10
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://oss.sgi.com/xfs/cmds/xfsprogs
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_CHECK_FORMAT_SECURITY:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/xfsprogs/default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  DEPENDS:=+libuuid +libpthread +librt
  URL:=http://oss.sgi.com/projects/xfs
endef

define Package/xfs-mkfs
$(call Package/xfsprogs/default)
  TITLE:=Utility for creating XFS filesystems
endef

define Package/xfs-fsck
$(call Package/xfsprogs/default)
  TITLE:=Utilities for checking and repairing XFS filesystems
endef

define Package/xfs-growfs
$(call Package/xfsprogs/default)
  TITLE:=Utility for increasing the size of XFS filesystems
endef

CONFIGURE_ARGS += \
	--enable-gettext=no \
	--enable-lib64=no

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include \
	-D_LARGEFILE64_SOURCE \
	-D_FILE_OFFSET_BITS=64 \
	-D_GNU_SOURCE

MAKE_FLAGS += \
	DEBUG= Q= \
	PCFLAGS="-Wall" \
	PKG_PLATFORM=linux \
	ENABLE_GETTEXT=no

define Build/Configure
	cp $(PKG_BUILD_DIR)/include/install-sh   $(PKG_BUILD_DIR)
	ln -sf $(STAGING_DIR)/host/share/libtool/config/config.guess $(PKG_BUILD_DIR)/config.guess
	ln -sf $(STAGING_DIR)/host/share/libtool/config/config.sub   $(PKG_BUILD_DIR)/config.sub
	$(call Build/Configure/Default)
endef

define Package/xfs-mkfs/install
	mkdir -p $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/mkfs.xfs $(1)/usr/sbin
endef

define Package/xfs-fsck/install
	mkdir -p $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/xfs_repair $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/xfs_db $(1)/usr/sbin
endef

define Package/xfs-growfs/install
	mkdir -p $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/xfs_growfs $(1)/usr/sbin
endef

$(eval $(call BuildPackage,xfs-mkfs))
$(eval $(call BuildPackage,xfs-fsck))
$(eval $(call BuildPackage,xfs-growfs))
