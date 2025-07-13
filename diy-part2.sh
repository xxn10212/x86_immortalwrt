#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate


mkdir -p package/base-files/files/etc

# 写入 network 配置
cat > package/base-files/files/etc <<EOF
config device
    option name 'br-lan'
    option type 'bridge'
    list ports 'eth0'
    list ports 'eth2'

config interface 'lan'
    option device 'br-lan'
    option proto 'static'
    option ipaddr '192.168.50.1'
    option netmask '255.255.255.0'

config interface 'wan'
    option device 'eth1'
    option proto 'dhcp'
EOF

