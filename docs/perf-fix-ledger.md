# 性能总账

按机制登记已落地变化；超过 10% 才单列优化成果。最终测量结果不设该门槛，
无论提升、持平或退化都更新同口径的现行结果。日期与提交号仅定位证据。

## 当前项目固定绘制结果

**Windows x64 / Win32 / DX12，LP14、`0x4000`、锁 11x，用户实机确认。**
本轮项目采用 Release/LTO，关闭图形校验和 RTSS，预热 128 次，
每轮 640 个固定 Draw 样本。
固定 32 植物、40 僵尸、3047 张 GPU 纹理；每轮的状态与纹理数量守恒。
下表统计值为两轮各自中位数或 p90 再取中位数。

| 指标 | 当前项目值 |
| --- | ---: |
| CPU Draw 中位数 | 2303.925µs |
| CPU Draw p90 | 2453.100µs |
| 线程周期中位数 | 7065293.25 cycles |
| 固定画面检查 | 1,920,000 字节，零差异 |
| Pool 功能 | 本次四轮均 exit=0，功能通过 |

这是当前固定绘制负载的项目实测值。测量使用显式开启 smoke 的产物，正式交付重新构建
`PVZ_ENABLE_GAME_PROBES=OFF`。计时只覆盖 `DrawScreen`，不含
flush/fence/readback，不是整局 CPU 占用或实玩 FPS。
原始证据：[运行条件与逐帧 CSV 清单](../Tests/evidence/release-fixed-draw-20261017-35dece7b/runs.json)；
此处保留原始文本输出、采样和运行清单，清单中的被测二进制以哈希标识，不保留程序副本。
日志中的现代项目冻结旧版对照仅作历史原件留存，
不再作为本文任何子项的现行基线，也不从该对照发布当前变化百分比。

## 实玩测量：credits 与统一无尽

本节按场景汇总 Windows 原版 1073、当前项目 Windows Win32/DX12 和
当前项目原生 Ubuntu Wayland/Vulkan 的真实实测。Windows 两者构成原有串行对照，
Ubuntu 为独立平台记录；表格并列用于查阅，不表示三者已完成同核同条件对拍。
日期仅用于定位证据。本轮 11x credits 和无尽已由用户取消。

Windows 双方均使用 LP14（`0x4000`），按用户指定的 **25x** 进行，不换算具体频率；
观测覆盖 2026-10-17 至 2026-10-18，使用 Tests 根目录的统一无尽存档。
无尽只统计 CSV 中 **`segment=game`**，开始等待、暂停、后台与其他场景不计入。
Windows credits 项目版因场景标记未更新而被误分类，按 credits 节的人工确认区间重算，
不混入菜单数据。

### Ubuntu 环境与公共采集口径

本轮按用户操作串行测量 credits → 统一无尽：在采集终端按 Enter 开始，
不设时长上限，退出游戏结束。只统计原始 CSV 的 **`segment=game`**，并校验
`valid=1`、前台状态及场景编号；credits 为场景 6，无尽为场景 3、模式 58。
没有沿用 Windows credits 的历史 `other-scene` 修正规则。

环境为原生 Ubuntu 25.10、内核 6.17.0-41-generic、Core Ultra 9 185H、
GCC 15.2、Release/LTO、`PVZ_ENABLE_GAME_PROBES=OFF`，图形后端为 Vulkan。
游戏所有线程绑定 **Linux CPU14（Core ID32，APIC ID64，低功耗 E 核）**，
采集器绑定 **Linux CPU15（Core ID33，APIC ID66）**。
初始化发现一个 `pvz_per:disk$0` 工作线程自行放宽亲和性，采集前已重新绑定；
有效采样期间逐线程检查亲和性，未发生偏离。

**本轮按“锁 25x 最高倍频上限”登记，用户实机确认。** CPU14/15 的硬件最高频率及
系统允许上限均为 2.5 GHz；这是最高倍频限制，允许运行时降频，不表示全程固定在最高频率。
有效区间的 `scaling_cur_freq` 瞬时读数约为 1.10–2.52 GHz，读数含估计波动，
不是整段频率或驻留时间。采集器自身没有设置倍频，原始元数据保持原样；
25x 上限的用户确认单独补记在本说明及派生汇总中。
当前 Windows 记录没有 LP14 的 APIC ID，尚未证明跨系统同号核心的物理身份一致。

三方采用相同的整进程汇总公式：有效区间进程 CPU 时间及绘制帧数分别累加，再求
`总 CPU 时间 × 1000 / 总绘制帧数`；整体 FPS 和 CPU 占用按实际区间时长加权，
不对各秒的 CPU ms/帧直接求算术平均。Windows CPU 时间来自 `GetProcessTimes`，
Ubuntu 来自 `/proc/<pid>/stat` 的 user+system 累计 tick，100 tick/s。
两者均包含进程全部线程、以单核为 100%；Ubuntu 约每秒采样一次，存在 tick 量化。
相同计算公式不保证跨系统图形驱动、音频及其他服务的 CPU 记账归属相同。
FPS 为已有 `mDrawCount` 增量，表示生成的绘制帧，不代表显示器实际呈现次数。

### credits 实测

Windows credits 仅保存采样与 CPU/帧统计，不生成图片。证据目录：
[`Tests/evidence/credits-25x-20261018-001320`](../Tests/evidence/credits-25x-20261018-001320/)。
双方采用音乐 100、音效 65、未静音，窗口模式、不等垂直同步；不传 `-nosound`。

| 程序 / 平台 | 有效样本 | 有效秒数 | 绘制帧数 | 累计 CPU 时间 | 平均绘制 FPS | CPU（单核 %） | CPU ms/绘制帧 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Windows 原版 1073 | 160 | 159.999912 | 15,899 | 40.734375 s | 99.369 | 25.459 | 2.562072 |
| 当前项目 Windows Win32/DX12 | 160 | 159.999711 | 15,999 | 26.203125 s | 99.994 | 16.377 | 1.637798 |
| 当前项目 Ubuntu Wayland/Vulkan | 160 | 160.000019 | 15,999 | 11.790000 s | 99.993738 | 7.368749 | 0.736921 |

Windows 双方共同播放区间的**平均每帧 CPU 时间降低 36.075%**，绝对减少约 0.924 ms/帧。
该数字为本次整进程成本对照，不归因于某一项优化。双方均接近 100 FPS 上限，
因此主要收益表现为 CPU 成本下降，不是相同比例的帧率增长。
CPU 时间覆盖所有进程线程，包含更新、绘制和音频；按
`累计进程 CPU 秒数 × 1000 / 累计绘制帧数` 计算，
不把各秒的 CPU/帧直接算术平均，也不把墙钟帧间隔当 CPU 时间。
采样间隔约 1 秒，明细中的每帧值是区间均值，未采集每一帧的独立耗时。

**`other-scene` 原因和筛选依据：**
被测版本的 `pvzPerf/LawnApp.cpp::ShowCreditScreen()` 创建 `CreditScreen` 并注册 Widget，
但没有将 `mGameScene` 改为 `SCENE_CREDIT=6`；本次从奖励界面进入后，
项目整个播放期间仍记录为 `SCENE_AWARD=5`。采样器只接受场景 6，
于是原始项目汇总报告 `no-valid-game-samples`，这是场景分类失败，不是没有绘制。
该入口现已补上 `mGameScene = GameScenes::SCENE_CREDIT`，在创建 credits 界面前设置，
后续采样可以按场景 6 正常分类；本轮历史原始记录仍保留当时的误分类，不回写。

依据用户确认两次均播放 credits、统一约第 3 秒开始的操作，以及源码的场景赋值缺失，
取双方共有的**采样终点约第 4–163 秒**，各 160 个样本：
原版要求原始 `segment=game`，项目要求原始 `scene=5` 且 `segment=other-scene`；
两者均要求区间前后采样端点在前台。
原版约第 164 秒的额外有效样本不纳入共同对照；
项目约第 164 秒起的菜单、后台、开始等待均排除。
这不是将所有 `other-scene` 视为 credits 的通用规则。
原始 CSV 没有逐秒记录 `mCreditScreen` 指针或播放位置，
因此项目 credits 归属依赖人工确认与源码核对；
单轮串行对照、非逐帧对齐，不声称重复 ABBA 或亚秒级中断已完全消除。

