## Fliter - Wireshark

## 捕捉过滤器

arp              显示所有 arp 封包.
broadcast  只显示 广播封包



## 显示过滤器:

tcp   只显示 tcp
udp 只显示 udp
tcp and udp

过滤例子


https://wiki.wireshark.org/DisplayFilters






定义 保存 过滤器:

ip.src == 172.19.16.166



IPv6

IPv4  32位

IPv6 128位 也就是2^128 个地址.
采用 32个16进制 来表示
每组之间 用: 隔开.  共8组.

2001:0db8:85a3:08d3:1319:8a2e:0370:7344 


每项数字前导的0可以省略，省略后前导数字仍是0则继续，例如下组IPv6是相等的。

可以用双冒号“::”表示一组0或多组连续的0，但只能出现一次：

IPv6 必备条件:
系统支持. 一般 win mac 都是支持的

宽带线路支持./  也可以 用 ipv6 隧道





