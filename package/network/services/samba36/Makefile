#
# Copyright (C) 2007-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=samba
PKG_VERSION:=3.6.5
PKG_RELEASE:=2

PKG_SOURCE_URL:=http://ftp.samba.org/pub/samba \
	http://ftp.samba.org/pub/samba/old-versions
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=2f0c14547333c1b48fd4728b031e7040
PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=COPYING

PKG_MAINTAINER:=Felix Fietkau <nbd@openwrt.org>

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

MAKE_PATH:=source3
CONFIGURE_PATH:=source3

PKG_BUILD_BIN:=$(PKG_BUILD_DIR)/$(MAKE_PATH)/bin

define Package/samba36-server
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba 3.6 SMB/CIFS server
  URL:=http://www.samba.org/
  VARIANT:=samba36-server
  DEPENDS:=+USE_EGLIBC:librt
endef

define Package/samba36-client
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Samba 3.6 SMB/CIFS client
  URL:=http://www.samba.org/
  DEPENDS:=+libreadline +libncurses
endef

define Package/samba36-server/config
	config PACKAGE_SAMBA_MAX_DEBUG_LEVEL
		int "Maximum level of compiled-in debug messages"
		depends PACKAGE_samba36-server || PACKAGE_samba36-client
		default -1

endef

define Package/samba36-server/description
 The Samba software suite is a collection of programs that implements the
 SMB protocol for UNIX systems, allowing you to serve files and printers to
 Windows, NT, OS/2 and DOS clients. This protocol is sometimes also referred
 to as the LanManager or Netbios protocol.
endef

define Package/samba36-server-ads
$(call Package/samba36-server)
  TITLE:=Samba 3.6 SMB/CIFS server with ADS support
  VARIANT:=samba36-server-ads
  DEPENDS:=+libpopt +libuuid +libopenldap +krb5-libs +libiconv +libacl +libreadline +librt +libtirpc
endef

define Package/samba36-server-ads/description
$(call Package/samba36-server/description)
endef

define Package/samba36-server-ads/config
	config PACKAGE_SAMBA_MAX_DEBUG_LEVEL
		int "Maximum level of compiled-in debug messages"
		depends PACKAGE_samba36-server-ads || PACKAGE_samba36-client
		default -1
endef

TARGET_CFLAGS += -DMAX_DEBUG_LEVEL=$(CONFIG_PACKAGE_SAMBA_MAX_DEBUG_LEVEL) -D__location__=\\\"\\\" -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

CONFIGURE_VARS += \
	ac_cv_file__proc_sys_kernel_core_pattern=yes \
	libreplace_cv_HAVE_C99_VSNPRINTF=yes \
	libreplace_cv_HAVE_GETADDRINFO=yes \
	libreplace_cv_HAVE_IFACE_IFCONF=yes \
	LINUX_LFS_SUPPORT=yes \
	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
	samba_cv_HAVE_IFACE_IFCONF=yes \
	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
	samba_cv_HAVE_SECURE_MKSTEMP=yes \
	samba_cv_HAVE_WRFILE_KEYTAB=no \
	samba_cv_USE_SETREUID=yes \
	samba_cv_USE_SETRESUID=yes \
	samba_cv_have_setreuid=yes \
	samba_cv_have_setresuid=yes \
	ac_cv_header_zlib_h=no \
	samba_cv_zlib_1_2_3=no

CONFIGURE_ARGS += \
	--exec-prefix=/usr \
	--prefix=/ \
	--disable-avahi \
	--disable-cups \
	--disable-pie \
	--disable-relro \
	--disable-static \
	--disable-swat \
	--disable-shared-libs \
	--with-codepagedir=/etc/samba \
	--with-configdir=/etc/samba \
	--with-included-iniparser \
	--with-included-popt \
	--with-lockdir=/var/lock \
	--with-logfilebase=/var/log \
	--with-nmbdsocketdir=/var/nmbd \
	--with-piddir=/var/run \
	--with-privatedir=/etc/samba \
	--with-sendfile-support \
	--without-cluster-support \
	--without-ads \
	--without-krb5 \
	--without-ldap \
	--without-pam \
	--without-winbind \
	--without-libtdb \
	--without-libtalloc \
	--without-libnetapi \
	--without-libsmbclient \
	--without-libsmbsharemodes \
	--without-libaddns \
	--with-shared-modules=pdb_tdbsam,pdb_wbc_sam,idmap_nss,nss_info_template,auth_winbind,auth_wbc,auth_domain

