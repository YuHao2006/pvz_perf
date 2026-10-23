# 曲线调用点静态审计

迁移前审计快照日期：2026-10-24。范围为当时工作区 `pvzPerf`，排除 `**/generated/**` 静态生成数据。173 处调用、原函数签名及下面的全量行号表记录的是**曲线接口迁移前**的状态；迁移后的分组状态另列在文末，不覆盖或混用这组基线数字。

以下数字是**源码静态调用点数量**，不是运行时调用次数、对象数量、每帧执行次数或性能采样结果。包含适配函数内部调用；排除声明、定义和注释。多行调用按函数名所在行计数。行号随代码编辑可能变化。

## 汇总

| 函数 | 静态调用点 | 涉及文件 | 整数时间 T | 浮点时间 F | 非时间量 N | 归一化进度 P | 内部适配 W |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| `TodAnimateCurve` | 112 | 18 | 83 | 0 | 29 | 0 | 0 |
| `TodAnimateCurveFloat` | 39 | 12 | 30 | 0 | 5 | 3 | 1 |
| `TodAnimateCurveFloatTime` | 20 | 6 | 0 | 1 | 3 | 16 | 0 |
| `TodCurveEvaluateClamped` | 2 | 1 | 0 | 0 | 0 | 2 | 0 |
| `Curves::*` 限定名直接调用 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 合计 | **173** | **22 个不同文件** | **113** | **1** | **37** | **21** | **1** |

业务调用为 170 处、21 个文件；另有 `TodCommon.cpp` 内 3 处适配调用。各函数的文件数有重叠，不能相加作为不同文件数。

`Curves::*` **限定名直接调用为 0 处**。搜索得到的 `Curves::EaseInOut(a, b, t)` 两处都是注释；大量 `Curves::Linear` 等作为函数指针传参，不是额外调用。`TodCommon.cpp:341` 的曲线函数指针表有 14 个条目，也不是 14 个调用点。

除上述 173 处具名 API 调用外，还有 4 处归一化输入的间接函数指针调用，另列在文末，不与主表重复计数。

分类按输入语义，而不是只看函数名：

- **T**：时间量目前通过 int/tick/minute 等整数接口输入，包括 `TimeCounter` 的隐式投影、整数时间局部变量和周期取模。
- **F**：实际经过时间以浮点输入。当前仅 `ProjectileAge()`，由绝对 ns 时间差算出 double legacy ticks，进入 `FloatTime` 时再窄化为 float。
- **N**：距离、坐标、得分、波数、数量、索引或非归一化进度量，不能直接按纳秒时间改写。
- **P**：归一化动画相位、节点插值比例、加载百分比等无量纲量；部分先乘 50/1000 并截成 int，但语义仍是相位。
- **W**：内部泛用适配器自身的调用，不能再算作一个业务时间使用者。

## 各文件数量

| 文件 | AnimateCurve | Float | FloatTime | Clamped | 合计 |
| --- | ---: | ---: | ---: | ---: | ---: |
| pvzPerf/Lawn/Board.cpp | 22 | 3 | 0 | 0 | 25 |
| pvzPerf/Lawn/Challenge.cpp | 18 | 1 | 0 | 0 | 19 |
| pvzPerf/Lawn/Coin.cpp | 1 | 3 | 0 | 0 | 4 |
| pvzPerf/Lawn/CutScene.cpp | 10 | 1 | 0 | 0 | 11 |
| pvzPerf/Lawn/GridItem.cpp | 12 | 1 | 0 | 0 | 13 |
| pvzPerf/Lawn/LawnMower.cpp | 0 | 2 | 0 | 0 | 2 |
| pvzPerf/Lawn/MessageWidget.cpp | 1 | 2 | 0 | 0 | 3 |
| pvzPerf/Lawn/Plant.cpp | 6 | 5 | 1 | 0 | 12 |
| pvzPerf/Lawn/Projectile.cpp | 0 | 0 | 1 | 0 | 1 |
| pvzPerf/Lawn/SeedPacket.cpp | 1 | 1 | 0 | 0 | 2 |
| pvzPerf/Lawn/System/Music.cpp | 0 | 7 | 0 | 0 | 7 |
| pvzPerf/Lawn/Widget/AwardScreen.cpp | 2 | 0 | 0 | 0 | 2 |
| pvzPerf/Lawn/Widget/ChallengeScreen.cpp | 2 | 0 | 0 | 0 | 2 |
| pvzPerf/Lawn/Widget/CreditScreen.cpp | 1 | 0 | 11 | 0 | 12 |
| pvzPerf/Lawn/Widget/GameSelector.cpp | 2 | 0 | 0 | 0 | 2 |
| pvzPerf/Lawn/Widget/SeedChooserScreen.cpp | 5 | 0 | 0 | 0 | 5 |
| pvzPerf/Lawn/Widget/StoreScreen.cpp | 1 | 0 | 0 | 0 | 1 |
| pvzPerf/Lawn/Widget/TitleScreen.cpp | 6 | 0 | 4 | 0 | 10 |
| pvzPerf/Lawn/Widget/ZombatarItems.cpp | 4 | 0 | 0 | 0 | 4 |
| pvzPerf/Lawn/ZenGarden.cpp | 3 | 0 | 1 | 0 | 4 |
| pvzPerf/Lawn/Zombie.cpp | 15 | 12 | 2 | 0 | 29 |
| pvzPerf/Sexy.TodLib/TodCommon.cpp | 0 | 1 | 0 | 2 | 3 |

