## Redis

Redis REmote DIctionary Server  远程字典服务器

Redis是一个开源、支持网络、基于内存、键值对 存储数据库.
Redis通常将全部的数据存储在内存中。性能优势非常明显!!
当然内存断电的问题: 将内存中的数据 异步写入硬盘.

> 某人对 MySQL 性能感到失望. 就自创了 Redis 数据库.

如今: Web 开发 最火热的内存数据库之一
新浪 知乎 GitHub 等等 都使用 Redis.

[官网][1]       [GitHub 链接][2]

安装: 没有外部依赖 安装非常简单.
	wget http://download.redis.io/releases/redis-3.0.7.tar.gz
	tar xzf redis-3.0.7.tar.gz
	cd redis-3.0.7
	make
	make test
	//进行测试! 是否安装成功.

启动:
	src/redis-server

Redis 以字典结构存储数据 允许其他应用通过 TCP 协议读写字典中内容.

字典中的 键值 可以死字符串 和 其他数据类型.
- 字符串类型
- 散列类型
- 列表类型
- 集合类型
- 有序集合类型

这种结构 和 mysql 等关系型数据库的 二维表形式的存储结构有很大差异.


可以设置 每个键 的 生存时间 Time To Live TTL.
生存时间到期后 键会自动被删除.

使用简单稳定:
SQL 取得 posts 表内 id 为1的记录的 title 字段的值:
	select title from posts where id = 1 limit = 1

Redis 
	hget post:1 title
 

Redis 提供 100+ 命令 
常用的 十几个 . 非常好记 .  比 SQL 语言简单多了.















启动 和 停止 Redis
了解下 redis 的可执行文件有哪些

如果 安装的时候 make 之后  执行了make install 命令
这些程序就会被 复制到 /usr/local/bin 目录内
所以 在 命令行中 直接输入程序名称即可执行
如: 终端 输入 redis-server  就能启动 redis
当然 如果已经启动过 就会报错 说已经运行中,.
---
redis-server   redis 服务器
redis-cli   redis 命令行客户端
redis-benchmark  redis 性能测试工具
redis-check-aof AOF 文件修复工具
redis-check-dump RDB 文件检查工具
redis-sentinel     sentinel 服务器.
---

 最常使用:  
redis-server    服务器.
redis-cli        自带的 redis 命令行 客户端 
学习 redis 的重要工具.


直接启动:
redis-server
> 默认使用 6379端口.
可以用 —port 自定义端口如:
	redis-server --port 6380

脚本启动(开机启动):

  
	redis_init_script 
	//初始化脚本文件 在redis 源代码目录  utils 文件夹下
 
首先 这个脚本 先复制到  /etc/init.d 目录下
文件名 设置成 
	redis_ 端口号
	客户端 通过这个端口 连接 redis.

- 修改脚本第六行 redisport 的变量值 改成你设置的端口号
建立需要的文件夹. 
	/etc/redis     //存放 redis 的配置文件
	/var/redis/端口号  //存放 redis 的持久化文件(内存异步到硬盘的文件.)
….

停止 Redis
强行终止 Redis 可能会导致数据丢失(内存数据同步到硬盘的时候)

redis-cli shutdown
或者  kill redis 进程 也可以.

命令行客户端:
redis-cli
Redis Command Line Interface


发送命令:
一: 每条命令前 都加 redis-cli

二: 直接运行 redis-cli 客户端  在里面输入命令


启动 redis-cli
	redis-cli

测试 客户端与服务器 连接是否正常  
打开命令行客户端  输入 ping  返回 pong 就是连接正常.


命令返回值: 比如查询某个数据要返回结果的.

状态回复.   ok  / pong 等等 都是

错误回复:  error / ERR  + 具体错误信息


比如  wrongtype  表示 类型错误



整数回复:
1
字符串回复

请求值 不存在 nil




配置:

配置文件模板 在源代码根目录  redis.conf







多数据库:
Redis 提供了多个用来存储数据的字典. 可以指定数据存到哪个字典
可以理解成 每个字典都是一个独立的数据库.

默认支持16个数据库. 数据库名是 0-16  不支持 自定义数据库名称.

客户端 默认连接 0 号数据库. 
可以用 select 更换数据库
如: 进入 命令行客户端 select 1   \> 会提示 ok  就表示切换成功.































[1]:	http://redis.io/
[2]:	https://github.com/antirez/redis