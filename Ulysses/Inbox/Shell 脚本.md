## Shell 脚本

	!/bin/sh
	//指定脚本解释器，这里是用/bin/sh做解释器
	cd 
	//切换到当前用户的home目录
	mkdir shelltut 
	//创建文件夹
	cd shell_tut
	//切换到新建文件夹
	
	for ((i=0; i<10; i++)); do
	touch test_$i.txt
	// 创建 test_1、test_2 ... test_10 文件
	done 
	// 结束循环