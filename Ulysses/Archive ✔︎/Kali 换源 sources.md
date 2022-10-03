## Kali 换源 sources

- kali2.0 中科大源

		sudo vi /etc/apt/sources.list
		 //必须用 sudo 不然会报错 注释掉官方源，粘贴以下四行进去

		deb http://mirrors.ustc.edu.cn/kali sana main non-free contrib deb-src http://mirrors.ustc.edu.cn/kali sana main non-free contrib deb http://mirrors.ustc.edu.cn/kali-security/ sana/updates main contrib non-free deb-src http://mirrors.ustc.edu.cn/kali-security/ sana/updates main contrib non-free 

	apt-get update 

- [阿里源地址链接][1]  

[1]:	deb%20http://mirrors.aliyun.com/kali%20kali%20main%20non-free%20contrib%E2%80%A8deb-src%20http://mirrors.aliyun.com/kali%20kali%20main%20non-free%20contrib%E2%80%A8deb%20http://mirrors.aliyun.com/kali-security%20kali/updates%20main%20contrib%20non-free