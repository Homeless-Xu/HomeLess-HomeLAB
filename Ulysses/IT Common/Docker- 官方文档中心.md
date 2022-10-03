## Docker:    [官方文档中心][1]



`docker run --name mysql -d kali /bin/sh -c "while true; do echo hello world; sleep 1; done`


运行中的容器 开 终端



*容器重命名*
`docker rename old-name new-name`

**详细命令 `docker + 回车`

**查找镜像:**  
- 网页查找 [https://hub.docker.com][2] (需要注册)
	- 命令查找 `docker search kali`

**下载镜像**
`docker pull kalilinux/kali-linux-docker`

**删除镜像
docker images → rmi ID.   
> 能删除镜像的前提是 没有容器用这个镜像!!! 有人在用(哪怕那个容器现在是关机的也不行) 肯定不给删除的.
**创建/删除 容器
`docker run/rm id`

**容器操作:
`docker start/stop/restart kali`

**创建交互容器:** 
`docker run -t -i kali /bin/bash`
> 这里要输入完整的 镜像名字.
**重命名镜像.
`docker tag kalilinux/kali-linux-docker kali`
> 把很长的镜像名字 改成短的.

**启动容器:**
`docker run kali /bin/bash`
运行什么镜像 运行什么命令.
-t 新容器内指定一个终端
-i 允许 我们对容器内的 STDIN 进行交互.
/bin/bash   在容器内 启动 bash 这个 shell.

 一旦退出 bash  你的容器就停止了!!!


**看本地镜像:
`Docker images`

docker images
REPOSITORY       TAG      IMAGE ID      CREATED      VIRTUAL SIZE
training/webapp  latest   fc77f57ad303  3 weeks ago  280.5 MB
ubuntu           13.10    5e019ab7bf6d  4 weeks ago  180 MB
镜像源.          镜像标签.    镜像 ID

**容器:
`docker ps`

`docker ps -a`  所有容器 哪怕已经关闭的容器


**重命名镜像名**            ` docker tag 468e6235b128 kali:latest` tag + ID + Name:latest   → 默认官方名字 改成 kali 

**开关启 Docker**         ` docker run / stop kali -i -t` ( Contain name ) 
**运行中的镜像**           ` docker ps` 需要新开 docker 终端 执行. 

**保存&启动 容器**  其实是新加标签 类似 git . 要养成给容器打标签的习惯.

Upgrade Docker
`apt-get upgrade docker-engine`
`service docker status/start`


## Docker 镜像

镜像是基础, 如果本地不存在镜像,会自动从 Docker 镜像仓库去下载.
镜像 相当于 迷你操作系统.


info:
`docker info`

*Docker IP*
`ip addr`  看容器ip
`nmap Container IP` 扫描容器端口.
telnet / ssh 容器 IP.
( 前提是 docker 允许 ssh 连接. 默认是不允许的.)

*Docker SSH*

- 轻量级虚拟机! 是一个进程 不是一台机器.
- 两个程序  服务端 和 客户端.  服务端管理所有容器.


Docker 会为所有已经运行（包括已经停止）的容器随机分配一个唯一的名字和一个唯一的 ID，
docker 命令可以识别 ID，也可以识别这个名字。
	docker ps -a 来显示 


每次运行 docker run 命令的时候，Docker 都会新建一个唯一的容器ID ， → 不同的容器 数据是不通的... 
已经停止的容器 里面的数据不会消失  用 docker ps -a 显示.

现在我们使用 -i（交互式）和 -t（临时终端）参数运行一个容器，然后输入一些交互命令：

容


# Mac : 

Docker 不原生支持Mac → So go 官网* Download:  Docker Toolbox* .帮你配置环境. 

使用:
- Docker Quickstart Terminal
	// 运行 docker 命令 要在这里输入. 因为 mac 不能支持原生 docker . 需要通过虚拟机来实现.

	docker inspect 698 
容器的详细信息.


**备份镜像**    docker push xujian

**删除容器**   docker rm 43de70a54ec1,或者简写成 docker rm 43de    来释放空间.

删除镜像: docker rmi xujian
// 如果有容器(即便已经停止) 存在.  那么就不能删除镜像. 不然暂停的容器就起不来.




新建 Docker
切换到 docker
管理容器

	docker run -it ubuntu bash
	// 就能进到 ubuntu 的 bash 了 能输入各种命令.

	docker run ubuntu
	docker → 你要使用 docker
	run  → 开启 运行
	ubuntu → 镜像名称 


找到镜像:
去 docker 官网看. 
[https://hub.docker.com/explore/][3]


下载 mysql
	docker pull mysql

下载 debian
	docker pull debian
	

在 docker 中运行 hello world
	docker run debian echo ''hello world''


在容器中安装程序:



保存容器:
1. 查看容器的 ID :  docker ps 只需前几位id就好
	docker commit 698 ubuntu


每次运行 都是一个新的容器.



删除容器:
先停止 再删除
docker stop ubuntu
docker rm ubuntu






—
基本概念.
镜像 image
容器 container
仓库 repository


镜像 只读模板.
自己可以很方便的创建 更新 镜像!!!!


容器;(简易的 linux 环境.)
docker 利用容器运行. 是镜像创建的 运行实例.
可以 启动 开始 停止 删除.
每个容器都是相互隔离的.


仓库:存放镜像的地方.
仓库 
- Public 公开仓库
	//Docker Hub 最大的公开仓库.
	- Private 私有仓库

用户创建了 自己的镜像后 可以哟吗 push 到私有或者公有仓库. 在另一台电脑用的时候 只要.pull 下来就好了.








容器:
- 创建新的容器    docker run
- 重启已停止的容器. docker start
- 很多时候 都是随时删除 和 创建新的容器.


后台:
background

-d

**容器是否会长久运行，是和docker run指定的命令有关，和 -d 参数无关。


查看容器输出信息:
`docker logs ID`



导出容器:
docker export id \> xxx.rar



**标记镜像
docker tag xxx xxxxxxxx





docker 数据管理

- 数据卷.
	- 数据卷容器.

数据卷:
可以给多个容器使用的,多个容器之间共享.

创建数据卷
输出数据卷


挂载本地文件 作为数据卷.






网络功能:


-p 指定端口映射. 到 web 界面.


容器互联.


**容器名:
sudo docker run -d -P --name web training/webapp python app.py




docker 启动时
会自动创建一个 虚拟网桥.(软件交换机)




交互式容器:
命令终止了 容器就关闭了


**守护式容器**

可以长期运行的容器.适合 运行 应用程序 和 服务.!!!! 

 用 kali 镜像 创建一个叫 mysql 的容器.

`docker run --name mysql -d kali /bin/sh -c "while true; do echo hello world; sleep 1; done`

这个容器会在后台运行.
 用了一个  while 循环.  会一直 打印 helloworld . 

后台运行的容器 可以用  `docker logs mysql` 查看日志.
查看容器内的进程  `docker top mysql`




*容器的更多信息
docker inspect mysql





构建自己的镜像
docker build -t \<镜像名\> \<Dockerfile路径\>
如Dockerfile在当前路径：
docker build -t xx/gitlab .




查看主机 ip 信息
 docker inspect nginx_dist |grep 172.17
"Gateway": "172.17.42.1",
"IPAddress": "172.17.42.6",













[1]:	https://docs.docker.com
[2]:	https://hub.docker.com
[3]:	https://hub.docker.com/explore/