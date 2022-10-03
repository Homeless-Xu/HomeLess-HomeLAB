## Kali

整体系统搭建:

1. 必先换源 官网的源速度慢 各种问题. 
2. 换源后 更新并安装系统。                       `apt-get update && apt-get dist-upgrade`
3. 安装谷歌浏览器。      系统自带的 Iceweasel 相当于火狐.  
在线安装需要翻墙, 用 scp 命令 从别的电脑拷贝源代码安装.




## Kali 输入法

Kali 默认不带中文！ 需手动安装. ( 先更新源 )  


- 更新软件源： 看 换源教程.  

- 安装中文输入法（任选一种）：

拼音五笔
	sudo apt-get install fcitx-table-wbpy ttf-wqy-microhei ttf-wqy-zenhei

经典的ibus
	sudo apt-get install ibus ibus-pinyin                                                         

fcitx拼音               
	sudo apt-get install fcitx fcitx-googlepinyin                                             

- 注销 + 重新登录.




## Kali Apple 蓝牙键盘连接
systemctl enable bluetooth.service

systemctl start bluetooth.service

 运行之后 就能蓝牙搜索到键盘了 。 。。     



## Kali Lantern 安装蓝灯翻墙

1. Lantern [官网][1]下载源代码 (下载需要翻墙)
2. 安装:   cd 到下载目录
3. `.dpkg -i lantern-installer-64.deb   文件名安装下载的为准
	`4. 安装好之后 不能用的话: 需要安装依赖包.
`apt-get install libappindicator3-1`

安装依赖包 可能需要先换源!!!


http://www.evil0x.com/posts/11627.html





## Kali 安装 ss
`pip install shadowsocks`

 ….




## 开机启动 ssh
vi /etc/re.local

添加 一行 (二选一)
`service sshd start`
`/etc/init.d/sshd start`














[1]:	https://getlantern.org/