# 普通程序贴图共享审计

审计日期：2026-10-23。对象为 `pvzPerf/Resources.h` 中移除 QuickPlay 后的 286 个普通 `Image*` 声明。QuickPlay 的 12 张原图保留在源码素材目录，但不进入运行包或 load plan。本次文档记录分析结果，没有实施新的 atlas 合并，也不声称任何 FPS 提升。

## 统计口径

- **286 个命名贴图、286 份不同源文件/解码配方、0 组同配方别名。** 原始资料为当日 `catalog.json` 的图片尺寸、源文件和网格信息，并按当前 `Resources.h` 过滤；复核同一源文件集、宽高、rows/cols 的组合，没有两个不同普通全局名称指向同一配方。这里不声称所有不同文件的像素都不同。
- **59 个贴图有至少两个 C++ 消费模块。** 扫描实际代码中的引用，剔除注释、字符串、自动生成代码、`Resources.h/.cpp` 声明/绑定以及 `CreateImageTexture` 预上传。消费者包括绘制、为后续绘制保存指针、尺寸查询和显式预热绘制；下表对后两类单独标注。模块数不等于纹理副本数：多个模块使用同一个全局指针，本来就共享该指针所指的图片。
- **42 个普通贴图的源图还出现在现有 definition atlas 中。** 展开 `definition.get("variants", [definition])` 后核对源文件；不能只看默认 variant，否则漏掉 5 项。42 张普通贴图自身的原始 RGBA 总量为 **20,572,352 字节**。此数只对普通贴图各计一次，不是删除整个 atlas 能节省的字节数，也不是合并后的净收益。
- 字节数均为 `width × height × 4` 的解码 RGBA，不包含 PNG 压缩、GPU 对齐、atlas 留白/边框和对象开销。候选组的数字不能相加当作已实现节省。

程序贴图 ID 的退役与 atlas 合并是两项独立工作。当前 load plan 通过具名 C++ 指针直接赋值，NRSC3 记录保存 kind、flags、recipe variant 和 font reference，不再保存全局图片身份编号。recipe variant 只在同一路径有不同解码配方时区分缓存对象；它不能成为新的图片 ID。

## 全部 59 个跨模块消费者

路径缩写：`Board`、`Plant` 等为 `pvzPerf/Lawn/<名称>.cpp`；`Almanac`、`GameSelector` 等界面文件为 `pvzPerf/Lawn/Widget/<名称>.cpp`；`PoolEffect` 为 `pvzPerf/Lawn/System/PoolEffect.cpp`；`LawnApp` 为 `pvzPerf/LawnApp.cpp`。下列行号已在本次普通图片 ID 退役、QuickPlay 代码删除后的源码中重新核对。多数为每个模块的首个有效引用，指针赋值的实际绘制发生在接收者中。