原始 `samples.csv`、`measurement.json` 和 `results.json` 均保留原值。
独立重算证据：[汇总与筛选说明](../Tests/evidence/credits-25x-20261018-001320/analysis-summary.json)、
[原版逐区间 CPU/帧](../Tests/evidence/credits-25x-20261018-001320/original-credits-analysis.csv)、
[项目逐区间 CPU/帧](../Tests/evidence/credits-25x-20261018-001320/project-credits-analysis.csv)、
[证据文件 SHA256 清单](../Tests/evidence/credits-25x-20261018-001320/evidence-manifest.json)。
重算入口为 `Tests/performance/analyze-credits.py`，与原始样本一起保留来源和可复现方法。

Ubuntu credits 直接按 `segment=game`、`valid=1`、前台及场景 6 筛选，
没有沿用 Windows 历史 `other-scene` 修正规则。剔除开始等待 2 个、后台 1 个、
其他场景 2 个样本；单秒 FPS 最低 98.996、p10 为 99.990，单秒 CPU 峰值约 12.000%。
平均绘制速率接近 100 FPS，进程 CPU 成本为 0.736921 ms/绘制帧；
数值低于本表 Windows 记录，但核心物理身份、后端、音频和实际频率条件未对齐，
不能据此认定跨系统优化收益，也不发布跨系统提升百分比。

Ubuntu credits 证据：[原始 CSV](../Tests/evidence/linux-wayland-20261018/credits-raw.csv)、
[区间 CPU/帧](../Tests/evidence/linux-wayland-20261018/credits-analysis.csv)、
[统计汇总](../Tests/evidence/linux-wayland-20261018/summary.json)。
credits 不生成图片，完整环境、哈希和统计口径见本节公共说明。

### 统一无尽实测：时间曲线与每帧 CPU 成本

每个程序单独成图：上半幅在同一坐标系叠加帧率和 CPU 占用，纵轴均为 0–100；
下半幅为每个有效采样区间的平均 CPU ms/绘制帧。横轴从按 Enter 开始观测计时，
未压缩时间轴；剔除区间留缺口，不跨暂停连线。原始 CSV 保留超过 100 的值，
不裁剪数据、不平滑。FPS 为游戏已有 `mDrawCount` 增量，代表生成的绘制帧，
不代表显示器实际呈现次数。

**原版 1073（暂停识别暂定）：**

![原版 1073：LP14 25x 无尽帧率、CPU 占用和每帧 CPU 成本](../Tests/evidence/windows-endless-25x/original-timeline.png)

**当前项目 Win32/DX12：**

![pvz_perf DX12：LP14 25x 无尽帧率、CPU 占用和每帧 CPU 成本](../Tests/evidence/windows-endless-25x/project-timeline.png)

**当前项目 Ubuntu Wayland/Vulkan：**

![原生 Ubuntu Wayland Vulkan：CPU14 锁 25x 上限，无尽 FPS、CPU 占用及 CPU/绘制帧](../Tests/evidence/linux-wayland-20261018/endless-timeline.png)

| 程序 / 平台 | `game` 样本 | 有效秒数 | 绘制帧数 | 累计进程 CPU 时间 | 平均绘制 FPS | CPU（单核 %） | 平均 CPU ms/绘制帧 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Windows 原版 1073（暂定） | 391 | 391.000513 | 31,678 | 322.437500 s | 81.018 | 82.465 | 10.178594 |
| 当前项目 Windows DX12 | 393 | 393.000051 | 39,261 | 211.328125 s | 99.901 | 53.773 | 5.382648 |
| 当前项目 Ubuntu Wayland/Vulkan | 390 | 390.000130 | 38,997 | 167.110000 s | 99.992274 | 42.848704 | 4.285201 |

计算方式：区间 CPU 时间 = `cpu_percent / 100 × interval_s`；
区间绘制帧数 = `draw_fps × interval_s`；
**整体 CPU ms/帧 = 有效区间 CPU 时间之和 × 1000 / 有效区间绘制帧数之和**。
整体占用和 FPS 也以有效区间累计时间加权，不能直接平均各秒的 ms/帧。
这是整个进程的 CPU 时间，包括更新、绘制、音频及其他线程，不是单独 Draw 的耗时，
也不是包含等待的墙钟帧间隔。现有数据以 1 秒间隔采样，无法还原每一帧的独立 CPU 耗时；
分析 CSV 提供的是该秒内每个绘制帧的平均 CPU 成本，不伪造逐帧记录。

Windows 项目剔除开始等待 2 个、暂停 3 个、后台 1 个、其他场景 6 个样本；
其中约 208 秒和 340 秒的暂停点已排除。原版剔除开始等待 2 个、
后台 3 个、其他场景 7 个样本。采样端以端点状态分类，
不足一秒的中断和状态切换所在区间仍可能混入，图不证明闪屏已解决。

**结论边界：** 本轮只有原版→项目一对串行观测，未完成重复 ABBA。
原版 Board 字段偏移读出不合理的波次、阳光等值，暂停识别仍须核实，
因此原版曲线和数值均为现有记录的暂定统计，不发布正式跨程序提升百分比。
项目设置为静音，原版声音状态未记录，音频条件尚未对齐；
双方均未使用 `-nosound`。这些限制不妨碍保留本轮原始测量，但不能声称严格同条件性能对拍通过。
Ubuntu 为同场景的独立实测，不构成严格同条件 Windows 对照；X11 尚未实测，
不用固定 Draw 或历史数据补填。用户已取消本轮 11x 实玩测量，不再安排。

证据：[计算汇总](../Tests/evidence/windows-endless-25x/summary.json)、
[文件哈希](../Tests/evidence/windows-endless-25x/manifest.json)、
[原版原始 CSV](../Tests/evidence/windows-endless-25x/original-raw.csv)、
[项目原始 CSV](../Tests/evidence/windows-endless-25x/project-raw.csv)、
[原版区间 CPU/帧](../Tests/evidence/windows-endless-25x/original-analysis.csv)、
[项目区间 CPU/帧](../Tests/evidence/windows-endless-25x/project-analysis.csv)。
原始测量元数据和项目 settings 与上述文件同目录，保留被测 EXE 哈希。
图与汇总可用 `Tests/performance/report-windows-game-perf.py` 从原始运行目录重新生成。

Ubuntu 无尽按 `segment=game`、`valid=1`、前台、场景 3 和模式 58 筛选。
剔除开始等待 2 个、后台 2 个、其他场景 10 个样本；有效区间覆盖第 0–20 波，
单秒 FPS 最低 98.011、p10 为 99.989，单秒 CPU 峰值约 69.997%。
整段平均绘制速率接近 100 FPS，没有持续满核的证据；区间统计不代表独立逐帧耗时，
也不能归因为某项代码优化的收益。Ubuntu 曲线沿用上述时间轴和缺口规则，
下半幅另以虚线标出整体 CPU ms/绘制帧均值，不跨暂停连线。

Ubuntu 无尽输入仍为 `Tests/game3_58.dat64`，SHA256 为
`0de22ff708e3f572a669a15cb138076148f59628f073e7cef46ffb252d96429a`，
每轮复制为独立玩家 ID1 的 `game1_58.dat64`；没有让游戏直接读写仓库基准。
玩家详情来自人工构造的全通关测试档，不代表 Windows 原玩家档完全相同。

Ubuntu 无尽证据：[原始 CSV](../Tests/evidence/linux-wayland-20261018/endless-raw.csv)、
[区间 CPU/帧](../Tests/evidence/linux-wayland-20261018/endless-analysis.csv)、
[无尽矢量图](../Tests/evidence/linux-wayland-20261018/endless-timeline.svg)、
[统计汇总](../Tests/evidence/linux-wayland-20261018/summary.json)。

### 跨平台比较限制与 Ubuntu 公共证据

Ubuntu 每个场景只有一次观测，没有重复 ABBA，也没有跨系统按播放位置或逐波时间对齐。
Linux/Vulkan/GCC 与 Windows/DX12/MSVC 的渲染、编译及运行库不同，核心物理身份和
实际运行频率条件尚未对齐，**不发布 Windows/Linux 提升百分比**。
采集未传 `-nosound`，但未随采样保存当时的音量和 `customScale` 开关快照；
证据目录的 `settings-after-run.json` 仅为事后快照（音量 85/55、未静音、
`customScale=0`），不能倒推整个测量期间的设置，也不能宣称已与 Windows 音频条件对齐。
`scale.json` 副本与两轮采集记录的配置哈希一致，但配置文件本身不证明缩放开关当时开启。
硬件频率上限和 APIC ID 清单同样标为事后核对。

