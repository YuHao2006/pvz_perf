# 时间域线程隔离试验

稳定基线为v3.2（64c38d7）。试验仅在Tests/performance/time_domain_thread_experiment.cpp，未接入生产主循环、EffectSystem或GPU提交；不改变存档。分支experiment/time-domain-workers可直接放弃，main与v3.2保持稳定实现。

## 测量范围

调用实际Reanimation::Advance、GetFrameTime、GetCurrentTransform、MatrixFromTransform，使用生成的普通僵尸行走定义、速率12和整数纳秒时间。每域持有独立动画快照、轨道实例和两份矩阵输出，只共享初始化后不再改写的定义。一个主线程计算battle批次，一个常驻线程计算visual批次。此处的域名表示独立批次，不是读取或修改游戏的时间域侧表。

测三种实现：串行；提交visual后主线程算battle并等待同帧结果；visual允许晚一帧，下一次提交前确认前一任务完成。最后一任务的排空时间计入平均耗时，分位数为每次主循环调用时长。慢worker仍会阻塞下一次提交，尚未实现丢弃过期任务或无阻塞latest-only发布。

全部轨道与按前帧图片可见性过滤两种负载；后者跳过隐藏与无图轨道，但不是完整DrawTrack，不包括颜色、裁剪、附件、字体、顶点生成或GPU上传。快照构建与来自活体游戏的复制成本不在计时内。所有对象使用相同动作和相位，是受控批量试验，不是关卡工作量分布。

Windows MSVC /O2 /GL /LTCG。固定LP14和LP15及OS调度分别测试，频率未控制或验证。每格300帧、三轮，顺序交替；表内为每轮平均耗时的中位数，单位μs。不能把OS与固定LP的差值归因于线程实现，不能推导整局FPS、功耗或手机收益。

| battle＋visual动画数（可见图片轨道） | 串行 | 同帧worker | visual晚一帧 |
| --- | ---: | ---: | ---: |
| 4＋4 | 26.07 | 61.37 | 23.32 |
| 32＋32 | 204.65 | 146.75 | 119.10 |
| 128＋128 | 831.83 | 488.43 | 482.26 |
| 512＋512 | 3574.36 | 2023.16 | 1965.08 |
| 4＋1 | 16.31 | 34.56 | 33.38 |
| 32＋4 | 115.36 | 110.97 | 109.86 |
| 128＋16 | 460.88 | 417.80 | 418.24 |
| 512＋64 | 2007.29 | 1792.37 | 1793.09 |

固定LP的小批量同帧同步明显更贵，延后一帧不能保证降低尾延迟：4＋4的晚一帧p95约60.8μs，串行约26μs。可见图片轨道32＋32的批次并行有收益，但visual只占八分之一时空间缩小；512＋64的同帧收益约10.7%，接近仅搬走较小批次的上限。不能因此给每个时间域都常驻分配线程。

每组规模在计时外对24帧完整已写矩阵前缀做逐字节比较；计时中检查每帧结果，延迟方案单独验证visual流。全部通过。检查只覆盖这个无附件、无震动、无业务回调的受控快照，不是游戏线程安全或完整行为验收。

## 生产依赖审计

- EffectSystem::UpdateAt按时间域选择时间，但reanim和粒子仍共用DataArray及附件池。时间参数不同不会自动产生独占所有权。
- Reanimation::UpdateAt除相位外还会更新混合、震动和attacher；震动调用共享RandRangeFloat，附件可能继续更新、创建或结束其他效果。不能直接把此函数按域放入并行循环。
- 粒子已有每system随机状态，不能误说每粒子每帧都使用全局随机数；但创建system仍从全局Rand取初始种子，池分配、释放及附件引用仍需主线程确定顺序。
- 根运动、动画完成状态等参与僵尸／植物逻辑，必须与当前逻辑帧一致；不是所有visual标记对象都可容忍延迟，UI完成回调和场景切换也可能读取它们。
- worker只读不可变定义是可行的；GPU指针绑定、资源卸载、字体缓存及renderer命令状态仍有生命周期与写入约束。本试验完全不调用图形API。
- 若允许worker跨主循环存在，不能继续依赖主线程会改写的全局步长。任务应带当前纳秒、步长、稳定对象标识及私有输入快照，输出必须在安全点发布。

