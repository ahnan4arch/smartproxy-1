smartproxy
==========

OpenWRT上的自动代理方案, 基于shadowsocks-libev, iptables, ipset, iptables-ipt-geoip实现

+ 忽略国内IP
+ 清理DNS污染

###编译安装


    git clone https://github.com/zqlee/smartproxy.git packages/smartproxy
    git clone https://github.com/madeye/shadowsocks-libev.git packages/shadowsocks-libev
    make menuconfig #选择Network > smartproxy
    make packages/smartproxy/compile
    #上传ipk到路由器
    opkg install <path/to/ipk>
    
或者

[下载](https://github.com/zqlee/smartproxy/releases)预编译版本(只有ramips_24kec的)

###配置


修改`/etc/smartproxy/shadowsocks.json`为您的shadowsocks帐号

运行`/etc/init.d/smartproxy restart`重新启动服务

####白名单

可以修改`/etc/smartproxy/`下的`ignore-src`和`ignore-dst`来忽略主机或者网络

eg: 

    192.168.129.250
    8.8.8.8/24
    
修改完记得运行`/etc/init.d/smartproxy restart`重新启动服务

####区分国内外DNS记录

为dnsmasq配置一个国内DNS和一个国外DNS, 国内的域名解析到离你最近的IP, 国外域名解析到离代理最近的IP

可以按照这个例子添加到/etc/dnsmasq.conf

	#国内DNS
	server=114.114.114.114
	#国外DNS
	server=8.8.8.8