MAKE_FLAGS += DYNEXP= PICFLAG= MODULES=

ifeq ($(BUILD_VARIANT),samba36-server-ads)
	TARGET_CFLAGS += \
		-I$(STAGING_DIR)/usr/include/krb5 \
		-I$(STAGING_DIR)/usr/include/tirpc \
		-DACTIVE_DIRECTORY \
		-DDFS_SUPPORT \
		-DNETLOGON_SUPPORT \
		-DSAMR_SUPPORT \
		-DLSA_SUPPORT

	TARGET_LDFLAGS += \
		-Wl,-rpath-link=$(STAGING_DIR)/usr/lib -lkrb5 \
		-L$(STAGING_DIR)/usr/lib/libiconv/lib \
		-lkrb5 -l:libcom_err.so.3 -ldl -ltirpc -lgssapi_krb5

	CONFIGURE_VARS += \
		ac_cv_lib_ext_krb5_krb5_mk_req_extended=yes \
		ac_cv_path_KRB5CONFIG=$(STAGING_DIR)/usr \
		smb_krb5_cv_enctype_to_string_takes_krb5_context_arg=no \
		smb_krb5_cv_enctype_to_string_takes_size_t_arg=yes

	CONFIGURE_ARGS := $(filter-out --without-ads --without-krb5 --without-ldap, ${CONFIGURE_ARGS})
	CONFIGURE_ARGS += \
		--with-ads \
		--with-krb5=$(STAGING_DIR)/usr \
		--with-ldap \
		--with-libiconv=$(STAGING_DIR)/usr/lib/libiconv \
		--with-acl-support \
		--with-quotas \
		--with-syslog \
		--with-shared-modules=all
endif

define Package/samba36-server/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/samba.config $(1)/etc/config/samba
	$(INSTALL_DIR) $(1)/etc/samba
	$(INSTALL_DATA) ./files/smb.conf.template $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/lowcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/upcase.dat $(1)/etc/samba
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/codepages/valid.dat $(1)/etc/samba
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/samba.init $(1)/etc/init.d/samba
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/samba_multicall $(1)/usr/sbin
	ln -sf samba_multicall $(1)/usr/sbin/smbd
	ln -sf samba_multicall $(1)/usr/sbin/nmbd
	ln -sf samba_multicall $(1)/usr/sbin/smbpasswd
	$(INSTALL_DIR) $(1)/usr/bin
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/smbcontrol
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/smbtree
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/smbstatus
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/smbcquotas
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/smbcacls
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/nmblookup
	ln -sf ../sbin/samba_multicall $(1)/usr/bin/testparm
endef

define Package/samba36-server-ads/install
	$(call Package/samba36-server/install,$(1))	
	$(INSTALL_DIR) $(1)/etc/openldap/schema
	$(CP) $(PKG_BUILD_DIR)/examples/LDAP/samba.schema $(1)/etc/openldap/schema
	$(INSTALL_DIR) $(1)/etc/samba
	ln -sf /var/etc/secrets.tdb $(1)/etc/samba/secrets.tdb
	ln -sf /var/etc/schannel_store.tdb $(1)/etc/samba/schannel_store.tdb
endef

define Package/samba36-server-ads/conffiles
/etc/samba/smb.conf.template
endef

define Package/samba36-client/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/smbclient $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_BIN)/nmblookup $(1)/usr/sbin
endef

$(eval $(call BuildPackage,samba36-client))
$(eval $(call BuildPackage,samba36-server))
$(eval $(call BuildPackage,samba36-server-ads))
