# Windows Phone 动画与线程路径调查

调查日期：2026-10-30。只读调查，不修改正在采集的 APK 或其运行状态。

## 证据范围

参考 [PvZ-Windows-Phone-decomp](https://github.com/IsraelDXPP/PvZ-Windows-Phone-decomp)，
提交 `26cbb77df48c674dca6cb6b1fa9ad6783903a5c4`。该工程是 Windows Phone
托管 LAWN.dll 的反编译与现代 .NET/MonoGame 移植混合源码，并不是未经修改的原二进制。
README 明确将同步加载、窗口化、音频替换等列为移植改动。
同时核对本地 PlantsVsZombies.NET 的共享 reanim 与 Android 主循环源码；
它能证明相关移植分支也保留了这些机制，不能证明精华版 2.4.3 的发行二进制完全一致。

## 线程

- `Sexy/Main.cs:309` 的 Update 同步调用 `UpdateApp()`，`:416` 的 Draw 同步调用
  `DrawGame()`。`Sexy/SexyAppBase.cs:394` 经 `DoUpdateFrames()` 直接进入更新。
- 对 `Lawn`、`Sexy.TodLib`、`Sexy` 的线程创建与并行 API 扫描，只找到
  `SexyAppBase.StartLoadingThread()` 和 `LawnApp.LoadResourceInThread()` 的加载线程。
  没有发现把植物、僵尸、Board、粒子或 reanim 更新分发给工作线程的实现。
- 当前参考移植默认 `SyncLoadOnMainThread=true`，这是 README 明确说明的移植修复，
  不能用它断言原 WP 版本没有后台加载。
- Android 系统、音频、GC、驱动有线程，并不等于战斗逻辑多核并行。

精华版此前的频率记录是核心簇的瞬时频率；`/proc/PID/stat` 的最后运行核心属于
进程主线程，Android 托管游戏循环不一定运行在该线程。没有游戏线程级调度记录，
不能据此判断精华版是否主要运行在 X4。

## 关键帧三角函数预计算

`Sexy.TodLib/ReanimatorXnaHelpers.cs:96` 在准备定义时计算四个值：
`cos(skewX)`、`sin(skewX)`、`cos(skewY)`、`sin(skewY)`。
`Reanimation.GetTransformAtTime()` 在相邻帧之间直接线性插值这四个值；
`DrawTrack()` 用插值结果乘缩放构造绘制矩阵。

本项目 `Reanimator.cpp::MatrixFromTransform()` 则先插值角度，再调用
`FastSin/FastCos`。因此参考实现的普通绘制路径省掉三角函数求值，但多存四个 float。
参考实现的混合辅助路径和通用 `MatrixFromTransform` 仍存在 sin/cos，不能说全部移除了。

这不是数学等价变换。以单轴纯旋转为例，相邻角度差为 d 时，sin/cos 在中点线性插值
得到的向量长度为 `cos(d/2)`；d=10 度时缩短约 0.38%，d=30 度时约 3.41%。
它还会改变区间内角速度，跨大角度时误差更明显。此方法可作为绘制近似的实验候选，
不可未经验证替换根运动、碰撞或附着变换；本轮未应用。

## 一次求帧，多处复用

`Reanimation.GetFrameTime()` 保存前后帧号和插值比例，并由 `mGetFrameTime`
失效标记控制重算。多个轨道及其他查询可复用结果。
本项目 `DrawRenderGroup()` 已在单个绘制组内共享一次 `GetFrameTime()`；
跨根运动查询、附着与不同绘制组是否值得共用，可另做实际调用计数和基准。
不能简单增加缓存而忽略直接修改播放区间、速率、混合状态时的失效。

## 批处理、图集与对象池

- `AtlasResources` 提供预制图集；`PrimitiveBatch` 使用顶点、16 位索引数组和
  `DrawUserIndexedPrimitives`，在 Flush 时批量提交。不是逐轨道必然一次 GPU draw。
- `TodTriangleGroup`、`ReanimatorTransform`、粒子使用对象池，减少托管分配与 GC。
  本项目已有原生栈对象、DataArray、编译图集、顶点流和批处理，不能把这些都当作
  尚未实现的新优化；移植 C# 对象池本身也不会自动改善 C++ 性能。

## 不可直接用于精华版性能归因的差异

参考 WP 路径配置目标 30 FPS，动画更新常量约 1/30 秒，且存在 480×320、800×480
两套移动布局。后续 PlantsVsZombies.NET Android 分支的目标设置已经不同。
这些能解释原移动版如何降低总工作量，不能解释此次精华版在手机呈现约 120 FPS 的原因。
目前没有证据支持“精华版由于 WP 战斗逻辑多线程，所以更稳帧”的结论。
