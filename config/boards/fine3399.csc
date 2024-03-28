# Rockchip RK3399 6Core 4GB SoC eMMC GBE NVMe USB3
BOARD_NAME="Fine3399"
BOARDFAMILY="rockchip64"
BOARD_MAINTAINER="icyleaf"
BOOTCONFIG="fine3399-rk3399_defconfig"
KERNEL_TARGET="legacy,current,edge"

BOOTPATCHDIR="legacy/u-boot-fine3399"
BOOT_SCENARIO="spl-blobs"
KERNEL_GIT=shallow
KERNEL_DRIVERS_SKIP+=(driver_rtw88) # This is a custom kernel, while the rtw88 driver patching expects pure mainline

#DEFAULT_CONSOLE="serial"
#BOOT_FDT_FILE="rockchip/rk3399-fine3399.dtb"
#SRC_EXTLINUX="yes"
#IMAGE_PARTITION_TABLE="gpt"

# Speed up!
REGIONAL_MIRROR=china
GITHUB_MIRROR=ghproxy

function add_host_dependencies__uboot_deps() {
		display_alert "Adding python3-pyelftools for brute force mainline uboot" "${EXTENSION}" "info"
		declare -g EXTRA_BUILD_DEPS="${EXTRA_BUILD_DEPS} python3-pyelftools libgnutls28-dev"
}
