## User/Group passwd File :  

**七个字段组成:** 
 用户名:密码(x表示):用户标识:组标识: 注释 :用户家目录: 用户登录后启动的一个进程.
`root  :   x       :    0   :   0  : root : /root    :  /bin/bash  
``bin   :   x       :    1   :   1  : bin  : /bin     :  /sbin/nologin  
``daemon:   x       :    2   :   2  :daemon: /sbin    :  /sbin/nologin  
`> 字段3/4 0 表示 root 用户/用户组  
> 字段7 nologin 就是不让用户登录的意思.


## sudoers:  

|作用|命令|注释|
|:---:|:---:|:---:|
| 查看文件权限 | ll /etc/sudoers |  默认只读.要先修改权限(用 root 登录修改) |  
| 修改文件权限 | chmod 777 sudoers | root 登录 等下最好改回去  chmod 440 sudoers  |
|||root 登录: 可用 vi  :wq! 强制修改,用别的账户登录无效.| 
| 编辑sudoers文件 |vi /etc/sudoers | 找到 root ALL=(ALL) AL (倒数17行左右); 此行下添加两行|
||xujian ALL=(ALL) ALL|这个 切换 sudo 时 需要输入密码的.|
||xx0219 ALL=(ALL) NOPASSWD:ALL | 这个 切换 sudo 时 不需要输入密码.|



## 权限分配

### 普通用户 → Root 权限  
1. root登录
2. adduser 新建用户名
3. passwd 增加新用户密码
4. 修改/etc/passwd即可，把用户名的ID和ID组修改成0。


	  