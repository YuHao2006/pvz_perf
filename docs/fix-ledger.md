# 已生效修复账

按问题主题记录当前有效变化；日期只用于定位原始证据，不表示实施顺序。
性能报告统一注明核与负载：正式报告核为 LP14（`0x4000`），锁 11x，用户亲验；不换算具体频率。
下列历史耗时只对应各自记录的工作量；功能通过、无窗口测试和软件 Vulkan 不等于实机 FPS 通过。
除末节明确列出的本轮固定 Draw 项目值外，各修复子项的耗时、计数及容量均为历史验证记录，
本轮未逐项重测，当前项目测量值待更新；历史功能证据不补签当前性能。
保留原版算法或原机制的历史对拍以解释修复，不采用现代项目冻结旧版作为任何子项的现行性能基线。
证据直接指向源码、Git 和原始日志；日志中的旧绝对目录须结合运行清单及二进制哈希识别。
为缩短路径，以下证据根只作路径展开：`S/` = `Tests/evidence/string-numeric-resume-20261010/`；
`R/` = `Tests/evidence/docs-evidence/20261015/retired-modern-game/Release/log/`；
`W/` = `Tests/evidence/docs-evidence/20261015/`；
`P/` = `out/x64-win32-dx12/Release/log/smoke/20261017-125226-242-a12d2ca6810049b8aa7153b90fa7de69/`。

## credits 场景状态

触发：从奖励界面打开 credits，画面正常播放，但 `mGameScene` 仍为
`SCENE_AWARD=5`，按 `SCENE_CREDIT=6` 识别的观测工具将全段记为 `other-scene`。
根因：`LawnApp::ShowCreditScreen()` 注册了 credits Widget，却漏设场景状态。
修复：在构造 `CreditScreen` 前赋值 `mGameScene = GameScenes::SCENE_CREDIT`；
初次进入和重播共用该入口。返回主菜单仍经过 `DoBackToMain()`，
由 `ShowGameSelector()` 设置 `SCENE_MENU`。
验证范围：针对 DX12 Release/LTO 构建及入口、重播、退出状态路径核对；
本轮未自动操作游戏重播，不将源码核对声称为运行时复测。
原误分类采样与重算证据保留在
[`Tests/evidence/credits-25x-20261018-001320`](../Tests/evidence/credits-25x-20261018-001320/)，
修复构建记录位于
[`Tests/evidence/credits-scene-fix/build.txt`](../Tests/evidence/credits-scene-fix/build.txt)。

## 存档格式、转换与失败处理

### DAT / DAT64 与玩家记录槽

触发：直接搬运模式数字或改扩展名，会使旧进度指向另一玩法，或让有效档被当成空档。
机制：关卡模式来自 `game<玩家ID>_<模式>` 文件名，Board 载荷没有模式字段；玩家记录另有槽序。
现行为：`users.dat` 保持 1073 格式；`user<ID>.dat64` 为 `PVZUSR64` 加 v13 明细，
记录按当前模式值直接索引；关卡档为 `PVZDAT64` v1、48 字节头、11 个池。
转换器逐字段解析 DAT，换算模式名、记录槽及图像 ID，写出后重解析并比较完整语义；游戏只读当前格式。
验证：原玩家样本 886 / 974 字节正反转换通过；游戏重存与转换器输出逐字节相同，变长盆栽及头像保留。
证据：`pvzPerf/Lawn/System/LevelSaveFormat.h`、`pvzPerf/Lawn/System/PlayerInfo.cpp`、`tools/saveConverter/src/LevelSaveConverter.cpp`；
Git `ae3f5b2c`；`R/smoke/20261014-181541-185-82481113682a481cb3b6c50789e9024f/profile-pair-order.txt`。

### 转换器方言与图像引用

触发：旧工程日期戳、22092 字节 Board、过渡 12 池档，以及描述符长度不一致曾使真档拒读或崩溃。
机制：固定声明 12 项却只初始化 11 项，末项空名字进入字符串构造；不同布局也不能按本机指针宽度硬搬。
现行为：描述符明确为 11 项；历史输入由转换器识别，非空已退役 Trail 明确拒绝；不向游戏添加兼容分支。
存档图像仍是 879 项混合资源变量表中的图像子集，空图哨兵 879；不是 ImageSymbolId 或 GPU 描述符槽。
验证：历史六份关卡样本 `DAT→DAT64→DAT` 回环逐字节相等；新格式输出还须通过目标语法及引用关系校验。
证据：Git `dc08c31e`、`b253d2e2`、`ae3f5b2c`；`tools/saveConverter/src/ResourceIdRemap.h`、
`tools/saveConverter/src/LevelSaveConverter.cpp::ARRAY_DESCRIPTORS/ValidateReferences`；
原始转换清单 `R/save-converter-20261010-161348/conversion-results.json`。