Ubuntu 原始数据、元数据和哈希均归档，不保留程序副本：
[统计汇总](../Tests/evidence/linux-wayland-20261018/summary.json)、
[文件哈希](../Tests/evidence/linux-wayland-20261018/manifest.json)、
[全部核心最高频率及 APIC 清单](../Tests/evidence/linux-wayland-20261018/environment-after-run.json)。
两场原始 CSV、区间 CPU/帧和无尽曲线分别链接于对应场景。
可复现分析入口为 `Tests/performance/report-linux-game-perf.py`，只为无尽生成图片，
credits 保留原始记录、区间 CPU/帧与汇总，不生成图片。X11 尚未实测。

## 口径与证据

- 当前固定 Draw 实测环境为 **LP14、`0x4000`、锁 11x**，用户已亲自核实；无尽实玩本轮按用户指定的 **25x** 测量。锁核本身不证明锁倍频，两种结果不互相外推。
- 除固定 Draw 与当前实玩表外，下文所有子项的耗时、容量、体积及收益数字均为历史证据，本轮未重测，当前项目对应值待更新。历史“新机制”列不是当前项目实测列，禁止用旧现代构建值填补当前结果。
- 保留原版算法或原机制 → 已落地算法的确切历史对拍，用于说明原理及原轮收益；历史数字只属于原轮，既不充当现代冻结基线，也不代表当前 1073 整程序对照。
- “锁定对拍”沿用原轮确认；无法确认原轮锁定条件的数字明确标为“历史未复测”，不登记为当前有效收益。LP15、未锁历史不改称 LP14 锁 11x。
- 常规微基准：MSVC x64 `/O2`，N=2M、min-of-5、两进程复核、差异超过 5% 重跑、统一 noinline、两侧 checksum 相同；九轮 AB/BA 与游戏逐帧协议另列。
- 降低率为 `(旧耗时－新耗时)/旧耗时`。不把新/旧耗时百分比误写成降低率，不跨负载、冷热状态、构建或统计量拼接收益，不外推整局 FPS。
- 访问器清理、自行引入又删除的虚函数、功能门禁、无匹配有效对照和不超过 10% 的微改不列成果。
- 下文 `B/` 指现存原始日志目录 `../../_shared/bench35/`（相对本文件）；各行给出目录与文件名。Git `ae5caaeb` 保存该批复核与统一符号口径，`b0d78ac9` 保存锁定遍历基准及实现。日志和 Git 证据均不依赖其他 Markdown 文档存续。

## 名字数值化：reanim 先行，particle 沿用

### reanim 名字枚举、MPHF 与 attacher 段表

测量状态：本节全部子项为历史证据，本轮未重测，当前项目值待更新。

**名字枚举首先在 reanim 落地。** 原逐 tick 轨道名字扫描、attacher 文本解析改为 `ReanimTrackId`、联合键 MPHF 和编译期整数段表；粒子随后采用枚举与区间。IDT5 装载清理是后续变化，不能覆盖或替代这一收益。

| 原机制 → 已落地机制 | 对拍或容量变化 | 范围与证据 |
| --- | --- | --- |
| `strnicmp` 线性轨道扫描 → `(type,id)` MPHF 直达、零字符串零回退 | 原始记录 65–262ns/查 → 全路径 2.92–4.13ns/查 | **历史未复测**：原轮锁定与逐路径配对未重新核实，保留原始收益记录，不据区间端点算新倍率。credits 约 3400 万次/轮是旧负载；Git `74279f21`、`aeb80da3`、`91f40433`，历史测量汇总 `ac6fe907` |
| 每类型 MPHF → 全局共享单表 | 约 154KB → 44KB，减少约 110KB（71%） | 表容量估算，非进程驻留内存；Git `487a3a0d`、`5739a3cd` |
| 每 tick 文本解析、每实例动作缓存 → 编译期整数段、资源共享缓存 | 缓存约 19KB/实例 → 2.4KB/资源；锁定轮新实现 `UpdateAttacherTrack` 379ns | 容量的共享粒度改变；379ns 仅是满员 credits 新路径成本，没有同场景旧值，不登记耗时倍率。Git `de7172f6`、`4d0602ad`、`b0d78ac9` |

名字接口与查找见 `pvzPerf/Sexy.TodLib/Reanimator.cpp`、`ReanimTrackId.h`、`ReanimTrackMphfGlobal.h`。attacher 隐藏值按原始帧语义处理，重复 ID 轨道也须保留；名字消除不等于合并同名轨道。旧未锁绝对成本不能与 379ns 相减。

### 粒子枚举、前缀区间与定义直索引

测量状态：本节全部子项为历史算法对拍，本轮未重测，当前项目值待更新。

原字符串精确/前缀比较 → 字典序名字枚举与左闭右开区间：`unnamed=0`、112 个具名 ID、`top=113`；All 为 `[unnamed,top)`，不占枚举。运行时和 compiled 删除名字、名字长度及 `mOnDuration` 死槽。精确 CrossFade 用首见定义索引；Override 仍扫描活实例，定义下标不能替代运行实例下标。

**锁定对拍**：LP14 锁 11x，原轮用户现场确认；程序记录处理器号 14。MSVC C++23 `/O2 /Ob2 /DNDEBUG /GL- /fp:precise /OPT:NOICF`，同一程序和 112 系统/222 定义语料，预热后九轮 AB/BA，QPC；每轮命中与输出 checksum 相同。下表均为九轮中位数，单位 ns/查询，降低率取两侧中位数之比。

| 路径/负载 | 旧机制耗时 | 新机制耗时 | 降低 |
| --- | ---: | ---: | ---: |
| 小系统匿名：空名 `_stricmp` → ID 相等 | 32.136155 | 18.318769 | 43.0% |
| 小系统匿名：旧首字节快路 → ID 相等 | 24.220093 | 18.277248 | 24.5% |
| 小系统具名精确：字符串 → ID 相等 | 66.470412 | 19.359554 | 70.9% |
| 小系统前缀：`strlen` + `_strnicmp` → 区间 | 92.634290 | 18.383265 | 80.2% |
| 小系统前缀：缓存长度 + `_strnicmp` → 区间 | 50.470242 | 18.306419 | 63.7% |
| 全语料匿名：空名 `_stricmp` → ID 相等 | 35.652610 | 18.820831 | 47.2% |
| 全语料匿名：旧首字节快路 → ID 相等 | 25.232980 | 18.788132 | 25.5% |
| 全语料具名精确：字符串 → ID 相等 | 112.898488 | 22.828038 | 79.8% |
| 全语料前缀：字符串 → 区间 | 122.317453 | 20.820691 | 83.0% |
| `gloom_` 所属系统：前缀字符串 → 区间 | 335.034964 | 45.899545 | 86.3% |
| `icetrap` 所属系统：前缀字符串 → 区间 | 90.341566 | 25.540467 | 71.7% |
| `awardray` 所属系统：前缀字符串 → 区间 | 567.046612 | 56.283233 | 90.1% |
| `doommushroom` 所属系统：前缀字符串 → 区间 | 508.619777 | 47.223432 | 90.7% |
| 小系统定义首见：字符串扫描 → 预建 ID 直索引 | 43.883524 | 5.989850 | 86.4% |
| 全语料定义首见：字符串扫描 → 预建 ID 直索引 | 68.832877 | 6.376767 | 90.7% |
| FadeOut：五个含目标的两定义系统，字符串扫描 → 直索引 | 48.643760 | 5.977852 | 87.7% |
| FadeOut：全语料合成缺失主导负载，字符串扫描 → 直索引 | 29.648333 | 5.964516 | 79.9% |

证据：基础 [results.json](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/results.json)、[samples.csv](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/samples.csv)、[run-metadata.json](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/run-metadata.json)；FadeOut [results.json](../Tests/evidence/particle-emitter-fadeout-20261010-161157-045/results.json)、[samples.csv](../Tests/evidence/particle-emitter-fadeout-20261010-161157-045/samples.csv)。实现：`pvzPerf/Sexy.TodLib/TodParticle.cpp::CrossFade/OverrideColor`、`TodParticle.h::mEmitterIndexByName`。

边界：一次查询仅扫一个系统；小系统 1–8 定义、平均约 1.72–2.89，全语料组也不是每次扫 222 项。热缓存模型含选择、16 字节颜色写入和共同计数，不含分配、交叉淡化执行或渲染；直索引每系统定义 113 个 int（452B），建表不计时。基础/补测分别 4.156/0.676 秒。All 原本跳过比较，无超过 10% 收益；枚举线性找定义的中间方案不另算已落地直索引的收益。

