
🔸 重要参考

    • opnestack 官网:   https://www.openstack.org/
    • openstack 版本:   https://releases.openstack.org/
        2017.2 : Ocata、 2016.4 : Newton 、2015.10: Liberty 
    • 官方中文文档:     https://docs.openstack.org/zh_CN/

    • CentOS 安装文档(CN): ★★★★★
        https://docs.openstack.org/mitaka/zh_CN/install-guide-rdo/

    • Ubuntu 安装文档(CN):
        https://docs.openstack.org/mitaka/zh_CN/install-guide-ubuntu/

    • 每天5分钟玩转 OpenStack ★★★★★
        http://www.cnblogs.com/CloudMan6/p/5224114.html

	• 手动安装 ★★★★★
		http://www.voidcn.com/article/p-mrrzstfu-ee.html

	• ❗️❗️强烈建议看官方的英文文档❗️❗️ 
		新版本没中文翻译.  可以参考老版本的中文翻译. 基本上差不多的.
		Ocata  英文手册    https://docs.openstack.org/ocata/install-guide-rdo/
		Mitaka 中文手册    https://docs.openstack.org/mitaka/zh_CN/install-guide-rdo/





🔸 硬件要求 

    ⦿ 方案1 : 本地电脑
        一台配置强悍的本地电脑.内存强烈建议 8G + 
        因为要在本地创建两个Linux 虚拟机 .

    ⦿ 方案2 : VPS 
        建议用GCE 一年免费送300刀.
        你可以创建很多个配置强悍的临时服务器.
        用完就停止. 停止了就不收费. 按分钟收费的.



🔸 系统要求 

	强烈建议用. Ubuntu_16.04 / CentOS_7



🔸 适用读者

	OpenStack 涉及的知识领域极广, 涵盖了IT基础设施的所有范围: 
		计算、存储、网络、虚拟化、高可用、安全、灾备.... 
	
	学习曲线非常陡峭,没Linux + 网络基础的就别看了.	
	学会了这个 你就可以搭建出类似 gce / aws 的云了.



🔸 OpenStack 版本.

	操作系统有 xp win7 win10 ; 
	OpenStack 每半年推出一个版本 .每个主版本按照 字母表顺序命名.
	从第一版的Austin（2000.1）到目前最新版本Ocata（2017.2）; 



🔸 OpenStack 是什么
	openstack 是个软件, 由一系列组件/模块.项目组成的. 
	每个组件可以单独更新，需要保证各个组件都属于同一个大版本

	openstack能干什么，可以搭建公有云，私有云，企业云。（顺便说一下，企业云将是openstack的用武之地）

	nova 项目 Github 链接: https://github.com/openstack/nova	
	➜ Branch master ➜ tags ➜ 选择大版本

	有些是核心项目:   openstack 运行所必须的.
	有些是非核心项目: 非必须的. 额外功能.



🔸 OpenStack 简介

	OpenStack是一个旨在为公共及私有云的建设与管理提供软件的开源项目。

	OpenStack项目的首要任务是简化云的部署过程并为其带来良好的可扩展性。

	很多机构都将OpenStack作为基础设施即服务（简称IaaS）资源的通用前端。


	池化虚拟资源来构建和管理私有云及公共云。

	比如 gce 的硬盘分配.  
	谷歌是有专门的存储服务器的. 每个服务器几百T, 成千上万个存储服务器组成了GCE的整个存储池.
	你的 gce 虚拟机用的硬盘只是分配了整个存储池里的 一部分而已.



🔸 OpenStack 用途

	私有云 : 可以单击私有云, 易安装、易管理.
	公有云:  可以搭建出可以媲美 GCE/AWS 的公共云服务.

	网络功能虚拟化
		将 OpenStack 用于网络功能虚拟化 (NFV), 从而将网络的一些重要功能分离出来以便在各环境中分配，这很可能将是下一个大事件。根据分析人士的调查，几乎全球所有通信服务提供商都已将此提上议事日程。


	容器   
		OpenStack	为私有云和公共云提供了可靠的基础。
		容器则加快了应用的交付速度，同时简化了应用的部署和管理。
		采用 OpenStack 平台运行容器，可将容器的优势从单个独立的团队扩展并惠及整个企业各部门的业务运营。




