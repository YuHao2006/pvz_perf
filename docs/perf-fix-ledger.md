# 性能总账

保留有明确口径的最终测量及已经落地的机制。下列测量只属于指定历史构建，
不代表后来所有本地改动均已重新测量；原始 EXE 以证据清单中的哈希识别。
未锁 CPU/GPU 的耗时、倍率及排序不登记，功能通过不作为性能收益。

reanim 的 `fullscreen` 轨道直接执行目标空间填充，不构造不会被填充使用的旋转、
缩放和位移矩阵，省去该路径的三角函数及矩阵乘法。粒子常量自旋的稳定段只求当前绝对角，
旧角度仅在重新绑定或离散积分时求值。这两项不增加运行期字段或存档数据；
功能回归不作为整局 CPU 或 FPS 提升的测量结论。

## 固定 Draw

Windows x64 / Win32 / DX12，LP14（0x4000），锁 11x 由用户实机确认。
Release/LTO、关闭图形校验与 RTSS，预热 128 次，每轮 640 个固定 Draw 样本；
32 株植物、40 个僵尸，状态与纹理数量守恒。

| 指标 | 项目实测 |
| --- | ---: |
| CPU Draw 中位数 | 2303.925µs |
| CPU Draw p90 | 2453.100µs |
| 线程周期中位数 | 7065293.25 cycles |
| 固定画面 | 1,920,000 字节零差异 |

这是显式开启旧 smoke 产物的 `DrawScreen` 成本，不含 flush/fence/readback，
不是整局 CPU 或 FPS。正式交付随后关闭 probe 重建，不能继承该产物的运行验收。
原始清单与 CSV：
[固定绘制证据](../Tests/evidence/release-fixed-draw-20261017-35dece7b/runs.json)。

## credits 与统一无尽

Windows 两程序串行使用 LP14、用户指定 25x；不换算具体频率。
Ubuntu 是原生 Wayland/Vulkan 独立记录，游戏 CPU14（APIC64）、采集 CPU15（APIC66），
用户确认 25x 最高倍频上限，允许运行时降频。亲和性不等于锁频，
Windows LP14 的物理身份未与 Linux 核对，不能发布跨系统提升倍率。
11x 实玩由用户取消，X11 尚未实测。

整体 CPU ms/绘制帧 = 累计进程 user+kernel CPU 秒 × 1000 / 累计绘制帧数。
CPU 以单核满载为 100%，占用和 FPS 按有效区间时长加权，
不平均每秒的 ms/帧。FPS 来自已有 mDrawCount，表示生成绘制帧，非显示器实际呈现。
约一秒区间采样不能还原逐帧独立 CPU 耗时。

| credits 程序 | 有效秒数 | 绘制帧 | CPU 秒 | 平均绘制 FPS | CPU 单核 % | CPU ms/绘制帧 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Windows 原版 1073 | 159.999912 | 15,899 | 40.734375 | 99.369 | 25.459 | 2.562072 |
| 项目 Windows DX12 | 159.999711 | 15,999 | 26.203125 | 99.994 | 16.377 | 1.637798 |
| 项目 Ubuntu Wayland/Vulkan | 160.000019 | 15,999 | 11.790000 | 99.993738 | 7.368749 | 0.736921 |

Windows credits 同播放区间的平均 CPU/绘制帧降低 36.075%，绝对减少约 0.924ms；
两者接近 100FPS 上限，不能称为同倍率帧率增长或归因于一项优化。
双方音乐100、音效65、未静音、窗口模式、不等垂直同步，未使用 -nosound。
项目旧版进入 credits 漏更新场景标记，原始记录整段为 other-scene；
只按人工确认的播放区间重算，不混菜单数据。
[credits 原始记录与重算](../Tests/evidence/credits-25x-20261018-001320/)。

| 统一无尽程序 | 有效秒数 | 绘制帧 | CPU 秒 | 平均绘制 FPS | CPU 单核 % | CPU ms/绘制帧 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Windows 原版 1073（暂定） | 391.000513 | 31,678 | 322.437500 | 81.018 | 82.465 | 10.178594 |
| 项目 Windows DX12 | 393.000051 | 39,261 | 211.328125 | 99.901 | 53.773 | 5.382648 |
| 项目 Ubuntu Wayland/Vulkan | 390.000130 | 38,997 | 167.110000 | 99.992274 | 42.848704 | 4.285201 |

