## VirtualBox Add HDD / VB 

## 添加新硬盘:
> 先虚拟机设置 . 再进系统进行分区,格式化 …

**虚拟机操作:
- VB菜单栏 → 设置 → 存储 → SATA 控制器 
	- 右键 添加虚拟硬盘
		- 创建新的虚拟磁盘
			- VDI 类型 & 设置大小 类型 


**进 linux 系统 进行分区.

- 查看现有的磁盘空间    `fdisk -l`
		root@kali:~# fdisk -l
		Disk /dev/sda: 21.9 GiB, 23514939392 bytes, 45927616 sectors
		Units: sectors of 1 * 512 = 512 bytes
		Sector size (logical/physical): 512 bytes / 512 bytes
		I/O size (minimum/optimal): 512 bytes / 512 bytes
		Disklabel type: dos
		Disk identifier: 0x3dde8b11
		
		Device     Boot    Start      End  Sectors  Size Id Type
		/dev/sda1  *        2048 43960319 43958272   21G 83 Linux
		/dev/sda2       43962366 45926399  1964034  959M  5 Extended
		/dev/sda5       43962368 45926399  1964032  959M 82 Linux swap / Solaris
		
		
		Disk /dev/sdb: 2 GiB, 2147483648 bytes, 4194304 sectors		
	> 发现有个 2G 的 也就是刚才添加的. 下面什么分区都没有
		Units: sectors of 1 * 512 = 512 bytes
		Sector size (logical/physical): 512 bytes / 512 bytes
		I/O size (minimum/optimal): 512 bytes / 512 bytes
 
**开始分区:

1. `fdisk /dev/sdb`
	> 进入 这个 要分区的 设置 
	> 输入 `m`  显示帮助命令.
	2. `n` 创建一个分区
		-  按回车  选择默认的 P (primary)
			- 按回车 选择默认的分区号. 
				> 1的话 → sdb1 ; 2的话 → sdb2 . . . . 
			- 按回车 选择开始扇区号
			- 按回车 选择结束扇区号
				> 这个 设置大小 可以分成多个区.
		3. `w` 保存修改.分区完成
		4. `fdisk -l`   再次查看.
				Device     Boot Start     End Sectors Size Id Type
				/dev/sdb1        2048 4194303 4192256   2G 83 Linux

		**格式化!!!
		`mkfs -t ext4 /dev/sdb1`

		**挂载**
		挂载前 挂载点分布:
			root@kali:~# df -h
			Filesystem      Size  Used Avail Use% Mounted on
			udev             10M     0   10M   0% /dev
			tmpfs           401M  6.0M  395M   2% /run
			/dev/sda1        21G  8.4G   12G  43% /
			tmpfs          1003M  200K 1003M   1% /dev/shm
			tmpfs           5.0M     0  5.0M   0% /run/lock
			tmpfs          1003M     0 1003M   0% /sys/fs/cgroup
			tmpfs           201M   16K  201M   1% /run/user/133
			tmpfs           201M  4.0K  201M   1% /run/user/0

1. cd /                      去根目录
	2. mkdir new-hdd             新建挂载目录
		3. mount /dev/sdb1 /new-hdd  进行挂载

			挂载后 挂载点分布:
				root@kali:/# df -h
				Filesystem      Size  Used Avail Use% Mounted on
				udev             10M     0   10M   0% /dev
				tmpfs           401M  6.0M  395M   2% /run
				/dev/sda1        21G  8.4G   12G  43% /
				tmpfs          1003M  200K 1003M   1% /dev/shm
				tmpfs           5.0M     0  5.0M   0% /run/lock
				tmpfs          1003M     0 1003M   0% /sys/fs/cgroup
				tmpfs           201M   16K  201M   1% /run/user/133
				tmpfs           201M  4.0K  201M   1% /run/user/0
				/dev/sdb1       2.0G  3.0M  1.9G   1% /new-hdd
			> 这个就是新挂载的 硬盘