🔸 openstack组成
	一般生物都有眼睛，鼻子，嘴等。那么openstack，都有什么。
	openstack更像是经过计算机的72变之后的产物。
	包括：7个核心组件：Compute(计算)， Object Storage(对象存储)，Identity(身份认证)，Dashboard(仪表盘)， Block Storage(块存储)， Network(网络) 和 Image Service(镜像服务) 。
	
		Compute类似计算的内存；
		Object Storage类似存储器
		Identity就像登陆过程中，验证用户名和密码
		Dashboard就操作界面
		Network这个大家很容易就明白。






🔸 OpenStack 安装方式

	⦿ 简介
		OpenStack 可以手动安装. 也可以用脚本安装. 
		脚本安装相对简单.  可以帮你搭建个 openstack 出来.
		让你大概看看 openstack 到底是什么.
		但是脚本安装对你学习openstack 几乎毫无帮助.
		就算安装好了后 你也毫无头绪. 你得到的只有一个网页.
		这时候就不行用手动安装方式. 权限系统,从零开始一步步安装.


	⦿ 脚本安装:
		• RDO 安装.
		• Packstack 安装  用的 puppet.
		• devstack 安装


	⦿ devstack 简介 
		是一个脚本. 方便安装,  
		首先我们先用脚本搭建个 openstack 看看先.
		当然如果你希望深入学习 那么接下来可以摆脱脚本,自己一步步安装.

		devstack 官网 https://docs.openstack.org/devstack/latest/

		Devstack目前是支持Ubuntu16.04和CentOS 7，
		如果你用的是 Ubuntu14.04 安装会出错. 排错非常麻烦.



🔸 OpenStack 项目起源

	项目是由 Rackspace 和 NASA（美国国家航空航天局）共同发起的。


🔸 NASA / 大数据

	NASA（美国国家航空航天局）; 非常牛逼的美国政府企业. 

	NASA方面的主要任务在于从太空中的航天器处持续获取信息，
	NASA主要拥有两种航天器类型
		深空飞船:  以每秒MB量级向地球发回数据，
		近地卫星:  以每秒GB量级向地球发回数据，

	NASA还需要处理来自在线平台、低成本传感器以及移动设备的数据。
	而且我们每个人都相当于一台会走动的数据生成器,谁知道有没有被监控.

	目前而言，NASA无法处理这么多数据，每秒收集到几百G 的数据.
	数据管理、存储与分析速度、转移、索引以及搜索都是极大的挑战.
	事实上，当下NASA设定的目标为在一天之内处理24TB数据.



🔸 Rackspace 云厂商

	⦿ 四大云厂商
		Amazon: AWS >  Google: GCE  > Rackspace   > Microsoft 

		Rackspace 最多也就只能达到亚马逊5%的规模, 想超越亚马逊，已经显得不太可能，
		所以他就把自己的对象存储技术: Swift 进行开源.
		亚马逊的对象存储技术是: S3
		 

🔸 SOA
	单一架构  ➜  垂直架构   ➜ 服务架构

	(Service Oriented Architecture)   面向服务的体系结构.以服务为核心的体系结构. 

	⦿ 单一架构
		最初每个系统都是独立的. 这时候的架构: 单一应用架构.
		随着社会进步, 无穷无尽的业务需求. 单一应用架构不能满足业务了.
		于是有了 垂直应用架构体系.

	⦿ 垂直架构 
		解决了单一架构面临的扩容需求. 流量可以分到子系统中. 
		但是不幸的是 垂直应用越来越多时, 应用之间的相互交互,相互调用 已避无可避. 
		为了解决这个问题 出现了 SOA 面向服务的体系架构

	⦿ 服务架构 SOA

		SOA 是一种设计方法, 把系统中相对核心的服务抽取出来，作为单独的系统对外提供服务.

		服务之间通过网络调用.  因为服务在不同的电脑上!
		而不像单个服务器那样. 各个服务通过进程来通信

		面向服务的软件，可以理解为是由一个一个服务组装成的。 SOA是一种问题解决方法或者解决框架。

		就像VPS.  在一台物理机上虚拟出很多虚拟机. 每台虚拟机都是一个vps.
		但是 vps 使用的硬盘 不是在那台物理服务器上的! 而是有专业的存储服务器. 里的一部分. 通过网络连接硬盘的!