### 坏档拒绝与池替换顺序

触发：非法槽图、游离链或晚段定义读取失败，可能留下半加载棋盘；附件析构还可能杀死刚恢复的动画。
机制：旧附件池最后替换，析构沿旧引用级联到新 reanim；两处漂移实际位于 184 字节记录偏移 28 的 `mDead`。
现行为：头、长度、CRC、schema 与全部 11 池结构先验证；读池前先清附件，让级联只作用于旧对象。
结构拒绝发生在池修改前；晚段失败沿真实失败销毁路径清理，并抛 `SaveGameLoadRejected`，不静默新开局。
验证：41 种结构拒绝覆盖 11 池且前后完整存档不变；72 次定义失败读取、8 次清理及六类真实读档拒绝通过。
证据：`pvzPerf/Lawn/System/SaveGame.cpp::ValidateDat64PoolHeaders/SyncBoard/LoadDat64FromBuffer`；
`pvzPerf/Lawn/PortablePoolReadSmoke.cpp`、`pvzPerf/Lawn/PortableSaveFailureSmoke.cpp`；`S/memory-data-views-final.log`、
`S/pool-data-views-final.log`；结构拒绝前存档不变与晚段失败销毁是两项不同保证。

## GPU 原图、阴影与上传生命周期

### 上传即弃 CPU 位图

触发：资源同时驻留 CPU / GPU、共享别名重复准备，造成额外内存和已弃像素被重新读取。
机制：上传必须先取得字节所有权，随后才可释放解码源；GPU 缓存不能依赖已清空的 CPU 位图重建。
现行为：每图上传后清除像素、索引、调色板及软件缓存；动画直接绘制原图，TextureData 持有一张原尺寸纹理。
CPU 对 GPU 常驻图的非法读取抛 `GpuImageCpuAccess`；诊断显式读回，不物化零位图，不保留私有位图副本。
验证：`P/cpu-bitmap-upload-discard.txt` 两种上传入口均在 `purge-request=0` 时
`retained-cpu-pixels=0 gpu-differences=0 cpu-read-rejected=1`；2244 张常驻资源 CPU 像素均为零。
证据：`pvzPerf/SexyAppFramework/graphics/MemoryImage.cpp::PurgeBits/GetBits`、
`pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp::CreateImageTexture/ReadImagePixels`；每图释放不意味着解码队列总内存有固定上限。

### 共享阴影源保持原始像素

触发：阴影先上传，晚到别名仅改变 minimize 提示，却触发销毁重传；源已释放后阴影错误或消失。
机制：无实际作用的提示被纳入缓存身份；原始透明像素 RGB、alpha 和绘制时强制不透明策略也必须分开。
现行为：缓存只按真实尺寸及像素版本更新；换纹理前先取得合法源，失败保留原纹理；共享命中不由 worker 再准备或弃像素。
验证：`P/actor-shadows.txt` 日 / 夜原图 GPU 读回均 `exact=1 cpu=0`，最大 alpha 为 128 / 64；
八个真实植物 / 僵尸绘制中，暗化像素分别为 1588、2664、1588、3565 / 1392、2335、1392、3081。
证据：`pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp::TextureData::CheckCreateTextures/CreateTextures`、
`pvzPerf/SexyAppFramework/graphics/MemoryImage.cpp`；共享失效定向记录为
`S/immutable-gpu-source-shadow-final-20261011.log`，只采用其中原图、别名及生命周期结果。

### 图鉴阴影遵循原版页面规则

触发：把首页僵尸无阴影误认成缺陷，会引入原版没有的视觉变化。
现行为：首页只植物带阴影，僵尸本来就不画阴影；僵尸详情页继续调用 `Zombie::DrawShadow`。
机制：`AlmanacDialog::DrawIndex` 只调用两类对象自身 Draw；植物在图鉴 Draw 路径画阴影，僵尸阴影是独立调用。
验证：`P/actor-shadows.txt` 首页植物暗化 877 像素，僵尸详情页暗化 235 像素，透明 GPU 负对照均生效。
这两个数验证现有绘制；首页僵尸无额外阴影由源码及用户零售核对确认，不用旧“首页僵尸应变暗”探针作依据。
证据：`pvzPerf/Lawn/Widget/Almanac.cpp::DrawIndex/DrawZombies`、`pvzPerf/Lawn/Plant.cpp::Draw`；
Git `ac6fe907` 保存当前首页无僵尸 DrawShadow 的变化，曾擅加的调用已撤销。

