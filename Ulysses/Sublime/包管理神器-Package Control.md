## 包管理神器:Package Control 

[官网也有安装教程][1]

*安装:*
1. view →show console 

	2. 粘帖下面代码 

		import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed\_packages\_path(); urllib.request.install\_opener( urllib.request.build\_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())


3. 重启Sublime Text 3。
	4. 如果在Perferences-\>package settings中看到package control这一项，则安装成功。



**Plugin install**


1. preferenc → package Control: 
2. 输入 install package 
3. input plugin name
4. choose one 
5. install



gb2312  不支持的话.  安装  GBK Encoding Support



[1]:	https://packagecontrol.io/installation