| 普通贴图名称 | 消费模块及依据行 | 消费性质与限定 |
|---|---|---|
| IMAGE_ACHEESEMENTS_ICONS | AchievementsWidget:143；AwardScreen:640 | 成就列表和奖励页绘制 |
| IMAGE_ALMANAC | Coin:934；AwardScreen:395 | 掉落物图像选择、奖励页绘制；不是 Almanac 页背景 |
| IMAGE_ALMANAC_GROUNDDAY | Almanac:403；ZombatarScreen:168 | 两页均绘制，Zombatar 的 DrawImage 在 169 |
| IMAGE_BACKGROUND1 | Board:1032；AwardScreen:342；CreditScreen:809 | Board 背景表；奖励页；Credits 的 809 是预热，862/871/899 另有实际绘制 |
| IMAGE_BACKGROUND2 | Board:1033；AwardScreen:396；CreditScreen:810 | Credits 的 810 是预热，878/916 另有实际绘制 |
| IMAGE_BACKGROUND3 | Board:1034；CreditScreen:811 | Credits 的 811 是预热，908 另有实际绘制 |
| IMAGE_BACKGROUND3_GAMEOVER_INTERIOR_OVERLAY | Board:8008；CreditScreen:998 | 两处绘制 |
| IMAGE_BACKGROUND3_GAMEOVER_MASK | Board:8017；CreditScreen:1021 | 两处绘制 |
| IMAGE_BACKGROUND4 | Board:1035；CreditScreen:812 | Credits 仅预热；不能计成第二个可见场景绘制用途 |
| IMAGE_BACKGROUND5 | Board:1036；CreditScreen:813 | Credits 仅预热；不能计成第二个可见场景绘制用途 |
| IMAGE_BACKGROUND5_GAMEOVER_MASK | Board:8019；CreditScreen:1025 | 两处绘制 |
| IMAGE_BACKGROUND6BOSS | Board:1037；AwardScreen:332 | Board 背景表、奖励页绘制 |
| IMAGE_BLANK | ChallengeScreen:156；GameSelector:224；SeedChooserScreen:138 | 三处按钮图片指针赋值，作为空白按钮素材 |
| IMAGE_BRAIN | GridItem:91；CreditScreen:1047 | 格子物件、Credits 绘制 |
| IMAGE_BUG_SPRAY | Board:8228；CursorObject:180；StoreScreen:476 | 工具栏、光标和商店图像 |
| IMAGE_BUTTON_LEFT | ContinueDialog:59；GameButton:16；LawnDialog:222 | 前两处绑定/绘制；LawnDialog 的引用用于按钮布局尺寸 |
| IMAGE_BUTTON_MIDDLE | ContinueDialog:59；GameButton:17；LawnDialog:227 | 同上 |
| IMAGE_BUTTON_RIGHT | ContinueDialog:59；GameButton:18；LawnDialog:225 | 同上 |
| IMAGE_CARKEYS | Coin:935；AwardScreen:397 | 掉落物图像选择、奖励页绘制 |
| IMAGE_CHALLENGE_BACKGROUND | AwardScreen:627；ChallengeScreen:582 | 两页背景绘制 |
| IMAGE_CHOCOLATE | Board:8250；Coin:947；CursorObject:190；GridItem:71 | 工具栏、掉落物、光标、需求图标 |
| IMAGE_COINBANK | Board:8854；StoreScreen:662 | 游戏与商店金币栏绘制 |
| IMAGE_CRATER | Challenge:2464；GridItem:243 | Challenge 和 GridItem 均实际绘制弹坑 |
| IMAGE_CREDITS_PLAYBUTTON | AwardScreen:191；CreditScreen:336 | 两页按钮图片绑定 |
| IMAGE_FERTILIZER | Board:8211；CursorObject:175；StoreScreen:475 | 工具栏、光标、商店 |
| IMAGE_FOG | Board:8972；CreditScreen:691 | 两处雾效果绘制 |
| IMAGE_IMITATERSEED | SeedChooserScreen:212；StoreScreen:469 | 选卡按钮和商店物品图像 |
| IMAGE_OPTIONS_MENUBACK | NewOptionsDialog:117；LawnApp:785 | 对话框绘制/布局；LawnApp 只读宽高以居中 |
| IMAGE_PHONOGRAPH | Board:8239；CursorObject:185；StoreScreen:477 | 工具栏、光标、商店 |
| IMAGE_PLANTSHADOW | LawnMower:330；Plant:4718；TitleScreen:59；ZenGarden:2136；Zombie:10185 | 多类物件阴影；TitleScreen 仅 DrawToPreload |
| IMAGE_PLANTSHADOW2 | GridItem:316；LawnMower:334；Plant:4723；Zombie:10185 | 多类物件阴影 |
| IMAGE_PLANTSPEECHBUBBLE | GridItem:70；GameSelector:849；ZenGarden:2407 | 需求图标/提示气泡 |
| IMAGE_POOL | PoolEffect:72；CreditScreen:909 | PoolEffect 仅取宽高构建网格；Credits 实际绘制 |
| IMAGE_PVZ_LOGO | CutScene:2403；TitleScreen:126 | 两处绘制 |
| IMAGE_REANIM_COIN_GOLD_DOLLAR | Coin:926；Plant:4572 | 金币静态图片选择、磁铁吸取物绘制 |
| IMAGE_REANIM_COIN_SILVER_DOLLAR | Coin:925；Plant:4566 | 银币静态图片选择、磁铁吸取物绘制 |
| IMAGE_REANIM_ZOMBIE_LADDER_5 | GridItem:404；Plant:2445 | 已放置梯子绘制、植物遮挡/磁铁物件；磁铁选择另见 Plant:4550 |
| IMAGE_SCARY_POT | Coin:936；GridItem:320 | 掉落物图像选择、罐子绘制 |
| IMAGE_SEEDBANK | Challenge:2290；CutScene:852；SeedPacket:935 | Challenge/CutScene 读取布局尺寸；SeedPacket 绘制及布局 |
| IMAGE_SEEDCHOOSER_BACKGROUND | Board:4289；SeedChooserScreen:444 | Board 读取宽度；选卡界面绘制 |
| IMAGE_SEEDCHOOSER_BUTTON | Almanac:154；AwardScreen:134；SeedChooserScreen:113 | 三处按钮图片赋值 |
| IMAGE_SEEDCHOOSER_BUTTON2 | AwardScreen:170；ChallengeScreen:139；SeedChooserScreen:156 | 三处按钮图片赋值 |
| IMAGE_SEEDCHOOSER_BUTTON2_GLOW | AwardScreen:171；ChallengeScreen:140；SeedChooserScreen:157 | 三处按钮高亮图片赋值 |
| IMAGE_SEEDCHOOSER_BUTTON_DISABLED | Almanac:157；AwardScreen:137；SeedChooserScreen:116 | 三处按钮禁用图片赋值 |
| IMAGE_SEEDCHOOSER_BUTTON_GLOW | Almanac:158；AwardScreen:138；SeedChooserScreen:117 | 三处按钮高亮图片赋值 |
| IMAGE_SEEDPACKETFLASH | Almanac:383；StoreScreen:591 | 两页选中种子闪光绘制 |
| IMAGE_SHOVEL | Board:8367；CursorObject:142 | 工具栏、光标 |
| IMAGE_SHOVEL_HI_RES | Coin:933；AwardScreen:393 | 掉落物图像选择、奖励页绘制 |
| IMAGE_STORE_SPEECHBUBBLE2 | Challenge:5567；LawnApp:3099 | 提示气泡绘制；LawnApp 选择气泡图片 |
| IMAGE_SUNFLOWER_TROPHY | Coin:945；AwardScreen:353；GameSelector:892 | 掉落物、奖励页和主菜单奖杯 |
| IMAGE_TACO | Coin:938；AwardScreen:399 | 掉落物图像选择、奖励页绘制 |
| IMAGE_TREEFOOD | Board:8292；CursorObject:230；StoreScreen:489 | 工具栏、光标、商店 |
| IMAGE_TROPHY_HI_RES | Coin:932；AwardScreen:374 | 掉落物图像选择、奖励页绘制 |
| IMAGE_WATERDROP | GameSelector:850；ZenGarden:2413 | 主菜单与花园需求图标 |
| IMAGE_WATERINGCAN | Board:8194；Coin:937；CursorObject:169；AwardScreen:401 | 工具栏、掉落物、光标、奖励页 |
| IMAGE_WATERINGCANGOLD | Board:8190；CursorObject:165；StoreScreen:474 | 工具栏、光标、商店 |
| IMAGE_ZEN_GARDENGLOVE | Board:8264；CursorObject:195；StoreScreen:478 | 工具栏、光标、商店 |
| IMAGE_ZEN_MONEYSIGN | Board:8270；CursorObject:200 | 工具栏、光标 |
| IMAGE_ZEN_WHEELBARROW | Board:8152；CursorObject:208；StoreScreen:480 | 工具栏、光标、商店 |