Windows 无尽只有一对串行观测，未重复 ABBA。原版 Board 偏移读出的波次等字段不合理，
暂停识别待核实，故原版统计为暂定；项目静音而原版声音状态未记录，
不发布正式跨程序提高百分比。有效段剔除等待、暂停、后台及其他场景，
端点采样可能混入不足一秒的状态切换。
[Windows 汇总](../Tests/evidence/windows-endless-25x/summary.json)、
[哈希](../Tests/evidence/windows-endless-25x/manifest.json)及同目录 raw/analysis CSV 保留。

Ubuntu 按 segment=game、valid=1、前台、场景6（credits）或场景3/模式58（无尽）筛选；
逐线程亲和性检查通过。Ubuntu 每场景仅一次观测，音量/customScale 未留同轮快照，
事后设置不能倒推采样状态，不能当作 Windows 同条件对照。
[Ubuntu 汇总](../Tests/evidence/linux-wayland-20261018/summary.json)、
[环境与 APIC](../Tests/evidence/linux-wayland-20261018/environment-after-run.json)、
[文件哈希](../Tests/evidence/linux-wayland-20261018/manifest.json)保留。

![原版无尽暂定曲线](../Tests/evidence/windows-endless-25x/original-timeline.png)
![项目 Windows 无尽曲线](../Tests/evidence/windows-endless-25x/project-timeline.png)
![项目 Ubuntu 无尽曲线](../Tests/evidence/linux-wayland-20261018/endless-timeline.png)

曲线不压缩时间轴，排除段留缺口，不跨暂停连线；上半幅为 FPS/CPU，
下半幅为该区间平均 CPU ms/绘制帧，不伪造独立逐帧数据。
重算入口为 `Tests/performance/report-windows-game-perf.py` 和
`report-linux-game-perf.py`；credits 不生成图。

## 已落地机制与证据

| 范围 | 最终机制 | 验证与限制 |
| --- | --- | --- |
| reanim 名字与附件 | ReanimTrackId、联合键 MPHF、编译期动作区间；保留重复同名轨道 | `Reanimator.cpp`、`ReanimTrackMphfGlobal.h`；非 UI 字符串退出热路径，真实字幕保留 |
| 粒子名字 | 字典序枚举／前缀区间、首见定义直索引；Override 仍定位活实例 | LP14 锁11x历史微基准：全语料具名查询112.898488→22.828038ns、前缀122.317453→20.820691ns、首见定义68.832877→6.376767ns；只属于原轮热缓存查询，非完整 CrossFade 或 FPS |
| 连续遍历 | reanim 活动／分组掩码、僵尸行段、植物四层格桶、粒子紧凑槽号名册 | 池保持真值，索引维护不改变顺序；原轮锁定遍历样本保留在测试证据，未当当前整局基线 |
| 业务分派 | 原常量赋值链改为静态表，可达行为用函数表 | 表范围与枚举对位校验；不能笼统声称所有 switch 都更慢 |
| 定义与外观 | 一根共享静态行为及外观数组，加载期只绑定 GPU；没有每实例行为复制、父链或旧图片覆写 | C++ 静态映射仍占内存；旧 IDV1 过渡体积与解码成绩不冒充当前值 |
| 资源加载 | NRSC4 按具名绑定加载/释放，运行时资源编号退役，CPU像素上传即弃 | 当前数量和协议见 ASSETS/RESOURCE 格式；未测启动或帧时提升 |
| 图集 | reanim、particle、projectile、Zombatar 和场景/UI 离线图集，共用缓存及两像素扩边 | 源sheet完整保存；60秒可行布局不冒充最优；RGBA面积不等于实测显存 |
| 提交与泳池 | 相邻同态绘制批处理、描述符数组；GPU焦散与静态泳池顶点路径 | 保留绘制顺序及有符号算术；五后端最终结构见 GPU泳池说明，未锁试验耗时不登记 |
| 常驻动画（实验） | GPU 保存关键帧并计算轨道变换；共享实例包，逐轨只交差异数据，结果直接绘制 | 各后端验证边界见 validation；GL 低轨道数切换尚未通过性能门槛，实验默认关闭，不声称全场景收益 |
| 上传内存写入 | DX12 重复 marker 先写 CPU 栈数组，再单次复制到映射上传内存 | 消除链式赋值对目的地址的读取；当前 MSVC 优化汇编及原生像素／性能夹具验证，不登记未锁频耗时 |
| 文字计高 | 折行布局的测量实例只计算指标，不创建空目标 Graphics，不绘制字形 | 实际 Dialog／Quit 布局验证；动态文案、宽度与字体指标仍在运行期求值，未测 FPS 收益 |
| 时间采样 | 共享整数时钟、根运动基准、主步粒子、复用局部年龄、原生宽乘除；线性变速保留旧段未舍入末位置 | 精度与一致性改造不是已测FPS收益；离散碰撞／力场仍可依赖步长 |
| 临时平移恢复 | GameObject、按钮、蜗牛拖影、盾牌及僵王后臂恢复保存原值，不用逆向加减抵消 | 保护父 Graphics 与共享 reanim 矩阵的 float 位值，不新增对象／存档字段；属于精度修复，未测速度收益 |