### 批量上传、描述集与延迟销毁

触发：逐图合成各自上传、提交、等栅栏，装载产生约 4500 次往返；过早重用 staging 会出现首行雪花。
机制：未完成 copy 仍读取 staging；未提交 dispatch 不能共享会被覆写的描述集；中间图也必须活到 GPU 完成。
现行为：`BeginTransfer` 累积，`FinishTransfer` 提交，`CompleteTransfers` 统一等待；
合成每 dispatch 独立描述集、池容量 4096、批上限 1024；中间裸图不占全局槽，最终图才登记。
staging 提交后等完成再复用；retired 图在完成后销毁，裸图不回收描述符槽；所有读回保持先提交再等待。
验证：Scenes / Survival / ParticleEmitters / Pool 功能均 exit=0；计时轮关闭图形校验，不能据此声称同步校验通过。
证据：Git `ac6fe907`；`pvzPerf/SexyAppFramework/graphics/vulkan/VulkanRenderer.cpp` 上述三原语、
`ComposeAlphaRaw/AdoptComposedTexture/ReapRetired`；`R/smoke/20261011-192227-844-6446cd197e9d41bda7d45e408384c730/verification.json`。

### 解码期合成与提交循环

触发：普通图片解码后逐图 GPU 合成多付底图 / 掩码分配上传；提交路径四遍顶点循环增加每次开销。
现行为：普通 sidecar、白着色及着色三段在解码线程按 1073 整数语义合成，出口为单张位图，上传后释放；
显式 alpha/grid 描述仍走批量 GPU 合成；提交校验、拷贝与槽重写合为一遍，反馈检测按单纹理调用执行。
验证：历史 Survival 单次提交 3.46→0.68μs，Board::Draw 1575→725μs，
PoolEffect 448→122μs、Backdrop 210μs；两树场景进度不同，不据提交总项数判定多画或宣称整局倍率。
当前精确 alpha 回归保留 31 次比较、55071 像素及 410 个 alpha=0 / RGB 非零像素，差异为零。
证据：Git `ac6fe907`；`pvzPerf/SexyAppFramework/imagelib/ImageLib.cpp::GetImage`、`pvzPerf/SexyAppFramework/graphics/vulkan/VulkanRenderer.cpp::Impl::Draw`；
`R/smoke/20261014-113948-860-9d229a260dba4ee4b5024f8ad5610287/alpha-composition-cases.txt` 与对应 `verification.json`。

### GPU 字体重采样与绘制标记

触发：通用双线性不能复现旧字体面积缩小 / 端点放大，16 个缩放例产生像素差；不透明视图也会污染透明源语义。
现行为：`game_font_cs.comp` 使用原 257 / 256 整数权重；不透明策略通过绘制标记表达，原始 BGRA 不改写。
GPU 染色、裁剪与复制保留透明 RGB、边界数值及源销毁后的目标生命周期；字体所需 FP64 在设备创建时明确申请。
验证：`P/font-atlas-cases.txt` 字体 24 个 GPU 绘制及 4 个边界例零差，72 次复制、72 次重建、24 次原字体销毁通过；
图像工厂 81 染色、56 裁剪、72 raw clone 通过；Pool 八次真实菜单重载与 Scenes 均无校验诊断。
证据：`pvzPerf/SexyAppFramework/graphics/vulkan/shaders/game_font_cs.comp`、`pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp`、
`pvzPerf/Lawn/PortableFontAtlasSmoke.cpp`、`pvzPerf/Lawn/PortableGpuImageFactoriesSmoke.cpp`；
`S/gpu-font-kernel-pool-edge-20261011.log`、`S/gpu-groups-scenes-context-fixed-20261011.log`、`S/gpu-image-factories-scenes-slot-fixed-20261011.log`。

### 覆盖度采样及呈现依赖

