## Homebrew
**Home-brew install :** [官网链接][1]

## HomeBrew

\*uninstall /reinstall  HomeBrew
- 卸载
		cd brew --prefix
		rm -rf Cellar
		brew prune
		rm -rf Library .git .gitignore bin/brew README.md share/man/man1/brew
		rm -rf ~/Library/Caches/Homebrew

	- 重装:
			$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

*卸载软件 *
如:卸载 Autojump     
`brew uninstall autojump`

*安装软件*
如: 安装 Git
`brew insrall git`

*查询软件*
安装软件 不知道软件名字时用
如果已安装 插件名后面有个 √.
后面 可以接 正则式表达.
`brew search autojump`

*列出已装软件*
`brew list`

*其他命令*
brew update  更新brew
brew info    软件信息
brew deps    显示包依赖


Misc:
- brew doctor
	检查 homebrew 各个模块是否正常.








*使用教程*
- 安装软件:
	brew install \<package\_name\>
- 更新软件源目录:
	brew update
- 查看你的包是否需要更新：
	brew outdated
	*更新包：*
	brew upgrade \<package\_name\>

Homebrew 将会把老版本的包缓存下来，以便当你想回滚至旧版本时使用。但这是比较少使 用的情况，当你想清理旧版本的包缓存时，可以运行：

brew cleanup

查看你安装过的包列表（包括版本号）：

brew list --versions

---
## 文件预览插件

有些 插件 可以让 Mac 上的文件预览更有效，比如语法高亮、markdown 渲染、json 预览等 等。

 brew cask install qlcolorcode 
 brew cask install qlstephen 
 brew cask install qlmarkdown 
 brew cask install quicklook-json 
 brew cask install qlprettypatch 
 brew cask install quicklook-csv 
 brew cask install betterzipql 
 brew cask install webpquicklook 
 brew cask install suspicious-package






[1]:	http://brew.sh