
## Man
> Example:    man ls 

- 所有命令的帮助文件位置
	`ls /usr/share/man`
	man1   man5   man7   man9   whatis
	man4   man6   man8   mann

	如: 
	man1 → awk.1
	man8 → ifconfig.8

*Man用法:*
> man 命令基于 less命令.less 能用的操作都能在 man 下使用
`⥎` → 下页;  `⌃+d` → 下半页; `↵` → 下行; `g`  → 首行;  ` q ` → 退出
`b ` → 上页;  `⌃+u` → 上半页; `k ` → 上行; `G`  → 尾行;  `g22` → 指定行

`/` 顺序搜索                不区分大小写
`?` 倒序搜索                `n/N` 上/下一个搜索结果

*Man命令 组成 (分不同的章节)*

1. General Command Manual 普通命令 
2. 系统调用
3. 函数库
4. 特殊文件 /dev
5. 文件格式
6. 游戏用
7. 附件
8. 系统管理员命令  ifconfig

如:
	man ls       → LS(1)
	man ifocnfig → IFCONFIG(8)

## NAME           命令全称
`ls - list directory contents`

## **SYNOPSIS**   语法格式

`ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]`

**`[]` 可选项.**
> -AB… → 前面要有- 


`<>` 必须提供项
`…`  同类的内容可出现多个
`a|b|c` 多选一. 必须选一个.


Description   命令的描述
option    选项
Examples   使用示例
Author   作者
Bugs 
SEE Also 参考