🔸 AWS

	十几年前的亚马逊是做在线图书生意的.
	网站架构非常简单.  前端网页搭载后端数据源.大部分组件同时读取/修改一个oracle 数据库. 
	那是一个 Oracle/Microsoft 统治的时代: 当网站流量越来越大的时候，技术公司的选择只能是购买更多更大的 Oracle 数据库服务器，同时忍受无数的并发连接问题、扩容问题。

	直到亚马逊强制使用 SOA 架构. 从此 Amazon 走上了一条崭新的路，Amazon 从此获取了开启云计算的第一把钥匙。
	SOA 让 Amazon 学到了巨多巨多的技术实践和运营经验，技术文化上 "service first" 深入人心。
	Jeff Bezos (CEO) 比绝大多数的亚马逊人都更早的领悟到，Amazon 可以成为一个平台，也必须成为一个平台。
	把通用的服务抽象出来，建立单独的基础服务（比如存储、计算），让所有团队,甚至其他公司付费使用。

	从此，潘多拉的盒子被打开。
	Amazon EC2 (Elastic Compute Cloud) Amazon S3 (Simple Storage Service) 相继上线。一个属于 AWS 的时代缓缓开启。


	⦿ AWS 四大服务.
		AWS 提供很多服务, 有4个基础服务非常有名. 规模庞大,用量惊人.

	⦿ EC2 (Elastic Compute Cloud)
		AWS 最初的基石型服务，EC2 应该是有史以来最成功的云服务。是服务器.

		EC2 最大的创新在于自动扩充 (auto scaling) 同时按用量计费。
		一个产品可以在实际需要的时候启动 EC2 实例，在不需要的时候终止他们，从而极大的节约成本。

		举个栗子，对于像 Netflix 这类夜间用户量巨大的产品，
		使用 EC2 可以方便的在夜间扩容处理极大增加的访问量，
		然后在峰值过后降容，在完全不损失用户体验的情况下节约成本。


	⦿ EBS (Elastic Block Store)
		作为 EC2 下方最重要的支撑，EBS 提供分布式的存储。
		通常情况下，每一个启动的 EC2 实例都需要连接 EBS 作为永久存储设备。
		由于 EC2 的虚拟机特性，它可以被理解为一个没有永久状态的计算设备（重启后所有数据均丢失），
		但是 EBS 提供了类似于硬盘一样的永久存储方式，只不过其分布式实现的复杂度远远超过一般人的想象。
		EBS 可能是 AWS 里面最厉害的组，也许没有之一



	⦿ S3 (Simple Storage Service)
		同作为最初的 AWS 服务，S3 可能是最有名，也是最受欢迎的云服务之一。
		它提出并设计了 Object Store 的构架和 API 接口，
		几乎成为所有之后 Object Store 服务不得不遵守的标准。
		简单的说，S3 就像一个
		永远不会有容量问题、并发问题的 key-> object store, 
		durability 达到11个9，
		availability 达到4个9 （一年宕机不超过1小时），
		明星用户 Dropbox, 那个存储规模，是 S3 最好的代言。

	⦿ Dynamo DB. 
		如果说 AWS 是一顶皇冠，那么 Dynamo 一定是皇冠之上的那颗珍珠。
		Dynamo 作为 NoSQL 服务的代表，高可用，极低延迟，
		网络内的服务响应在 single digit (< 10) ms, 同时理论上支持无限并发。
		关于 Dynamo 的介绍和讨论有一篇非常有名的 paper, 算是 Amazon 对业界不多的贡献之一。





🔸 GAE

	GAE (Google App Engine) 是 Google Cloud Platform 最初的旗舰产品，
	最早在2008年就发布了 preview 的版本。可惜忙于和 Facebook 的社交之战，
	Google 在很长一段时间没有更新 Cloud 相关产品，等谷歌察觉到的时候 AWS 已近蛮火的了.

	为了避免和 AWS 进行同质化的竞争，GAE 没有走 AWS 的 IaaS 的路线，
	而是选择作为一个 PaaS 平台向企业提供高度集成的计算能力。

	简而言之，用户开发的程序运行在 Google 提供的沙箱 Runtime 中，不需要关心底层的 OS / Web server 细节。

	这种设计大大简化了用户的开发和部署流程，而且由于 PaaS 提供高度的集成能力，Log / Monitor / Task 等附加功能可以很自然整合进入 Console, 运营、调试和维护都非常直观。因此，对于小规模的创业公司，GAE 是一个非常不错的选择。

	另一方面，GAE 虽然可以做到自动扩容，但由于沙箱模型对于安全性的顾虑，用户运行的程序中访问 OS / Storage 存在非常多的限制，很多程序移植到 GAE 都会遇到这样那样的问题。

	当然，除了 GAE, Google Cloud 也提供了很多类似与 AWS 的基础服务：
	和 S3     对应的 GCS (Google Cloud Storage);
	和 Dynamo 对应的 Datastore (非常不一样的实现和接口，但同属于NoSql Service);
	和 EC2    对应的 GCE (Google Cloud Engine);






