## Docker :

- 轻量级虚拟机! 是一个进程 不是一台机器.
- 两个程序  服务端 和 客户端.  服务端管理所有容器.


Docker 会为所有已经运行（包括已经停止）的容器随机分配一个唯一的名字和一个唯一的 ID，
docker 命令可以识别 ID，也可以识别这个名字。
	docker ps -a 来显示 


每次运行 docker run 命令的时候，Docker 都会新建一个唯一的容器ID ， → 不同的容器 数据是不通的... 
已经停止的容器 里面的数据不会消失  用 docker ps -a 显示.

现在我们使用 -i（交互式）和 -t（临时终端）参数运行一个容器，然后输入一些交互命令：

容

版本信息:
	docker version
	Client:
	 Version:      1.11.0
	 API version:  1.23
	 Go version:   go1.5.4
	 Git commit:   4dc5990
	 Built:        Wed Apr 13 18:13:28 2016
	 OS/Arch:      darwin/amd64
	
	Server:
	 Version:      1.11.0
	 API version:  1.23
	 Go version:   go1.5.4
	 Git commit:   4dc5990
	 Built:        Wed Apr 13 19:36:04 2016
	 OS/Arch:      linux/amd64

# Mac : 

Docker 不原生支持Mac → So go 官网* Download:  Docker Toolbox* .帮你配置环境. 

使用:
- Docker Quickstart Terminal
	// 运行 docker 命令 要在这里输入. 因为 mac 不能支持原生 docker . 需要通过虚拟机来实现.
- Kitematic
	// 界面形式的 docker

**显示所有参数**            ` docker`
**版本信息**                   ` docker version`
**镜像列表:**                  ` docker images`
**重命名镜像名**            ` docker tag 468e6235b128 kali:latest` tag + ID + Name:latest   → 默认官方名字 改成 kali 
**开关启 Docker**         ` docker run / stop kali -i -t` ( Contain name ) 
**运行中的镜像**            ` docker ps` 需要新开 docker 终端 执行. 

**保存&启动 容器**  其实是新加标签 类似 git . 要养成给容器打标签的习惯.
1. 新终端 `docker ps` 查看 容器 ID (经常会变 不固定的.)  记下前3位数字.
2. 新终端 `docker commit 188 xujian`    就把容器保存为xujian 了
3. 启动保存的容器:  `docker -it xujian`

	docker run ubuntu /bin/echo 'hello world'
	//  要有 系统名称 比如 ubuntu . 本地没有镜像  docker 会自动下一个. 

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
[https://hub.docker.com/explore/][1]


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













[1]:	https://hub.docker.com/explore/