后续若接入游戏，优先切出只读轨道求值与矩阵批次，先对完整生产绘制状态对拍。池分配／释放、随机事件、附件、逻辑完成事件和GPU提交留在主线程。是否增加运行期缓冲，不等于需要修改存档字段。未达到完整正确性与整局性能门槛前，不把worker接到v3.2生产路径。

## 复测

先构建Windows Vulkan Release，再运行tools/test-time-domain-threads.ps1；输出默认位于Temp，不读写用户存档。脚本复用生产编译／链接参数，仅替换入口点。原始数据、构建命令、源码与产物哈希见[试验证据](../../Tests/evidence/time-domain-threads-20261030/)。

## 实际时钟及共同推进场景

静态调用链核对：动画域枚举只有Visual与Battle。mBattleTimeNs是Board::mLevelTimeNs的发布副本，不是第三个独立动画时钟。

| 时钟／进度 | 当前归属 | 主要停止条件／说明 |
| --- | --- | --- |
| steady_clock墙钟 | 主循环 | 采样实际经过时间与sleep；不是效果对象域 |
| mApplicationTimeNs | SexyAppBase | 实际应用更新推进；Board暂停仍可推进，音乐等使用 |
| mVisualTimeNs | ReanimationHolder，场景负责推进 | 通常LawnApp推进；普通Board暂停冻结，Store是继续推进的例外；Credits接管并随其暂停冻结 |
| mLevelTimeNs | Board | 仅Battle场景有效推进；暂停、选卡过场及time-stop冻结 |
| 水面出生／发布时刻 | PoolEffect | 管理者时间减出生时间得相位；冻结／场景间隙平移出生时间，不是额外的全局时钟 |
| CutScene、选卡、Credits局部计时 | 各界面 | 动画主要复用Visual；局部倒计时及Credits墙钟同步不等于独立工作域 |

正常战斗同时推进Battle和Visual；无尽选卡冻结保留战斗对象，仅Visual继续。普通暂停通常两者都冻结，Store暂停Battle但推进Visual。主菜单、从主菜单进入的图鉴、独立Credits主要只有Visual动画工作。花园等Board场景可能同时有Board时间和Visual对象，不能仅因不是战斗就认定只有一个域；应按实际非空工作批次调度。

应用时钟和输入UI始终可能有轻量工作，不把它算作必须启动worker的第二个大批次。建议只在Battle与Visual都有足量可独立任务时并行；单域及小批量由主线程直接调用同一更新入口。所有权属于管理组件，不以当前执行线程决定，才能安全在单线程与worker之间切换。

当前多数战斗身体动画、攻击及爆炸粒子使用Battle时间，并不是画面上的特效都属于Visual。正常战斗Visual工作量可能很小，因此此前两域等量基准只能表示上限。

裸管理预览Zombie有现成先例：AlmanacDialog::SetupZombie用new Zombie，不进Board池，清理时DieNoLoot后delete。选卡可采用相同生存期模式并保留CUTSCENE语义，但Zombie自身改为裸管理并不自动隔离其reanim、particle、attachment；这些仍经LawnApp和全局EffectSystem访问。雪橇等预览特殊路径及点击命中需单独核对。

本节为静态审计，没有改变生产调度、预览所有权或存档。

## 合并轻量任务及暂停界面复核

用户要求试验将多个轻量任务合并成一次后台批次，不以单个Visual批次较小就预先否决。单域场景仍主线程执行；关卡进行时可评估水面网格／常驻Visual效果与音乐控制维护合批。既有双批次等量基准不能直接代替此方案的测量。

worker不自行读取steady_clock或忙轮询：主循环发布本轮各时钟、步长和只读输入，唤醒阻塞等待的常驻worker；完成后发布结果并继续等待。条件变量／事件的阻塞等待与循环询问任务不同，仍有唤醒和发布成本。不得让主线程每帧Join。

