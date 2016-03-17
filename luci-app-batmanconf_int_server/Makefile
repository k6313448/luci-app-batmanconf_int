#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-batmanconf_int_server
PKG_VERSION:=1.0
PKG_RELEASE:=0

PKG_LICENSE:=GPLv3 
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=maoky <maoky@bellnett.com> 

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-batmanconf_int_server  
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  $(call Package/luci/webtemplate)
  DEPENDS+=+luci +kmod-batman-adv +wireless-tools +ip
  TITLE:=batmanconf_int_server luci control interface
endef

define Package/luci-app-batmanconf_int_server/description
  LuCI Support for bellnett batmanconf_int_server
endef

define Build/Prepare
  #mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-batmanconf_int_server/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then 
	chmod 755 /etc/init.d/batman_ini >/dev/null 2>&1
	chmod 755 /etc/init.d/mesh >/dev/null 2>&1
	/etc/init.d/mesh enable >/dev/null 2>&1
	/etc/init.d/batman_ini disable >/dev/null 2>&1
fi
exit 0
endef

define Package/luci-app-batmanconf_int_server/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/batman_ctrl.lua $(1)/usr/lib/lua/luci/controller/batman_ctrl.lua

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./files/luci/model/cbi/batman_cbi.lua $(1)/usr/lib/lua/luci/model/cbi/batman_cbi.lua

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/root/etc/config/batman_conf $(1)/etc/config/batman_conf
	$(INSTALL_DATA) ./files/root/etc/config/network $(1)/etc/config/network
	$(INSTALL_DATA) ./files/root/etc/config/wireless $(1)/etc/config/wireless

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/root/etc/init.d/batman_ini $(1)/etc/init.d/batman_ini
	$(INSTALL_BIN) ./files/root/etc/init.d/mesh $(1)/etc/init.d/mesh	
endef

$(eval $(call BuildPackage,luci-app-batmanconf_int_server))