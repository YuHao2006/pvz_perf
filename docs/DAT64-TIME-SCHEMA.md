# DAT64 v2 时间字段审计

审计日期：2026-10-21。范围为 `LevelSaveFormat::RECORD_LAYOUTS` 的全部 18 类记录、
Board 状态块和含十个 SeedPacket 的 SeedBank。字段定义与实际更新、比较、比例求值用途
共同确定时间语义，不按 `Counter`、`Frame` 等名字机械转换。

共享定义位于 `pvzPerf/Lawn/System/Dat64TimeSchema.h`。v2 版本为 2，schema
为 `0x00010732`，时间采用小端 64 位纳秒；每个列出的旧 32 位时间槽扩为 8 字节。
字段符号性继承旧协议。其余字节保留，ID、数组索引、帧索引和数量不扩展。
负哨兵按数值换算，例如旧 `-1` tick 对应 `-10,000,000 ns`，可以精确往返。

游戏只读写 DAT64 v2；独立转换器可读取 DAT64 v1/v2 和原 DAT。
游戏与转换器均不校验内容 CRC/哈希。头部 `0x20` 原 CRC32
槽已停用，v2 写出为零，读取任意旧值时忽略；手工修改合法载荷字段无需重算。
转换器显式输出 v1 时仍写真实 CRC 供旧 v1 程序使用。48 字节头和其余偏移保持不变，
版本、schema、文件长度与字段边界仍按协议解析。

运行时 `BasicTimeCounter` 的公开 `mNanoseconds` 是真正的 64 位值；
`mPreviousNanoseconds` 是同一更新内阈值事件使用的临时状态，不进入协议。
普通拷贝保留二者，数字赋值使二者相等，反序列化也重置为当前值。
每次 `++/--` 精确加减配置帧间隔的整数纳秒，改变 targetFps 不缩放已有时间。
整数阈值按递增 `old < target <= new`、递减 `new <= target < old` 判断；
倒计时跨零时停在零。周期事件用整数边界分区，细于 10ms 的更新不会重复触发零余数。
计时器之间的比较仅比较当前值，临时历史不参与排序和相等判断。
有符号加减在 int64 边界饱和；unsigned 保留旧 2^32 原单位的循环周期，并保留周期内每个纳秒。
数字常量及隐式数值转换仍使用字段的原单位；旧格式写出只接受明确的精度策略，
不会把运行步数或历史状态当作纳秒保存。

本文偏移均为十六进制。普通记录列出 **1073 对象记录偏移**，通过
`LevelSaveFormat` 段表映射为 DAT64 v1 偏移。Board 列出 **状态块偏移**，
即从 `mPaused` 开始，不能加上保存流中的长度前缀。v2 中字段位置为
`v1Offset + 4 × 位于其前面的时间字段数`。

类别：`elapsed` 是已过时间，`remaining` 是剩余时间，`duration` 是固定时长或
初始时长快照，`timestamp` 是时钟快照。某些复用状态计时器随状态改变递增或递减，
类别写作 `elapsed/remaining`。这些类别说明用途，不改变转换倍率。

## Board：32 个字段

除了表中明确标注的秒、毫秒外，单位均为 1073 tick，1 tick = 10 ms。
Board 对象的 `mPaused` 原偏移为 `0x164`；早期成员的对象偏移减去 `0x164`
即可得到本表偏移。

