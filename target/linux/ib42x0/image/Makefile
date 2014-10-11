#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define Image/BuildKernel
# NAS4210: mach id 8191 (0x1FFF)
	echo -en "\x1f\x1c\xa0\xe3\xff\x10\x81\xe3" > $(BIN_DIR)/nas4210-zImage
	cat $(LINUX_DIR)/arch/arm/boot/zImage >> $(BIN_DIR)/nas4210-zImage
# NAS4220: mach id 2038 (0x7F6)
	echo -en "\x07\x1c\xa0\xe3\xf6\x10\x81\xe3" > $(BIN_DIR)/nas4220-zImage
	cat $(LINUX_DIR)/arch/arm/boot/zImage >> $(BIN_DIR)/nas4220-zImage
endef

define Image/Build/jffs2-64k
	dd if=$(KDIR)/root.$(1) of=$(BIN_DIR)/$(1).img bs=64k conv=sync
endef

define Image/Build/jffs2-128k
	dd if=$(KDIR)/root.$(1) of=$(BIN_DIR)/$(1).img bs=128k conv=sync
endef

define Image/Build/squashfs
	$(call prepare_generic_squashfs,$(KDIR)/root.squashfs)
	dd if=$(KDIR)/root.$(1) of=$(BIN_DIR)/$(1).img bs=128k conv=sync
endef

define Image/Build
	$(call Image/Build/$(1),$(1))
	touch $(BIN_DIR)/rd.gz
	dd if=$(BIN_DIR)/$(1).img of=$(BIN_DIR)/rd.gz bs=6M count=1
	touch $(BIN_DIR)/hddapp.tgz
	dd if=$(BIN_DIR)/$(1).img of=$(BIN_DIR)/hddapp.tgz bs=6M count=1 skip=1
	cp $(BIN_DIR)/nas4210-zImage $(BIN_DIR)/zImage
	cp ./ImageInfo-ib4210 $(BIN_DIR)/ImageInfo
	(cd $(BIN_DIR); tar -czf sysupgrade-ib4210.tar.gz ImageInfo zImage rd.gz hddapp.tgz)
	cp $(BIN_DIR)/nas4220-zImage $(BIN_DIR)/zImage
	cp ./ImageInfo-ib4220 $(BIN_DIR)/ImageInfo
	(cd $(BIN_DIR); tar -czf sysupgrade-ib4220.tar.gz ImageInfo zImage rd.gz hddapp.tgz)
endef

$(eval $(call BuildImage))