🔸 云存储

	绝大多数的计算时间是花在读取数据上的,云存储性能非常关键.

	对象存储
	数据库支持的存储.
	附加存储



	⦿  对象存储
	对象存储（Amazon AWS 简单存储服务（S3），谷歌云存储（GCS），微软Azure存储）
	提供了一个简单的放/得到/头/表（PUT/GET/HEAD/LIST）接口，用来存储因为太大而不能放进数据库的任何类型的数据。
	优点: 因为便宜、通过自动冗余和缩放来服务并发需求，提供安全保障。
	缺点: 是具有延迟（为每一个文件建立一个新的HTTP连接）和受限制的网络吞吐量和可用性。










🔸 云计算 / 云服务


	这是一个云的时代，也是一个云里雾里的时代。
	当 Neflix 不用建一个数据中心就可以做到500亿美金市值的时候，
	当 NASA 也需要购买 EC2 资源才能划算的完成大规模运算的时候，
	云计算早已从科学教、布道者的理论设想中落到现实。

	创业者无疑是幸运的，借着云计算的帮助，
	CTO 们不再需要考虑繁琐的扩容成本问题、设备维护问题，
	CEO 们也终于可以专注于产品，专注于解决 business 的核心问题。

	另一方面，无论是 Amazon, Google, Micorsoft 还是阿里，掌握了云，就相当于掌握了大数据互联网时代的水和电。
	创业公司会兴盛衰落，而水厂、电厂却绝不会轻易倒闭。
	这是巨头们背后的逻辑，也是未来我们可以继续看戏、继续期待变革的原因。


	云服务”现在已经快成了一个家喻户晓的词了。
	如果你不知道PaaS, IaaS 和SaaS的区别，那么也没啥，因为很多人确实不知道。

	“云”其实是互联网的一个隐喻， 以前一般在自己机房搭买服务器,运行各种服务. 
	现在普遍使用互联网云服务公司提供的服务器. 如 谷歌、AWS、搬瓦工、阿里云 ....
	相对来说还是云服务器稳定点. 云企业肯定有专业的运维团队.一般的中小公司也就几个网管,差距明显.
	自己搭建机房的唯一好处就是数据安隐私好点. 放在云上的数据肯定是国家监管的.

	云是分层的. 就像阿里云和AWS 肯定不是一个等级的.
	基础设施在最下端，平台在中间，软件在顶端。别的一些“软”的层可以在这些层上面添加。


🔸 私有云 / 公有云
	
	⦿ 公有云:
		GCE 、 Amazon 、 阿里云 都是公有云。
		公有云可以通过 互联网使用. 核心是共享服务资源.

	⦿ 私有云:
		企业自己用的. 是专有资源.
		私有云可以搭建在公司局域网.  虽然安全性能会比较高.但是维护成本大.
		一般只有大企业才会用私有云. 自身运维以及基础都完善了 搭建私有云的成本比公有云低!  
		就像百度绝对不会使用阿里云, 不仅是出于数据安全 成本也是大的因素.

	⦿ 总结
		云类型   数据安全性  功能拓展型  SLA    成本	            核心属性
		私有云   高	         高	         强	    维护成本较高	    专有
		公有云   低	         低	         中	    数据风险成本较高	共享





🔸 分层云:
	• LaaS:  Infrastructure（基础设施）-as-a-Service，
	• PaaS:  Platform（平台）-as-a-Service，
	• SaaS:  Software（软件）-as-a-Service。



🔸 LaaS:  基础设施
	LaaS 公司, lass 公司会提供场外服务器、存储、网络硬件. 
	
	几年前的公司要自己组场地、自己建机房、自己买服务器、自己搭建网络等等 成本很高.  
	现在你可以把硬件外包给 lass公司. 你要做的只是通过 远程连接/ssh 控制服务器就可以了.


