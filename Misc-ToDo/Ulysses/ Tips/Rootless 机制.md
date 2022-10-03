## Rootless 机制

Mac 可能会遇到 *sudo 改不了权限*

因为 Mac 加入了 Rootless 机制. 不能随心所欲修改很多文件了. 哪怕有了 root 权限也不行.
> Rootless 机制 是对抗恶意软件的最后防线

**关闭/开启 Rootless:
重启电脑 → 
按住 ⌘+R →  
进入恢复模式 → 
打开终端  →
 `csrutil disable`  就是关闭
 `csrutil enable`   就是开启


