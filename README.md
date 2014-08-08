smartproxy
==========

OpenWRT上的自动代理方案

###配置

+ 修改`/etc/smartproxy/shadowsocks.json`为您的shadowsocks帐号
+ 运行`/etc/init.d/smartproxy restart`重新启动服务

####白名单

可以修改`/etc/smartproxy/`下的`ignore-src`和`ignore-dst`来忽略主机或者网络

eg: 

    192.168.129.250
    8.8.8.8/24
    
修改完记得运行`/etc/init.d/smartproxy restart`重新启动服务