触发：覆盖度顶点未填纹理槽会默认采场景 0 号槽；呈现尾部缺 color-write release 依赖会报写后呈现危险。
现行为：覆盖度绘制显式传 mask 槽与 nearest/clamp 采样器；Vulkan render pass 明确声明到 EXTERNAL 的依赖。
机制：bindless 槽是每顶点语义，零初始化不是白色蒙版；图像布局转换不能代替颜色写入的执行 / 可见性排序。
验证：Scenes 覆盖度 300 跨段、裁剪与变换检查通过；Vulkan 修复后 Scenes / Credits / Survival / Continue 校验无诊断。
证据：Git `85ca95bc`、`ac6fe907`；`pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp::FillScanLinesWithCoverage`、
`pvzPerf/SexyAppFramework/graphics/vulkan/VulkanRenderer.cpp`；`S/gpu-groups-scenes-context-fixed-20261011.log`。

## 并发加载与退出

### 加载放行与主线程 GPU 所有权

触发：只等队列空会漏掉未入队资源、调色板图和末批入队；装载线程建 PoolEffect 会与主线程共用命令池。
机制：队列消费不等于全表驻留；`mBits==nullptr` 也可能有索引像素；GPU 上传、焦散目标及 staging 非并发写接口。
现行为：主线程泵和全表清扫，放行条件为队列空且清扫净；每次入队清净标志，调色板也入队。
PoolEffect 在主线程创建，焦散目标建立后完成布局初始化；CPU 只保留计算用 LUT，源位图上传即弃。
验证：清扫实测 1695 张泵上传加 322 张补传、skip=0；调色板及放行门修复后 Continue 首绘上传计数 40→0。
这些是历史装载记录，不承诺固定队列峰值，也不把当前按需新生 GPU 图像说成启动时全部已经存在。
证据：Git `14f82ac4`、`ac6fe907`；`pvzPerf/Sexy.TodLib/TodCommon.cpp::TodQueueTextureWarm/TodWarmDrained/TodWarmFinalSweep`、
`pvzPerf/LawnApp.cpp::LoadingCompleted/UpdateApp`、`pvzPerf/Lawn/System/PoolEffect.cpp`。

### 标题首绘及同核加载调度

触发：主线程同步读取全量动画定义时，锁核启动先黑屏；主线程单独升优先级又可能压住同核装载 worker。
现行为：Init 只分配定义数组及加载条所需定义，完整定义数据在 worker 加载；主线程不再单独提升为 AboveNormal。
机制：全量磁盘 / 解析工作移出首绘阻塞段；定义发布用就绪门，主线程不遍历 worker 正在填写的轨道。
验证：Git `73b98ef2` 的同口径首绘 7375→2203ms；同核 `AfterParticles` 回调、循环退出、join、清理及销毁通过。
证据：`pvzPerf/Sexy.TodLib/Reanimator.cpp::ReanimatorLoadAllDefinitionData`、`pvzPerf/LawnApp.cpp::Init/LoadingThreadProc`、
`pvzPerf/SexyAppFramework/SexyAppBase.cpp::StartLoadingThread`；`S/loading-close-lp14-priority-fixed.log`。
这是已证实的首绘 / 调度修复，不据此给另行发生的 loading hang 指定唯一原因。

### 早关、资源发布与线程收尾

触发：装载未完成就销毁资源，或把完成标志当成线程已退出，会让 worker、队列引用及线程尾部清理越过对象寿命。
现行为：关闭请求先让装载协作退出；派生析构和 Shutdown 在资源释放前 `WaitForLoadingThread`，
真实 join 后再清预热队列、动画 / 粒子定义及资源；共享图片只在首次私有加载准备，完成后才发布。
验证：BeforeLoader / BeforeImages / AfterImages / AfterMusic / AfterParticles 五阶段均
`callback/loop/join/game-cleanup/destruction verified`；共享图片四种 worker 数及清理交错通过。
证据：`pvzPerf/LawnApp.cpp::~LawnApp/Shutdown`、`pvzPerf/SexyAppFramework/SexyAppBase.cpp::WaitForLoadingThread`、
`pvzPerf/Sexy.TodLib/TodCommon.cpp::TodWarmDispose`；`S/loading-close-{BeforeLoader,BeforeImages,AfterImages,AfterMusic,AfterParticles}.log`、
`S/immutable-image-loading-close-20261011.log`、`S/gpu-groups-scenes-context-fixed-20261011.log`。

## 玩法对象、索引与界面路由

### 池复用残留死亡标志导致僵尸停更