## 遍历、索引与连续存储

测量状态：本节全部子项为历史算法对拍，本轮未重测，当前项目值待更新。

以池为单一真值，生命周期维护派生桶/名册；键直取缩短扫描，连续槽号减少节点→ID→池槽的依赖加载。下表为已有锁定对拍；本次未复测。

| 原机制 → 已落地机制 | 旧 → 新 | 降低 | 范围与证据 |
| --- | --- | ---: | --- |
| reanim 全轨 112B 步长扫描 → 256 位活动掩码跳过 | 32.3 → 3.12µs/pass | 90.3% | 稀疏活动负载，非满员整局 Update；Git `b0d78ac9`，`Tests/performance/bench_reanim_trackwalk.cpp` |
| reanim 每个绘制组全扫 → 分组占用位跳过 | 163.3 → 58.6µs/pass | 64.1% | 独立分组基准，不与上一行相减；Git `ae5caaeb`，`Reanimator.cpp::mGroupOccMask` 相关路径 |
| 僵尸高水位全池扫 → 连续 uint16 行段、反索引、Boss 侧数组 | 2733.4 → 592.8ns | 78.3% | 池 1024×168B、本行 171；链跳对照 884.5ns；Git `ef28072e`、`b0d78ac9` |
| 植物高水位扫 → 每格四层桶、按需重扫维护 | 183.31 → 24.97ns | 86.4% | 48 植物夹具；`B/cellbucket/bench_cellbucket.lpe.out`，Git `ae5caaeb` |
| 发射器/粒子 TodList 指针链 → uint16 紧凑名册 | 132.2 → 2.42µs/pass | 98.2% | 900 粒模型；尾存倒序保持 AddHead 顺序，非 98 倍；Git `b0d78ac9`，`Tests/performance/bench_particle_roster.cpp` |
| 每删一粒 Find 扫槽 → 已知迭代下标传入 DeleteParticleAt | 801.5 → 550.3ns | 31.3% | churn 删除；级联漂移仍校验、必要时重新找槽；同上 |

实现：`pvzPerf/Sexy.TodLib/Reanimator.cpp`、`TodParticle.cpp`、`pvzPerf/Lawn/Board.cpp`。活动掩码须含编译期 attacher 位与重复轨道、访问自愈和附件兜底；256 位覆盖原语料最大 171 轨。行段保持池顺序与 first-match，候选超集仍须真实行过滤；整池清空须同步重建桶。旧未锁名册/更新环数字不再并列为有效基线。

### 附件平面遍历

测量状态：以下为历史算法对拍，本轮未重测，当前项目值待更新。

显式 DFS 栈与不可达附件嵌套分支 → 平面 for 和可达效果分支。锁定 LP14 复核，N=2M、min-of-5、AB 交错、checksum 相同；数据取 `B/todlib/bench_attachment.lpe.out`，实现 `pvzPerf/Sexy.TodLib/Attachment.cpp`，Git `ae5caaeb`。

| 路径 | 旧 → 新 ns | 降低 |
| --- | --- | ---: |
| Update | 42.81 → 26.51 | 38.1% |
| SetPosition | 81.80 → 33.69 | 58.8% |
| SetMatrix | 257.14 → 41.76 | 83.8% |
| Draw | 43.03 → 30.64 | 28.8% |
| AttachmentDie：移除不可达嵌套分支 | 35.72 → 30.62 | 14.3% |

边界：夹具每附件一个效果，均匀 `{particle,trail,reanim,other}`，下游为空桩，仅验证分发与遍历；当前 trail 已退役，不能将这组历史模型当当前效果混合比例。OverrideColor 同轮反而变慢，不计全族普遍加速。

## 分支分发与常量表

测量状态：本节两表的全部子项为历史算法对拍，本轮未重测，当前项目值待更新。

原 switch/if 常量赋值链 → static 常量数据表；行为 case → 函数指针表。MSVC 的连续枚举跳转表、区间判断不必更慢，只登记逐项对拍胜出的路径。以下是已有 LP14 锁 11x 复核；`B/` 日志两侧 checksum 相同，DrawBossPart 另据同构 body 的历史复核，不冒充该批 checksum 验证。Git `ae5caaeb`。每行仅对应夹具的键分布、桩与调用范围，不代表完整函数或游戏同比加速。

| 路径：旧链/分派 → 新表 | 旧 → 新 ns/次 | 降低 | 原始日志（B/ 下） |
| --- | --- | ---: | --- |
| 植物发射物类型 kFireProjectiles | 44.40 → 7.12 | 84.0% | `r4/bench02_fireproj.lpe.out` |
| 范围伤害旗 kDamageRangeFlags | 33.08 → 6.89 | 79.2% | `r4/bench01_dmgflags.lpe.out` |
| 商店价格 kStoreItemCosts | 40.25 → 9.22 | 77.1% | `r4/bench15_storecost.lpe.out` |
| 花盆高度/缩放 kFlowerPotAdjust | 34.12 → 8.96 | 73.7% | `r4/bench04_flowerpot.lpe.out` |
| 僵尸图像偏移 kZombieImageOffsetFix | 33.12 → 9.53 | 71.2% | `r4/bench06_zimgoff.lpe.out` |
| 投射物绘图参数 kDrawParams | 48.35 → 15.42 | 68.1% | `r4/bench10_prodraw.lpe.out` |
| 种子包绘图指标 kSeedPacketDrawMetrics | 62.63 → 26.77 | 57.3% | `r4/bench05_packetdraw.lpe.out` |
| 行走头部位置 kWalkHeadPos | 30.49 → 14.66 | 51.9% | `r4/bench07_walkhead.lpe.out` |
| 发射节奏 kShootingCounter | 30.06 → 15.72 | 47.7% | `r4/bench03_shootctr.lpe.out` |
| 投射物阴影 kShadowParams | 89.66 → 59.93 | 33.2% | `r4/bench11_proshadow.lpe.out` |
| 投射物直接绘制 kImmediateRender | 25.59 → 18.25 | 28.7% | `r4/bench12_proimmediate.lpe.out` |
| 直飞判定 kDynamics（同表另一消费者） | 25.58 → 18.18 | 28.9% | `r4/bench13_dynamics.lpe.out` |
| 种子成本覆盖 kSeedCostOverrides | 39.48 → 32.87 | 16.7% | `r4/bench14_seedcost.lpe.out` |
| 植物更新分派 kSeedTypeUpdates | 56.11 → 48.16 | 14.2% | `r4/bench08_seedupdate.lpe.out` |
| 盆栽高度偏移 → static 表 | 31.79 → 8.49 | 73.3% | `ifelse/bench2_potoffset.lpe.out` |
| 植物高度 → static 表 | 27.21 → 11.72 | 56.9% | `ifelse/bench7_plantheight.lpe.out` |
| 植物阴影 → static 表 | 40.46 → 22.89 | 43.4% | `ifelse/bench5_plantshadow.lpe.out` |
| 发射原点 → static 表 | 44.31 → 36.86 | 16.8% | `ifelse/bench8_fire.lpe.out` |
| Coin 绘制 → static 表 | 66.84 → 56.91 | 14.9% | `ifelse/bench4_coindraw.lpe.out` |
| DrawSeed 选择 → static 表 | 32.98 → 29.06 | 11.9% | `ifelse/bench1_seedpacket.lpe.out` |
| 调色板模式 SetColorMode | 26.74 → 8.67 | 67.6% | `ui/bench13_ZombatarColors_SetColorMode.lpe.out` |
| 分类高亮 DrawCategoryHighlight | 45.56 → 19.16 | 57.9% | `ui/bench11_ZombatarItems_DrawCategoryHighlight.lpe.out` |
| BeghouledPickSeed 种子选择 | 117.29 → 51.98 | 55.7% | `ui/bench07_Challenge_BeghouledPickSeed.lpe.out` |
| 禅园 DrawPlantOverlay | 31.06 → 21.06 | 32.2% | `ui/bench09_ZenGarden_DrawPlantOverlay.lpe.out` |
| SquirrelFound | 93.51 → 72.57 | 22.4% | `ui/bench08_Challenge_SquirrelFound.lpe.out` |
| Plant::DoSpecial | 48.02 → 37.31 | 22.3% | `ui/bench02_Plant_DoSpecial.lpe.out` |
| DrawBossPart 五 case 级联 → 五槽函数表 | 18.2 → 7.33 | 59.7% | Git `50201e46`，同构单层 body、五槽均匀、七跑一致 |

