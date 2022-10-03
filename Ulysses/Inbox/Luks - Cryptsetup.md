## Luks / Cryptsetup
> Cryptsetup 版本: `cryptsetup --version`
> 一般系统 都自带的.   [教程参考链接][1]
> 能同时设置多个密码

*预备知识:* 
- 硬盘分区     `fdisk`
	- 创建文件系统 `mkfs.ext4`
		- 挂载/卸载    `mount`
		- 显示已挂载   `df -h`

*Crypsetup加密的特点：
- 加密后不能直接挂载
	- 加密后硬盘丢失也不用担心数据被盗
		- 加密后必须做映射才能挂载


**加密状态:**

`cryptsetup status /dev/mapper/---`
> 这里要输入 挂载后的地址.
加密后的硬盘 一般 挂载在 dev/mapper 下  cd 到这看看就能知道那个分区被加密了.



**创建加密盘 (也就是格式化成 luks 格式)

参数      含义      推荐值
cipher    加密方式  aes-xts-plain64
key-size  秘钥长度  512
hash      散列算法  sha512
iter-time 迭代时间  大于10000

1. `cryptsetup --cipher aes-xts-plain64 --key-size 512 --iter-time 10000 luksFormat /dev/sdb1` 

	> Cannot format device /dev/sdb1 which is still in use.
	- 文件使用中 无法格式化
		- 先把 `/dev/sdb1` 这个分区  卸载了!!!
			- 无法 卸载 umount is busy:
				用:	`fuser -km /dev/sdb1
				`
			然后再加密!! 就可以了

		2. 输入 `YES` 必须是大写的YES
		3. 输入两遍密码


**打开加密盘**

1. **解密**加密分区:
	`cryptsetup luksOpen /dev/sdb1 program`
	> 最后的 program 不能随便改... (/dev/mapper/program)
	> 把 加密硬盘 解密到  /dev/mapper/program 文件夹

2. **格式化**加密分区
	`mkfs.ext4 /dev/mapper/program`

	**挂载**加密分区
	- `mkdir /program` (这个文件夹 只需要建立一次)
		- `mount /dev/mapper/program /program`
			> 这边挂载的是 解密出来的 位置.不是 硬盘的原始位置.

3. 查看挂载状态 `df -h`

	4. **永久挂载**
		修改 fstab


**锁住加密分区**
- 先卸载 `umount /dev/mapper/program`

	- 再锁住 `cryptsetup luksClose burvis`
		> close = luksClose = cryptClose





**修改密码** / **添加第二个密码**
> 先添加密码 添加成功 再删除旧的密码.
1. 添加第二个密码:
	- `cryptsetup luksAddKey /dev/sdb1
		` - 输入一个已存在的密码 (验证你的身份,不是所有人都能添加密码的) 

		2. 测试密码:
			-  先卸载分区: 
				> 不能卸载 那个/ dev/sdb1   要卸载 /dev/mapper/Program 这个.
			- `df -h` 看看有没有卸载掉.

			-  再锁住分区 `cryptsetup luksClose /dev/mapper/program`

			- 再解锁: `cryptsetup luksOpen /dev/sdb1 program`
				输入新设置的密码 
			- 再挂载
				 


**删除密码:**
- `cryptsetup luksRemoveKey /dev/sdb1`
	- 输入要删除的 密码.






---- -

**Disk /dev/sdbdoesn't contain a valid partition table  **
不包含有效分区表信息，我们需要给新磁盘创建分区表




加密物理分区
加密逻辑分区




 
注：要解除加密需要备份分区内的文件再重新格式化LUKS分区







文件系统级别加密. 加密每一个文件.
Cryptsetup.
不能给现有的数据加密,必须创建加密分区. 把数据转移到新建的加密分区中.

1. 创建加密分区:
2. 创建可加载的逻辑分区.
3. 创建 文件系统
4. mkdir 创建目录
5. 挂载.



好像系统安装的时候 选LVM 才能加密的！
**修改磁盘密码**
**Ubuntu 用 LUKS 来加密 分区 和 LVMs**

*新增密码*
`sudo cryptsetup luksAddKey /dev/sda5`
*删除密码*
`sudo cryptsetup luksRemoveKey /dev/sda5`

**三种加密方式:**
- 文件加密
	- 系统加密
	- 磁盘加密 (最好)
		> 不需要整个硬盘加密，只需要将除过boot/分区以外的其他分区加密。




如果你要加密整个硬盘的话，并且从这个硬盘引导的话，单个硬盘是无法做到的。除非你有别的硬盘或者u盘、光盘来启动系统。
因为计算机的MBR以及操作系统的引导程序如grub是无法从加密的分区里都去读取操作系统的内核镜像文件并加载。你可以加密整个硬盘，然后把内核镜像文件，初始化的Initrd文件还有grub安装到一个U盘或者另外一个硬盘。让计算机从U盘或者别的硬盘启动系统。否则你只能分区，保留一个分区不加密用于存放grub和内核镜像文件和initrd初始化文件。这样也可以达成保密的效果。
例如你可以分一个100MB的分区,格式化成grub能够识别的文件系统，将grub和vmlinuz,initrd.img文件复制到该分区。然后从该分区引导启动操作系统。其它分区全部加密。






— 


[1]:	https://linux.cn/thread-14738-1-1.html "教程链接"