# 纳秒计时字段与 v5 迁移审计

审计基于 3.3.8beta（2026-11-08）。这是下一次破坏性存档更新的清单，不表示以下字段已经迁移。当前仍写 DAT64 v4。

## 当前刷新调度

运行时 `mZombieCountDown` 已换为 `long long mNextZombieWaveTimeNs`，由 Board 时间比较刷新终点；`mZombieCountDownStart` 已换为原始间隔参数 `mZombieWaveCountdownDurationNs`。

v4 写档仍将绝对终点投影为剩余纳秒，读档再加 Board 时间还原。旧档在大波预告期间使用预告剩余时间重建实际终点。这是兼容处理。v5 应直接规定终点字段及其时间基准，不继续使用旧倒计时名称和布局。

`mHugeWaveCountDown` 尚在，但已经由刷新终点求值，不独立递减；它服务于预告显示及跨阈值事件。v5 可进一步取消持久化的重复剩余值。

## 尚未迁移的计时

`BasicTimeCounter::operator--()` 内部扣的是纳秒步长 `gUpdateIntervalNs`，并记录前次值、处理跨零，不是扣一纳秒。下表并不代表它们仍按固定刷新率倒数。

| 所有者 | 字段／用途 | 迁移约束 |
| --- | --- | --- |
| Board | `mSunCountDown` 天降阳光 | 下次生成终点；等待首次种植等条件会暂停此计时 |
| Board | `mRiseFromGraveCounter`、`mFinalWaveSoundCounter` | 墓碑出怪、最后一波音效终点；事件由状态消费 |
| Board | `mFogBlownCountDown`、`mIceTimer[]`、`mIceTrapCounter`、`mTimeStopCounter` | 各效果的终点，保留独立冻结规则 |
| Board | `mBoardFadeOutCounter`、`mNextSurvivalStageCounter`、`mScoreNextMowerCounter` | 通关、换轮、小推车计分终点，核对 Board 停止而过场继续的阶段 |
| Board | `mTutorialTimer`、`mOutOfMoneyCounter`、`mCobCannonCursorDelayCounter` | 教学、余额警告、玉米炮输入延迟终点 |
| Board | `mShakeCounter`、`mFwooshCountDown`、`mFlagRaiseCounter`、`mCoinBankFadeCount` | 震动、声效、旗帜、钱袋显示的起点或终点；随机采样仍属于模拟 |
| Plant | `mStateCountdown`、`mDoSpecialCountdown`、`mBlinkCountdown` | 状态、技能、眨眼终点；睡眠、被压、蹦极抓取会影响推进条件 |
| Plant / ZenGarden | `mZenProductionCountdown` | 产出终点；巧克力期间当前每次更新扣两次，速率切换时保持剩余进度 |
| Zombie | `mPhaseCounter` | 动作阶段终点；逐阶段核对冻结和 ICE3/ICE4，不能更改事件顺序 |
| Zombie | `mSummonCounter`、`mBossBungeeCounter`、`mBossStompCounter`、`mBossHeadCounter`、`mGroanCounter` | 召唤、技能、叫声终点，保持原随机调用位置和有效推进时间 |
| Challenge | `mChallengeStateCounter` | 被多种小游戏状态复用，需要逐状态核对单位、暂停和重置语义 |
| Challenge | `mConveyorBeltCounter` | 下次发牌终点，与 SeedBank 的同名动画相位不同 |
| Challenge | `mRainCounter`、`mCloudsCounter[6]` | 雷雨、云效果触发终点 |
| ReanimatorTrackInstance | `mBlendCounter` | 混合终点；使用外部传入的动画时间，不反向查询 Board |
| CutScene / MessageWidget | `mCrazyDaveCountDown`、`mSlideOffTime` | 对话及文字滑出起点／终点；`mDisplayTime` 是显示时长参数 |
| CursorObject / ToolTipWidget | `mHammerDownCounter`、`mWarningFlashCounter` | 当前搜索只找到初始化、设置、读取，未找到递减点；先确认是否无效，再删除或恢复推进 |
| ChallengeScreen / AwardScreen | `mUnlockStateCounter`、`mFadeInCounter`、`mAchievementAnimTime` | 解锁、淡入、成就动画的起点／终点 |
| GameSelector | `mStartingGameCounter`、`mCloudCounter[6]`、`mLeafCounter`、`mSlideCounter` | 启动过场、云叶效果、滑动起点／终点 |
| StoreScreen | `mBubbleCountDown`、`mAmbientSpeechCountDown`、`mHatchTimer` | 气泡、闲聊、车门动画终点；`mStoreTime` 是年龄 |
| CreditScreen / TitleScreen / ZombatarItems | `mBlinkCountdown`、`mTitleStateCounter`、`mTransitionCounter` 等 | UI 状态终点；Credits 播放相位还受音乐、暂停和跳转影响 |
| 公共控件 | EditWidget、ScrollbarWidget、WidgetContainer 的计时包装 | 闪烁、重复输入、年龄；先区分时间与更新次数 |