ifelse 行取原始 A 与最终 C(static)，不取曾经栈物化的 B；收益相对原始链计算。实现分别在 `pvzPerf/Lawn/{Plant,Zombie,Projectile,SeedPacket,Coin,ZenGarden,Challenge,CursorObject}.cpp` 与 `pvzPerf/Lawn/Widget/{StoreScreen,ZombatarColors,ZombatarItems}.cpp`。

以下原始输出为循环**总耗时**，另列以免冒充 ns/次；同属上述锁定复核与范围限制。r3 为预热后 min-of-5；r2plant 的 r1/r2 是同进程两轮，各取 min-of-5，降低率按两轮最小值计算，不补称两进程复核。

| 原分派 → 已落地表 | 旧 → 新总耗时 | 降低 | 原始日志（B/ 下） |
| --- | --- | ---: | --- |
| CursorObject::Draw → kCursorDrawCases | 120935300 → 99015400ns | 18.13% | `r3/t16_cursor.lpe.out` |
| BossSpawnAttack → kBossSpawnTracks | 482260400 → 403634500ns | 16.30% | `r3/b_zombie_events.lpe.out` |
| BossHeadSpit → kBossHeadTracks | 505164300 → 448182900ns | 11.28% | 同上，独立 case |
| 玉米炮状态 → kCobCannonStateCases | 两轮 22575300/22540800 → 20225800/20251500ns | 10.27% | `r2plant/bench_plant.lpe.out` |
| 仙人掌状态 → kCactusStateCases | 两轮 69724900/69238900 → 57673300/58129700ns | 16.70% | 同上 |

## 数值记录解码与产物体积

测量状态：本节解码耗时、请求量及产物体积均为历史证据，本轮未重测，当前项目值待更新。

reanim 原 IDT4 非字幕文本、长度槽和临时字符串构造 → IDT5 数值元数据、编译期 ID 与段表，真实 UI 字幕保留。**锁定对拍**：LP14 锁 11x，用户原轮确认；MSVC `/O2 /Ob2 /GL- /fp:precise /OPT:NOICF`，146 记录/2694 轨/404950 帧，九轮 AB/BA；两侧 checksum 均为 `7103195926588035581`。总进程 5.240 秒，前后同负载探针差约 0.37%。

| 模型路径 | 旧中位数 → 新中位数 | 成对变化中位数 |
| --- | --- | ---: |
| resident decode | 44.5916 → 32.1947ms | -27.9249% |
| resident CRC + decode | 143.6580 → 122.6496ms | -14.6380% |

证据：[results.json](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/results.json)、[samples.csv](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/samples.csv)、[run-metadata.json](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/run-metadata.json)，同目录上级 `frequency-before.log`、`frequency-after.log`。百分比是逐对变化中位数，不能用两侧中位数重算后混称同一统计量。

边界：resident 拥有型对象模型，校验/释放在计时外；dummy 资源与容器布局不是游戏 ABI，不含读盘、图像/字体、GPU 上传、完整启动或 FPS。非 UI 字符复制 257 次/10404 请求字节 → 0、临时字符串 259 次/12752 请求字节 → 0；字幕仍 46 次/1008 请求字节。分配请求不等于进程内存，未完成的实际游戏装载配对不补作本项验收。

粒子 compiled 原指针结构转储与名字死槽 → 无指针标量/轨道体、数值区间：112 份旧 v4 **273092B → 114860B，减少 158232B（57.94%）**。这是文件体积，非装载速度或常驻内存；首见定义索引另有每系统 452B 运行时容量。Git `ac6fe907` 保存该 v4 基线；现存 `Tests/evidence/string-numeric-resume-20261010/image-symbol-compact-20261011/particle-native-verification.json` 验证 112 记录、159 具名/63 匿名发射器、8988 轨道流及新体积。该日志旧基线为 native v2 的 278738B，不能冒充上述 v4 的 273092B。

## 外观覆写前移与粒子定义继承（历史过渡实现）

以下保留 IDV1 阶段的结构与字节证据；当前实现已改为 PAV6 同根外观数组，
不再加载独立子定义或在运行时解析父依赖。旧 13-case 依赖测试已由同一路径
的 PAV6 根内外观测试替代，当前结构见后面的 v3.2 小节。

登记日期：2026-10-23。**未做本项前后配对计时，不登记 FPS/CPU 加速百分比，
也不把“预期差异小”写成“实测持平”或“零开销”。** 本节不改变上面的历史测量结果。

粒子图片原先由业务代码在实例生成后覆写，现改为独立的外观定义 ID：
编译期确定各图片的最终图集矩形，加载期完成纹理绑定和继承关系解析；
生成与存档仍使用各自的 ParticleEffect。运行时不再保存图片覆写 ID。
颜色、缩放、帧选择等其他动态 Override 接口仍保留，不能概括为全部覆写都已消失。

需要分开看两项变化：

| 变化 | 已确认的作用 | 性能结论边界 |
| --- | --- | --- |
| 实例生成后的图片覆写 → 预编译外观、加载期绑定 | 去掉原图片覆写赋值及绘制时的覆写选择路径，外观归属由定义表达 | 原来的指针赋值本身很轻；仅改变覆写时机、且输出几何/纹理/批次相同时，不减少 GPU 绘制工作。整局帧时差预期有限，尚未计时；不能把图集布局、批处理等其他变化的收益归到这里 |
| 56 个展开变体 → IDV1 继承记录、行为浅拷贝 | 每个变体保留自己的 emitter/矩形数组及 GPU 绑定；行为标量复制，曲线节点与力场数组共享父定义内存 | 减少重复解码、行为数组分配及其存储；加载期增加父依赖解析。每帧仍直接访问已绑定数据，不查父链。启动时间、峰值/常驻内存和缓存收益未量化 |

本轮产物对比：56 个变体 compiled 合计 **32604B → 5985B，减少 26619B**。
新旧 PAK 仅这 56 个记录变化，图集图片不变；这是文件字节数，不是内存或速度测量。
粒子 ID 与 DAT64 v3 未变化。Vulkan/OpenGL 各通过 13 个继承专项 case，
包括三层共享、父/子两种释放顺序、坏包回滚与重新加载；真实 v3 存档也加载通过。
这些是正确性验证，不是性能基准。

实现与可复跑验证：
[粒子加载与释放](../pvzPerf/Sexy.TodLib/TodParticle.cpp)、
[当前 v6 格式](RESOURCE-V5-FORMAT.md)、
[静态定义生命周期测试（替代旧继承记录测试）](../tools/test-static-definition-runtime.ps1)、
[实际图片与粒子绘制测试](../tools/test-image-runtime.ps1)。

### reanim 图片覆写检查（历史：外观数组迁移前）

本节保留迁移前的静态审计快照，以下 `mImageOverride`、`SyncImage` 和
候选设计描述不代表当前实现。当前结构见下一节；本轮尚未进行帧时对照。

本次去除注释后扫描业务 C++：77 处 `SetImageOverride(...)` 调用，
另有 4 处直接赋值 `mImageOverride = IMAGE_BLANK`。这是静态代码位置数，
包含恢复为 nullptr 的调用，不是效果种类数或每帧调用次数。
分布为 Zombie 51+4、Plant 9、LawnApp 8、GameSelector 5、CreditScreen 2、ZenGarden 2。

`ReanimatorTrackInstance` 仍持有 `Image* mImageOverride`；
`Reanimation::DrawTrack` 在有图像的轨道绘制时检查该指针，
覆写存在时取替代图片的 GPU 纹理及整图矩形。setter 本身是轨道定位后一次指针赋值，
不在这里上传图片。`SyncReanimation` 仍通过 `SyncImage` 保存/恢复轨道覆写，
不能套用 particle 已删除图片覆写存档字段的结论。

| 用途 | 当前例子 | 是否适合全部前移到加载期 |
| --- | --- | --- |
| 生成时选定外观 | 巨人武器、红眼初始头图；戴夫展示的钱袋借用肥料袋动画 | 可把外观编译成共享行为的变体，运行时仍需决定生成哪个变体 |
| 固定部件替换/附件组合 | 植物僵尸用 IMAGE_BLANK 隐去原头，再挂植物动画 | 可研究定义级隐藏或变体，但必须保留附件与轨道布局语义 |
| 受伤外观 | 坚果/高坚果、大蒜、南瓜；头盔、盾牌、断臂、巨人、冰车、投篮车、僵王 | 图片可预编译，血量/部件状态选择仍发生在运行时；组合状态不宜盲目枚举成整套动画 |
| 连续或阶段状态 | 戴夫口型、credits 向日葵唱歌/眨眼、投篮车有球/无球、僵王冰火光效 | 不能把状态选择固定在加载期；可研究预编译外观表或动画轨道 |
| UI/花园/秘技状态 | 菜单按钮悬停、解锁阴影、花盆湿土、胡子和墨镜切换 | 仍需响应交互或状态改变 |

