## File - Linux

Touch → file
mkdir → Folder




## File Time
**访问时间**
**修改时间**
**状态改动时间**


### 查看时间信息:
**stat xu.txt**
	:~# stat xujian.txt
	  File: ‘xujian.txt’
	  Size: 0         	Blocks: 0          IO Block: 4096   regular empty file
	Device: 801h/2049d	Inode: 1231468     Links: 1
	Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
	Access: 2016-07-26 17:10:41.492000000 +0800
	// 访问时间
	Modify: 2016-07-26 17:10:41.492000000 +0800
	// 修改时间
	Change: 2016-07-26 17:10:41.492000000 +0800
	// 状态改动时间
	 Birth: -

**`stat *`\*\*
> 当前文件夹所有文件的时间信息





## Touch 
- 文件存在:   修改文件的存储时间/更改时间
- 文件不存在: 新建文件



`touch xu.txt`
文件存在:  各项文件的 存取和修改时间.
文件不存在: 新建 xu.txt file

`touch -c xu.txt`
文件不存在: 不新建文件!





`touch ~/Desktop/xu/ xx.txt`
在 xu 文件夹下 新建 xx.txt 文件.

 









