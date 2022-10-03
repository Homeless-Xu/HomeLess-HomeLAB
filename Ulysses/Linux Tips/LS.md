## LS

ls -m  紧凑显示所有内容.而不是 一行一个文件.


ls  列目录  下的 所有文件名与相关属性       list的意思

ls -al    目录下的 所有隐藏文件和 文件属性.

drwxr-xr-x+ 47 V     staff   1598  4  9 20:07 .
drwxr-xr-x@  5 root  admin    170  2 27 09:20 ..
-r--------   1 V     staff      9  2 25 14:36 .CFUserTextEncoding
-rw-r--r--@  1 V     staff  22532  4 10 14:42 .DS_Store
文件类型 权限  连接数 拥有者 文件所在群组 文件大小  文件最后修改时间 文件名字
文件权限 d 表示目录   - 表示文件  l 表示链接! 
 接下来  三个一组 rwx read write  execute   读写 可执行    rwx 位置不会变 没有权限显示-   
 第一组 owner 第二组本群组 第三组其他非本群组