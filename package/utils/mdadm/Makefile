include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mdadm
PKG_VERSION:=3.2.6
PKG_RELEASE:=1

PKG_SOURCE_URL:=@KERNEL/linux/utils/raid/mdadm
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
#PKG_MD5SUM:=2fd33dedcdb06f0d1461f50ddabb7e4a

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=A tool for managing Soft RAID under Linux
  URL:=http://www.kernel.org/pub/linux/utils/raid/mdadm/
  DEPENDS:=+@KERNEL_DIRECT_IO
endef

define Package/mdadm/description
 A tool for managing Linux Software RAID arrays.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -DHAVE_STDINT_H" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		mdadm mdassemble
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/mdadm.init $(1)/etc/init.d/mdadm
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mdadm $(1)/sbin/
endef

$(eval $(call BuildPackage,mdadm))

