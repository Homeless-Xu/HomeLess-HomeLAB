




用户计费认证: *PPPOE* *802.1x*  *WEB*

防代理策略:
判断 并发流大小
sessions 数量来限制网络流量.



共享 wifi:
就是 数据代理转发:
通过一台能上网的设备.带动别的设备仪器上网.









Portal 认证 : WLAN 主流认证方式之一.
每次接入 都需要 输入 账号密码.(极为不便)








**实现方法: **
- *DNS  跳转*
	- *HTTP 跳转*
	- *IP   跳转*


1. DNS 跳转:
	所有客户端的 dns 请求 都解析为认证服务器的 IP.
	再用 dns url 跳转. 把 dns 解析为认证页面的地址.

2. http 跳转:
	所有 http 请求都返回 302 / 301 跳转.
	目标是认证页面.

3. ip 跳转:

	把 所有ip 包里面的目标地址 改为认证服务器.
	然后再做 404 跳转.





## BAS
broadband access server 

bas 控制用户.
用户需要在 bas 上通过 aaa 认证.
不然 即使有合法 ip 也不能上网的.




*Wlan 用户接入流程*
 1. 打开 wifi 通过DHCP 协议 获取 IP
2. 打开某个网站 发起 http 请求
3. AC 拦截 HTTP 请求.
由于用户没有认证,强制到 portal 服务器.
强制在 portal url 中加入相关参数.

4. Portal 服务器 向用户推送 WEB 认证页面.
5. 用户 填入账号密码. 提交到 portal 服务器.
6. portal 服务器收到用户信息. 向 radius 发出用户信息查询请求.
7. radius 验证用户密码. 向 portal 服务器 返回 查询结果 以及 系统配置的 单次链接最大时长.以及用户手机卡套餐剩余时长信息
8. 查询成功: portal 按照 chap 流程 向 ac 请求 challenge
查询失败: 流程结束
9. ac 返回 challenge 包括: challenge id 和 challenge
10. portal  把 
密码 
challengeid 
challenge 做 md5 算法后的 challenge-password 
一起提交给 ac 发起认证.

11. ac 把上面的 3个 加 账号 一起提交到 radius 用户认证服务器. 进行认证
12. radius 根据用户信息.判断用户是否合法.
 ….








链接网络后 跳转到指定网页.


portal 认证的过程.

设备上 做了 http 请求拦截 跳转至认证页面.
只有合法的用户才会开发数据通信端口.





## portal 协议:

portal → 入口

Portal 认证 → Web 认证.

未认证用户 强行登陆到特定站点.

需要使用 internet 时候就必须通过认证后才行.




 internet
IMC server —lan— portal 网关
  L2/3 Switch


ip       来标识用户
ip + Mac 来标识用户






802.1x 认证:  需要客户端.控制严格点.



基于 udp






用户浏览器       BAS      Portal Web      Portal Kernel
┃              ┃            ┃
┃HTTP请求 →    ┃            ┃
┃              ┃            ┃
┃重定向   ←   ┃            ┃
┃          HTTP 请求 →       ┃
┃
┃
┃
┃


强制页面:
用户输入 用户名和密码.




*维持在线 和 用户下线*






异常情况分析: pc 掉电 . 自己关闭认证网页....































