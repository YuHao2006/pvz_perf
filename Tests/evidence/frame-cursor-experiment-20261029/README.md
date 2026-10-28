# 按关键帧推进的根运动候选实验

本目录是独立实验，不是已接入正式Zombie更新的优化。当前游戏仍DAT64 v3.6、sizeof(Zombie)=608；没有改生产字段、读写映射或资源包。

MSVC14.51 x64 /GL /LTCG，复用当前Vulkan Release实际对象及生成的_ground关键帧。LP14/0x4000；11x沿用用户控制条件，未独立读回。两个独立进程串行，各内核预热一次、五轮各200万更新，报告min-of-5。每进程内顺序固定，未宣称ABBA。共同不可内联调用屏障与位置checksum计入时间。

## 范围

四种普通正向行走循环：normal12、football18、newspaper12、polevaulter12。每步10ms，帧间隔至少10ms，最多跨一个关键帧。候选不包含逆向、hold/full-last、变速重绑定、读档重建、事件派发、碰撞或完整Zombie::Update；不能用结果宣称完整游戏提速。

每帧整数时长q=floor(当前动画周期/(frameCount-1))。当前区间索引与帧开始时间存入候选状态，age=now-frameStart；age>=q时推进一次并frameStart+=q，保留越界整数年龄；只在整个周期完成时base增加周期位移。base对应现有mRootOriginX，不算新增字段。

cursor_basic新增帧开始时间、帧时长和int帧号：按末尾追加的模拟布局，24字节，Zombie608→632。cursor_cached再缓存double帧时长倒数和坐标系数，增加到40字节，608→648。这些字段一旦放入正式Zombie，所有僵尸类型都占用；本实验未建立不同类型布局。

actual_root_long_span调用当前实际RootMotion，包括固定_ground表与精确帧定位；actual_root_period_local另含输入取模，范围沿用上一轮诊断。旧速度累加内核重建原算术，非原版EXE调用。两候选包含帧推进和位置求值；绑定/常数准备位于计时外。候选周期截去小数纳秒，与当前未截位周期不要求逐位相同。

## 精度

100/120/200/240/1000Hz及1ns～10ms不规则步长，逐个比较60个整秒检查点：每个候选跨步长位置逐位相同。每次更新检查帧内年龄在[0,q)，对独立量化周期解析参考误差<0.002px。两个进程accuracy.csv逐字节一致，各(定义,内核)的五轮及跨进程checksum一致；不同算法的checksum不要求相同。

原始CSV记录每周期舍弃的整数纳秒差、位置与当前RootMotion之差。double基础位置每周期按相同顺序相加，确保本实验跨步长结果一致，但不声称永远没有浮点舍入。实际落地后的字段与存档版本需另行处理，本次没有自动升级用户档案。