`IMAGE_ACHEESEMENTS_CHINA`、`IMAGE_ACHEESEMENTS_HOLE_TILE`、`IMAGE_SELECTORSCREEN_ACHIEVEMENTS_BG` 还出现在 LawnApp 的 GPU 预上传代码中，但该操作不是另一处语义消费者，故未列入 59 项。

## 全部 42 项普通图像与 definition atlas 的重复源图

表中 `IMAGE_` 前缀省略；atlas 路径均相对运行包。`A/` 表示 `compiled/atlases/`，`R/` 表示 `compiled/reanim/`，`P/` 表示 `compiled/particles/`，文件均以 `.atlas.png` 结尾。每行普通图片独立存在，且其源文件在所列 atlas 中占有区域；多个 variants 指向相同物理 atlas 时只列一次。这些图片的网格配方都是 1×1。

| 图片名称（前缀 IMAGE_） | 普通图 RGBA 字节 | 已存在的物理 atlas |
|---|---:|---|
| AWARDPICKUPGLOW | 123,904 | P/awardpickuparrow |
| BACKGROUND1 | 3,360,000 | A/credits_stage |
| BACKGROUND2 | 3,360,000 | A/credits_stage |
| BACKGROUND3 | 3,360,000 | A/credits_stage |
| BACKGROUND4 | 3,360,000 | A/credits_stage |
| BACKGROUND5 | 3,360,000 | A/credits_stage |
| PLANTSHADOW | 12,384 | A/credits_stage；R/zombie_credits_dance |
| PLANTSHADOW2 | 12,384 | A/credits_stage |
| REANIM_COIN_GOLD_DOLLAR | 8,100 | R/coin_gold |
| REANIM_COIN_SILVER_DOLLAR | 6,880 | R/coin_silver |
| REANIM_COINGLOW | 25,600 | R/coin_gold；R/coin_silver |
| REANIM_CORNPULT_BUTTER_SPLAT | 10,192 | A/credits_stage |
| REANIM_DIAMOND | 14,144 | R/diamond |
| REANIM_SELECTORSCREEN_CHALLENGES_BUTTON | 139,568 | A/selector_clouds |
| REANIM_SELECTORSCREEN_STARTADVENTURE_BUTTON | 193,304 | A/selector_clouds |
| REANIM_SELECTORSCREEN_SURVIVAL_BUTTON | 166,516 | A/selector_clouds |
| REANIM_SELECTORSCREEN_VASEBREAKER_BUTTON | 130,872 | A/selector_clouds |
| REANIM_SELECTORSCREEN_WOODSIGN3_PRESS | 92,628 | A/selector_clouds |
| REANIM_SODROLLCAP | 20,732 | R/sodroll |
| REANIM_STINKY_TURN3 | 19,824 | R/stinky |
| REANIM_TREE_BG | 1,920,000 | R/treeofwisdom |
| REANIM_WALLNUT_BODY | 40,000 | A/appearance_wallnut |
| REANIM_ZOMBIE_BUCKET1 | 16,616 | A/appearance_zombie |
| REANIM_ZOMBIE_BUCKET2 | 16,616 | A/appearance_zombie |
| REANIM_ZOMBIE_BUCKET3 | 16,616 | A/appearance_zombie；P/zombiepail |
| REANIM_ZOMBIE_DIGGER_PICKAXE | 9,024 | A/appearance_digger |
| REANIM_ZOMBIE_FOOTBALL_HELMET | 19,272 | A/appearance_football |
| REANIM_ZOMBIE_FOOTBALL_HELMET2 | 19,272 | A/appearance_football |
| REANIM_ZOMBIE_FOOTBALL_HELMET3 | 19,272 | A/appearance_football；P/zombiehelmet |
| REANIM_ZOMBIE_JACKBOX_BOX | 13,224 | A/appearance_jackbox |
| REANIM_ZOMBIE_LADDER_1 | 37,268 | A/appearance_ladder |
| REANIM_ZOMBIE_LADDER_1_DAMAGE1 | 37,268 | A/appearance_ladder |
| REANIM_ZOMBIE_LADDER_1_DAMAGE2 | 37,268 | A/appearance_ladder；P/zombieladder |
| REANIM_ZOMBIE_LADDER_5 | 37,268 | A/appearance_ladder |
| REANIM_ZOMBIE_SCREENDOOR1 | 32,472 | A/appearance_zombie；R/zombie_credits_screendoor |
| REANIM_ZOMBIE_SCREENDOOR2 | 32,472 | A/appearance_zombie |
| REANIM_ZOMBIE_SCREENDOOR3 | 32,472 | A/appearance_zombie；P/zombiedoor |
| SEEDPACKETFLASH | 14,000 | P/seedpacketflash |
| SPOTLIGHT | 31,000 | A/credits_stage；R/credits_discolights |
| SPOTLIGHT2 | 4,000 | A/credits_stage |
| STORE_SPEECHBUBBLE | 204,960 | A/credits_stage |
| STORE_SPEECHBUBBLE2 | 204,960 | A/credits_stage |