## 精度风险与升级分组

1. `TodCommon.h:157–158` 的 `TodAnimateCurveFloat` 和 `TodAnimateCurve` 前三个参数均为 int。`Float` 只说明输出类型；将调用名改为 Float 不会保留纳秒。`BasicTimeCounter::operator Storage()` 在 `TimeCounter.h:94` 起把 ns 四舍五入为 legacy 单位，进入这些接口时高模拟精度已经丢失。
2. T 类优先检查 `mPhaseCounter`、`mStateCountdown`、雾、震动、Coin、音乐淡出和 UI 动画。应使用原 ns 或精确时间差计算比例，再在最终确实需要整数像素/颜色时舍入输出。时间单位需按字段确认；ZenGarden 两处输入是“分钟”，不能机械乘 10ms。
3. 不能只改函数参数类型。`MessageWidget.cpp:305/314` 中 TimeCounter 差值参与普通算术，可能在调用前已经投影为整数；`Challenge.cpp:3124/3131` 接收的 `DrawStormFlash(int theTime)` 本身已丢精度，其上游调用在 3195/3199/3204/3208。雨纹在 3158 先把 `mEffectCounter` 转 int，再在四处曲线中取模。
4. `SeedChooserScreen.cpp:57–60/648–655` 先把 UI wrapping timestamps 转为 uint32 tick 的 duration/elapsed，再传 int。若改 ns，必须同时处理上游差值及原 UI 回卷约定，不能仅替换最后一个曲线调用。
5. P 类应继续使用归一化无量纲接口。`Zombie.cpp:2176` 把 double phase ratio 乘 1000 后传 int；2985 把 ratio 乘 50 存入 `int aCounter`，再供 2989/2993 使用。这三处在曲线求值前人为降低相位分辨率，适合直接归一化。
6. N 类应使用普通实数映射，保留其数量/得分业务语义。尤其 `Board.cpp:7015` 的 float 雾位移和 `Zombie.cpp:4407/5831/5832/10206` 的 float 坐标/高度目前经过 int 参数，存在空间量截断；其中 5831/5832 还显式写了 `(int)mAltitude`。
7. `FloatTime` 20 处中只有 1 处是实际 elapsed time，另 16 处是归一化相位/比例、3 处是距离或宽度。批量按“Time”后缀迁移会混淆单位。
8. 保留命名曲线的端点钳制和回摆族行为，以及整数结果的最终舍入规则；归一化分母为零的约定需在新 API 中明确。当前 `TodCommon.cpp:403/412` 直接除以 end−start，没有独立的零跨度处理。

这里给出调用点迁移分组与风险；新 API 的最终命名、参数合同和实现由独立设计确定，本审计没有修改 C++。

## 全量具名 API 调用点

每项定位为**小节的文件路径 + 行号**，例如首项为 `pvzPerf/Lawn/Board.cpp:1542`。片段保留前三个输入参数，用 `…` 省略输出端点和曲线指针；这三个参数足以识别时间/进度来源。Clamped 的前三个参数则是归一化输入及两个输出端点。

### pvzPerf/Lawn/Board.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1542 | `TodAnimateCurve(50, 0, mChallenge->mChallengeStateCounter, …)` | T |
| 3304 | `TodAnimateCurve(18, 50, aFlags, …)` | N |
| 3323 | `TodAnimateCurve(10, 50, aFlags, …)` | N |
| 3333 | `TodAnimateCurve(14, 100, aFlags, …)` | N |
| 3340 | `TodAnimateCurve(10, 110, aFlags, …)` | N |
| 3350 | `TodAnimateCurve(10, 50, aFlags, …)` | N |
| 3354 | `TodAnimateCurve(10, 50, aFlags, …)` | N |
| 7007 | `TodAnimateCurveFloat(200, 0, mFogBlownCountDown, …)` | T |
| 7011 | `TodAnimateCurveFloat(2000, 0, mFogBlownCountDown, …)` | T |
| 7015 | `TodAnimateCurveFloat(-5, aMaxFogOffset, mFogOffset * Sexy::UpdateDecay(1.1f), …)` | N |
| 7135 | `TodAnimateCurve(12, 0, mShakeCounter, …)` | T |
| 7136 | `TodAnimateCurve(12, 0, mShakeCounter, …)` | T |
| 7289 | `TodAnimateCurve(0, 1000, mSodPosition, …)` | N |
| 7297 | `TodAnimateCurve(0, 1000, mSodPosition, …)` | N |
| 7305 | `TodAnimateCurve(0, 1000, mSodPosition, …)` | N |
| 7922 | `TodAnimateCurve(0, PROGRESS_METER_COUNTER, mProgressMeterWidth, …)` | N |
| 7978 | `TodAnimateCurve(100, 0, mFlagRaiseCounter, …)` | T |
| 7981 | `TodAnimateCurve(0, mNumWaves, aTotalWavesAtFlag, …)` | N |
| 8004 | `TodAnimateCurve(0, 150, mProgressMeterWidth, …)` | N |
| 8152 | `TodAnimateCurve(50, 0, mChallenge->mChallengeStateCounter, …)` | T |
| 8330 | `TodAnimateCurve(50, 0, mChallenge->mChallengeStateCounter, …)` | T |
| 8707 | `TodAnimateCurve(200, 0, mBoardFadeOutCounter, …)` | T |
| 8736 | `TodAnimateCurve(50, 0, mChallenge->mChallengeStateCounter, …)` | T |
| 8741 | `TodAnimateCurve(50, 0, mChallenge->mChallengeStateCounter, …)` | T |
| 11137 | `TodAnimateCurve(50, 0, --mFwooshCountDown, …)` | T |

