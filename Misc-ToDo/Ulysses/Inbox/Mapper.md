
## Mapper

**查看逻辑设备:** `lvdisplay`
**查看物理设备:** `fdisk -l` 
> 逻辑设备 不能用 fdisk -l 命令看
> 不然会报错....



逻辑设备 到物理设备的映射.
比较流行的 
*逻辑卷管理器 LVM2 *



安装系统  首先建立个 swap 空间
然后剩余的  应该是分到 logical volumes



二、/dev/mapper目录的解释
   为了方便叙述，假设一台服务器有三块硬盘分别为a，b，c，每块硬盘的容量为1T。在安装Linux的时候，先根据系统及自身的需要建立基本的分区，假设对硬盘a进行了分区，分出去了0.1T的空间挂载在/boot目录下，其他硬盘未进行分区。系统利用Device mapper机制建立了一个卷组（volume group，VG），你可以把VG当做一个资源池来看待，最后在VG上面再创建逻辑卷（logical volume，LV）。若要将硬盘a的剩余空间、硬盘b和硬盘c都加入到VG中，则硬盘a的剩余空间首先会被系统建立为一个物理卷（physical volume，PV），并且这个物理卷的大小就是0.9T，之后硬盘a的剩余的空间、硬盘b和硬盘c以PV的身份加入到VG这个资源池中，然后你需要多大的空间，就可以从VG中划出多大的空间（当然最大不能超过VG的容量）。比如此时池中的空间就是2.9T，此时你就可以建立一个1T以上的空间出来，而不像以前最大的容量空间只能为1T。
   /dev/mapper/Volume-lv_root的意思是说你有一个VG (volume group卷组)叫作Volume, 这个Volume里面有一个LV叫作lv_root。其实这个/dev/mapper/Volume-lv_root文件是一个连接文件，是连接到/dev/dm-0的，你可以用命令ll /dev/mapper/Volume-lv_root进行查看。
   其实在系统里/dev/Volume/lv_root 和 /dev/mapper/Volume-lv_root以及/dev/dm-0都是一个东西，都可当作一个分区来对待。
   若要了解硬盘的具体情况，可通过fdisk或者pvdisplay命令进行查看。
   若你想要重装系统到/dev/sda下，且安装时有些东西不想被格式化想转移到/dev/sdb下，但此时/dev/sda和/dev/sdb被放到VG中了，那该如何解决该问题呢？这种情况下，由于此时根本没办法确定数据在哪一个硬盘上,因为这两个硬盘就如同加到池里，被Device mapper管理，所以解决方案就是再建个逻辑卷出来，把数据移到新的卷里，这样你就可以重装系统时只删掉之前分区里的东西，而新的卷里的东西不动，就不会丢失了。



