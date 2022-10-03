
Bundle: 自动帮你安装 依赖包的一个命令.




*gemfile*
每个项目 都会生成一个 gemfile. 
当然也有全局的gemfile.








*bundle install 很慢:* 下面一条命令就能解决.
`bundle config 'mirror.https://rubygems.org' 'https://gems.ruby-china.org'`



*1. 先更新rubygems 版本 建议2.6+ 版本:*
`gem update --system`
# 这里请翻墙更新   gem -v  → 2.6.3





默认是 去 rubygems.org 下载 各种依赖包的. ...  国内反正就是很慢. 只能换成淘宝的ruby-china源



gemfile 中可以指定源.



详细看官网:   [RubyGems 镜像- Ruby China ][1]





# Could not locate Gemfile or .bundle/ directory


1. sudo gem install rails

2. sudo gem install bundler

	3. sudo gem install jekyll bundler
	• cd /Sites

	4. bundle install
	5. Then in your browser just go to http://127.0.0.1:4000/ and it really should be running




[1]:	http://gems.ruby-china.org/