### pvzPerf/Lawn/Challenge.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1469 | `TodAnimateCurve(90, 30, mChallengeStateCounter, …)` | T |
| 1637 | `TodAnimateCurve(0, BEGHOULED_WINNING_SCORE, mChallengeScore, …)` | N |
| 1988 | `TodAnimateCurve(0, 18, aTotalCount, …)` | N |
| 1992 | `TodAnimateCurve(0, mApp->mGameMode == GAMEMODE_MINIGAME_COLUMN ? 45 : 35, aTotalCount, …)` | N |
| 2062 | `TodAnimateCurve(0, 18, mBoard->CountPlantByType(SEED_LILYPAD), …)` | N |
| 2135 | `TodAnimateCurve(0, SLOT_MACHINE_WINNING_SCORE, aSunMoney, …)` | N |
| 2956 | `TodAnimateCurve(1, 12, mBoard->mCurrentWave, …)` | N |
| 2984 | `TodAnimateCurve(1, 12, mBoard->mCurrentWave, …)` | N |
| 2985 | `TodAnimateCurve(1, 12, mBoard->mCurrentWave, …)` | N |
| 3124 | `TodAnimateCurve(150, 0, theTime, …)` | T |
| 3131 | `TodAnimateCurve(150, 75, theTime, …)` | T |
| 3159 | `TodAnimateCurve(0, 100, aTime % 100, …)` | T |
| 3160 | `TodAnimateCurve(0, 20, aTime % 20, …)` | T |
| 3173 | `TodAnimateCurve(0, 161, aTime % 161, …)` | T |
| 3174 | `TodAnimateCurve(0, 33, aTime % 33, …)` | T |
| 3841 | `TodAnimateCurve(0, ZOMBIQUARIUM_WINNING_SCORE, aScore, …)` | N |
| 5108 | `TodAnimateCurve(0, I_ZOMBIE_WINNING_SCORE, mBoard->mChallenge->mChallengeScore, …)` | N |
| 5387 | `TodAnimateCurve(0, MAX_SQUIRRELS, mChallengeScore, …)` | N |
| 5589 | `TodAnimateCurveFloat(55, 20, mChallengeStateCounter, …)` | T |

### pvzPerf/Lawn/Coin.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 647 | `TodAnimateCurveFloat(0, 400, mDisappearCounter, …)` | T |
| 648 | `TodAnimateCurveFloat(0, 350, mDisappearCounter, …)` | T |
| 649 | `TodAnimateCurveFloat(0, 350, mDisappearCounter, …)` | T |
| 774 | `TodAnimateCurve(15, 0, mFadeCount, …)` | T |

### pvzPerf/Lawn/CutScene.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1223 | `TodAnimateCurve(theTimeStart, theTimeEnd, mCutsceneTime, …)` | T |
| 1249 | `TodAnimateCurve(0, 100, aChooser->mViewLawnTime, …)` | T |
| 1253 | `TodAnimateCurve(250, 350, aChooser->mViewLawnTime, …)` | T |
| 1270 | `TodAnimateCurve(12, 0, mBoard->mShakeCounter, …)` | T |
| 1358 | `TodAnimateCurve(aTimeSeedBankRightStart, aTimeSeedBankRightEnd, mCutsceneTime, …)` | T |
| 1370 | `TodAnimateCurve(aTimeRollSodStart, aTimeRollSodEnd, mCutsceneTime, …)` | T |
| 2331 | `TodAnimateCurve(TimeIntro_PanRightStart, TimeIntro_PanRightEnd, mCutsceneTime, …)` | T |
| 2379 | `TodAnimateCurve(TimeIntro_PresentsFadeIn, TimeIntro_PresentsFadeIn + 300, mCutsceneTime, …)` | T |
| 2380 | `TodAnimateCurve(aTimePanRightStart - 600, aTimePanRightStart - 300, mCutsceneTime, …)` | T |
| 2396 | `TodAnimateCurveFloat(TimeIntro_LogoStart, TimeIntro_LogoEnd, mCutsceneTime, …)` | T |
| 2409 | `TodAnimateCurve(TimeIntro_FadeOut, TimeIntro_FadeOutEnd, mCutsceneTime, …)` | T |