粒子锁定微基准的完整分布、负载及元数据保留在
[查询证据](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/results.json)、
[原始样本](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/samples.csv)、
[环境](../Tests/evidence/particle-emitter-microbench-20261010-160239-749/run-metadata.json)，
FadeOut 补充为 `Tests/evidence/particle-emitter-fadeout-20261010-161157-045/`。
该负载每次只扫一个小系统，不是每次扫全部222定义，建表和渲染不在区间内。
其他原轮算法证据可通过 Git `ae5caaeb`、`b0d78ac9` 和精选原始记录追溯，
不再在文档重复过程表或未核实锁定条件的数字。

## 历史锁频算法对拍的最终结果

以下均为原轮明确登记的 LP14 锁11x 算法基准；本地后续版本未逐项复测。
保留的是原机制到落地机制的最终两端，不恢复中间设计或未锁频结果。
微基准不代表完整函数、整局或FPS收益；负载、下游桩、缓存和建表范围须与原件一同解读。

粒子名字基准使用 MSVC C++23 `/O2 /Ob2 /GL- /fp:precise /OPT:NOICF`，
112系统/222定义语料、九轮AB/BA，命中与输出checksum一致。单位为ns/查询，
降低率取两侧九轮中位数之比。小系统为1–8定义，不是每次遍历全部222项。
包含共同选择和颜色写入，不含分配、交叉淡化执行、渲染或直索引建表。

| 路径／负载 | 原机制 | 落地机制 | 降低 |
| --- | ---: | ---: | ---: |
| 小系统匿名：空名比较→ID | 32.136155 | 18.318769 | 43.0% |
| 小系统匿名：首字节快路→ID | 24.220093 | 18.277248 | 24.5% |
| 小系统具名：字符串→ID | 66.470412 | 19.359554 | 70.9% |
| 小系统前缀：strlen/比较→区间 | 92.634290 | 18.383265 | 80.2% |
| 小系统前缀：缓存长度比较→区间 | 50.470242 | 18.306419 | 63.7% |
| 全语料匿名：空名比较→ID | 35.652610 | 18.820831 | 47.2% |
| 全语料匿名：首字节快路→ID | 25.232980 | 18.788132 | 25.5% |
| 全语料具名：字符串→ID | 112.898488 | 22.828038 | 79.8% |
| 全语料前缀：字符串→区间 | 122.317453 | 20.820691 | 83.0% |
| gloom_所属系统前缀 | 335.034964 | 45.899545 | 86.3% |
| icetrap所属系统前缀 | 90.341566 | 25.540467 | 71.7% |
| awardray所属系统前缀 | 567.046612 | 56.283233 | 90.1% |
| doommushroom所属系统前缀 | 508.619777 | 47.223432 | 90.7% |
| 小系统定义首见：扫描→直索引 | 43.883524 | 5.989850 | 86.4% |
| 全语料定义首见：扫描→直索引 | 68.832877 | 6.376767 | 90.7% |
| FadeOut，五个含目标的两定义系统 | 48.643760 | 5.977852 | 87.7% |
| FadeOut，全语料合成缺失主导 | 29.648333 | 5.964516 | 79.9% |