扫描在 Lawn、TodLib 和相关公共控件／音频头文件中发现 **71 个计时包装字段声明**，数组按一个声明计，含同名配置字段及持续时间参数。这个数不是 71 个倒计时，也不包括所有裸整数计数。

## 不机械迁移的字段

- `mFrameLength`、`mAnimTicksPerFrame`、`mLaunchRate`、`mRefreshTime`、`mBlendTime` 是时长或周期参数，清理包装后仍应是纳秒参数，不是到期时间。
- Plant 的 `mAnimCounter` 有到端点后反向、退回一帧的往返动画逻辑，应按相位起点、方向和周期处理，或保留已授权的模拟路径。
- SeedBank 的 `mConveyorBeltCounter` 是传送带动画／移动相位；Challenge 的同名字段才是发牌等待。相位可按年龄求值，卡牌位置仍按当前模拟方案处理。
- 波次、数量、随机选择次数和容量不是时间。粒子复杂力场、速度和位移仍保留现有模拟方案，不恢复公式粒子。

## 性能与正确性要求

1. 仅判断到期时直接比较 `nowNs >= endTimeNs`；只有绘制进度、跨阈值事件等使用点才计算剩余量。
2. 当前包装通常保存当前和前次两个纳秒值。能由当前时间和有效步长推导的旧值不再持久化。局部冻结、变速不能推导时，先保留必要状态。
3. 周期事件要保留超出量时，从旧终点推进下一个终点；每次用 `nowNs + intervalNs` 重排会丢掉超出量。随机和一次性事件按自身原语义处理。
4. 时间由持有者传入。Reanimation、Plant、Zombie、Particle 不识别时间域、不自行调用墙钟。
5. 继续使用整数纳秒，不缓存浮点帧时长倒数。wasm32 也支持 i64，不以 memory64 为前提。
6. 用不均匀步长、暂停恢复、冻结／黄油、变速、状态切换和存读档验证。`==0` 必须改为到期与一次消费，不能只替换变量名。

改造预期减少周期性写入及包装字段占用，并未实测得到收益。如果每次更新又为所有字段重算剩余量，收益可能抵消。实际迁移后再测微基准及无尽。

## v5 与转换器

v5 在字段迁移完成后冻结，明确每个起点／终点的时间基准和无效值。游戏直接读取 v5，原版及 v4 的兼容投影放在离线工具中。目标支持原版 1073、v4、v5 相互转换，新网页工具不提供 v1～v3 输入输出。

转换器在 PvzDevTools 独立维护。游戏外的网页功能可使用 JavaScript 或独立工具 Wasm，但不提取或启动游戏 Wasm、不加载 PAK、不访问正在运行的 Board。原版时间舍入需要明确选择；不能表示的字段明确报错，不静默丢失。v5 尚未定稿，不提供改头冒充的 v5 文件。

2026-11-08 发布范围修正：v5 与批量计时字段迁移暂缓，3.3.8 先保持 v4 兼容。独立工具复用 C++ 转换器的 wasm32 构建，生成、校验、提取、转换和既有卡死修复均在工具记录模型上完成。游戏网页只交换文件字节；已删除隐藏游戏、游戏对象文件生成器和 PAK／音频依赖。v4 初始记录数据和格式契约由 PvzDevTools 冻结维护。