### pvzPerf/Lawn/GridItem.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 152 | `TodAnimateCurve(0, 100, mGridItemCounter, …)` | T |
| 173 | `TodAnimateCurve(0, 1000, aHeightPosition, …)` | N |
| 174 | `TodAnimateCurve(0, 50, aHeightPosition, …)` | N |
| 175 | `TodAnimateCurve(500, 1000, aHeightPosition, …)` | N |
| 180 | `TodAnimateCurveFloat(400, 0, aPlant->mStateCountdown, …)` | T |
| 207 | `TodAnimateCurve(0, 11, i, …)` | N |
| 245 | `TodAnimateCurve(25, 0, mGridItemCounter, …)` | T |
| 386 | `TodAnimateCurve(0, 50, mTransparentCounter, …)` | T |
| 425 | `TodAnimateCurve(50, 0, mGridItemCounter, …)` | T |
| 429 | `TodAnimateCurve(50, 0, mGridItemCounter, …)` | T |
| 433 | `TodAnimateCurve(50, 0, mGridItemCounter, …)` | T |
| 437 | `TodAnimateCurve(50, 0, mGridItemCounter, …)` | T |
| 441 | `TodAnimateCurve(50, 0, mGridItemCounter, …)` | T |

### pvzPerf/Lawn/LawnMower.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 215 | `TodAnimateCurveFloat(0, 100, mRollingInCounter, …)` | T |
| 264 | `TodAnimateCurveFloat(50, 0, mChompCounter, …)` | T |

### pvzPerf/Lawn/MessageWidget.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 305 | `TodAnimateCurveFloat(0, 50, (mDisplayTime - mDuration) * aTextSpeed - aPos, …)` | T |
| 314 | `TodAnimateCurveFloat(0, 50, (mSlideOffTime - mDuration) * aTextSpeed - aPos, …)` | T |
| 480 | `TodAnimateCurve(75, 0, mApp->mBoard->mMainCounter % 75, …)` | T |

### pvzPerf/Lawn/Plant.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1549 | `TodAnimateCurve(200, 50, DistanceToClosestZombie(), …)` | N |
| 1968 | `TodAnimateCurve(50, 20, mStateCountdown, …)` | T |
| 1969 | `TodAnimateCurve(50, 20, mStateCountdown, …)` | T |
| 1980 | `TodAnimateCurve(10, 0, mStateCountdown, …)` | T |
| 2851 | `TodAnimateCurveFloatTime(30.0f, 0.0f, aDistance, …)` | N |
| 3394 | `TodAnimateCurve(50, 0, mBeghouledFlashCountdown % 50, …)` | T |
| 3411 | `TodAnimateCurve(50, 0, mBeghouledFlashCountdown % 50, …)` | T |
| 3482 | `TodAnimateCurveFloat(400, 0, mStateCountdown, …)` | T |
| 3486 | `TodAnimateCurveFloat(70, 0, mWakeUpCounter, …)` | T |
| 3547 | `TodAnimateCurveFloat(100, 0, mStateCountdown, …)` | T |
| 3548 | `TodAnimateCurveFloat(100, 0, mStateCountdown, …)` | T |
| 3549 | `TodAnimateCurveFloat(100, 0, mStateCountdown, …)` | T |

### pvzPerf/Lawn/Projectile.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1122 | `TodAnimateCurveFloatTime(0, 30, ProjectileAge(*this), …)` | F |

### pvzPerf/Lawn/SeedPacket.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 57 | `TodAnimateCurve(0, 5, aPeasCount, …)` | N |
| 162 | `TodAnimateCurveFloat(SLOT_MACHINE_TIME, 0, mSlotMachineCountDown, …)` | T |

### pvzPerf/Lawn/System/Music.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 618 | `TodAnimateCurveFloat(400, 0, mBurstStateCounter, …)` | T |
| 642 | `TodAnimateCurveFloat(400, 0, mBurstStateCounter, …)` | T |
| 675 | `TodAnimateCurveFloat(800, 0, mBurstStateCounter, …)` | T |
| 677 | `TodAnimateCurveFloat(400, 0, mBurstStateCounter, …)` | T |
| 724 | `TodAnimateCurveFloat(800, 0, mDrumsStateCounter, …)` | T |
| 726 | `TodAnimateCurveFloat(50, 0, mDrumsStateCounter, …)` | T |
| 765 | `TodAnimateCurveFloat(mFadeOutDuration, 0, mFadeOutCounter, …)` | T |

### pvzPerf/Lawn/Widget/AwardScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 442 | `TodAnimateCurve(180, 0, mFadeInCounter, …)` | T |
| 461 | `TodAnimateCurve(mAchievementItems[i].mStartAnimTime, mAchievementItems[i].mEndAnimTime, mAchievementAnimTime, …)` | T |

### pvzPerf/Lawn/Widget/ChallengeScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 463 | `TodAnimateCurve(50, 25, mUnlockStateCounter, …)` | T |
| 538 | `TodAnimateCurve(25, 0, mUnlockStateCounter, …)` | T |

### pvzPerf/Lawn/Widget/CreditScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 731 | `TodAnimateCurve(50, 100, mCreditsPhaseCounter, …)` | T |
| 1040 | `TodAnimateCurveFloatTime(aFrameFactor * 189.0f, aFrameFactor * 249.0f, (static_cast<double>(aCreditsReanim->SamplePlayback().clock) / (aCreditsReanim->mFrameCount * ReanimClock::Frame)), …)` | P |
| 1253 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1254 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1261 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1262 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1270 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1271 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1278 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1279 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1518 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |
| 1519 | `TodAnimateCurveFloatTime(0.0f, 1.0f, aFraction, …)` | P |

### pvzPerf/Lawn/Widget/GameSelector.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 949 | `TodAnimateCurve(75, 0, mSlideCounter, …)` | T |
| 950 | `TodAnimateCurve(75, 0, mSlideCounter, …)` | T |