| 字段 | 旧状态块偏移 | 旧类型 | 类别 / 单位 |
| --- | --- | --- | --- |
| mFogBlownCountDown | 0470 | i32 | remaining |
| mIceTimer[0..5] | 04C0 + 4×i | i32 | remaining |
| mSunCountDown | 53D4 | i32 | remaining |
| mShakeCounter | 53DC | i32 | remaining |
| mMainCounter | 5404 | u32 | elapsed |
| mEffectCounter | 5408 | u32 | elapsed |
| mRiseFromGraveCounter | 5410 | i32 | remaining |
| mOutOfMoneyCounter | 5414 | i32 | remaining |
| mTutorialTimer | 5428 | i32 | remaining，含 -1 哨兵 |
| mZombieCountDown | 5438 | i32 | remaining |
| mZombieCountDownStart | 543C | i32 | duration；波次倒计时初始值 |
| mHugeWaveCountDown | 5440 | i32 | remaining |
| mCoinBankFadeCount | 5490 | i32 | remaining |
| mBoardFadeOutCounter | 549C | i32 | remaining，含 -1 哨兵 |
| mNextSurvivalStageCounter | 54A0 | i32 | remaining |
| mScoreNextMowerCounter | 54A4 | i32 | remaining |
| mFlagRaiseCounter | 54B0 | i32 | remaining |
| mIceTrapCounter | 54B4 | i32 | remaining |
| mFwooshCountDown | 55E0 | i32 | remaining |
| mTimeStopCounter | 55E4 | i32 | remaining |
| mFinalWaveSoundCounter | 55EC | i32 | remaining |
| mCobCannonCursorDelayCounter | 55F0 | i32 | remaining |
| mPlayTimeActiveLevel | 561C | i32 | elapsed，秒 |
| mPlayTimeInactiveLevel | 5620 | i32 | elapsed，秒 |
| mStartDrawTime | 5628 | u32 | timestamp，系统 uptime 毫秒 |
| mIntervalDrawTime | 562C | u32 | timestamp，系统 uptime 毫秒 |
| mPreloadTime | 5638 | i32 | duration，毫秒 |

`LawnApp::UpdatePlayTimeStats` 以 `(tick-last)/1000` 累加游玩秒数。
`Board::StartLevel` 使用 `SexyGetTickCount()` 记录绘制起点，
`Board::DrawDebugText` 用有符号 32 位差值处理毫秒回绕；
`CutScene` 从 `PerfTimer::GetDuration()` 保存预加载毫秒数。
这些时钟与模拟 tick 的精度、起点均不同，必须保留独立倍率。

Board 后段头文件注释有 GOTY 之前的旧偏移。实际成员声明在
`mPrevBoardResult` 后新增了 16 字节，因此 `mPlayTimeActiveLevel` 的旧对象偏移
实际是 `0x5780`，`mGameID` 实际是 `0x57A0`。本表与共享 schema 使用实际布局，
不使用那些已过期的尾部注释。

## 普通记录：71 个字段

本节字段旧存储均为 **i32**，单位均为 **10 ms tick**。`mAnimTicksPerFrame`
和 `mFrameLength` 是每动画帧的时间长度；`mFrame`、`mNumFrames` 等仍是索引或数量。