此外，震动、颜色/透明度、额外 additive、轨道分组/隐藏等也有实例级改写，
其中包括伤害反馈、淡出和动画控制，不属于本轮 particle 固定图片替换的迁移范围。
reanim 本轮仅审计，没有迁移或删除这些运行时行为。

补充核查：当前 OpenGL `Submit` 只合并相邻且 texture/blend/coverage/clip 相同的三角形；
`Flush` 对每个 batch 调用 `glBindTexture` 和 `glDrawArrays`。因此正常图集 A、
独立覆写纹理 B、再回 A，在这些状态相同且三段都有可见几何时仍会形成三个 batch。
这是纹理身份改变造成的批次拆分，与是否经过 ImageSymbol 注册无直接关系。
将替代图片编入同一图集有机会合并这些相邻批次；把覆写时机前移但仍使用另一张
独立纹理，不能消除该成本。尚未对整局 draw-call 数或帧时做前后测量。

`IMAGE_BLANK` 的源为 `images/blank_.gif`，经现有逻辑图像解码路径得到
107×34 RGBA，alpha 全零。可研究零面积矩形表示“轨道仍有效但不提交图像几何”；
不能简单改成现有无图分支的 `return false`：`DrawRenderGroup` 把
`!aTrackDrawn` 传给 `AttachmentDraw`，后者结合 `mDontDrawIfParentHidden`
决定是否隐藏附件。植物僵尸的替换头部需要保留这项轨道/附件语义。

兼容外观变体可设计成只切换定义身份与定义指针，保留实例的时钟、轨道数组和附件，
无加载、上传或重新初始化。但须由编译器保证轨道顺序/ID、帧数/时间轴及行为布局兼容，
并为变体生成正确的轨道索引/attacher 元数据。现有代码还按 mReanimationType 做
动画类型识别；需区分外观身份与行为家族，不能仅更改一个 ID 就宣称已安全切换。
这部分仍为方案，未实现、未登记性能收益。

源代码定位：
[覆写绘制与 setter](../pvzPerf/Sexy.TodLib/Reanimator.cpp)、
[植物受伤外观](../pvzPerf/Lawn/Plant.cpp)、
[僵尸外观与状态](../pvzPerf/Lawn/Zombie.cpp)、
[覆写存档](../pvzPerf/Lawn/System/SaveGame.cpp)。

### reanim/particle 根定义外观数组与 v3.2 存档

当前每个根 ReanimationType 只保存一次轨道、关键帧、字体、文本和附件行为。
实例保存 `u32 mVariant`，定义持有按外观排列的 GPU 绑定和
`[variant][image slot]` 四整数矩形表。共享关键帧保存 `u32 image slot`，
不再保存逐轨道 Image 覆写。`none` 只跳过 sprite，保留附件可见性语义。
图片原 cell 与替换整图的选择已在离线阶段解析。

生成目录包含 31 个外观家族、2,717 行（含各家族 base）、166 个 action，
transition 目标占 210,136 字节；行为没有为每行重复分配。整套 VariantId
由 compiler 生成，轨道 option 通过当前 variant 的 transition 切换，并保留
其他轴的状态。`Root_V*` 尾 glob 只在配置明确声明时共享图集。
这不等同于所有外观自动合图，也不证明所有相邻绘制都会合批。

DAT64 v3.2 使用 major 3、minor 2、schema `0x10735`，Reanimation 原有
四字节空隙保存 variant。每个轨道物理删除八字节图片指针保留区及四字节
图片 ResourceId 附加字段。真实旧布局副本由 868,992 字节变为
833,004 字节，减少 35,988 字节（2,999 轨道 × 12）；这是存档体积，
不是内存、帧时或吞吐收益。旧外观由生成目录和确证的资源别名迁移，
未知组合拒绝输出，原文件不覆盖。

最终 v3.2 使用 major 3、minor 2、schema `0x10735`，粒子也使用单根定义
共享行为和内部 appearance 数组。ParticleEffect 恢复原版 106 项顺序，
56 个旧独立外观转换为根内 variant；ParticleSystem 固定记录偏移 4 的
四字节空隙保存该 variant，不增加保存记录字节数。真实副本为
833,004 字节。冻结的 162 项旧身份映射只存在于离线转换器，新游戏只接受
v3.2，不用同一 header 猜测两种粒子编号布局。
转换器只支持原版 DAT、DAT64 v1、v2、v3.2。未发布 v3.0/v3.1 的
输入、CLI 目标和自动识别转换路径均已删除，遇到对应头部明确拒绝；
冻结的内部粒子身份映射仍用于受支持格式之间的完整语义比较。
历史 879 项 ResourceId、图片类型判断与确证别名已移到转换器专属的
`FrozenResourceIds.h`，编号、双向重映射和外观 ordinal 不变；
转换器及 reanim 存档目录生成器不再依赖程序的 ResourceId。
两后端转换器及 appearance tests 重新构建，CTest 各 2/2，部署副本的
完整 CLI 回归通过；7 项 program image 测试包含历史编号和依赖边界保护。
收窄格式后，两后端转换器和三个专项测试目标均重新构建通过，
各自 CTest 3/3；两份 `Release/data` 转换器均通过 CLI 回归，
包括未发布版本、混用头部和旧目标拒绝且不创建输出、不改动输入。

本轮新增结构和转换正确性验证，尚未进行整局 draw-call 或 CPU/GPU 帧时
前后测量，因此不登记性能百分比。资源协议见
[RAV7/PAV6 与外观数组](RESOURCE-V5-FORMAT.md)，存档边界见
[v3.2 转换协议](DAT-DAT64-CONVERSION.md)。
最终 Vulkan 与 Win7 OpenGL Release 构建、两后端的图片运行时测试均通过。
当前 v3.2 真实转换副本在两后端均完成原生加载、保存、重载：
187 个 reanimation（36 个非默认外观）的 root/variant 和 17 个粒子系统
（3 个非默认外观）的 base/variant 快照完全相同，保留 50 个僵尸和 87 株植物。
两后端的粒子与 reanimation 越界 variant 拒绝测试也均通过；只修改独立副本，
原输入保持不变。833,004 字节的当前副本 SHA256 为
`73B2C45F32B7DE5287073101A27615DA8083557D3EE308C14069446515896B53`；
v3.2 再次转换字节稳定。本轮 21 项相关 CTest 全部通过。
这些结果验证资源和保存语义，不将隐藏测试进程的运行时间登记为游戏性能。

### ResourceId 退役与加载计划

运行时混合 `ResourceId`、879 槽表、`ResourceReference`、指针反查 map 和
十个旧 getter/reverse-lookup 接口已删除。NRSC2 只存分组加载参数，
生成的 C++ 按具体变量执行加载与对应逆序释放，不保留新的混合资源编号。
29 组共 708 个目标：520 图片、168 音效、20 字体。额外删除了 47 个
没有加载绑定和业务消费者的旧图片全局声明/定义，当前图片声明、定义、
加载目标、释放目标和 ImageSymbol 集合严格相同。

Manifest 只解析一次；每组加载完成即销毁临时参数及字体引用关系。
常驻图片 shared owners 直接按现有 dense ImageSymbol 索引，字体由命名指针
持有，音效保留声音后端句柄。标题图在 `ShowGameSelector` 创建主界面前释放；
重复释放及不同符号共享同一路径图片的生命周期已验证。

Vulkan 与 OpenGL 的原生隐藏测试均完整加载全部 708 项，实际解码 168 个
声音但不播放，检查 volume/pan、所有图片和字体字形页已上传且 CPU 解码数据
已释放、所有临时计划为空、完整释放与重复关闭安全。两后端 v3.2 存档
加载/保存/重载通过，玩家输入文件保持不变。

查找审计：声音源由后端句柄直接索引数组，GPU 纹理绑定号直接读取纹理
对象的 `slot`；没有恢复资源指针到 ResourceId 的 map。文件路径共享缓存、
渲染器纹理所有权容器及字体字符映射仍各有用途，不能把本次结果描述成
全工程零 map。未测得帧时或 FPS 改善，不登记性能百分比。历史 879 编号
仅冻结在离线转换器，当前 v3.2 协议和外观编号不变。

