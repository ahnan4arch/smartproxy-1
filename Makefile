include $(TOPDIR)/rules.mk

PKG_NAME:=smartproxy
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/smartproxy
    SECTION:=proxy
    CATEGORY:=Network
    TITLE:=Smart proxy non china traffic
    DEPENDS:=+shadowsocks-libev +iptables-mod-geoip +kmod-ipt-ipset +iptables-mod-u32 +kmod-ipt-u32
endef

define Package/smartproxy/conffiles
/etc/smartproxy
endef

define Build/Compile
endef

define Package/smartproxy/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) ./files/smartproxy-conf $(1)/etc/smartproxy
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/smartproxy.init $(1)/etc/init.d/smartproxy
	$(INSTALL_DIR) $(1)/usr/share
	$(CP) ./files/xt_geoip $(1)/usr/share
endef

define Package/smartproxy/postinst
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Enabling rc.d symlink for smartproxy"
        /etc/init.d/smartproxy enable
fi
exit 0
endef

define Package/smartproxy/prerm
#!/bin/sh
# check if we are on real system
if [ -z "$${IPKG_INSTROOT}" ]; then
        echo "Removing rc.d symlink for smartproxy"
        /etc/init.d/smartproxy disable
fi
exit 0
endef

$(eval $(call BuildPackage,smartproxy))