| 记录 | 字段 | 1073 偏移 | 类别 |
| --- | --- | --- | --- |
| Zombie | mAnimCounter | 38 | elapsed，动画周期相位 |
| Zombie | mGroanCounter | 3C | remaining |
| Zombie | mAnimTicksPerFrame | 40 | duration |
| Zombie | mJustGotShotCounter | 54 | remaining |
| Zombie | mShieldJustGotShotCounter | 58 | remaining |
| Zombie | mShieldRecoilCounter | 5C | remaining |
| Zombie | mZombieAge | 60 | elapsed |
| Zombie | mPhaseCounter | 68 | elapsed/remaining，依状态 |
| Zombie | mZombieFade | 74 | remaining，含 -1 哨兵 |
| Zombie | mChilledCounter | AC | remaining |
| Zombie | mButteredCounter | B0 | remaining |
| Zombie | mIceTrapCounter | B4 | remaining |
| Zombie | mYuckyFaceCounter | C0 | elapsed |
| Zombie | mSummonCounter | 114 | remaining |
| Zombie | mBossBungeeCounter | 134 | remaining |
| Zombie | mBossStompCounter | 138 | remaining |
| Zombie | mBossHeadCounter | 13C | remaining |
| Plant | mAnimCounter | 2C | elapsed，动画周期相位 |
| Plant | mFrameLength | 34 | duration |
| Plant | mDisappearCountdown | 4C | remaining |
| Plant | mDoSpecialCountdown | 50 | remaining |
| Plant | mStateCountdown | 54 | remaining |
| Plant | mLaunchCounter | 58 | remaining |
| Plant | mLaunchRate | 5C | duration，发射间隔 |
| Plant | mShootingCounter | 90 | remaining |
| Plant | mBlinkCountdown | B0 | remaining |
| Plant | mRecentlyEatenCountdown | B4 | remaining |
| Plant | mEatenFlashCountdown | B8 | remaining |
| Plant | mBeghouledFlashCountdown | BC | remaining |
| Plant | mWakeUpCounter | 130 | remaining |
| Projectile | mAnimCounter | 2C | elapsed，动画周期相位 |
| Projectile | mAnimTicksPerFrame | 54 | duration |
| Projectile | mProjectileAge | 60 | elapsed |
| Projectile | mClickBackoffCounter | 64 | remaining |
| Coin | mFadeCount | 3C | remaining |
| Coin | mCoinAge | 4C | elapsed |
| Coin | mDisappearCounter | 54 | elapsed |
| LawnMower | mAnimTicksPerFrame | 18 | duration，当前代码无使用点，保留原时间参数语义 |
| LawnMower | mChompCounter | 20 | remaining |
| LawnMower | mRollingInCounter | 24 | elapsed |
| LawnMower | mSquishedCounter | 28 | remaining |
| GridItem | mGridItemCounter | 18 | elapsed/remaining，依状态 |
| GridItem | mTransparentCounter | 4C | elapsed/remaining，依状态 |
| ParticleEmitter | mSystemAge | 28 | elapsed，初始 -1 |
| ParticleEmitter | mSystemDuration | 2C | duration |
| ParticleEmitter | mEmitterCrossFadeCountDown | 5C | remaining |
| Particle | mParticleDuration | 04 | duration |
| Particle | mParticleAge | 08 | elapsed |
| Particle | mCrossFadeDuration | 38 | duration |
| CursorObject | mHammerDownCounter | 44 | elapsed/remaining，锤击状态 |
| MessageWidget | mDisplayTime | 84 | duration，初始显示时长快照 |
| MessageWidget | mDuration | 88 | remaining，Update 递减 |
| MessageWidget | mSlideOffTime | 294 | duration，退出动画阈值 |
| SeedPacket | mRefreshCounter | 24 | elapsed |
| SeedPacket | mRefreshTime | 28 | duration |
| SeedPacket | mSlotMachineCountDown | 3C | remaining |
| Challenge | mChallengeStateCounter | 58 | elapsed/remaining，依状态 |
| Challenge | mConveyorBeltCounter | 5C | remaining，距下次生成种子 |
| Challenge | mCloudsCounter[0..5] | 90 + 4×i | remaining，云层启动延迟 |
| Challenge | mRainCounter | B4 | remaining |
| Music | mBurstStateCounter | 28 | remaining |
| Music | mDrumsStateCounter | 34 | remaining |
| Music | mFadeOutCounter | 44 | remaining |
| Music | mFadeOutDuration | 48 | duration |
| ReanimatorTrackInstance | mBlendCounter | 00 | remaining |
| ReanimatorTrackInstance | mBlendTime | 04 | duration |

ParticleSystem、Reanimation、Attachment 和 CursorPreview 四类没有需要扩展的
32 位绝对时间或持续时长字段。其他十四类都在上表。

## SeedBank：31 个字段

SeedBank 的旧对象布局中，包数组从 `0x28` 开始，每包 `0x50` 字节，
`mConveyorBeltCounter` 位于 `0x34C`。DAT64 v1 对应数组起点为 `0x38`，
每包 `0x60` 字节，传送带计时器位于 `0x3FC`。

十个包各含上表三个 SeedPacket 时间字段。共享 schema 中它们的 v1 偏移是：

| 字段 | DAT64 v1 偏移 | 旧类型 / 类别 |
| --- | --- | --- |
| mSeedPackets[i].mRefreshCounter | 0068 + 60×i | i32 elapsed |
| mSeedPackets[i].mRefreshTime | 006C + 60×i | i32 duration |
| mSeedPackets[i].mSlotMachineCountDown | 0080 + 60×i | i32 remaining |
| mConveyorBeltCounter | 03FC | i32 elapsed，皮带动画及移动节拍 |

