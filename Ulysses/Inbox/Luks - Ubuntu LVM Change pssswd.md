## Luks - Ubuntu LVM Change pssswd

每次重启 都要输入密码 解锁 LVM 卷.


加密盘 会自动映射到 /dev/mapper/xxx
这里创建文件系统
mkfs.ext4 /dev/mapper/xxx≤≤,

挂载文件 也是把 映射都的地址 挂载到 根目录下某个文件夹中






安装系统的时候加密硬盘.
需要改这个密码.

1. 进入系统
2. cd /dev/mapper
3. 看有哪几个是被加密的
4. `cryptsetup statue /dev/mapper/sdb5_crypt`
5. 看具体的加密信息(加密方式等等)


加第二个密码:

first mount the /dev/mapper/C2Cx /mnt/xx



luksAddKey /dev/sdb5 →  sdb5 is inactive