触发：Linux 新普通僵尸活着却停在原地，四波仍正常生成，最后因场上残留活僵尸无法结束。
机制：1073 初始化尾部先 `UpdateAnimSpeed` 后清 `mDead`；用户提供的空构造不能保证值初始化清零标量。
复用时残留 `mDead=true` 使动画速率被设为初始 0，之后仅清死亡位不重算；不能归因于已证明的某个编译器 pass。
现行为：`pvzPerf/Lawn/Zombie.h` 首次声明 `Zombie() = default`，删除空实现，让池 `std::construct_at` 值初始化建立清零语义。
验证：真实 DataArray 单槽复用 128 次；四波完成、新生可移动僵尸 4 只，第四波后再跑 500 更新，exit=0、Vulkan 校验干净。
两只第四波僵尸 x=722.840 / 727.711、速率 14.54106 / 11.81389；旧档原有 x=783 零速率对象仍原样保留。
证据：`Tests/evidence/native-wave-stall-e81de7b3c651490f80e1204a90661a70/{zero-logs/zero-zombie-rate.log,verified-logs/wave-spawn-smoke.log}`；
`pvzPerf/Sexy.TodLib/DataArray.h`、`pvzPerf/Lawn/Zombie.cpp::ZombieInitialize/UpdateAnimSpeed`、
`reconstruction/1073/raw_decomp/functions/0053/005329A0.c`；不宣称旧档已通关。

### 粒子属主隔离及自然死亡回收

触发：不同粒子池同槽同世代 ID 串写名册；自然死亡系统若只回收系统槽，会让发射器长局耗尽。
机制：槽 ID 没有跨池唯一性；发射器及其粒子是系统拥有的资源，系统槽消失不等于子资源已经析构。
现行为：`TodParticleData` 拥有三池和名册，holder 只借用；DeleteQueue 执行完整 `ParticleSystemDie` 后释放系统。
验证：共享视图不重置池、独立数据同 ID 不串写；96 次名册读取、88 次销毁及完整棋盘存档前后相等。
池耗尽现场峰值 1024、拒绝 219～244 次；修复后的定向漏斗 allocTry=26 / allocReject=0，不保留读档孤儿自愈。
证据：`pvzPerf/Sexy.TodLib/TodParticle.h/.cpp`、`pvzPerf/Sexy.TodLib/EffectSystem.cpp::ProcessDeleteQueue`；
`S/memory-data-views-final.log`、`S/pool-data-views-final.log`；reanim 私有池隔离另见 `S/reanim-isolation-final.log`。

### 格桶迁移与整池清空同步

触发：消消乐级联下落、Twist 四株旋转及保龄球弹跳直写行列后，索引仍指旧格，可能重复选同株或形成悬空链。
现行为：上述移动均调用 `MovePlantCellBucket`；死亡、铲除、移动统一镜像挂摘；越界格不写相邻行头。
滚动坚果仍在桶内并随行迁移，因为撑杆等僵尸确实读取该索引；读档成功后重建派生桶。
另一个独立卡死来自 intro 清空僵尸池却遗留街头预览索引；`ClearUpsellBoard` 清池后同步 `RebuildZombieRowBucket`。
验证：Beghouled 双洞级联终局三株互异、Twist 输入及 Scenes 通过；intro 现场 shadow 曾为 bucket=9 / pool=4。
证据：Git `ef81d26c`、`6c73eb06`、`17ee4d92`、`ee2262a3`；
`pvzPerf/Lawn/Challenge.cpp::BeghouledFallIntoSquare`、`pvzPerf/Lawn/Plant.cpp::UpdateBowling`、`pvzPerf/Lawn/Board.cpp::MovePlantCellBucket`、`pvzPerf/Lawn/CutScene.cpp::ClearUpsellBoard`。

### 按钮、模式及提示表索引

触发：文本排列顺序被当成枚举数字，造成菜单错跳、禅园商店无响应；挑战页行号被当模式值会开错玩法。
现行为：主菜单按按钮数值序分派，商店表按模式锚定；挑战入口、标题及记录均从定义行的 `mChallengeMode` 取值。
挑战定义无尺寸声明并校验行数，避免少行零初始化产生覆盖生存按钮的幽灵；CUSTOM 保留占位但不显示为可玩关卡。
验证：菜单 15/15 ID 独立对拍零差；挑战 72/72 行命中通过，其中一组原版同位置按后行覆盖；
保龄球 1 波数保持 20、保龄球 2 为 30，不修改正确旧档；Survival / Scenes / Continue 功能通过。
证据：Git `d6eabb22`、`f7a42d4d`、`ac6fe907`；`pvzPerf/Lawn/Widget/GameSelector.cpp::ButtonDepress`、
`pvzPerf/Lawn/Widget/ChallengeScreen.cpp::ButtonDepress`、`pvzPerf/Lawn/Board.cpp::kStoreButtonAction/kNumWavesPerMode`、`pvzPerf/Lawn/PortableSurvivalSmoke.cpp`。

