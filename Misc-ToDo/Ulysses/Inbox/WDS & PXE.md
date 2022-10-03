## WDS & PXE 

WDS:    WindowsDeployment Services  **Windows部署服务**
> 类似于Linux系统的PXE，用来批量部署Windows操作系统


*WDS 组件:*
1. 服务器组件。
	用于网络启动客户端的PXE服务器和TFTP服务器，以加载并安装操作系统。此外还包括一个共享文件夹和映像存储库，其包含网络启动所需要的启动映像、安装映像及文件。Windows Server 2008的WDS不但提供了PXE的支持，对用于传输启动映像的TFTP等协议也进行了优化，能够提供更快的PXE启动速度。
2. 客户端组件。
	WDS为我们提供了一个集中化管理操作系统和启动映像的类MMC统一界面。在此可以方便的设置WDS、添加/删除操作系统和启动映像。此外也可以用来捕获已安装好的计算机操作系统。
3. 管理组件。
	包括WDS管理控制台和命令行工具，他们可以用于管理服务器，操作系统映像和客户端计算机帐户。利用WDS多播部署，可以将操作系统同时快速部署到多台计算机中，这个是绝对实用的功能。
值得关注的是，在Windows Server 2008的WDS中使用的基于文件的WIM格式，和我们平时使用的Ghost等工具不同，Ghost等工具是基于磁盘的。由于是基于文件，所以WIM格式的映像可以在不破坏原有磁盘文件系统的情况下对系统进行恢复，且占用空间极小。



*WDS 镜像类型*
1. Boot image
      包括WDS client和windows pe。
      位于Windows7，2008的安装光盘中，名为boot.wim。
      单boot image可支持多install image。
      执行安装windows系统
      修复操作系统
      启动镜像捕获
      启动其他用途的windowsPE
2. Installimage
      类似于windows的安装光盘
      Windows7/2008光盘\source\install.wim
      Windowsvista：sysprep /oobe /generalize /reboot，然后进行捕获
      Windowsxp：sysprep –mini –reseal –reboot，然后进行捕获

1.3 WDS安装条件
      ActiveDirectory 服务器
      DHCP 服务器
      DNS服务器
      WDS 服务器
      模版计算机（主要针对windowsvista之前操作系统时使用）



WDS部署
      2.1部署步骤
       配置WDS安装，要进行如下步骤：
1）配置AD服务器:WDS依赖于AD，这是硬性要求。
2）配置DHCP服务器:为网卡启动的客户端分配IP地址。
3）配置DNS服务器：相应域内主机的IP解析。
4）配置WDS服务器：系统部署的核心应用。



