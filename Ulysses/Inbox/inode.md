## inode
记录文件属性 以及 文件实际数据放在硬盘的哪几个 block 内

该档案的存取模式(read/write/excute);  

该档案的所属群组(owner/group);  

该档案的容量;  

该档案建立或者状态改变时间(ctime); 
最近一次的读取时间(atime); 
最近修改时间(mtime); 
定义文件特性的旗标(flag),如 SetUID...; 
该档案真正内容的指向 (pointer);  


inode 的数量与大小也是在格式化时就已经固定了 
每个 inode 大小均固定为 128 bytes; 
每个档案都仅会占用一个 inode 而已; 
文件系统能够建立的档案数量与 inode 的数量有关; 
系统读取文件时 → 先找到 inode → 分析 inode 所记录的权限 与用户是否符合,符合才能  
够开始实际读取 block 的内容。  

 