现有 projectile atlas、Zombatar atlas 的源文件与这 286 项没有交集。Zombatar 界面使用 `ALMANAC_GROUNDDAY`，不代表该图已在 Zombatar atlas 内。

普通 `Image*` 代表整张逻辑图像，不能直接替换成某 atlas 的整张 GPU 图片指针而保持原有 DrawImage 语义。若复用已有 atlas，必须把调用上下文改为“纹理指针 + 区域矩形”，保留逻辑尺寸并正确处理源矩形、缩放、过滤及 UV。这样才可能同时删掉独立图片；只让加载器多保存一个 atlas 指针不构成去重。

## 有边界的候选组及实际绘制关系

| 候选组 | 张数 | 源图 RGBA 字节 | 源码依据和判断 |
|---|---:|---:|---|
| 磁铁物件：16 种铁器 + 银币/金币/钻石 | 19 | 450,932 | `Plant::DrawMagnetItems` 在 Plant:4469，4485–4578 从物件类型选图，每槽最后在 4588 或 4592 绘制。相同循环可能依次画不同物件，是有实际相邻绘制依据的小组 |
| 石头按钮 normal/down 左中右 | 6 | 43,056 | GameButton:14–39 固定“左 → 中段循环 → 右”；三段共 atlas 可减少这条图片序列的纹理切换 |
| 对话框边框 | 13 | 576,712 | LawnDialog:283 开始，顶行三段、每行中部三段、底行三段和 header 顺次绘制；比仅按文件名前缀分组有更直接的连续绘制依据 |
| 上述按钮 + 边框 | 19 | 619,768 | 小型 common UI 组；边框到按钮之间有文字/子控件绘制，不能把整页当成一个连续 batch |
| 五种 seedchooser 按钮状态 | 5 | 101,712 | 上表中的跨页按钮绑定可共用同一组区域；normal/glow/disabled 状态不是每帧全部绘制，收益需要观测实际图像序列 |
| 上述 common UI + 五按钮 | 24 | 721,480 | 有限扩展候选，不包含整页背景、字体和 reanim |
| Almanac 名称前缀全集 | 20 | 12,464,760 | `IMAGE_ALMANAC` 是 Coin/Award 的书道具；实际 Almanac 页资源为其余 19 项，不能仅凭前缀判断消费归属 |
| 成就页 ACHEESEMENTS 全集 | 15 | 10,839,596 | AchievementsWidget:107–143 中背景后连续绘制地底装饰，再进入图标/文字交错循环；该组不是 15 张同时持续可见的小图 |