`i ∈ [0,10)`。加上独立 SeedPacket 记录 schema，总计 134 个字段描述实例：
Board 32、普通记录 71、SeedBank 31。

## 保留编码的相关字段

以下内容虽与动画或时间相关，但不是本次 32 位 tick→64 位纳秒槽：

| 字段或数据 | 原语义及保留理由 |
| --- | --- |
| Zombie/Plant/Projectile 的 mFrame、mPrevFrame、mAnimFrames、mNumFrames | 帧索引、帧数量 |
| Reanimation 的 mFrameStart、mFrameCount、mFrameBasePose、mLoopCount | 选取帧区间、姿态索引、循环次数 |
| Reanimation.mAnimTime、mLastFrameTime | float 归一化动画进度 |
| Reanimation.mAnimRate、Zombie.mOriginalAnimRate | float 动画速率 |
| Particle 的 mParticleTimeValue、mParticleLastTimeValue、mAnimationTimeValue | float 归一化进度或动画相位 |
| Emitter 的 mSystemTimeValue、mSystemLastTimeValue | float 归一化进度 |
| GridItem.mMotionTrailFrames[].mAnimTime | 历史 float 归一化动画进度快照 |
| Board.mDrawCount、mIntervalDrawCountStart | 实际绘制次数及次数快照 |
| Board.mCurrentWave、mLastBungeeWave、mWaveRowGotLawnMowered[] | 波号及波号快照 |
| Music.mPauseOffset、mPauseOffsetDrums | BASS byte position 或 packed module order/row |
| Music.mQueuedDrumTrackPackedOrder | packed module order/row |
| Music.mBaseBPM、mBaseModSpeed | 音乐节拍速率参数 |
| SeedPacket.mTimesUsed、Coin.mTimesDropped、Emitter.mParticlesSpawned | 事件次数 |
| Attachment.mNumEffects、各实体ID及池槽 | 数量、身份及代次编码 |
| Particle.mParticleDurationInv | 派生 float 倒数，不入存档 |

Coin 中的 PottedPlant 还含四个 **原本已经是 i64 秒**的 Unix epoch 时间戳：
`mLastWateredTime`、`mLastNeedFulfilledTime`、`mLastFertilizedTime`、
`mLastChocolateTime`。它们在 Coin 的 1073 记录偏移分别是 `0x88`、`0xA8`、
`0xB0`、`0xB8`，DAT64 v1 偏移分别为 `0x90`、`0xB0`、`0xB8`、`0xC0`。
v2 将这四个现有 64 位槽保留为 epoch 秒，不能当成 tick 或放进 32 位扩展列表。
`mFutureAttribute[0]` 是保留的 i64 属性，未建立时间用途。
玩家详情 `PVZUSR64` 是独立格式，不使用关卡 `PVZDAT64` 的这张 schema。

## 验证

`Tests/native/Dat64NanosecondTests.cpp` 是纯协议测试，不创建 Board 或加载真实存档。
它覆盖 18 类记录、Board、嵌套 SeedBank 和独立的字段数量、关键偏移断言；
用非零背景字节检查所有邻接内容完整保留，并测试完整 i32/u32 极值、负哨兵、
非整 tick 的纳秒、严格导出拒绝、nearest 的正负半数舍入和溢出拒绝。
该测试可以直接以 C++20 编译，仅需 `pvzPerf` include 路径，不依赖游戏可执行文件。

`Tests/native/TimeCounterSaveTests.cpp` 还独立核对全部 20 类原生记录的 134 个
字段映射，测试 60/100/144/240/250/1000 FPS 的精确整数纳秒递增递减、跨阈值
相等比较、周期触发、负哨兵、unsigned 回绕和长时间运行精度，并用实际粒子记录的
写入/读取函数验证跨 FPS 的非整 tick 纳秒不变。原生计时器包含当前和前次值，
前次值只是跨阈值判定所需的运行时元数据；磁盘始终只保存一个 8 字节当前值，
读取后将前次值重置为当前值。
