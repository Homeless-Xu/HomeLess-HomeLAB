## Grub

系统启动:
打开
/boot/grub/grub.cfg

找到类似下面一段:

	menuentry "Ubuntu 9.10, kernel 2.6.31-17-generic" {
	search --no-floppy --fs-uuid --set f1bafdd4-73c2-44b2-9a62-d50a2da4d019
	linux /boot/vmlinuz-2.6.31-17-generic root=UUID=f1bafdd4-73c2-44b2-9a62-d50a2da4d019 ro splash
	initrd /boot/initrd.img-2.6.31-17-generic
	}
	

这是一个标准的 ubuntu 引导菜单.

menuntry 那行 仅仅显示 该项目的名称. 不管

第二行 才是真正进入 linux 系统引导过程.

search 





