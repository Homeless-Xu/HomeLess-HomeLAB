## Raid Server Conf

重新建 raid 之后 就算硬盘是没数据的 也要 sync 同步下的. 算初始化吧



**USB 开启启动选项是 擦了 USB 才会出现的!!!!! **

插usb 之后 最好重启下才能看到 usb 启动选项.

SAS 配置 就是 Raid 卡.
> 也就是 连硬盘数据线的那块设备 


开机自检:
看 SAS 阵列卡 是否有检测到.
有的话 Ctrl+C 进入配置.





`VD` 虚拟磁盘
`PD` 物理硬盘
`HS hot spare` 热预备

先选 raid0 或者 raid1

然后 进去 选哪块硬盘到这个 raid!! 空格选硬盘
然后保存.




raid level → 支持的 raid 级别.



