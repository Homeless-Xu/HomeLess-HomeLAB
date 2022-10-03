## USB Console 配置线

第一次使用  必须用设备线进行配置.

fit 模式 只能用 相应的 ac 控制器来管理
fat 模式 可以用 console
telent / ssh  web 网管登陆  nms 登陆


*硬件:*  console 配置专用线 :  用串口+网线  或者 usb+ 网线
*软件:*  securecrt7.3.4  或者 iTerm终端(Mac OS)

连接设备和电脑   打开超级终端  就能进去了, 进去之后设置telent远程登录功能 方便以后管理.

命令不区分大小写

用户视图 权限小
系统试图 权限大  命令:  system-view

退出当前视图/断开ap设备连接 quit

返回用户视图  return

?  在线帮助


快速命令输入
save startup system-view
sa  直接保存
sy 系统视图


undo  禁用某个功能


空格  下一屏
回车 下一行

ctrl e  光标到行尾



console 口 缺省配置
速率 9600 bit/s
流控  校验 无  停止位 1  数据位8