遍历对拍保持池顺序和first-match；粒子尾存倒序保留原AddHead语义。
活动掩码覆盖重复轨道及附件兜底。附件夹具每附件一个效果，
下游为空桩，均匀particle/trail/reanim/other；当前trail已退役，不代表当前效果混合。

| 原机制→落地机制 | 原→最终 | 降低 | 原轮证据 |
| --- | --- | ---: | --- |
| reanim全轨扫描→活动掩码 | 32.3→3.12µs/pass | 90.3% | `b0d78ac9`，`bench_reanim_trackwalk.cpp` |
| 每绘制组全扫→分组占用掩码 | 163.3→58.6µs/pass | 64.1% | `ae5caaeb` |
| 僵尸高水位扫→连续行段 | 2733.4→592.8ns | 78.3% | `ef28072e`、`b0d78ac9`；1024槽、本行171 |
| 植物全扫→每格四层桶 | 183.31→24.97ns | 86.4% | `cellbucket/bench_cellbucket.lpe.out`；48植物 |
| 粒子指针链→紧凑名册 | 132.2→2.42µs/pass | 98.2% | `b0d78ac9`，`bench_particle_roster.cpp`；900粒模型 |
| 删除时Find→迭代下标DeleteParticleAt | 801.5→550.3ns | 31.3% | 同上，churn删除 |
| 附件Update：DFS→平面遍历 | 42.81→26.51ns | 38.1% | `todlib/bench_attachment.lpe.out` |
| 附件SetPosition | 81.80→33.69ns | 58.8% | 同上 |
| 附件SetMatrix | 257.14→41.76ns | 83.8% | 同上 |
| 附件Draw | 43.03→30.64ns | 28.8% | 同上 |
| AttachmentDie移除不可达嵌套 | 35.72→30.62ns | 14.3% | 同上 |

常量与分派基准 MSVC x64 `/O2`、N=2M、min-of-5，
原轮锁频复核，`ae5caaeb`保存结果与口径。下表为ns/次，按夹具键分布执行，
不把整段游戏函数或连续枚举switch一般化为同比收益。
日志相对原证据根 `../../_shared/bench35/`，由Git及原件追溯。

