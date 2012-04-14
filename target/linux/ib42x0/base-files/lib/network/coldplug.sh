#!/bin/sh
# Copyright (C) 2006-2011 OpenWrt.org

coldplug_interface_dhcp() {
	local config="$1"
	local ifname

	config_get ifname "$config" ifname
	setup_interface "$ifname" "$config" "dhcp"
}

coldplug_interface_static() {
	local config="$1"
	local ifname

	config_get ifname "$config" ifname
	setup_interface_static "$ifname" "$config"
}
