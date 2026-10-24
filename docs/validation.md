# 构建与验证边界

本页汇总已经完成的功能验收及可复现入口，不按开发阶段追加检查点。
UV 存储与空裁剪改造已重新构建主程序，并对实际游戏链接的图像、静态定义及退出确认框
入口重新验收；其余历史结论属于各项实现时记录的构建。
后续结构修改必须对相应入口重新验收，不能继承旧构建的通过结论。
Windows 当前主机上的 Win7 目标测试不等于真实 Windows 7 或旧显卡实测；
Metal 尚需 macOS 编译和运行。

## 资源与生命周期

Reanim residency 编译测试覆盖 `cpu:`／`gpu:`／`both:`、缺省与跨组件重置、
文本标志位、变体继承、非法区域与旧格式拒绝。现有全部素材经新旧编译器输出
298 个文件逐字节一致。GRU1 测试独立解码轨道槽位、无关键帧标记、
整数 frame、float 位模式及变体 UV；逻辑轨道不重排。

Vulkan 实验路径通过 24 组独立 CPU/GPU 图片对拍，覆盖变体、倾斜、镜像、
alpha、截断帧、矩形裁剪、普通与 GPU 顶点交错，以及离屏提交和延迟释放。
Vulkan、OpenGL 与 DX12 完整游戏开启实验开关后，实际 DrawTrack／附件与资源生命周期测试也通过。
`PVZ_EXPECT_GPU_REANIM=1` 为图像夹具的额外验收：测试故意让可变 CPU
轨道平移与已上传 GPU 关键帧不同，实际 `DrawRenderGroup` 必须画在 GPU 数据的位置，
从而排除“CPU 回退也画对了”的假阳性。该开关仅存在于测试入口，不进入游戏运行逻辑。
稀疏 GPU-only 夹具移除对应 CPU 关键帧，检查实际分组绘制仍正确，
并检查连续 DrawTrack 使用同一个强制实例 token；Vulkan、OpenGL 与 DX12 均通过。
Vulkan 的共享实例包、逐轨差异包及索引绘制已通过独立像素检查，
密集轨道和频繁插入普通图片的混合批次也通过各自性能门槛。
少量 reanim 混入大量普通图片时仍需避免整帧承担 geometry shader 成本，
因此 `PVZ_EXPERIMENTAL_GPU_REANIM` 继续默认关闭，不能将实验验收称为生产路径完成。
GPU 计时钩子只编入单独的 opt-in benchmark 后端，不进入普通生产二进制。
未锁频实验的数字保留在系统临时目录，不写入性能结果表。
Vulkan 基准分别保留完整 CPU 准备／命令录制时间和包含提交／呈现等待的 wall 时间，
两者独立报告 median／mean 门槛，不用局部 jobs 时间替代完整录制时间。
录制终点在最终 flush、纹理上传和呈现四边形录制之后、队列提交之前；
窗口获取与 BeginScene 等待仍在这两个计时区间之外。
当前重新链接的夹具通过扩容、像素及无 geometry 回退检查；
受进程观测保护的密集／混合场景通过录制门槛，wall 门槛仍有失败。
切换场景运行期间检测到外部编译，整轮无效，后续轮次未启动；
因此不能据此宣称完整性能套件通过。

