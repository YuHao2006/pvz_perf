# 曲线调用点静态审计

审计日期：2026-10-24。范围为当前工作区 `pvzPerf`，排除 `**/generated/**` 静态生成数据；不修改 C++，不编译、不提交。

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