磁铁 16 种铁器的精确集合为：`REANIM_ZOMBIE_BUCKET1/2/3`、`REANIM_ZOMBIE_FOOTBALL_HELMET/HELMET2/HELMET3`、`REANIM_ZOMBIE_SCREENDOOR1/2/3`、`ZOMBIEPOGO`、`REANIM_ZOMBIE_LADDER_1/LADDER_1_DAMAGE1/LADDER_1_DAMAGE2/LADDER_5`、`REANIM_ZOMBIE_JACKBOX_BOX`、`REANIM_ZOMBIE_DIGGER_PICKAXE`，全部有 `IMAGE_` 前缀。其中不少已被 appearance/particle atlas 收录。新增磁铁 atlas 有望改善磁铁循环内的纹理局部性，但若原 definition atlas 保持不动，就仍有源像素重复；是否把这些小图指向已有 atlas，应与模块区域矩形迁移一起评估。

Almanac 的三张 1400×600 大背景合计 **10,080,000 字节**，分别在 `DrawIndex`、`DrawPlants`、`DrawZombies` 中互斥显示。优先考虑其余 16 张页面小图的组，而不是强迫三个大背景与小图共 atlas。`DrawPlants` 的顺序为 Almanac:360 背景、376 选卡图标、392/403 地面、411 植物 reanim、415 卡片；`DrawZombies` 为 544 背景、559–606 窗框与缓存僵尸交错、615 地面、632 僵尸 reanim、634 卡片。字体、缓存图和 reanim 会打断普通 UI 图像的连续 batch。

