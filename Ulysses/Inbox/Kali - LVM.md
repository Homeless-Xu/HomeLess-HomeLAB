## Kali - LVM

配置

1. vb 虚拟机 添加个4.4G 的 vdi 硬盘.
2. 进系统 `fdisk -l` 能看到4.4G 的硬盘


给这个硬盘分区:
创建第一个分区:
`fdisk /dec/sdc`
`n`
`p`
`1`
开始扇区 → 回车键
结束扇区 → +1024M  就创建一个1G 的分区.

`p` 查看分区→ 现在就能看到 1G 的分区了.

 创建第二个分区:
n → p → ↵ → ↵ → 输入大小 +2048M → ↵ 
p  查看分区.

创建第三个分区 (用剩余容量)
  一路默认就好了.


保存修改 → `w`

fdisk -l 就能看到 新加的硬盘有了三个分区.




分区之后格式化

转换磁盘分区 到 LVM
pvcreate /dev/sdc1
pvcreate /dev/sdc2
pvcreate /dev/sdc3


> 扫描 本地的 vg 储存池 :vgscan




创建 VG 存储池 
VG: LVM 中的物理磁盘分区. 
要加入 LVM 的物理分区 都要创建一遍 vg
(把很多物理分区 集中到一个逻辑分区上)

vgcreate vg1 /dev/sdc1 1G
vgcreate vg2 /dev/sdc2 2G 
vgcreate vg3 /dev/sdc3 1.4G

vgdisplay 看创建的vg分区.


分配 LV 逻辑卷.(类似 win 系统分区)
lvcreate -L 500M -n work vg1
显示 lv 卷. lvdisplay


分区格式化
mkfs.ext3 /dev/vg1/work


挂载:
mkdir /home/work
mount /dev/vg1/work /home/work

挂载后就能 在  df -h 下面看到了.







新增 LVM. 格式化的时候就要选择 luks 的格式.

cryptsetup --cipher aes-xts-plain64 --key-size 512 --iter-time 10000 luksFormat /dev/sdc1

YES → 输入密码
// `/dev/sdc1 is in use`

卸载 sdc1 umount /dev/sdc1






