### 僵尸卡越界与枚举表真值

触发：I, Zombie 卡 60～74 进入 53 项植物建议表；提示表少一行又使 IMP 落空，后续取植物名再次越界。
现行为：升级建议只接受 40～47 的八项区间；提示表按无尺寸数组加计数 / 首尾槽锚，植物定义访问有范围守卫。
僵尸动作 / 偏移表同时按真实显式枚举及剥除块注释后的成员构造，INVALID=-1 不占普通类型 0。
验证：提示表 75/75 槽对位相等；动作与偏移对原始阶梯按名零差；Scenes 通过。
早期 IZombie 专项曾卡在选卡交互，不能把该轮写成整场玩法已通过；真实崩点的非法字符串解引用链已消除。
证据：Git `d5c12249`、`420ce630`、`b39e1ee2`、`bad75c5b`；
`pvzPerf/Lawn/Board.cpp::TryGetUpgradeAdvice/kSeedToolTip`、`pvzPerf/Lawn/Plant.cpp::GetPlantDefinition`、`pvzPerf/Lawn/Zombie.cpp`、`ConstEnums.h`。

### 原版边界漏洞与动画可见性

触发：玉米炮死亡后光标仍持其 ID，复用槽可被当旧炮；断臂梯子僵尸卸盾会重显外臂；禅园卖盆负索引可破坏玩家字段。
现行为：炮死亡时清同 ID 瞄准光标；卸梯只在 `mHasArm` 时显臂；卖出确认重核对象和盆栽索引，负数 / 超界计数硬拒。
雨纹保持有符号取模；僵王按 1073 固定第 0 行生成，避免随机行改变魅惑目标判定。
credits 掩码按完整轨道下标生成，含 type122 的 bit14 / bit50；同名轨道不能用首见 MPHF 去重结果生成可见性掩码。
验证：雨纹正负计数×7 坐标×163 帧对拍通过；credits 冷隐藏、隐藏杀附件及复显重挂五项通过，Survival 16 能力例通过。
证据：Git `9881f396`、`ef28072e`、`ac6fe907`；`pvzPerf/Lawn/Plant.cpp::Die`、`pvzPerf/Lawn/Zombie.cpp::DetachShield`、
`pvzPerf/Lawn/ZenGarden.cpp`、`pvzPerf/Lawn/Challenge.cpp::DrawRain`、`pvzPerf/Lawn/CutScene.cpp::PlayBossEnter`、`pvzPerf/Sexy.TodLib/generated/ReanimAttacherMasks.h`。

## 输入与原生窗口

### 连续位置采样与按钮 FIFO

触发：高回报率移动逐事件进入控件、标脏并触发完整 GPU 重绘，放大原版廉价 blit 路径的成本。
现行为：连续位置按 10ms 逻辑心跳采样，移动消息不逐条驱动控件；按钮 / 键盘仍保 FIFO 及各自事件坐标。
ButtonWidget 进出、按下和释放只更新状态，视觉由正常帧呈现；真实勾选变化仍标脏，音效和即时按钮逻辑保留。
窗口外释放取消按下 / 捕获状态，避免把窗外坐标送进 MouseUp 形成神炮；静止采样不刷新用户活动时间。
验证：1000 移动加 1000 客户区光标消息未进延迟队列，100 次显式采样；按钮采样后再移动仍保留入口坐标。
证据：Git `ac6fe907`、`f122dd6a`；`pvzPerf/SexyAppFramework/platform/windows/Win32App.cpp`、
`pvzPerf/SexyAppFramework/widget/ButtonWidget.cpp`、`pvzPerf/Lawn/ModernVulkanInputSmoke.cpp`；不以合成输入测试宣称物理鼠标 / 离电 FPS 全修复。

### 进出窗口时仍检查非移动工作

