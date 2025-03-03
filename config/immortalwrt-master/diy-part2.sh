#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='immortalwrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
sed -i 's/192.168.1.1/10.10.100.253/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
# svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
svn co https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/sbwml/luci-app-alist package/luci-app-alist
svn co https://github.com/liudf0716/luci-app-apfree-wifidog package/luci-app-apfree-wifidog
svn co https://github.com/lisaac/luci-app-diskman package/luci-app-diskman
svn co https://github.com/immortalwrt/homeproxy package/luci-app-homeproxy
svn co https://github.com/riverscn/openwrt-iptvhelper package/luci-app-iptvhelper
svn co https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
svn co https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
svn co https://github.com/muink/luci-app-netspeedtest package/luci-app-netspeedtest
svn co https://github.com/destan19/OpenAppFilter package/luci-app-oaf
svn co https://github.com/vernesong/OpenClash package/luci-app-openclash
svn co https://github.com/sirpdboy/luci-app-partexp package/luci-app-partexp
svn co https://github.com/animegasan/luci-app-quickstart package/luci-app-quickstart
svn co https://github.com/tindy2013/openwrt-subconverter package/openwrt-subconverter

# Apply patch
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

