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
销毁事件失效改动后，新增定义／纹理各自 begin-only 与 queued 四组场景通过，
确认旧 token 拒绝、替代实例正常、已排队像素保留及失败白纹理销毁不损坏实例。
原生 arena／无 geometry 回退、普通 render、production OFF 编译与 render、
恢复 ON 后的 Release、Image 强 probe 与四项 static 恢复场景均重新通过。
逐轨路径去掉了纹理集合查询及重复 owner 检查，没有修改 GPU packet 或 shader。
少量 reanim 混入大量普通图片时仍需避免整帧承担 geometry shader 成本，
因此 `PVZ_EXPERIMENTAL_GPU_REANIM` 继续默认关闭，不能将实验验收称为生产路径完成。
GPU 计时钩子只编入单独的 opt-in benchmark 后端，不进入普通生产二进制。
未锁频实验的数字保留在系统临时目录，不写入性能结果表。
OpenGL 独立夹具每帧只有一次非空 Flush；elapsed query 覆盖该 Flush 的
上传与绘制区间，不能解释为纯 shader 活跃时间。CPU 样本包含准备及这些
GL API 调用，并扣除独立测量的 Present 调用耗时；BeginScene 位于样本外。
Present 仍实际执行，不能宣称驱动排队和呈现节奏对样本完全没有影响。
诊断 FrameTiming 使用单个 query ID，不累计同一真实帧中的多个 Flush，
因此不能直接用它宣称复杂游戏帧的 GPU 总耗时。
Vulkan 基准分别保留完整 CPU 准备／命令录制时间和包含提交／呈现等待的 wall 时间，
两者独立报告 median／mean 门槛，不用局部 jobs 时间替代完整录制时间。
录制终点在最终 flush、纹理上传和呈现四边形录制之后、队列提交之前；
窗口获取与 BeginScene 等待仍在这两个计时区间之外。
当前重新链接的夹具通过扩容、像素及无 geometry 回退检查；
管线槽位直接索引及索引缓冲状态复用后，一轮受进程观测保护的密集／混合／切换场景共 64 项，
录制 median 通过 64 项、mean 通过 63 项，wall median／mean 分别通过 54／57 项；
12 个稀疏场景验证实际 CPU 回退，未计作 GPU 计时通过。
本轮未观察到外部负载，但未锁频，不能据此宣称完整性能套件通过。
Vulkan 基准 CLI 仅在录制及 wall 的 median／mean 全部通过时返回 0，
任一门槛失败返回 2，运行异常返回 1；CPU_FALLBACK 场景单独计数。
真实混合场景已验证全通过返回 0，密集／切换负例验证返回 2，
普通正确性及稀疏策略检查返回 0。退出码改动没有调整计时范围、采样或门槛。
普通段改为管线槽位直接索引、索引缓冲在恢复状态时绑定后，
主画面／离屏目标、短／长普通段、普通纹理／R8 字体 coverage 混合像素回归，
覆盖三种 blend、scissor 变化、尾部 coverage 和水波插入后的 uint16→uint32 索引恢复。
夹具水波路径显式开启与游戏一致的 shaderFloat64；首次缺少该功能的失败日志保留在 Temp。
unified、超过 64MiB 的 arena stress、无 geometry 回退及普通 render 均通过，
普通 render 的 65,536 个 coverage byte／alpha 对精确匹配，验证层错误为零。
该版本 Vulkan Release 已重新构建，实际游戏 Image 强 probe 及完整／缺失／损坏／
尺寸错误四种 static 场景通过；原 PAK 的 SHA256 保持不变。
此前管线槽位版本的混合场景曾遇到外部 Python 进程，该组结果无效，原始记录保留；
当前索引状态复用版本四组均未观察到外部负载，但仍未通过全部性能门槛。