DX12 原生 resident 夹具已通过 CPU 参考像素、逻辑轨道空槽、共享实例、
纹理／目标切换与延迟释放检查；Temp 完整游戏构建的 image 与四项 static 恢复测试也通过。
上传内存的链式赋值曾生成目的地址读取，改为 CPU 栈数组加一次复制后，
当前独立夹具的 dense、mixed 与 transition 实际 GPU cases 均通过 median／mean 门槛。
六项强制 sparse GPU cases 仍失败；正常 policy 对应六项均为 CPU_FALLBACK，单独计数，
性能总 gate 继续报告 FAIL，不将强制路径的代价或 CPU 回退伪称为 GPU 收益。
未锁频耗时仅保留在 Temp，不作为正式性能结果。
DX12 扩容夹具超过初始 64MiB 后验证旧定义像素不变，进行 192 次内部区间替换、
提交完成前销毁及四轮完整释放／重载；累计上传超过 4GiB，debug 错误为零。
累计上传量不代表同时驻留量，也不突破单缓冲区的 4GiB 字节寻址上限。
此改动后再次执行实际游戏图像与四种静态资源恢复场景均通过，
源布局缓存、生成源码及 PAK 字节未变。
OpenGL 独立 compute 试验及强制 GS 回退均通过像素检查，但未解决低轨道数
密集／稀疏切换成本；试验仅作为显式构建目标保留，不进入默认路径。
OpenGL 常规 GS 改为四角输出并复用批次 scissor 后，原生渲染与 resident 套件、
实际游戏 GPU 关键帧强 probe、稀疏 GPU-only、附件、字体和 Quit 检查均通过。
新增六组离屏 CPU/GPU 配对覆盖三种裁剪框及 IgnoreDefaultClip，逐字节一致。
原场景的带裁剪线性采样用例出现最大 1 个 RGBA8 通道值差异，未扩大原有容差；
无裁剪与最近邻用例没有差异，因此不将此修改称为全套逐字节一致。
此候选的性能收益尚未验证，不能用功能通过替代性能门槛。
Metal 的 `sexy_metal_reanim_tests` 仅在 Apple 主机构建，包含独立 CPU 参考、
多定义交错、跨批次 private 顶点缓冲复用、反馈与生命周期检查；
当前 Windows 主机没有执行该目标，源码存在不能作为原生编译、像素或性能通过的证据。

Vulkan 与 Win7/OpenGL Release 曾完成完整资源加载、重复释放与重载，
并分别覆盖完整资源、缺失 PNG、损坏 PNG、尺寸错误 PNG 四种场景。
测试链接实际游戏代码，验证失败回滚、同进程恢复、GPU 上传后释放 CPU 解码数据，
以及图集共享、工作线程等待绑定取消和存档副本往返。

静态定义覆盖 144 个 reanim 根、106 个 particle 根及嵌套 backing 数据；
定义行为不再加载期解析。场景图集覆盖 78 张完整 sheet、99 个 view、
真实按钮状态、所有子区域的 RGBA 和两像素扩边。Zombatar 覆盖 209 个子图、
按钮、完整头像叠层及 180×180 GPU 到无损 PNG 往返。
作者 sheet 保持完整像素与排列，原版布局依据见[原有拼图调查](original-atlas-audit.md)。

源定义验证由 `test_v7_definition_numbers.py`、`test_static_particle_codegen.py`
等工具测试执行。粒子 112 个作者根、222 个 emitter、3,133 个节点与保留 native
记录对照；字段归属另由独立 decoder 校验，不能让迁移器与 oracle 共用同一错误顺序。
[粒子轨道修复](particle-track-migration-regression.md)保留原因、独立对照及真实出生测试。

## 时间、运动与存档

原生时钟及 actor 测试覆盖正反播放、变速、暂停、非零初相位、多周期、
full-last-frame、时间域切换及保存恢复。宽算术有 20,000 组随机输入对独立逐位 oracle，
并保留大值黄金样本、商余和越界检查。
时间曲线覆盖 1ns、非 tick 对齐输入、大 epoch、int64 范围、反向区间、零跨度、
全部曲线端点和整数输出舍入。

粒子真实生产 fixture 覆盖 30/60/100/144/200/240/1000Hz 和随机纳秒拆分：
检查常量发射总量、长时间恒速图帧相位、不足 10ms 运动、单次非线性场、摩擦、
加速度、自旋、寿命边界、循环余数、零时长／暂停不消费 RNG、held 输入、
新旧 emitter 中的交叉淡出及保存后接续。只对模型承诺的量检查分区一致，
离散碰撞和变化力场允许不同结果。

实际 Plant/Zombie/Projectile 方法覆盖根运动、保龄球跨多行与行桶、
寒冰豌豆和玉米粒出生、运动、目标碰撞及伤害。
发射 deadline 覆盖局部冻结、0ns、本步末端创建及未完成攻击的重入限制。
实际 Board 进度条检查阈值前 1ns、恰好跨界、边界后及大步；
教学启动依据保留在[1073 教学调查](research/1073-first-tutorial.md)。