应用更新是SexyAppBase::UpdateFrames：应用时钟、更新统计、鼠标采样、WidgetManager::UpdateFrame、BassMusicInterface::Update及CleanSharedImages。Widget树内含Board，不能把整个应用更新当作可后台执行的轻量服务。输入、控件事件和带GPU资源生命周期的清理继续需要主线程边界。

暂停报纸由DoPauseDialog创建ReanimationWidget，非Zombie。当前分配与UpdateAt均取mVisualTimeNs；LawnApp只在无Board、Board未暂停或打开Store时推进Visual。因此普通暂停报纸也会冻结，是当前时钟归属缺陷。宜由对话框传入应用时间，不能靠恢复整局Visual来使报纸运动。本次仅识别，未修改此生产行为。

Music::MusicUpdate使用应用时间，BassMusicInterface::Update维护slot/check/fade；音乐高潮控制会读Board::mPaused、游戏模式与CountZombiesOnScreen，现有播放／停止／音量调用也直接修改同一控制状态。后台音乐控制需传入状态快照并集中处理命令，不能让worker扫描正在修改的僵尸池。BASS已有播放音频处理，此处试验对象是主线程控制维护而非重写混音器。

1073发行EXE复核：0x40D64F先写scene=2，0x40D66B调用StartLevelIntro；0x43F4B1检查scene=2，0x43F4DA调用PlaceStreetZombies。正常关卡计数在0x4183B0检查scene=3，0x4183E9才增加。选卡预览的创建／更新属于战斗计时停止阶段，可留主线程；此处不是mPaused=true（CutScene更新反而在该标记为true时提前返回）。[反汇编证据](../../Tests/evidence/visual-domain-owners-1073-20261030/retail-disassembly.txt)。

PoolEffectUpdate维护出生／采样基准并写renderer的caustics.timeNs；真正焦散图像由Vulkan compute记录绘制时生成，CPU水面BuildPoolMesh也在DrawPool中计算。若要从主线程搬走水面CPU计算，应生成网格快照，主线程仍负责上传与记录GPU命令；仅把SetCausticsTimeNs挪到worker既没有明显计算收益，也会造成renderer状态跨线程写入。

## 水面出生时间与冻结

寒冰菇不暂停全局Visual。Board在mIceTrapCounter非零时跳过水面更新，其他Visual工作仍可推进。水面已改为出生时间与已发布采样时刻之差求相位；恢复时将未允许推进的时间平移进出生值，渲染快照仍停在旧相位，不会跳跃或补播。发布时刻还用于识别场景未更新间隙及同一时间的重复调用，不保存另一份累计年龄。此处早先依据重建源码判断寒冰菇不冻结闪光，现已被1073发行EXE证据推翻：0x469EFF写入mDontUpdate=1，已修正为冻结。

## Board时钟水面与音乐任务

水面和POOL_SPARKLY在关卡内都由Board时间驱动；UI场景仍由其持有者传入相应时间。执行于visual worker不意味着使用Visual时钟。用户选择普通暂停／选卡随Board停止，并保留寒冰菇的局部冻结。原版初次选卡仍有闪光的行为不再作为当前默认目标。1073 IceZombies的0x469EFF证实闪光冻结标志为true；结束时Board解除。运行时测试直接调用实际Plant::IceZombies，覆盖水面与闪光同时冻结／恢复，而非只修改测试标志。

音乐由控制状态机与BASS播放两部分构成。控制更新包括主旋律／鼓点／hihat声部、高潮进入／退出及淡入淡出；高潮触发会读取屏幕僵尸数，按音乐实际order/row边界切换鼓点，Resync通过调整BPM同步声部。音乐时间不改为Board时间：应用时间与音频播放位置仍是所需输入。移至后台任务需单一持有音乐控制状态，接收暂停、曲目、音量等有序命令及不可变Board状态快照；不得并发读取活体Board或同时从UI改写同一slot。visual任务不得阻塞等GPU完成，否则会拖延音乐控制。
