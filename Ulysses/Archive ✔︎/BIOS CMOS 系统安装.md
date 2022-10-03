## BIOS CMOS 系统安装
cmos 记录各项硬件参数
bios 写入主板的一个软件,电脑启动时执行的第一个软件!!!!

bios: 分析电脑有哪些储存设备 → 根据设定 去读取能够开机的硬盘 → 找到到该硬盘的第一个扇区的 MBR 位置 .内含开机管理程序

开机管理程序(boot loader): 一个可以加载核心文件(操作系统)的软件
1:主要任务: 操作系统的选择 也就是多重引导功能.
2:载入 核心文件

开机管理程序 能安装在两个地方 mbr 和 boot sector

安装多系统 最好先安装 windows 再 linux
因为 win 安装系统的时候 会主动覆盖 mbr 扇区
linux 可以选择 开机管理程序 安装在mbr 还是 别的启动扇区

如果先安装 linux 在windows 那么 开机管理程序会只有 win 的开机程序
  这样 linux 就不能正常启动了   也不需要重装系统 利用 spddisk 来修复引导什么 就好了


 

系统安装:
调整开机启动项目.
选择语言
分区
设置 root 密码 
开机管理程序的处理: 一般用 grub 管理程序  要安装到硬盘的 mbr 里.
选择硬盘 就自动会安装到 mbr 里的. 

网络参数. 如果有路由器且开启 dhcp 的话 就能自动获取



apm advanced power management 早期电源管理模块
acpi advanced configuration and power interface 现代电源管理模块


账户问题: 尽量不用 root 权限 
这个权限太大了 很可能出错 导致系统崩溃/坏掉. 

用到 root 账户的时候 可以用命令切换到 root