## 其他历史绘制负载

测量状态：本节全部子项为历史记录，本轮未重测，当前项目值待更新；原轮现代构建间的对照仅供解释机制，不作现行基线。

以下机制已落地，原轮为 Vulkan Survival 历史逐帧对拍；**未核实原轮 LP14 锁 11x，不登记为当前有效收益**。保留同轮可比较原始变化，不拼接为当前整体加速。现行 D3D12/Vulkan 与原图直绘不能直接继承旧绝对值。

| 原机制 → 已落地机制 | 同轮历史对拍 | 范围与证据 |
| --- | --- | --- |
| 每图元即时 Bind/Draw → 相邻同态游程延迟合并，保持混合顺序 | ON/OFF：p50 532.9/621.2µs（-14.2%），p90 723/981（-26.3%），p99 1087/1459（-25.5%），mean 547/668（-18.1%） | 无校验、同构建交替 A/B、约 13.2k 帧；Git `b0d78ac9`、`ac6fe907`，原日志名 `perf-ab/frame_time_merge_{on,off}_20261005.log`，当前目录无该原件 |
| 每帧 CPU 生成 8192px + 上传 → GPU 焦散直写 | 无校验三轮中位 p50：CPU 447.7 → GPU 329.4µs（-26.4%）；独立校验相位 PoolEffectDraw 152.9 → 58.2µs（-61.9%） | 两种统计不混算；6930 帧×8192px 零差异、含负数边界，bits 重传 13200 → 0；Git `b0d78ac9`、`0b3be516` |
| 每纹理独立描述符绑定 → 顶点携带纹理数组槽位 | 同期无校验三轮中位 p50 329.4 → 192.9µs（-41.4%） | 192.9 为原轮冷机；同代码热机约 225–240µs，不能跨冷热比较；Git `b0d78ac9` |
| 采样器交替绑定、逐游程绑顶点流 → 采样器数组、单绑定流 | 同轮热机 p50 230 → 153.1µs（-33.4%），三轮 152–156；frameDraws 23 → 2、绑定 31 → 10 | 历史场景 CPU 绘制成本与提交计数，不是更新率、上屏率或整局 FPS；Git `b0d78ac9` |

实现证据：`pvzPerf/SexyAppFramework/graphics/vulkan/VulkanRenderer.cpp`、`shaders/game_caustic_cs.comp`、`pvzPerf/Lawn/System/PoolEffect.cpp`。焦散必须保持有符号向零除法语义。上述分阶段结果不相加，也不再发布旧“775 → 153、整体提速 80%”结论。

## 历史未复测的算术收益

测量状态：本节全部子项为历史记录，本轮未重测，当前项目值待更新。

| 原机制 → 已落地机制 | 原始记录 | 范围与证据 |
| --- | --- | --- |
| 常值轨仍间接求值 → 单节点 low==high 直返 | 3.90 → 2.75ns，降低 29.5% | 原轮锁定条件未确认；Git `ae5caaeb` 明记该轮未重建代数基准，不登记当前有效收益；`pvzPerf/Sexy.TodLib/Definition.cpp::FloatTrackEvaluate` |
| 每粒每帧 age/(dur-1) → 缓存倒数乘 | 4.58 → 2.76ns，降低 39.7% | 同上；出生、交叉改写、存档读回三处同步倒数，`TodParticle.cpp`、`pvzPerf/Lawn/System/SaveGame.cpp` |
## 2026-10-23：投掷物离线图集、完整定义静态化

投掷物的 12 张弹体和一张昼夜阴影源图由 DSL 指定，沿用公共精确装箱、
两像素扩边和每图集 60 秒预算。离线 PRJ1 只记录十四项矩形/缩放、两项阴影矩形及
格式/尺寸；运行时一份 GPU 指针和固定内联数组，不为实例增加数据。
全局图片绑定从 520 项缩为 507 项，原十三个具名图片和 ImageSymbolId 均移除。
当前图集 244×134，32696 像素；求解状态 FEASIBLE，面积下界 31746，
gap 2.905554%，未证明最优。完成缓存已保存在源树 atlas-cache 中。

配置显式列出 144 个 reanim 和 106 个 particle 的原有枚举顺序。
生成的静态矩形分别为 126210、550 项，合计 2028160 字节。
这些字节从加载期堆数组改为程序映射的只读数组，不能把全部字节声称为
总内存节省。定义仍直接持有指向对应静态数组的指针，绘制未新增哈希查询或
ID 定位。完整行为也已生成 C++ 静态数据：398381 个 reanim 关键帧、
5158 个粒子曲线节点及其默认参数、力场和全部外观选项不再由运行期解析或分配。
689 段附件动作区间离线确定，运行期直接取范围，删除首次访问时的轨道扫描和缓存分支。
根对象及可修改 backing 数组使用 constinit，GPU 纹理和字幕字体在加载期赋值；
只读矩形和其他常量继续放在静态常量数组。数据仍占用程序映射内存，
不能将定义堆分配的消失等同于全部内存字节消失。
生成器同时输出加载/解绑函数，PNG 上传成功即释放 CPU 解码数据。
运行包不再包含这三类 `.compiled`；当前 934 个包条目含 192 张定义图集、
20 个字体 compiled 及 1 个资源计划。无运行时 ID 的两个旧舞者定义及独占图集不发行。
没有调整存档版本、弹种/动画/粒子 ID，也没有 FPS 百分比测量。

验证覆盖 C++ DSL 正反例、PRJ1 格式和闭包、源像素/扩边/装箱一致性、
配置枚举和运行时目录一致性、C++ 静态枚举断言、静态矩形与离线语料一致性、
静态生成的默认值/行为字段以及当前用户存档副本的读写重载。
Vulkan 和 Win7/OpenGL Release 均构建成功；两后端原生图片测试实际绘制全部
十四种弹体、旋转/缩放/镜像分支、孢子年龄曲线、昼夜和抛射阴影，并核对
40×40/玉米炮原始碰撞尺寸。OpenGL 比较像素通道差不超过 2；Vulkan 在旋转
最近点采样边界有两个独立像素选择相邻源 texel，测试通过逆变换与严格
子像素边界条件确认，而非放宽整图误差；其他像素与全部阴影检查通过。
首次新增原生夹具遗漏 PlayerInfo 导致 Board 构造崩溃，已补上内存中测试
profile，并让硬件异常直接导致测试失败；不修改生产游戏逻辑。

完整静态定义的原生生命周期测试还覆盖全部 144/106 根及其嵌套 backing 数据、
192 张图集共享、重复批量加载、两轮完整释放重载、各定义种类独立解绑与实际 GPU 读回、
工作线程等待绑定取消，以及缺失/损坏/尺寸错误 PNG 的回滚和同进程恢复。
测试只从只读运行包生成 Temp 夹具，不改变用户存档或真实资源包。

## 2026-10-23：Zombatar 编辑器与头像独立图集

209 个全局图片绑定迁移为一份 GPU 图集指针与静态矩形表；
全局 ImageSymbolId 从 507 减为 298，保持连续，CRC 为 B609B53C。
普通资源加载计划从 695 减为 486 项，原有 168 声音和 20 字体不变。
子图不创建 Image 或图片视图，部件表删除 Image**，改为模块内 16 位图片枚举；
按钮使用只保存实际布局、输入状态及外观枚举的专用数据类，不保留通用按钮的无用图片指针。
静态头像、着色遮罩、选项格子和 PNG 导出直接采样图集，
战斗中的 REANIM_ZOMBATAR_HEAD 图集及部件选择机制不变。
大头贴的存档部件与颜色索引不变，没有存档版本调整。

图集由公共装箱器离线生成，1347×2208、两像素扩边、固定方向；
60 秒预算得到 FEASIBLE，面积 2974176、下界 2944583、
gap 0.994998%，未证明最优。完成缓存纳入源树。
这是减少纹理对象、绑定来源和加载描述的结构变化，尚无启动耗时或 FPS 百分比测量。
当前包共 726 项，193 张图集；Zombatar 不发行 compiled 元数据或独立单图。

验证包括全部 209 源图的独立 RGBA 解码、矩形及扩边对拍；
原生绘制对比全部子图的着色、裁剪、局部源矩形、缩放和非整数缩放原点，
以及实际按钮状态、完整头像叠层和 180×180 GPU 到无损 PNG 的往返。
加载/解绑/重载及现有用户存档副本读写重载同时验证，原包和原存档不修改。