### pvzPerf/Lawn/Widget/SeedChooserScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 59 | `TodAnimateCurve(0, static_cast<int>(aDuration), static_cast<int>(std::min(aElapsed, aDuration)), …)` | T |
| 561 | `TodAnimateCurve(0, 40, mViewLawnTime, …)` | T |
| 570 | `TodAnimateCurve(310, 350, mViewLawnTime, …)` | T |
| 654 | `TodAnimateCurve(0, static_cast<int>(aDuration), aCurveTime, …)` | T |
| 655 | `TodAnimateCurve(0, static_cast<int>(aDuration), aCurveTime, …)` | T |

### pvzPerf/Lawn/Widget/StoreScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 611 | `TodAnimateCurve(50, 110, mStoreTime, …)` | T |

### pvzPerf/Lawn/Widget/TitleScreen.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 88 | `TodAnimateCurve(50, 0, mTitleStateCounter, …)` | T |
| 92 | `TodAnimateCurve(mTitleStateDuration, mTitleStateDuration - 50, mTitleStateCounter, …)` | T |
| 120 | `TodAnimateCurve(100, 60, mTitleStateCounter, …)` | T |
| 124 | `TodAnimateCurve(60, 50, mTitleStateCounter, …)` | T |
| 149 | `TodAnimateCurveFloatTime(0, mTotalBarWidth, mCurBarWidth, …)` | N |
| 282 | `TodAnimateCurve(60, 10, mTitleStateCounter, …)` | T |
| 286 | `TodAnimateCurve(10, 0, mTitleStateCounter, …)` | T |
| 314 | `TodAnimateCurveFloatTime(0, 1, aLoadingPercent, …)` | P |
| 316 | `TodAnimateCurveFloatTime(0, 1, aLoadingPercent, …)` | P |
| 323 | `TodAnimateCurveFloatTime(0, 1, aLoadingPercent, …)` | P |

### pvzPerf/Lawn/Widget/ZombatarItems.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1200 | `TodAnimateCurve(180, 0, mTransitionCounter, …)` | T |
| 1201 | `TodAnimateCurve(180, 0, mTransitionCounter, …)` | T |
| 1235 | `TodAnimateCurve(180, 0, zi.mTransitionCounter, …)` | T |
| 1241 | `TodAnimateCurve(180, 0, zi.mTransitionCounter, …)` | T |

### pvzPerf/Lawn/ZenGarden.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 187 | `TodAnimateCurve(5, 30, aTime, …)` | T |
| 1432 | `TodAnimateCurve(3000, 6000, aCoin->mDisappearCounter, …)` | T |
| 1757 | `TodAnimateCurveFloatTime(20.0f, 5.0f, fabs(aDeltaY), …)` | N |
| 2359 | `TodAnimateCurve(5, 30, PlantGetMinutesSinceHappy(thePlant), …)` | T |

### pvzPerf/Lawn/Zombie.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 1542 | `TodAnimateCurve(200, 0, z.mPhaseCounter, …)` | T |
| 1615 | `TodAnimateCurveFloat(POGO_BOUNCE_TIME, 0, mPhaseCounter, …)` | T |
| 2079 | `TodAnimateCurveFloat(DOLPHIN_JUMP_TIME, 0, z.mPhaseCounter, …)` | T |
| 2176 | `TodAnimateCurveFloat(0, 1000, (static_cast<double>(aBodyReanim->SamplePlayback().phaseNs) / aBodyReanim->mPeriodNs) * 1000, …)` | P |
| 2828 | `TodAnimateCurve(50, 20, mPhaseCounter, …)` | T |
| 2829 | `TodAnimateCurve(50, 20, mPhaseCounter, …)` | T |
| 2846 | `TodAnimateCurve(10, 0, mPhaseCounter, …)` | T |
| 2989 | `TodAnimateCurveFloat(0, 50, aCounter, …)` | P |
| 2993 | `TodAnimateCurveFloat(0, 50, aCounter, …)` | P |
| 3057 | `TodAnimateCurve(130, 40, z.mPhaseCounter, …)` | T |
| 3061 | `TodAnimateCurve(30, 0, z.mPhaseCounter, …)` | T |
| 3102 | `TodAnimateCurve(130, 40, z.mPhaseCounter, …)` | T |
| 3106 | `TodAnimateCurve(30, 0, z.mPhaseCounter, …)` | T |
| 3265 | `TodAnimateCurve(150, 0, mPhaseCounter, …)` | T |
| 3416 | `TodAnimateCurve(50, 0, mPhaseCounter, …)` | T |
| 3420 | `TodAnimateCurve(50, 0, mPhaseCounter, …)` | T |
| 4407 | `TodAnimateCurveFloat(700, 300, (mX), …)` | N |
| 5538 | `TodAnimateCurveFloatTime(0.7f, 1.0f, (static_cast<double>(aBodyReanim->SamplePlayback().phaseNs) / aBodyReanim->mPeriodNs), …)` | P |
| 5697 | `TodAnimateCurve(30, 0, mPhaseCounter, …)` | T |
| 5699 | `TodAnimateCurveFloat(BOBSLED_CRASH_TIME, 0, mPhaseCounter, …)` | T |
| 5700 | `TodAnimateCurveFloat(BOBSLED_CRASH_TIME, 75, mPhaseCounter, …)` | T |
| 5831 | `TodAnimateCurveFloat(BUNGEE_ZOMBIE_HEIGHT, BUNGEE_ZOMBIE_HEIGHT - 400, (int)mAltitude, …)` | N |
| 5832 | `TodAnimateCurveFloat(BUNGEE_ZOMBIE_HEIGHT, BUNGEE_ZOMBIE_HEIGHT - 400, (int)mAltitude, …)` | N |
| 5922 | `TodAnimateCurve(0, 39, mBoard->mMainCounter % 40, …)` | T |
| 5925 | `TodAnimateCurve(0, 39, mBoard->mMainCounter % 40, …)` | T |
| 6010 | `TodAnimateCurveFloat(12, 0, mShieldRecoilCounter, …)` | T |
| 6097 | `TodAnimateCurveFloatTime(0.0f, 0.2f, (static_cast<double>(aBossReanim->SamplePlayback().phaseNs) / aBossReanim->mPeriodNs), …)` | P |
| 10206 | `TodAnimateCurveFloat(BUNGEE_ZOMBIE_HEIGHT - 1000, 100, mAltitude, …)` | N |
| 10313 | `TodAnimateCurve(4000, 5000, mBoard->mCutScene->mCutsceneTime, …)` | T |

