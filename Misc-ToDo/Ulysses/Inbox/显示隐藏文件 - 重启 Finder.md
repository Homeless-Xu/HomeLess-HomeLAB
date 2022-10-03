## 显示隐藏文件 / 重启 Finder
> 最好用 机器人那个工具 写成脚本. 
- 显示文件：
	defaults write com.apple.finder AppleShowAllFiles -bool true
	 
- 隐藏文件：
	defaults write com.apple.finder AppleShowAllFiles -bool false

- 重启 Finde
	Killall -KILL Finder
	  