## 2026-10-23：NRSC3 与运行时资源 SymbolId 退役

本条接续以上 NRSC2、520/507/298 图片绑定及 Zombatar 图集的历史记录；
原轮数量、包条目和验证结论保留为当时基线，不代表当前构建。
当前运行时 `ResourceId`、`ImageSymbolId` 和字体 SymbolId 均已退役，
`ProgramImageSymbols.h/.cpp` 已删除。普通图片来自 `Resources.h/.cpp`
中的 286 个命名 `Image*`，加载器直接给目标赋值；每个图片绑定由具名
`SharedImageRef` owner 管理，不经 dense 编号数组、资源 slot 或指针反查。
字幕字体加载 credits 组后直接取得 `FONT_BRIANNETOD32`。
离线旧存档转换器的 879 项冻结身份和当前 DAT64 v3.2 布局不变。

NRSC3 临时加载计划含 29 组、286 图片、168 声音和 20 字体，共 474 条步骤。
八个 u32 头字段保存 magic、版本、图片记录数、组数、总记录数、具名绑定
契约 CRC、payload CRC 及字节数；每条记录的四个 u32 元数据为 kind、
flags、同路径缓存 variant 和组内字体引用序号，没有图片身份字段。
生成代码逐项加载和逆序释放；相同物理路径及完整加载配方复用共享缓存，
普通单配方路径的 variant 为零，不为绘制增加身份查找。

QuickPlay 界面代码及其 12 个图片绑定、加载描述符和运行包条目已移除，
12 张原始 PNG 继续保存在 `assets/runtime/images/`。
源图保存与发行引用闭包分别校验；字体字形页及 alpha 配图仍通过完整闭包保护。
图鉴工具改为具名 `images` 记录，定义复用盘点覆盖全部外观，而非仅基础外观。

本条登记结构和协议变化，不登记图集装箱、启动耗时、CPU/GPU 帧时或 FPS 收益。
验证已完成 Win10/Vulkan 与 Win7/OpenGL Release 构建，两者运行包一致：
714 项、193 张图集，SHA256 为
`D46B811039D126980BDE4F8AF51591511B4859C5CB880C575BFEF51A036E16A0`。
58 项相关 Python 测试、13 组专项 CTest、105 项历史包/转换夹具测试及
Win7 导入检查通过。两个后端的图片原生测试均覆盖全部 29 组、
474 条资源、286 张 GPU-only 图片、20 字体及 168 次真实声音解码，
并验证上传即弃、加载计划释放、标题图提前释放、共享别名、逐类像素对比
和重复关闭。两个后端的大头贴完整 209 子图、按钮、头像合成、PNG 导出和重载均通过。
Vulkan 静态定义测试覆盖 144 reanim、106 particle、193 个共享 GPU 图集，
以及缺失/损坏/尺寸错误图集的回滚和同进程恢复。
现有 DAT64 v3.2 存档的加载、写入副本和重载通过；原始存档哈希未变。
测试输出保存在系统 Temp 的 `pvz-symbol-free-tests/`，不在 out 中新增日志。

## 2026-10-23：清除 C++ 图片分格信息，资源计划升级 NRSC4

NRSC3 仍在加载期读取源图行列及已禁用的图片动画字段；NRSC4 删除这些
wire 字段，image tail 只剩一个 `u32 alphacolor`。286 个图片记录共减少
9152 字节，资源计划由 40548 减为 31396 字节。这是协议文件大小变化，
不作为启动速度或 FPS 测量。离线 JSON 作者清单仍描述源图网格，
不支持的图片动画和未离线展开的多格 alpha mask 在编译期明确报错。
相同路径、相同像素加载配方不再因作者网格不同而分裂缓存。

普通 Image、TextureSource、加载器、CPU 合成输入及五个后端的 alpha
合成 API 均不保存纹理分格行列。CPU alpha 输入直接存为 `Image*` 数组，
删除只剩单指针的 AlphaLayer 包装。透明度合成要求底图和 mask 同尺寸，
按同一像素坐标采样。Vulkan push constants 和 Metal 常量从 24 减为
16 字节，DX12 root constants 从 6 减为 4 DWORD；GL/DX9 删除 cells 参数。
保留 alpha 覆盖、colorOnly 的 packed-alpha OR 及原始纹理采用/释放语义。

Win10/Vulkan 和 Win7/OpenGL Release 已构建；两者资源包均为
`6C900A4E5E4C9A718E45EE892366FD2ED89289172601D6727613CA3E8811800B`，
仍为 714 项和 193 张图集。相关 Python 61 项及图集元数据/像素校验 8 项通过。
两个后端的原生渲染测试通过；Vulkan 包含双次重建与零验证层错误。
两个后端的完整资源加载/像素测试，以及 Vulkan 下历史原存档同 hash
副本的读写重载通过，本轮不写 Release/data。Win7 导入检查通过。Vulkan、DX12、DX9、GL
的对应 shader 独立编译检查通过；Metal 在当前 Windows 环境未编译。
NRSC4 需与本轮 EXE 配套；DAT64 v3.2 格式不变。

## 2026-10-23：场景/UI 整图集与作者 DSL

磁铁物件、Almanac 和成就页分别使用 `assets/definitions/ui/` 的 atlas DSL；
固定 UI 直接选择六张石质按钮、十三张对话框部件和五张选卡按钮。
总共 78 张完整源图生成四个 GPU 图集、99 个矩形视图。
原有 sheet 不拆、不重排内部像素、不裁未引用区域；Pogo 三态保留整张
132×86，成就图标保留整张 512×256。view 仅在原矩形上加装箱 origin。
生成的 C++ 保存每模块一个 GPU 指针、静态矩形和必要缩放，游戏不读取新 compiled。
成就数字索引有独立生成的 Icons 表，不依赖 DSL 中 Sprite 的声明顺序。

| 图集 | 源图 / 视图 | 尺寸 | 证明状态 / gap |
| --- | ---: | ---: | --- |
| Magnet | 19 / 21 | 151×862 | FEASIBLE / 4.293880% |
| Almanac | 19 / 19 | 5276×612 | FEASIBLE / 2.295820% |
| Achievements | 16 / 35 | 4728×687 | FEASIBLE / 4.822427% |
| FixedUI | 24 / 24 | 939×219 | FEASIBLE / 4.035674% |

均使用现有非旋转装箱器、两像素扩边和每图集 60 秒预算，未证明最优。
四份完成搜索缓存保存到 `assets/definitions/atlas-cache/`。
普通图片绑定从 286 减为 210，删除 76 对全局声明/定义；资源计划从
474 减为 398 条，仍含 168 声音和 20 字体。场上梯子、磁铁尺寸读取、
大头贴草地背景及跨页按钮也使用相应图集，保留原绘制位置和交互规则。
银币、金币的独立 Coin 绘制仍使用其普通图片，磁铁图集保留对应像素。

新四图集的 RGBA 像素面积为 27,251,404 字节，被移除的 76 张普通图片
为 25,696,188 字节，增加 1,555,216 字节。此数仅比较原始 RGBA 面积，
包含图集留白/扩边和仍需独立消费的像素副本，不包含 GPU 分配对齐或对象
开销，不能当作实测显存差值。这里的目标是减少独立纹理及相邻绘制的
纹理切换来源；没有登记 FPS、帧时或启动时间收益。

Win10/Vulkan 和 Win7/OpenGL Release 构建通过，共用同一运行包：
642 条目、197 图集，SHA256 为
`58444F294A2A03B94708CCFF613F33BAA3B52C8FBC22B3EB130C6EAEF7DF20F7`。
109 项相关 Python 测试覆盖 DSL、包闭包、完整源图/全部 view 的像素、
边框和静态生成。两个后端的原生图片测试均覆盖 32 组 atlas helper 对照、
10 种真实按钮状态、完整 398 条资源、字体、动画/粒子/投掷物。
缩放入口保留原 `mLinearBlend` 与单位缩放采样规则；nearest 严格对拍
避开数学上精确 texel 边界的邻居歧义，linear 和非整数缩放仍覆盖。
两个后端的静态生命周期覆盖四场景图集、全部 99 个视图实际绘制、
CPU decode 立即释放、重复加载/释放及缺失/损坏/尺寸错误后的回滚恢复。
Win7 导入检查和历史同 hash 存档副本的读写重载通过；DAT64 v3.2 不变。
本轮不写玩家数据，测试证据位于系统 Temp 的 `pvz-scene-atlas-tests/`。