触发：离电反复进出窗口卡，纯窗内移动不卡；`mMouseIn=false` 曾让整个消息提取绕过 readiness。
机制：状态要等 Update 才刷新，无限普通 Peek 会延迟 Update，使旧“窗外”状态持续放行，自我放大泵占用。
现行为：所有正常活动窗口先查非移动工作；无这类工作且在画布外时，每逻辑更新只额外允许一次原生查询。
验证：旧现场无绕过 / 有绕过分别 30.05 / 32.20s，更新 99.90 / 99.98Hz，绘制 99.40 / 87.37Hz；
Pump 32.11 / 154.69ms 每秒、最长 31.74 / 197.71ms；自由操作分组不是固定轨迹 A/B。
普通 / ASan 检查 100 更新×1000 边界切换，额外查询仅 100 次；400 按钮一次排完，14.1813 / 14.0306ms。
证据：`pvzPerf/SexyAppFramework/platform/windows/Win32App.cpp::NativeQueueReady`、同目录 `NativeMessageReadiness.h`、
`tools/native-tests/win32_message_readiness_tests.cpp`；
`W/message-readiness-control-20261015/{manual-21404-boundary/boundary-intervals.json,boundary-fix-222136/targeted-tests.log}`；物理鼠标复验未据此补签。

### 全屏切换保持当前可见性

触发：进入全屏覆盖 GWL_STYLE 丢 WS_VISIBLE；隐藏启动保存的旧样式在退出全屏时也会把已显示窗口隐藏。
现行为：进入取当前可见位，退出清掉保存样式中的旧位再合入当前位；隐藏预热仍隐藏，运行时切换仍显示。
机制：FRAMECHANGED / NOACTIVATE 不负责恢复显示，样式替换必须自己保留显示契约。
验证：两个旧逻辑负对照均 `old_visible=0`；修正进入 / 退出均 `preserved_visible=1`，隐藏往返仍 `visible=0`。
七轮 DX12 / Vulkan Scenes、Pool、Survival 功能及图形校验均通过；原生探针不使用 GPU，不激活前台。
证据：`pvzPerf/SexyAppFramework/platform/windows/Win32App.cpp::SetWindowFullscreen`；
`W/native-message-split-20261015/fullscreen-visibility-result.log`、`W/native-message-split-20261015/functional-20261015-185103/runs.json`；
不扩大为比例、HDR、独占或 DWM 原因已验证。

### Linux 装饰与内容尺寸

触发：直接创建 xdg-shell 没有标题栏；没有尺寸约束时用户可把窗口拉到非 scale 输出大小。
现行为：Wayland 由 libdecor 管理装饰和全屏恢复，坐标保持内容区；X11 写同值 min/max，主动 Resize 同步约束。
Wayland 移除 resize capability，浮动目标尺寸不被全屏 configure 覆盖；关闭 scale 恢复 800×600。
验证：两端各 2/2 窗口门通过、exit=0，含四次生命周期、非阻塞泵、主动缩放 / 恢复；两套 Release/LTO 构建 exit=0。
证据：`pvzPerf/SexyAppFramework/platform/linux/{WaylandWindow,X11Window}.cpp`；`Tests/evidence/linux-wayland-decoration-window-tests.log`、
`Tests/evidence/linux-{x11,wayland}-fixed-window-tests.log` 与对应 `fixed-window-game-build.log`。
WSLg X11 实测仍可拖边框，未登记“禁止交互缩放已完成”；Wayland 标题栏拖动及实际全屏交互仍由用户验证。

## Linux 桌面错误提示

触发：缺少缩放 HLSL 等启动异常已写入 stderr/日志，但入口弹窗仅编译在 Windows 分支，
Linux 从文件管理器启动时表现为无提示退出；通用 Popup 同样只有终端输出。

现行为：Linux 入口异常、资源异常及通用错误 Popup/MsgBox 调用独立的桌面对话框，
优先使用宿主 zenity，必要时回退 kdialog，不依赖游戏窗口或 Vulkan 初始化成功。
诊断包含原始错误；入口异常另附游戏目录。参数通过 posix_spawnp 原样传递，不经 shell，
禁用/转义 markup，保留日志及失败退出码。无显示会话、无可用提供程序时保留文本诊断；
显式 hidden probe 不等待用户关闭弹窗。

验证：X11、Wayland 两套 Release/LTO 重建成功；各 7 项回归通过，包含真实游戏缺少
缩放文件时报错、特殊字符原样传递、提供程序回退、用户关闭及无桌面环境路径。
真实桌面对话框已验证可见、等待关闭、关闭后游戏退出码为 1；两套正常资源加载也通过。
实现：`pvzPerf/main.cpp`、`pvzPerf/SexyAppFramework/SexyAppBase.cpp`、
`pvzPerf/SexyAppFramework/platform/linux/ErrorDialog.cpp`。
临时回归程序已在验证后移出项目，保留实际修复和上述验证结果。