实际 Coin::UpdateFall 覆盖六种飞行分支、原重力／减速递推、
墙碰撞的严格边界及同一步落地优先级；割草机覆盖三种机型、
原咀嚼速度序列、重新咀嚼、传送改位、入水／出水 140ms 边界；
Zombiquarium 脑子覆盖下落、外部改位和死亡。
这些夹具比较不同频率及随机纳秒划分后的实际生产对象状态，
不以独立公式测试替代业务方法调用。
钱币六种飞行模式、阳光缩放及割草机运动／入水状态还经过真实
`WriteSaveRecord`／`ReadSaveRecord` 内存记录往返，再与不中断的运动比较；
阳光缩放另覆盖五秒场景冻结、恢复、外部修改及上限时刻。
僵尸高度夹具调用十四条实际业务路径，比较 100/200/1000Hz 和随机划分，
检查原速度序列、小鬼先重力后位移的闭式、屋顶相对行高、
高重力气球的双写路径、固定端点、外部修改和真实保存接续。
雪橇车通过实际类型动作与 Walking 调用检查耦合速度／位置：
覆盖四个起点、双方向、爆胎、跨速率区间、额外恒速、停走、
外部修改和存档续接，与独立原递推公式比较。
片尾滚动的实际 helper 覆盖逐 10ms 原循环、随机划分、多周期、
底部相等、回卷前 1ns、零时长和大步长；不把 helper 测试称为整段片尾 UI 验收。

存档检查先读取输入，再写独立副本、重载并继续运行，比较角色、动画、外观、
弹道、粒子余数与 RNG，原输入哈希保持不变。已验证粒子恢复后继续
17,123,457ns 的状态及弹射物接续。主时钟相邻字段写入不同值，确保读档不补写已删除的缓存。
开发中布局不承诺互相兼容；磁铁批次状态等最终布局以代码和最终版本协议为准。

## 绘制与平台

游戏链接的 ImageRuntimeTests 覆盖字体上传即弃、非零图集区域、按钮、
全部十四类弹射物、粒子变体与非旧 tick 对齐年龄。
最近点采样在精确纹素边界可能选中相邻 texel，仅允许严格的独立边界候选证明，
不整体放宽误差；linear、裁剪和反馈检查继续使用原限制。

[GPU 泳池说明](gpu-pool-production.md)维护五后端提交契约、
静态网格、三层波形、裁剪和反馈规则。Vulkan、OpenGL、DX9、DX12 原生套件曾通过，
实际游戏泳池昼夜/宽屏与旧路径对拍最大通道差不超过 1；Metal 未在 Windows 编译执行。
Vulkan validation 与 DX12 debug 检查属于各自运行，不能由单纯构建成功代替。

Windows 音乐回归入口为 `tools/test-music-runtime.ps1 -BuildDirectory <build>`，
检查主／后台加载的实际 BASS 输出设备、静音等待后的夜晚高潮声部、
音量、播放位置和暂停恢复。Linux 增益测试检查实际 OpenAL gain、
后台加载交错、退出与 sanitizer；无声测试不等于扬声器听音验收。
Win7 硬导入检查只证明未发现已知 Win8+ 硬依赖。
`test-image-runtime.ps1` 在运行前检查实际声音解码所需的 `bass.dll`；
临时构建应配置 `PVZ_BASS_DLL` 或提供同名环境变量，缺失时直接报错，避免无人值守错误框。

## 性能

完整工具用法见 [Tests/performance/README.md](../Tests/performance/README.md)，
实际受控结果见[性能总账](perf-fix-ledger.md)。
亲和性只选择 CPU，不能证明锁频；未锁 CPU/GPU 的临时耗时、倍率和排序不写入文档。
功能、像素、无窗口或软件 Vulkan 通过不能换算为整局 FPS。

保留的独立基准源码包括 `coordinate_conversion_benchmark.cpp`、
`trig_power_benchmark.cpp`、`exponential_curve_benchmark.cpp`、
`gpu_pool_trig_experiment.cpp`、`gpu_pool_trig_benchmark.cpp` 和
`gpu_pool_trig_vulkan_benchmark.cpp`，均位于 `Tests/performance/`。
坐标基准校验各方案 checksum，包含更新同步成本；算术基准检查数值误差；
GPU 正确性读回与性能计时分离，CPU wall 与 GPU elapsed 不相加。
Intel 隔离试验为显式选设备的 headless Vulkan，不能称为 Intel OpenGL 实测。
这些探索程序不改变生产最低硬件要求，也不替代实际游戏后端验收。

新增自定义日志、夹具、编译产物及未锁频原始输出写入系统 Temp。
精选长期证据位于 `Tests/evidence/`，历史夹具位于 `Tests/reference/`；
它们不作为当前现代项目冻结性能基线或发行内容。CTest 自身标准记录由构建系统管理。
