## Shutdown

`?           帮助信息
``l            注销
``s           关机
``r            重启
``h           休眠
``t xxx     关闭前的超时. 默认30秒
``f            强制关闭
``a           取消操作.
`

关机&重启 :  
` shutdown -s             一分钟内关闭
`` shutdown -s -t 0      立即关闭
`` shutdown -r              一分钟内重启
`` shutdown -r -t 0       立即重启
``shutdown -r —f t 0    强制重启
`
重启脚本:  新建文本 直接写命令. 改成. bat  双击运行.
	shutdown -r -t 0