## Linux 音频增益与所有权

### 总音量变化刷新已初始化声源

触发：标题曲在失焦静音时开始、其他曲目尚未加载完便恢复焦点，逻辑 PLAYING / voiceVolume=1 但实际 AL_GAIN 仍为 0。
机制：Windows 用 BASS 全局增益；Linux 将总音量乘入各 OpenAL 声源，原 SetVolume 在全表发布前跳过刷新。
现行为：LoadMusic 初始化并放槽后 release 发布 `mGainReadySlots`；SetVolume acquire 读取，只刷新已完成声源，卸载清位。
全表 `mSlotsPublished` 仍控制原播放准入；Windows 在编译期跳过逐声源增益分支，无每帧补救或播放顺序变更。
验证：修正前 27 项中 6 失败（恢复 .85 实际为 0，静音实际为 .85）；修正后普通及 ASan/UBSan 均 32/32、exit=0。
含三次真实加载 / 发布 / 销毁及一次后台 LoadMusic 与主线程音量交错；`detect_leaks=1`，无 sanitizer 错误 / 泄漏。
证据：`pvzPerf/SexyAppFramework/sound/BassMusicInterface.cpp/.h`、`tools/native-tests/linux_music_gain.cpp`；
`Tests/evidence/linux-music-gain-{before-fix,after-fix,after-fix-asan-ubsan}-20261017.log`；真实 alGetSourcef，无窗口、null 输出及全零 PCM。
音频解码模块通过 DecoderLease 保持到 mixer 关闭；该验证不等同于用户扬声器听音验收，也不记为图形性能收益。

## 发行清理与验证边界

用户 DLL 关卡入口及加载器删除；`GAMEMODE_CUSTOM_LEVEL=72` 保留，挑战页隐藏并拦截占位，既有枚举 / 存档编号不前移。
正式 `PVZ_ENABLE_GAME_PROBES=OFF`，Smoke 不编入发行；watchdog、PhasePerf、鼠标及临时提交 / 动画计时日志删除。
证据：`CMakeLists.txt`、`pvzPerf/SexyAppFramework/CMakeLists.txt`、`main.cpp`、`pvzPerf/LawnApp.cpp`、`pvzPerf/Lawn/Widget/ChallengeScreen.cpp`；
这些是当前工作区变化，不能把旧 Git 检查点当成已含全部发行清理。
最终 Windows DX12、Linux X11/Vulkan、Wayland/Vulkan 三套 Release/LTO 编译退出码均为 0；
日志为 `Tests/evidence/release-dx12-final-build-20261017.log`、`Tests/evidence/release-x11-final-build-20261017.log`、`Tests/evidence/release-wayland-final-build-20261017.log`。
带 probe 的 Pool 本次四轮均 exit=0、功能通过；固定 32 植物 / 40 僵尸，每轮 640 个 Draw 样本。
当前项目固定 Draw 中位数为 2303.925µs、p90 为 2453.100µs，线程周期中位数为 7065293.25 cycles；
固定画面检查为 1,920,000 字节零差异。运行条件与逐帧 CSV 清单见
`Tests/evidence/release-fixed-draw-20261017-35dece7b/runs.json`，项目值同步登记于性能总账。
原始对照仍保留在日志中，不再作为现行基线或发布变化百分比；固定绘制不等于实玩 CPU 或 FPS。
四轮采用 LP14、图形校验为 `disabled-for-measurement`；锁 11x 来自用户亲验，不反推具体频率，不混用 LP15 功能门。
Windows 关闭 probe 后交付构建已成功，`pvz_perf.exe` 为 6,881,280 字节，日志 `Tests/evidence/release-dx12-delivery-build-20261017.log`。
四轮 Pool 验的是带 probe 产物，不自动给最终 OFF EXE 补签运行验收。
Windows 原版 1073 与当前项目的 credits / 统一无尽 CPU + FPS 结果待主代理测完后填写性能总账：
均用 core LP14，11x 用户已确认，25x 待切换核实，不换算具体频率；Linux 本轮不测。
Windows loading hang、闪烁 / DWM 及物理鼠标离电掉帧尚无统一定因；只保留上文已复现、已落地且有明确边界的修复。