成就组中八张 1400×225 地底条同样占 **10,080,000 字节**，其余七图为 **759,596 字节**。AchievementsWidget:111 重复 hole tile 70 次，本身已经反复使用同一纹理；合 atlas 的潜在收益主要在 113–120 的不同装饰切换。143 以后每个图标后又有字体绘制，不能推断所有图标会合为一个 batch。页内裁剪和实际可见装饰数量也影响收益。

五张草坪背景、树背景等大图虽在普通图片与 reanim atlas 间重复，但不应因为“重复”就与零散小型 reanim 图集合并。需要分别比较：删除独立图后的常驻字节变化、现有 atlas 的实际尺寸/留白、调用点是否本来连续使用同一 atlas、以及未来按场景加载的代价。已有 `credits_stage`、`selector_clouds`、`appearance_*` 本身是共享物理 atlas，不得把它们的各 definition 重复当作多张 GPU 图片。

## Pool 的专门限制

`PoolEffectInitialize` 在 PoolEffect:15–36 验证 `IMAGE_POOL_CAUSTIC_EFFECT` 必须是 **256×256**，并把它交给 `InstallCausticsCompute`。生成的 `mCausticImage` 是 compute 输出，并不来自普通静态图片。PoolEffect:72–73 只用 `IMAGE_POOL` 的逻辑尺寸构造网格。

PoolEffect:171–177 使用 `DrawTrianglesTex` 分别绘制 day/night 的 base、shading；顶点的归一化 UV 在 155–156 等处加入水波偏移。180–183 对 compute 输出临时开启 sampler wrap。把这些资源机械地打进普通 UI atlas 会改变 UV 和 wrap 的边缘语义。caustic 输入和输出应保持独立；base/shading 即使要共 atlas，也必须先实现每层 UV 的区域映射、边缘采样及 day/night 视觉验证。此审计不把 Pool 计为可直接合并组。

## 后续验证要求

候选实施时应保留现有的 atlas 像素 hash、源矩形/网格、两像素边框和 variant 元数据验证，并补充调用点的逻辑尺寸与裁剪检查。性能判断应来自实际渲染统计中的纹理切换/批次数和目标场景测量；本审计仅确认共享关系、重复源像素和有依据的候选范围。