🔸 PasS:  平台
	PasS 公司提供各种应用方面的解决方案. 一般就提供各种现成的环境

	• 虚拟服务器: 让你节省资源.  一台物理服务器可以虚拟出很多 虚拟机. 
	• 操作系统  : 提供各种系统 debian/centos 等等. 一来你不一定会装系统. 二来你自己装系统起码半天.
	• Mysql 服务器、 LAMP 服务器、Redis 服务器、Jenkins 服务器......


🔸 SaaS:  软件
	Saas 公司提供现成的软件. 用户通过网络连接到远程服务器上的应用.

	Netflix, Google Apps, Dropbox, iCloud 都是通过网络(浏览器)连到服务器的.


🔸 汇总

	服务器资源      Iaas   PaaS     SaaS
	Applications                    ✔︎
	Data                            ✔︎
	Runtime                ✔︎       ✔︎
	Middleware             ✔︎       ✔︎
	O/S                    ✔︎       ✔︎
	Virtulization   ✔     ✔︎︎       ✔︎
	Servers         ✔︎     ✔ ︎      ✔︎
	Storage         ✔︎     ✔ ︎      ✔︎
	Networking      ✔︎     ✔ ︎      ✔︎


🔸 LaaS  vs  PaaS

	⦿ 简介
		lass 主要提供 虚拟机;	pass 主要提供 开发和运行平台 
			• LaaS 代表: Amazon AWS 、 搬瓦工
			• PaaS 代表: Google GCE 、 Windows Azure


	⦿ 开发环境.
		paas 提供一整套IDE在内的开发和测试环境. 不仅提供虚拟机, 还会提供专业的 mysql 虚拟机.
		laas 只提供虚拟机.  只提供系统 CentOS 或者 Debian . 不会有 mysql 虚拟机. 要你自己搭建的.


	⦿ 支持的应用 
		lass 提供虚拟机, 虚拟机能但安装各种 Linux 操作系统, 所以支持的应用是非常广的. Linux 能跑的都支持.
		Paas 要让一个应用支持paas就困难许多了.  要确保这个应用只能调用这个平台的API....


	⦿ 可伸缩性
		paas 会自动调整资源来应对突发流量.  laas 需要手动调整才行..









🔸 OpenStack 资源

	OpenStack的主要目标是管理数据中心的资源，简化资源分派。它管理三部分资源，分别是：

	⦿    计算资源：
			OpenStack可以规划并管理大量虚机，从而允许企业或服务提供商按需提供计算资源；
			开发者可以通过API访问计算资源从而创建云应用，管理员与用户则可以通过web访问这些资源；

	⦿    存储资源：
			OpenStack可以为云服务或云应用提供所需的对象及块存储资源；
			因对性能及价格有需求，很多组织已经不能满足于传统的企业级存储技术，
			因此OpenStack可以根据用户需要提供可配置的对象存储或块存储功能；

	⦿    网络资源：
			如今的数据中心存在大量的设置，如服务器、网络设备、存储设备、安全设备，
			而它们还将被划分成更多的虚拟设备或虚拟网络；
			这会导致IP地址的数量、路由配置、安全规则将爆炸式增长；
			传统的网络管理技术无法真正的可高扩展、高自动化地管理下一代网络；
			因而OpenStack提供了插件式、可扩展、API驱动型的网络及IP管理；






