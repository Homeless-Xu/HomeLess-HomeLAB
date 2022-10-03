
## UUID

Universally Unique Identifier
*通用唯一识别码*

这是软件构建的标准.

指的是 在 一台机器上生成的数字,保证对在同一时空中的所有机器都是唯一的.



用到了 以太网地址. 纳秒级时间,芯片 ID ..

UUID 组成:
当前时间日期:
第一部分 个时间有关.
你生成一个 UUID.
过几秒后又生成一个  第一部分是不一样的.其余是相同的.



2. 时钟序列

3. 全球唯一的 IEEE 机器识别码.
> 如果有网卡 那么优先从MAC 地址获取.


唯一缺陷是:
生成的结果 比较长!!!


其格式为：xxxxxxxx-xxxx- xxxx-xxxxxxxxxxxxxxxx(8-4-4-16)，其中每个 x 是 0-9 或 a-f 范围内的一个十六进制的数字。而标准的UUID格式为：xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx (8-4-4-4-12)，可以从cflib 下载CreateGUID() UDF进行转换。











