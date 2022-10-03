
## Echo

**查看&修改文件.

- 覆盖文件写入:
	`echo aaa > a.txt`
	 
- 增加写入 (文件尾部 新建一行增加)
	`echo aaa >> a.txt`
	 
- 增加分行写入 
	`echo -e "xujian\nxujian0219@126.com" >> a.txt`
	> echo 下面 ! 是特殊符号  要`\!` 才能输出 !号.

- 多行文字输入: 
	`cat >> 文件 <<EOF`
	直接输入内容.就可以了. 可以输入很多行!!!!!!
	 
	 Example:
		cat >> /root/a.txt <<EOF
		123456789
		bbbbbbbb
		FFFFFFFFFFFFFFFFFFFFFFF
		EOF
		//作用: 在a.txt文件后面加上三行代码。

 *Cat 和 EOF*
- cat 文本输出命令，观看某个文件的内容；
	- EOF: ”end of file"，表示文本结束符。

结合这两个标识，即可避免使用多行echo命令的方式，并实现多行输出的结果。

注意EOF只是标识，并不是固定不变的也可以用别的符号代替比如EEE等等。
	Cat << EOF  ...EOF 最后一个EOF一定顶格写，还有相关命令一定要顶格写.