### pvzPerf/Sexy.TodLib/TodCommon.cpp

| 行号 | 调用片段 | 分类 |
| --- | --- | --- |
| 404 | `TodCurveEvaluateClamped(aWarpedAge, thePositionStart, thePositionEnd, …)` | P |
| 413 | `TodCurveEvaluateClamped(aWarpedAge, thePositionStart, thePositionEnd, …)` | P |
| 420 | `TodAnimateCurveFloat(theTimeStart, theTimeEnd, theTimeAge, …)` | W |

## 额外的间接归一化求值点

这四处不属于上方四个 API 的 173 处计数；它们调用同一组命名曲线函数。

| 定位 | 源码片段 | 语义 |
| --- | --- | --- |
| `pvzPerf/Sexy.TodLib/TodCommon.cpp:391` | `theCurve(theTime, thePositionStart, thePositionEnd)` | 静态私有 `TodCurveEvaluate` 的归一化转发；未发现该私有函数的其他调用 |
| `pvzPerf/Sexy.TodLib/TodCommon.cpp:397` | `theCurve(theTime, thePositionStart, thePositionEnd)` | Clamped 包装器的归一化转发 |
| `pvzPerf/Sexy.TodLib/Definition.cpp:162` | `TodCurveResolveEval(node.mDistribution)(theInterp, node.mLow, node.mHigh)` | 粒子参数分布插值，不是经过时间 |
| `pvzPerf/Sexy.TodLib/Definition.cpp:178` | `TodCurveResolveEval(aNodeCur->mCurveType)(aTimeFraction, …)` | 参数轨节点间归一化比例，由 rational 节点时间算出 |

实际命名曲线的签名是 `Curves::EaseInOut(t, start, end)` 等，t 在首位；现有注释中的 `(a, b, t)` 示例顺序与声明/定义不一致，升级 API 时应以签名为准。

## 复核方式

先使用以下模式扫描，再排除注释、四处声明和四处定义；仅作文本审计，没有执行编译器 AST 或动态 profiling。

```text
rg -n '\b(TodAnimateCurveFloatTime|TodAnimateCurveFloat|TodAnimateCurve|TodCurveEvaluateClamped)\s*\(' pvzPerf --glob '!**/generated/**'
rg -n 'Curves::[A-Za-z_]+\s*\(' pvzPerf --glob '!**/generated/**'
rg -n 'TodCurveResolveEval\s*\([^;]*\)\s*\(' pvzPerf --glob '!**/generated/**'
```

本快照内每个命中调用的函数名占一行，173 处调用也对应 173 行。声明/定义各四行及一行注释不计入调用；因此原始四 API 匹配为 182 行。后续编辑后应重新扫描，不应把本表数量当成固定代码不变量。

## 迁移后分组状态：UI、MessageWidget、CutScene、Challenge

这组拥有 11 个 `.cpp` 文件，迁移前共 71 处曲线调用。迁移后为 **45 处 `TodAnimateCurveNs` 时间调用 + 26 处实数范围映射**；它是本组状态，不是全仓库新总数。范围内 `TodAnimateCurveFloatTime` 已全部移除，也没有把真实 TimeCounter 直接传入实数范围映射接口。

| 分组 | 整数 ns 曲线 | 实数范围/进度曲线 |
| --- | ---: | ---: |
| 八个 Widget 文件 | 23 | 15 |
| MessageWidget.cpp | 3 | 0 |
| CutScene.cpp | 11 | 0 |
| Challenge.cpp | 8 | 11 |
| 合计 | 45 | 26 |

时间曲线从公开 `.mNanoseconds` 或整数 ns 差值取输入；不经过 legacy tick 投影，也不产生浮点时间。整数像素/颜色输出继续在最终接口舍入。MessageWidget 字符延迟在 ns 中算差和倍率，周期闪烁在 ns 中取模。

