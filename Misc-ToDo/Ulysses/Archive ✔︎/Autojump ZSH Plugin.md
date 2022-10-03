
## Autojump ZSH Plugin

原理:  记录你常去的文件夹到数据库 → 根据使用频率 自动跳到常用文件夹.

**手动编译 :
1. 终端输入:  获取源代码
	`git clone git://github.com/joelthelion/autojump.git
	`2.  定位到下载的文件夹
		`cd autojump
		`3. 运行 python 的安装 或者 卸载脚本
		`python ./install.py`
		.py  就是 python 文件    运行方法: Python hello.py
	4. 根据屏幕提示  打开用户的 zshrc 配置    
		`vi /users/v/.zshrc`
		编辑 .zshrc (用户目录下的隐藏文件) 用 `ls -a`命令显示隐藏文件.
		文件末尾添加两行屏幕出现的提示	
	5. 重启 zsh 就能用了.

**Manual

*j de        *→ 智能跳到常用的包含 de 的文件夹 比如:desktop
*jo music    *→ 在 Finder 中打开Music文件夹
*d           *→ 列出历史访问目录,输入序号跳转文件夹
*autojump -v *→ 版本信息
*autojump -s *→ 历史路径库
历史记录文档路径: `vi /Users/v/Library/autojump/autojump.txt`

