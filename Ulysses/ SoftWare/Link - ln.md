
link 是非常重要的命令 .

功能: 给某个文件 在另外的地方建立个同步的链接.

当我们在不同的目录 需要用到相同的文件时 我们就不需要再每个目录下 都放一个相同的文件.

只需要在一个目录里放文件. 其他目录用 link 链接就可以了.
不必重复占用空间.




*brew link 问题*

安装软件 会出 这个命令没有链接的报错信息.

brew doctor → link 错误
brew link xxx → xxxxxx is not writable
/usr/local/share/man/ru/man1 is not writable.

→ 这个问题是 /usr/local 目录缺少权限.

执行: **sudo chmod -R g+w /usr/local**
再不行 就 cd 到 ru 目录
手动 `sudo chmod 777 man1`
亲测 可用.

然后再次 brew link git









*安装完 brew 后. 需要 把 /usr/local/bin添加到 path 路径的 最前面.
保证系统优先调用的是 brew 下载的.

命令行 输入













常用安装软件
wget=26
pkg-config=17
automake=17
autoconf=17
readline=15
git=14
gettext=14
libtool=14
xz=14
pcre=13
imagemagick=12
zsh=12
jpeg=12
gdbm=12
openssl=11
mongodb=11
cmake=11
coreutils=11
libevent=11
tree=11
freetype=11
sqlite=11
libpng=10
macvim=10
mtr=10
libyaml=10
mysql=9
node=9
mercurial=9
tig=9
nginx=9
gnutls=8
redis=8
libgpg-error=8
ack=8
gmp=8
tmux=8
libtiff=8
glib=7
go=7
libksba=7
nettle=7
p11-kit=7
unrar=7
phantomjs=7
python=7
libffi=7
gawk=7
libtasn1=7
lua=7
apple-gcc42=7
libxslt=7
dos2unix=6
fontconfig=6
python3=6
htop-osx=6
pixman=6
ctags=6
gd=5
intltool=5
git-extras=5
swig=5
curl=5
neon=5
jasper=5
curl-ca-bundle=5
icu4c=5
p7zip=5
postgresql=5
zlib=5
libxml2=5








