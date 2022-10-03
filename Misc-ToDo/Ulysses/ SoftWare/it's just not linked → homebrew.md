


1. 首先 *brew link aria2*
	看具体的错误提示.

	/usr/local/share/man/ru/man1 is not writable.
	应该是权限问题.

chmod -R 777 /usr/local/share 就可以了


如果这步 没有给出错误信息! 那就执行
*brew doctor*


