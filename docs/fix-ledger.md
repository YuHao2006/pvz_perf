# 已生效修复

只记录仍有效的根因、处理和证据。旧 probe、Smoke 和临时日志的测试入口可能已退出生产源码；
其历史记录只能证明对应构建。本地运行时机制见[运行时说明](runtime.md)，
现行验证方法与平台限制见[验证说明](validation.md)。

## 存档与对象生命周期

植物发射期限独立于 `mShootingCounter`。纳秒期限改造曾额外要求上一轮攻击计时结束，
导致忧郁蘑菇的 200cs 攻击计时挡住 186～200cs 的下一轮，通常隔轮漏打，
实际整轮间隔约翻倍。已移除主发射和追加发射的这项限制，恢复原有触发规则。
真实植物、目标僵尸和弹射物池回归先复现漏打，再验证忧郁蘑菇与机枪射手
每轮四次伤害／发弹及其触发时刻，覆盖 30／100／144／200／1000Hz 和不规则步长；
另验证双发与猫尾草在计时仍为正时可触发追加攻击。未改变伤害、发射间隔或存档布局。
入口为 `ActorFloatRuntimeChecks.h::LaunchDeadlines`，由
`tools/test-static-definition-runtime.ps1` 执行真实游戏链接测试。

DAT/DAT64 必须逐字段转换模式、记录槽和图像引用，不能改扩展名或硬搬 native 对象。
用户摘要、玩家详情和关卡快照分别管理版本。头、长度、schema、11 池结构、
代次与跨对象引用先校验；内容 CRC/哈希不作为当前读档拒绝依据。
读池前先清旧附件，避免析构沿旧引用杀死刚恢复的动画；晚段失败走真实销毁路径并报告拒绝，
不静默新开局。历史结构拒绝测试覆盖 41 类，另有 72 次定义失败与清理检查。
实现为 `SaveGame.cpp::ValidateDat64PoolHeaders/SyncBoard/LoadDat64FromBuffer`；
转换边界见[存档协议](DAT-DAT64-CONVERSION.md)。

DataArray 单槽复用时，Zombie 的用户空构造曾保留 `mDead=true`，
初始化中的 `UpdateAnimSpeed` 因而生成零速率。首次声明改为 `Zombie() = default`，
由值初始化建立清零语义；真实复用 128 次及四波生成/移动测试通过。
已存档的旧零速率对象不被倒推改写。
证据：`Tests/evidence/native-wave-stall-e81de7b3c651490f80e1204a90661a70/`。

粒子三池和名册由各自 `TodParticleData` 拥有，holder 只借用，
避免不同池同槽同世代 ID 串写。自然死亡先完整 `ParticleSystemDie` 再回收系统，
同时释放 emitter 与 particle，避免长局耗尽。读档后重建派生索引，
不保留孤儿对象“自愈”路径。实现为 `TodParticle.h/.cpp` 与
`EffectSystem.cpp::ProcessDeleteQueue`。

植物消消乐下落、Twist 和保龄球换行统一维护格桶；死亡、铲除、移动镜像挂摘，
越界不写相邻行头。intro 清空僵尸池后同步重建行桶，避免残留预览索引。
池仍是对象真值，桶不改变 first-match 顺序。
实现为 `Board.cpp::MovePlantCellBucket/RebuildZombieRowBucket`、
`Challenge.cpp::BeghouledFallIntoSquare`、`CutScene.cpp::ClearUpsellBoard`。

## 图像、上传与加载

Quit 确认框创建时会先测量正文折行高度。UV 绘制入口曾在空裁剪早退之前要求 GPU 目标，
导致 `Graphics(nullptr)` 的旧测量路径抛 `NonScreenDrawError`，默认异常文本为
`Unknown exception`。UV 入口已恢复不可见绘制的早退，折行计高进一步改为不调用字形绘制的
模板实例。`QuitDialogRuntimeChecks.h` 覆盖真实确认框创建、正文和两按钮绘制与删除；
独立隐藏 fixture 同时检查 Shutdown 和析构。固定宽度、长单词、显式换行及颜色标记的
测量高度和最大行宽与实际布局一致，测量时字形 draw 调用数为零。

上传先取得字节所有权，再释放像素、索引、调色板与软件缓存；
GPU-only 图的 CPU 非法读取明确拒绝，诊断使用显式读回。
阴影共享别名不会因无效 minimize 提示销毁重传；
透明像素原始 RGB/alpha 与绘制时不透明策略分别处理。
图鉴首页保持原版植物有阴影、僵尸无额外阴影；僵尸详情页仍绘制阴影。
实现为 `MemoryImage.cpp`、`RenderInterface.cpp` 和 `Almanac.cpp`。

批量上传的 staging、dispatch 描述集和中间图必须活到 GPU 完成；
提交、等待、回收分别处理，裸中间图不误回收全局描述符槽。
CPU 解码合成保持 1073 整数 alpha 语义；显式 GPU 合成保持批量生命周期。
字体面积缩小／端点放大使用原整数权重，避免通用双线性替代导致字形变化。
覆盖度绘制显式传 mask 槽，Vulkan 呈现依赖包含颜色写入到 EXTERNAL。
历史 alpha 回归 31 次比较、55,071 像素零差；字体、复制、染色和读回另有独立边界检查。

