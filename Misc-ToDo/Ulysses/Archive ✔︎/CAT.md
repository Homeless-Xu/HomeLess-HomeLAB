## CAT

1. cat 显示出文本内容，
	命令格式：cat filename(s)
	> 当内容超出一屏时，只保留最后一屏幕，其他内容一闪而过。

cat最常见的用法是配合重定向符来清空文件以及将几个文件合并成为一个文件。
	cat /dev/null > doc.txt  
	//清空文件doc.txt，/dev/null代表空设备文件（记住使用即可）
	cat << doc1.txt >> doc2.txt  
	//将doc1.txt中的内容保存在doc2.txt的尾部


-



