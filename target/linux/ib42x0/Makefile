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
DEVICE_TYPE:=nas
FEATURES:=squashfs
CFLAGS:=-Os -pipe -march=armv4 -mtune=fa526 -fno-caller-saves
MAINTAINER:=Tobias Waldvogel <tobias.waldvogel@gmail.com>

DEFAULT_PACKAGES := $(filter-out dropbear,$(DEFAULT_PACKAGES))
DEFAULT_PACKAGES += \
  kmod-pata-gemini kmod-button-hotplug kmod-usb-core kmod-usb2 \
  kmod-fs-exportfs kmod-fs-nfs kmod-fs-nfsd \
  fstab ssmtp nfs-kernel-server nfs-kernel-server-utils \
  ntpclient uhttpd ethtool krb5-client krb5-libs p910nd rpcbind \
  openssh-client openssh-keygen openssh-moduli openssh-server openssh-sftp-server \
  librt libstdcpp libgnutls libopenssl libgrcypt libkeyutils libopenldap libptopt libreadline \
  libsasl2 libtirpc \
  luci-app-hd-idle2 luci-app-hd-mon luci-app-p910nd luci-app-transmission \
  transmission-daemon transmission-web \
  acl libacl attr libattr nss_ldap nano chattr lsattr tune2fs fdisk gptfdisk \
  hd-idle2 hdparm sfdisk \
  zoneinfo-core zoneinfo-europe zoneinfo-northamerica zoneinfo-simple \
  coreutils-su file ldd mdadm parted quota screen smartd smartmontools \
  usbutils xfs-mkfs xfs-fsck blkid uuidgen lualdap luaspcdns \
  sambafull sambafull-server

LINUX_VERSION=3.2.14

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