加载完成要求预热队列和全表清扫都净，不把队列空当所有资源就绪；
调色板与末批入队同样参与门控。GPU 上传、PoolEffect 与焦散目标由主线程处理。
完整定义工作移出标题首绘阻塞段，不单独提升主线程优先级压制同核 worker。
关闭先请求协作退出，真实 join 后再清队列、定义和资源；
图片首次私有准备完成后才发布共享对象。
历史五阶段早关及共享加载交错验证通过，不能据此为所有 loading hang 指定同一原因。

泳池波纹已移入专用 GPU 顶点路径，最终契约与后端验证见
[GPU 泳池](gpu-pool-production.md)。泳池闪点和樱桃爆炸的另一独立根因是
粒子 wire 顺序迁移错误，以及缺省 ParticleStretch 快速路径值错误；
修复及全语料独立 decoder 证据见[粒子轨道归属](particle-track-migration-regression.md)。

## 玩法与界面

按钮、挑战入口、标题和记录按实际枚举与 `mChallengeMode` 取值，
不把文本顺序或挑战行号当模式编号。提示表、僵尸动作/偏移表按显式枚举建立并校验范围，
INVALID 不占普通类型零槽；I, Zombie 不再越界进入植物升级建议表。
菜单 15 个 ID、挑战 72 行和提示 75 槽曾独立对拍通过；
早期 IZombie 专项卡在交互的结果不作为整场玩法通过。

玉米炮死亡清除同 ID 瞄准光标；梯子卸盾只在仍有手臂时显臂；
禅园卖出确认重新校验对象与索引；雨纹保留有符号取模，
僵王按 1073 第 0 行生成。credits 掩码按完整轨道下标生成，
同名轨道不能被首见名字查找结果去重。实现位于 Plant、Zombie、ZenGarden、
Challenge、CutScene 及生成的 ReanimAttacherMasks。

传送门候选排除配对门所在行、旧行和已有门，允许同列与两侧边列，
原版地址与全枚举回归见[1073 传送门](portal-relocation-1073.md)。
保龄球已经采用根运动和目标行到达时刻，旧固定 100Hz 子步方案不再是当前实现。
磁铁起点从破坏道具前的实际轨道中心取样，保留绘制中心连续；
有意改善原版近似偏移的边界见[1073 磁铁调查](research/1073-magnet-coordinates.md)。
教学在首次有效战斗更新启动，沿用现有状态保证一次性，
原版证据见[首次教学](research/1073-first-tutorial.md)。

从奖励界面进入 credits 时，`ShowCreditScreen()` 在构造前设置 `SCENE_CREDIT`，
重播和返回保持场景路由正确。旧观测误分类的原件保留于
`Tests/evidence/credits-25x-20261018-001320/`，
修复构建记录为 `Tests/evidence/credits-scene-fix/build.txt`。

## 原生窗口与输入

Win32 每逻辑心跳至少维持一次 `PeekMessage(PM_NOREMOVE)` 响应性，
避免持续更新窗口被系统创建 Ghost 替身而点击闪屏、误暂停。
连续鼠标位置按逻辑心跳采样，按钮和键盘保留 FIFO 与消息自带坐标；
窗外释放取消捕获，静止采样不更新用户活动时间。
所有活动窗口先检查非移动工作，画布外无工作时每更新只额外查询一次，
避免旧 `mMouseIn` 状态放大消息泵占用。
独立回归：`tools/native-tests/win32_message_readiness_tests.cpp`；
点击闪屏与误暂停由用户实机确认消失，不扩大为所有离电掉帧已解决。

全屏进入和退出合入当前 WS_VISIBLE，避免样式覆盖隐藏窗口；
隐藏预热仍保持隐藏。Linux Wayland 用 libdecor，X11 同步固定内容尺寸约束；
WSLg 曾仍可拖边框，不登记为全部桌面禁止交互缩放通过。
Linux 桌面异常优先 zenity、回退 kdialog，通过 posix_spawnp 原样传参，
不依赖 GPU 初始化；无桌面时保留日志、stderr 和失败退出码。
入口为 `platform/linux/ErrorDialog.cpp`，历史两窗口后端各七项回归通过。

## 音频与发行

Linux 总音量只刷新 release/acquire 已发布的 OpenAL 声源，
避免失焦静音期间开始加载的标题曲恢复后 gain 仍为零。
DecoderLease 保持解码模块到 mixer 关闭；实际 gain、加载交错及 sanitizer 验证通过，
不等于用户听音验收。

Windows 后台线程在创建 MOD/stream 前显式选择实际 BASS 输出设备。
主线程初始化输出不会自动改变后台线程设备；无声设备也能解码并推进位置，
因此回归必须核对设备归属和真实声部，不能只看非零 PCM。
实际入口为 `tools/test-music-runtime.ps1`。

用户 DLL 关卡入口、生产 Smoke、watchdog、PhasePerf、shadow 对拍和临时逐帧探针已移除；
CUSTOM 模式编号保留但不显示为可玩入口，不前移存档枚举。
原版诊断、错误／崩溃处理、独立回归和外部只读采样保留。
功能、图片或构建通过不自动给另一个交付 EXE、平台或实玩性能补签。
