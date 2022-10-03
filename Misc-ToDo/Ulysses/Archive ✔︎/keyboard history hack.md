## keyboard history hack

keylogger在内网渗透过程中（尤其是比较大的内网），起到很关键的作用，因为搞定一个密码，有可能就搞定了一个网段
ixkeylog是我常用的一个，linux\>=2.63均可使用
或者使用meterpreter会话的自带键盘记录功能
keyscan_start
keyscan_dump
￼
￼
用meterpreter有个好处，就是在win中可以做内存注入，不会创建进程
这里说一个小tips，如果觉得keylogger动作大，可以进系统后把一些你需要的管理工具，如navicat，putty，PLSQL，SecureCRT之类全部选成记住密码