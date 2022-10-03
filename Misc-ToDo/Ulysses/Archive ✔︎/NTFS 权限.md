NTFS 权限:


Xcacls.vbs 工具 能修改+ 查看权限
xp win2000 win2003 是测试过能用的 win7 不一定

win7 需要 wmi  才能用 这个脚本.
wmi windows management instrumentation   windows 管理工具.

 管理数据和 操作的基础模块. 可以用这个去管理本地或者远程计算机上的资源.



下载 exe 解压出来一个 xcacls.bs 文件
将脚本引擎 从 wscript 改为 cscript   因为这个脚本最适合在 cscript 下运行
改脚本引擎 值影响 脚本向屏幕写入的方式
Wscript 根据对话框 封包写入每一行
Cscript 将每一行命令写入命令窗口.

如果不想换脚本引擎 那么 必须:
cscript.exe xcacls.vbs

如果改了 只需: 
xcacls.vbs

查看语法命令:
xcacls.vbs /?


如: 看 c:\test 文件夹权限
xcacls.vbs c:\test




这个 需要 打开终端 输入 cscript.exe /h:cscript

然后 cmd 定位到 xcacls.vbs 所在的文件夹  然后终端输入 xcacls.vbs 就正常运行了,   就是右键属性 高级 安全 下面的具体权限 只是这个 是文本 可以导出文件而已.....

























1 看某个文件夹  某人/组 的具体权限
属性 → 安全 →高级 →  有效权限


2
某对象(文件/文件夹) 关联的 NTFS 权限

用命令 
cacls d:\xx.txt
cacls i:\office 

IBM\Xujian:(OI)(CI)F
BUILTIN\Administrators:(OI)(CI)F
SH\Boss:(OI)(CI)F
BUILTIN\Administrators:F
BUILTIN\Administrators:(OI)(CI)(IO)F
NT AUTHORITY\SYSTEM:F
NT AUTHORITY\SYSTEM:(OI)(CI)(IO)F



3.	 批量查看对象的 ntfs 权限
powershell 提供非常丰富的 批量管理功能

如 test 文件夹下的  所有文本文档的有效权限

get-acl c:\test\*.txt


为了方便查看 可以用 管道符号 | 将结果传输到 Format-list  命令.  修改显示格式 如: 
Get-act c:\test\*.txt | Format-list

 将对象的 ntfs 权限导出文本 用\> 命令

get-acl c:\test\*.txt | Format-list \> c:\aa.txt





工具 :
1.	  Powershell     支持 使用参数  将输出 导出到 csv 文件.     export-csv

2.	Fileacl   软件 下载 通过 /sub:n 来设定列举子文件夹的层数.  
3.	showacls  /s 实现列举子文件夹.   只能列举或者不列举   优点: 输出整齐 一文件夹为单位 进行列举.







高级文件权限:
根目录 TS.  开共享和安全 
共享 任何人可读写
安全: 不继承 


权限继承 是从上级文件夹继承下来的.   本级文件夹关闭共享 可以选择 保留 或者 删除上级留下来的程序.

TS 下面有 A、B、C 三个文件夹.  a 下面有 a1 a2   b下面有 b1 b2   c 下面有 c1 c2

如果某人xx要有 c2的读写权限    别的都不能读写.: 可以看文件名称
⁃	首先 ts 要开共享  任何人可读写.  
⁃	取消继承. 
⁃	安全给









