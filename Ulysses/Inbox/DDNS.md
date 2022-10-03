## DDNS
一般宽带上网    真实 ip 都在不断的变化 所谓的动态 ip
 
服务器 和个别软件必须要用固定的 ip 
 
Ddns dynamic domain name system  就诞生了,把动态 ip 变成 静态 ip
 
常见的 ddns 服务商 
 
花生壳       zoneedit  no-ip   等
 
 
Noip  申请示范   国内好像被强了 
 
 
Ddwrt 路由器 花生壳设置   http://service.oray.com/question/868.html
 
 
首先通过浏览器登入路由器的web管理界面：
 
选择Setup- Dynamic DNS (DDNS)
 
在DDNS Service项选择“Custom”；
 
在DYNDNS Server项填写ddns.oray.com
 
在User Name项填写花生壳帐号、Password项填写帐号密码
 
在Host Name项填写帐号下需要使用花生壳服务的域名
 
在URL项中填写/ph/update?
 
填写完毕后点击Save，当DDNS Status显示Update successful时即可正常使用。（如图）