🔸 OpenStack 6大组成 


	核心控制器  ➜ NOVA     资源管理访问工具:  规划、创建 、 删除  诸如存储、CPU 和 RAM 等资源都是
	网络  ➜ NEUTRON  连接其他 openstack服务. 并连接网络.
	对象存储	  ➜ SWIFT   高度容错的对象存储服务，使用 RESTful API 来存储和检索非结构数据对象。
	      ➜ CINDER   通过自助服务 API 访问持久块存储。
	身份  ➜ KEYSTONE 认证所有 OpenStack 服务并对其进行授权。同时，它也是所有服务的端点目录。
	镜像  ➜ GLANCE   从多个地点存储和检索虚拟机磁盘镜像。
			支持多种虚拟机镜像格式，包括VMware（VMDK）、Amazon镜像（AKI、ARI、AMI）以及VirtualBox所支持的各种磁盘格式。



	 在最新liberty版本中业务功能越来越丰富，有二十多个核心组件，
	 但是不是所有组件都像Nova、Cinder、Glance那样成熟和重要。在这里将介绍6个必备核心组件。



	⦿ Nova（计算）
	    Nova是OpenStack Compute Service的项目名称，
	    从OpenStack第一个版本Nova就集成在项目中.是最核心和最复杂的组件之一。
	    
	    它管理计算资源，负责虚拟机实例的所有活动，包括虚拟机创建、开机、关机、挂起、迁移等等操作。
	    但是，Nova自身并不能提供虚拟化能力，而是通过API来对外提供服务。
	    它使用Keystone 来执行身份验证，使用 Horizon 作为其管理接口，并用Glance 提供其镜像。



	⦿ Glance（镜像服务 OpenStack Image Service 的项目名）
	    它负责管理OpenStack集群中的镜像，可以创建、删除、编辑镜像基本信息，支持多种虚拟机镜像格式。
	    但是，Glance本身并不存储信息，它只保存描述镜像的元数据和状态信息，存储工作由cinder和swift等项目负责。


	⦿ Cinder（块存储 OpenStack Block Storage 的项目名）
	    它负责为运行实例提供稳定的块存储服务，可以为设备提供创建卷、删除卷、挂载或卸载卷等功能。
	    对于可扩展的文件系统、企业存储服务以及需要访问访问块级的应用程序而言，块存储是必不可少的。
	    Cinder可以为Glance提供镜像存储，是EMC公司参与较多的项目之一。


	⦿ Swift（对象存储）
	    功能类似于一个分布式、可访问API的存储平台，可直接将它集成到应用程序中，或者用于存储VM镜像、备份和归档文件。
		对象存储包括对象和容器，容器类似于文件夹，对象就是存储实体，对象必须存储在容器中，因此您必须拥有至少一个容器才能使用对象存储。
		对象可以分布在数据中心的多个磁盘中，主要是文件相关的内容和元数据。Swift也可以为Glance提供镜像存储，为Cinder提供卷备份服务。



	⦿ Keystone（身份服务）
    	Keystone主要为OpenStack提供身份验证服务、用户的角色信息、服务规则和令牌服务。
    	Keystone为其它组件提供了服务和管理API接口，后端可以接其它认证服务，比如使用LDAP服务做为认证服务。



	⦿ Neutron（网络） 
	    Neutron设计的目的是为OpenStack虚拟环境提供灵活地网络功能，为多租户环境下的每个租户提供独立的网络环境，
	    功能类似于VMware NSX虚拟网络功能，可是实现原理不同。
	    Neutron通过API实现这种目标，用户可以创建自己的网络对象，该项目发展迅速。  








🔸 OpenStack 模块

	OpenStack 有好多個跟雲端儲存、運算、網路功能的模組。使用者可以依自己的需求，選擇佈署特定模組。以下是 OpenStack常見的模組：

	Nova：負責運算的元件，為整個 IaaS 系統的核心元件。
	Keystore：OpenStack 的身份認證服務，能夠管理雲端服務的存取權限，並提供開發者多種不同的連接方式
	Swift：負責 OpenStack 雲的物件儲存元件，不同於傳統儲存方式，Swift 將檔案儲存到不同節點，確保錯誤時檔案仍在。
	Cinder：區塊儲存元件，與傳統的電腦硬體運作方式相似，可以確保資料資料存取速度。
	Neutron：OpenStack 的網路管理元件，確保 OpenStack 的各個不同元件能夠順暢購通。
	Glance：OpenStack 的磁碟快照服務，可新增、刪除、複製快照。
	Horizon：OpenStack 的報表系統，提供系統管理員和使用者系統狀況的圖表報表。
	Ceilometer：OpenStack 的監控服務，能夠為有收費機制的公有雲，計算使用量。
	Trove：OpenStack 的資料庫服務。








🔸 数据库 

数据库种类: MySQL   MariaDB   MongoDB  postgresql

MySQL   MariaDB 可以看成一样的. 
MongoDB 是什么呢..

MySQL是关系型数据库中的明星
MongoDB是文档型数据库中的翘楚。



許多人從 RDBMS 跳到 NoSQL 的第一站都是 MongoDB ，所以這一篇，就是特別寫來解釋，為什麼很多人選用 MongoDB ，以及解釋你為什麼不該用 MongoDB 來換掉 RDBMS 。







🔸 简介
    数据库有很多种类. 不同的数据库有不同的优点.所以 openstack用了好几种数据库. 
    MySQL是关系型数据库中的明星, MongoDB是文档型数据库中的翘楚.
    Telemetry 服务使用 NoSQL 数据库来存储信息, 我们用MongoDB

