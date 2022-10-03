

## `.DS_Store` 文件禁止生成的终极方案:

禁止.DS_store生成:
打开终端Terminal,复制粘贴下面的命令,然后回车执行,最后重启Mac即可生效。
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

恢复.DS_store生成:
defaults delete com.apple.desktopservices DSDontWriteNetworkStores





