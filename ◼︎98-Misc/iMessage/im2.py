#!/usr/bin/python
# -*- coding=UTF-8 -*-

# 导入子进程、数据库模块
import subprocess
import MySQLdb


# 
db_ip = "127.0.0.1"



# 定义运行 apple脚本的函数
def asrun(ascript):
    "Run the given AppleScript and return the standard output and error."
    osa = subprocess.Popen(
      ['osascript', '-'],
      stdin=subprocess.PIPE,
      stdout=subprocess.PIPE)
    return osa.communicate(ascript)[0]


# 定义数据库连接状态函数
def db_status(ip)
try:
    # 连接数据库 ip + 用户名/密码 + 数据库名
    db = MySQLdb.connect(ip, "imuser", "impasswd", "iMessage")
    # ...
    cursor = db.cursor()
    # 查询数据库版本 
    cursor.execute("SELECT VERSION()")
    data = cursor.fetchone()
    print "Database version : %s " % data
    # 关闭数据库
    db.close()
except MySQLdb.errot, e:
    print "MySQLdb Errot", e

db_status()


# iMessage 内容
textNumber = '"18621923213"'
textContent = '"hello xujian"'


ascript = '''
  tell application "Messages"
    set textNumber to {1}
    set textContent to {0}
    send textContent to buddy textNumber of service "E:xujian0219@126.com"
  end tell
  '''.format(textContent, textNumber)
print ascript
asrun(ascript)