`CutScene::CalcPosition` 和 `Challenge::DrawStormFlash` 的真实时间参数已改为 int64 ns，并同步调用方。CutScene 原场景阶段常量、Award 的作者动画边界、Title 的固定持续长度仍可保留作者配置单位，在调用边界显式乘 `10'000'000` 形成整数 ns；运行中的 TimeCounter 不先转回 tick。这些固定作者时长换算不依赖运行 FPS 或 `gUpdateTicks`。

SeedChooser 飞行动画直接按现有 unsigned UI 时钟的 ns 做模差，保留其历史回卷周期；新飞行结束时刻由当前精确时间加 150ms/250ms 生成，避免 `mSeedChooserAge + 整数` 先触发 tick 投影。雨纹同样直接在 ns 中保留原有符号回卷区间，然后取各自周期的余数。

Credit 的脑子移动/动画相位、Title 的加载比例和宽度，以及 Challenge 的得分/数量/波数映射均保留实数范围语义。这次接口迁移不修改存档 schema。

## 迁移后全仓复核（2026-10-24）

再次扫描整个 `pvzPerf`，排除 `**/generated/**`，沿用前文的静态调用计数规则。当前有 **170 处业务调用、21 个业务文件**；其中 **114 处整数 ns 时间调用、56 处非时间量或归一化进度映射**。另有 `TodCommon.cpp` 内 2 处整数输出包装器转发，因此具名公开 API 的总数为 **172 处、22 个文件**。历史 173 处快照保留不变；内部 Clamped 转发的移除和 Ns 包装器的加入使内部计数从 3 变为 2。

| 当前接口 | 业务调用 | 核心内部转发 | 合计 |
| --- | ---: | ---: | ---: |
| `TodAnimateCurveNs`（float/int 重载合计） | 114 | 1 | 115 |
| `TodAnimateCurve`（实数范围、整数输出） | 29 | 0 | 29 |
| `TodAnimateCurveFloat`（实数范围、float 输出） | 27 | 1 | 28 |
| 合计 | **170** | **2** | **172** |

| 业务文件 | 整数 ns | generic int | generic float | 合计 |
| --- | ---: | ---: | ---: | ---: |
| `Lawn/Board.cpp` | 12 | 12 | 1 | 25 |
| `Lawn/Challenge.cpp` | 8 | 11 | 0 | 19 |
| `Lawn/Coin.cpp` | 4 | 0 | 0 | 4 |
| `Lawn/CutScene.cpp` | 11 | 0 | 0 | 11 |
| `Lawn/GridItem.cpp` | 9 | 4 | 0 | 13 |
| `Lawn/LawnMower.cpp` | 2 | 0 | 0 | 2 |
| `Lawn/MessageWidget.cpp` | 3 | 0 | 0 | 3 |
| `Lawn/Plant.cpp` | 10 | 1 | 1 | 12 |
| `Lawn/Projectile.cpp` | 1 | 0 | 0 | 1 |
| `Lawn/SeedPacket.cpp` | 1 | 1 | 0 | 2 |
| `Lawn/System/Music.cpp` | 7 | 0 | 0 | 7 |
| `Lawn/Widget/AwardScreen.cpp` | 2 | 0 | 0 | 2 |
| `Lawn/Widget/ChallengeScreen.cpp` | 2 | 0 | 0 | 2 |
| `Lawn/Widget/CreditScreen.cpp` | 1 | 0 | 11 | 12 |
| `Lawn/Widget/GameSelector.cpp` | 2 | 0 | 0 | 2 |
| `Lawn/Widget/SeedChooserScreen.cpp` | 5 | 0 | 0 | 5 |
| `Lawn/Widget/StoreScreen.cpp` | 1 | 0 | 0 | 1 |
| `Lawn/Widget/TitleScreen.cpp` | 6 | 0 | 4 | 10 |
| `Lawn/Widget/ZombatarItems.cpp` | 4 | 0 | 0 | 4 |
| `Lawn/ZenGarden.cpp` | 3 | 0 | 1 | 4 |
| `Lawn/Zombie.cpp` | 20 | 0 | 9 | 29 |
| 合计 | **114** | **29** | **27** | **170** |

### 剩余 generic 输入逐组核对

56 处 generic 业务调用分为 **37 处非时间量、19 处归一化进度**。未发现将 `TimeCounter`、tick 投影或提前取整的经过时间直接传入 generic 接口的剩余调用。以下行号属于本次迁移后源码，不能套用到前文历史表。

| 文件及行号 | 输入语义 | 数量 |
| --- | --- | ---: |
| `Board.cpp:3304,3323,3333,3340,3350,3354` | 旗帜/波次数量和权重 | 6 |
| `Board.cpp:7015` | 雾的空间偏移 | 1 |
| `Board.cpp:7289,7297,7305,7922,7981,8004` | 草皮位置、进度条宽度及波次位置 | 6 |
| `Challenge.cpp:1637,1988,1992,2062,2135,2956,2984,2985,3844,5111,5390` | 得分、植物数量、阳光数及波数 | 11 |
| `GridItem.cpp:173,174,175,207` | 已求出的高度及绘制索引；高度即使来自动画，也已是空间量 | 4 |
| `Plant.cpp:1549,2851` | 与目标的距离 | 2 |
| `SeedPacket.cpp:57` | 豌豆数量 | 1 |
| `Zombie.cpp:4407,5831,5832,10206` | X 坐标或高度；5831/5832 的 `(int)mAltitude` 是空间精度截断 | 4 |
| `ZenGarden.cpp:1760` | Y 方向距离绝对值 | 1 |
| `TitleScreen.cpp:150` | 加载条宽度 | 1 |
| `Zombie.cpp:2176,2989,2993,5538,6097` | double 动画相位比例；2989/2993 的局部 `aPhase` 也是 double | 5 |
| `CreditScreen.cpp:1040,1253,1254,1261,1262,1270,1271,1278,1279,1518,1519` | 动画时钟归一化比例及文字/脑子移动比例 | 11 |
| `TitleScreen.cpp:315,317,324` | 加载完成比例 | 3 |
| 合计 | 非时间量 37 + 归一化进度 19 | **56** |

