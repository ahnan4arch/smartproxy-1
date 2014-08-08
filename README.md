smartproxy
==========

OpenWRT上的自动代理方案, 基于iptables, ipset, iptables-ipt-geoip实现. 国内ip直连, 其他走代理.

###编译安装

    git clone https://github.com/zqlee/smartproxy.git packages/smartproxy
    make menuconfig #选择Network > smartproxy
    #上传ipk到路由器
    opkg install <path/to/ipk>

###配置

+ 修改`/etc/smartproxy/shadowsocks.json`为您的shadowsocks帐号
+ 运行`/etc/init.d/smartproxy restart`重新启动服务

####白名单

可以修改`/etc/smartproxy/`下的`ignore-src`和`ignore-dst`来忽略主机或者网络

eg: 

    192.168.129.250
    8.8.8.8/24
    
修改完记得运行`/etc/init.d/smartproxy restart`重新启动服务