DX12 原生 resident 夹具已通过 CPU 参考像素、逻辑轨道空槽、共享实例、
纹理／目标切换与延迟释放检查；Temp 完整游戏构建的 image 与四项 static 恢复测试也通过。
销毁事件失效后，逐轨提交省去纹理集合查询和重复 owner 检查；
新增定义／纹理各自 begin-only 与 queued 四组场景验证旧 token 拒绝、
同帧新实例正常、已排队像素保留及失败白纹理销毁不影响有效实例。
修改后 native ON／OFF、arena stress、实际游戏 Image 强 probe 和四项 static
恢复场景均通过，debug 错误为零，没有新增成员或线性 Begin 查找。
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
OpenGL Flush 内状态去重及普通段 EBO 过滤后，常规 GS／独立 VS／compute／显式 GS 回退、
普通 render 的 coverage／字体／alpha／pool／反馈／目标切换，以及 OFF／恢复 ON
均在状态去重版本通过；直接生成 resident EBO 与 80 字节实例版本重新通过上述四条 ON 路径、普通 render、
Win7/OpenGL Release 构建、实际游戏 Image 强 probe 和 static 四场景。
反馈目标测试直接查询 GPU 缓冲区大小，确认 512 个普通三角形后的单轨常规 GS
仅保留三个索引，独立 VS 保留六个索引；compute 的 GS 回退也执行该检查，
实际 compute 保留原索引机制。相邻 marker、单个普通三角形间隔、
长段阈值两侧、末尾无后继 marker、同批和跨材质边界像素检查均通过。
常规 GS／独立 VS 移除实例裁剪矩形后，原生实例上传为 80 字节；
compute 及其旧 GS 回退仍为 96 字节。两次反馈 Flush 的 GPU 缓冲区查询
分别确认两个实例共 160／192 字节，像素检查覆盖非零实例编号及裁剪行为。
当前版本单轮未观察到外部负载的 regular GS 测试，密集／混合各八项
median／mean 全通过，DDSS 各通过四项，低轨道数仍失败。
不能据此宣称整套性能通过，也不能将减少上传字节直接视作已测得的速度收益。
基准 CLI 现在在任一 median／mean 门槛失败时返回 2，全通过返回 0，
运行异常仍返回 1；真实 DDSS 负例及密集／混合正例已验证该行为，
计时范围、门槛和政策未变。
OpenGL 的销毁事件失效覆盖定义、纹理、直接 raw adoption 和纹理替换，
分别验证 begin-only／queued、同帧 Flush 后旧 token 拒绝、替代资源的新 token
正常及已排队像素保留；失败销毁白纹理不会破坏仍有效的实例。
常规 GS、独立 VS、compute、compute 的显式 GS 回退，以及 OFF／恢复 ON
普通 render 均通过。Win7/OpenGL 实际游戏 Image 强 probe 与四种静态资源恢复
场景也通过，移除逐轨集合查询没有改变生产 shader、政策或计时门槛。
独立纯 VS 试验每轨提交四个 marker 顶点和六个索引，复用 native sin/cos
求值后直接进入 SceneFS，不附加 GS；其构建目标同样为 EXCLUDE_FROM_ALL。
完整原生正确性套件通过，与上述四角 GS 的差异用例和通道值一致。
一轮未观察到外部负载的测试中，持续密集／混合场景通过各自八项
median／mean 门槛，DDSS 切换仅通过两项 median 和一项 mean；
低轨道数及部分大批次仍失败。此路线没有解决切换成本，未被提升为默认路径。
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
通用 GameObject 绘制恢复还覆盖小数父平移与大偏移的 1024 次交替，
每次结束后精确还原父平移；按钮图集与独立图片对拍也使用小数父平移，
并检查绘制返回后的原值。此项不增加对象或存档字段。
僵王后臂的实际绘制入口覆盖四种攻击状态、可见参考轨道的像素对拍及
1024 次共享 reanim 矩阵精确恢复；旧加减恢复实现已在该夹具复现失败。
变速线性段覆盖 4096 段独立二进制整数参考、零步长、携带 sub-ULP 残量时
显式失效、外部传送、非线性状态交接及真实存档记录往返后的续算。
这些检查验证坐标精度，不承诺鱼的追踪／边界决策对任意时间划分完全相同，
也不作为速度提升的测量。
上述精度修复后，Vulkan 与 Win7/OpenGL Release 及 Temp DX12 游戏构建
均通过实际游戏 Image 强 probe（含 GPU 关键帧、稀疏 GPU-only、附件、
按钮、字体和 Quit）与静态定义四场景；夹具包含上述绘制恢复及变速保存续算。
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
