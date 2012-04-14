platform_check_image() {
	local productline=`tar -xzOf $1 ImageInfo | grep productName`
	[ "$productline" == "" ] && return 1

	eval $productline
	[ "$productName" == "" ] && return 1
	
	echo $productName
	return 0
}

platform_do_upgrade() {
	tar -C /tmp -xzf $1
	rm $1
	dd if=/tmp/rd.gz of=/tmp/rootfs bs=6M count=1 >/dev/null 2>&1
	rm /tmp/rd.gz
	dd if=/tmp/hddapp.tgz of=/tmp/rootfs bs=6M count=1 seek=1 >/dev/null 2>&1
	rm /tmp/hddapp.tgz

	local line

	line=`grep Distribution /tmp/ImageInfo`
	eval $line
	line=`grep Layout /tmp/ImageInfo`
	eval $line

	if [ "$Distribution" == "OpenWrt" ]; then
		USE_REFRESH=1
	fi

	local mode=0
	if [ "$Layout" == "Compact" ]; then
		mode=1
	fi 

	mtd -q write /tmp/zImage Kern
	mtd refresh Kern $mode
	mtd -q write /tmp/rootfs rootfs
}

disable_watchdog() {
	killall watchdog
	( ps | grep -v 'grep' | grep '/dev/watchdog' ) && {
		echo 'Could not disable watchdog'
		return 1
	}
}

append sysupgrade_pre_upgrade disable_watchdog