| 路径：原链／分派→最终表 | 原→最终ns | 降低 | 日志 |
| --- | --- | ---: | --- |
| kFireProjectiles | 44.40→7.12 | 84.0% | `r4/bench02_fireproj.lpe.out` |
| kDamageRangeFlags | 33.08→6.89 | 79.2% | `r4/bench01_dmgflags.lpe.out` |
| kStoreItemCosts | 40.25→9.22 | 77.1% | `r4/bench15_storecost.lpe.out` |
| kFlowerPotAdjust | 34.12→8.96 | 73.7% | `r4/bench04_flowerpot.lpe.out` |
| kZombieImageOffsetFix | 33.12→9.53 | 71.2% | `r4/bench06_zimgoff.lpe.out` |
| kDrawParams | 48.35→15.42 | 68.1% | `r4/bench10_prodraw.lpe.out` |
| kSeedPacketDrawMetrics | 62.63→26.77 | 57.3% | `r4/bench05_packetdraw.lpe.out` |
| kWalkHeadPos | 30.49→14.66 | 51.9% | `r4/bench07_walkhead.lpe.out` |
| kShootingCounter | 30.06→15.72 | 47.7% | `r4/bench03_shootctr.lpe.out` |
| kShadowParams | 89.66→59.93 | 33.2% | `r4/bench11_proshadow.lpe.out` |
| kImmediateRender | 25.59→18.25 | 28.7% | `r4/bench12_proimmediate.lpe.out` |
| kDynamics直飞判定 | 25.58→18.18 | 28.9% | `r4/bench13_dynamics.lpe.out` |
| kSeedCostOverrides | 39.48→32.87 | 16.7% | `r4/bench14_seedcost.lpe.out` |
| kSeedTypeUpdates | 56.11→48.16 | 14.2% | `r4/bench08_seedupdate.lpe.out` |
| 盆栽高度偏移 | 31.79→8.49 | 73.3% | `ifelse/bench2_potoffset.lpe.out` |
| 植物高度 | 27.21→11.72 | 56.9% | `ifelse/bench7_plantheight.lpe.out` |
| 植物阴影 | 40.46→22.89 | 43.4% | `ifelse/bench5_plantshadow.lpe.out` |
| 发射原点 | 44.31→36.86 | 16.8% | `ifelse/bench8_fire.lpe.out` |
| Coin绘制 | 66.84→56.91 | 14.9% | `ifelse/bench4_coindraw.lpe.out` |
| DrawSeed选择 | 32.98→29.06 | 11.9% | `ifelse/bench1_seedpacket.lpe.out` |
| SetColorMode | 26.74→8.67 | 67.6% | `ui/bench13_ZombatarColors_SetColorMode.lpe.out` |
| DrawCategoryHighlight | 45.56→19.16 | 57.9% | `ui/bench11_ZombatarItems_DrawCategoryHighlight.lpe.out` |
| BeghouledPickSeed | 117.29→51.98 | 55.7% | `ui/bench07_Challenge_BeghouledPickSeed.lpe.out` |
| DrawPlantOverlay | 31.06→21.06 | 32.2% | `ui/bench09_ZenGarden_DrawPlantOverlay.lpe.out` |
| SquirrelFound | 93.51→72.57 | 22.4% | `ui/bench08_Challenge_SquirrelFound.lpe.out` |
| Plant::DoSpecial | 48.02→37.31 | 22.3% | `ui/bench02_Plant_DoSpecial.lpe.out` |
| DrawBossPart五case→五槽函数表 | 18.2→7.33 | 59.7% | `50201e46`，同构单层body、五槽均匀 |

以下为循环总耗时ns，不能误读为ns/次。r3预热后min-of-5；
r2plant两轮在同进程，按两轮最小值计算降低，不补称两进程复核。
ifelse最终为static表，不采用中间栈物化方案。

| 路径 | 原总耗时→最终总耗时 | 降低 | 日志 |
| --- | --- | ---: | --- |
| CursorObject::Draw | 120935300→99015400 | 18.13% | `r3/t16_cursor.lpe.out` |
| BossSpawnAttack | 482260400→403634500 | 16.30% | `r3/b_zombie_events.lpe.out` |
| BossHeadSpit | 505164300→448182900 | 11.28% | 同上，独立case |
| 玉米炮状态 | 22575300/22540800→20225800/20251500 | 10.27% | `r2plant/bench_plant.lpe.out` |
| 仙人掌状态 | 69724900/69238900→57673300/58129700 | 16.70% | 同上 |

IDT4→IDT5解码最终对拍同为LP14锁11x，146记录/2694轨/404950帧，
九轮AB/BA，checksum `7103195926588035581`一致。resident decode中位数
44.5916→32.1947ms，逐对变化中位数−27.9249%；CRC+decode为
143.6580→122.6496ms，逐对−14.6380%。逐对统计不等于两侧中位数直接相除。
该拥有型dummy资源模型不含磁盘、图片、字体、GPU上传、完整启动或FPS；
当前已静态生成行为，不把原解码负载视为当前每次装载仍发生的工作。
[完整结果](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/results.json)、
[样本](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/samples.csv)、
[环境](../Tests/evidence/string-numeric-resume-20261010/reanim-metadata-final/run-metadata.json)。

后续性能验收必须指定同源场景、存档、波次、画幅、音频、缩放、预热、CPU/GPU条件及构建哈希；
串行 ABBA，观测器避开被测核。完整工具入口见
[性能工具](../Tests/performance/README.md)，当前功能验收见[验证说明](validation.md)。