ZenGarden 的两处历史分钟输入已改为 Ns 接口：直接比较 `mFrameTime` 与 `mLastNeedFulfilledTime`，正差以 unsigned 运算取得，先钳制到 `[0,1800]` 秒再乘 `1'000'000'000`；未来时间和巧克力状态对应 age 0。曲线范围为 300–1800 秒，输出仍分别为整数 `3000..15000` 和 `0..80`，最终由整数输出重载舍入。原时钟和存档时间本身仍为整数秒，此改动消除了曲线前的整分钟截断，不提高 wallclock 源时钟精度。仅供这两处使用的 `PlantGetMinutesSinceHappy` 声明和定义已移除。

### 核心与间接求值

`TodCommon.h` 的 generic 范围起点、终点、输入均为 double；`TodCurveEvalFn` 与命名曲线的进度参数也为 double。Ns 入口接受三个 `int64_t`，先判断端点并计算局部 unsigned 差，再把差转 double 求比例；支持反向区间和零跨度，避免绝对 ns 浮点化及 signed 极值相减溢出。float/int 是最终输出类型；整数包装器只在输出时 `FloatRoundToInt`。

当前 2 处具名内部调用是 `TodCommon.cpp:401` 的 generic int→float 转发和 `:433` 的 Ns int→float 转发，不计入业务数。另有 4 处间接求值，单独列出且不重复计入 172：

| 定位 | 当前作用 |
| --- | --- |
| `TodCommon.cpp:396` | generic 范围求得 double 比例后调用函数指针 |
| `TodCommon.cpp:427` | Ns 局部整数差求得 double 比例后调用函数指针 |
| `Definition.cpp:162` | `theInterp` 是 float 随机/分布插值因子，不是经过时间 |
| `Definition.cpp:178` | `aTimeFraction` 为 double；输入 `theTimeValue`、rational 节点时间及区间 span 均按 double 求值 |

`Definition.h/.cpp` 的 `FloatTrackEvaluate` 和 `FloatTrackEvaluateFromLastTime` 时间参数均为 double。保留 float 随机插值和最终属性输出符合其语义，不视为旧 tick 时间路径。

全仓 `TodAnimateCurveFloatTime`、`TodCurveEvaluateClamped` 以及 `PlantGetMinutesSinceHappy` 均无剩余源码命中。`Curves::*` 限定名直接调用仍为 0；两处示例注释和 14 项函数指针表不计数。命名曲线内部进度运算为 double，`SinW` 最终调用既有 `FastSin(float)` 时仍会窄化角度；这是现有数学/渲染输出精度边界，不是旧整数 tick 输入。

本次仍是文本调用点及数据来源审计，不是 AST 证明或运行时性能统计。最终复扫使用 `\b(TodAnimateCurveNs|TodAnimateCurveFloat|TodAnimateCurve)\s*\(`，排除注释及对应声明/定义，并将 `Sexy.TodLib/TodCommon.cpp` 的内部调用单独分组。

### 仓库其他目录与验证边界

额外扫描仓库其余源码目录，测试调用与生产调用分别计数：

| 测试文件 | Ns 调用 | generic int | generic float | 合计 |
| --- | ---: | ---: | ---: | ---: |
| `Tests/native/StaticDefinitionRuntimeTests.cpp` | 22 | 1 | 2 | 25 |
| `Tests/native/ImageRuntimeTests.cpp` | 1 | 0 | 0 | 1 |
| 合计 | **23** | **1** | **2** | **26** |

因此本次全仓源码调用为 **198 处、24 个文件**：生产业务 170 + 核心内部转发 2 + 测试 26；按接口为 Ns 138、generic int 30、generic float 30。该数不替代用于比较迁移前后的 `pvzPerf` 172 处。

`ImageRuntimeTests.cpp` 的期望图计算也已改为 Ns，使用 `{0,123456789,300000000}` 纳秒样本，同时直接设置被测投射物的创建时间，覆盖非旧 tick 对齐的缩放。`MusicBurstTests.cpp` 的本地曲线 stub 已改为 Ns 签名，定义本身不计调用点；实际生产音乐控制器代码仍由测试脚本提取运行。工具脚本中的旧调用字符串也不是 C++ 调用点。测试中的直接 `Curves::*` 调用、测试 stub 和生产 API 业务计数不混合。

本次对修改后的 `ZenGarden.cpp` 使用 `out/x64-win32-vulkan/compile_commands.json` 的现有编译参数，初始化 MSVC 环境后追加 `/Zs` 做独立语法检查，返回 0。此检查未运行共享 Ninja 构建或游戏运行时；全量构建与运行时 fixture 的结果由对应验证流程记录。
