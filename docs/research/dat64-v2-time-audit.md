# 原版／DAT64 v1到v2时间字段审计

本页只保存2026-10-21冻结审计的原版字段、偏移、单位及v2扩槽依据，用于离线转换追溯。它不是当前运行时成员清单。当前格式与支持范围见[存档转换](../DAT-DAT64-CONVERSION.md)，时间域见[运行时](../runtime.md)。

v2将列出的旧32位时间槽扩成小端64位纳秒，其余字节保留；ID、数组索引、帧索引与数量不扩展。旧负哨兵按数值换算，例如-1个10ms单位对应-10,000,000ns。原有epoch秒字段不能按10ms时间转换。

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
| Music.mBaseBPM、mBaseModSpeed | v3 为 32 位浮点音乐节拍速率参数，不属于纳秒计时字段 |
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
