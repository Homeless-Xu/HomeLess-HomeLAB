
互联网视频大多使用 flash 来实现. 不同的浏览器 可能使用不同的插件.

html5 定义了一个 统一元素 来指定视频和音频的插入及显示


\<video width=“320” height=“240” controls=“controls” id=“gbin1\>
 \<source src=“movie.mp4” type=“video/mp4”\>
 \<source src=“movie.ogg” type=“video/ogg”\>
 your browser does not support the video tag.
\</video\>


*\<video\>* 支持: mp4 webM Ogg

一个电影可以有多个源 ,当某个源坏掉 就用另一个
或者某个源中的视频格式 浏览器不支持 就用另一个.

source : 定义多个媒体源
video   定义一个视频或者电影 
track   定义 播放器中的 媒体元素的文字曲目信息.


*DOM*
用 DOM 控制 video 元素.


*video 属性*
播放 暂停  加载…



下表中列出了大多数浏览器支持的video属性，方法和事件：

*方法              属性                  事件*
                  height
                  width
                  error                   abort
                  muted                   emptied
                  paused                  empty
                  ended                   ended
canPlayType       videoHeight             error
                  volume                  loadedmetadata
pause()           currentTime             pause
play()            currentSrc              play
load()            videoWidth              progress
                  duration                timeupdate
                  seeking                 waiting

注意：在所有的video属性中，只有videoWidth和videoHeight直接就可以使用，其它属性必须在视频加载完后才可以使用。


