## Apt-get
> Debian Kali …

- **install**
	`apt-get install packagename`
- **reinstall** 
	`apt-get install package`

- **remove**  (keep configure )
	`apt-get remove packagename` 
- **remove**  (delete configure)
	`apt-get -purge remove packagename `

- **Search**
	`apt-cache search httpd`

- **fix**
	`apt-get -f install packagename`




**更新源**
`apt-get update`		
**更新已安装软件** 
`apt-get upgrade`
**更新系统版本(核心升级)**
`apt-get dist-upgrade`



*安装 SSH*
- 客户端 openssh-client 
	- 服务端 openssh-server
		`apt-get install openssh-server -y`
		> -y 出来提示 就不用手动按 y 键了.





apt-cache search package 搜索包
apt-cache show package 获取包的相关信息，如说明、大小、版本等
sudo apt-get update 更新源sudo apt-get upgrade 更新已安装的包
sudo apt-get dist-upgrade 升级系统
sudo apt-get dselect-upgrade 使用 dselect 升级
apt-cache depends package 了解使用依赖
apt-cache rdepends package 是查看该包被哪些包依赖
sudo apt-get build-dep package 安装相关的编译环境
apt-get source package 下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean 清理无用的包
sudo apt-get check 检查是否有损坏的依赖



