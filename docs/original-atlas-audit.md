# 原有拼图资源与重组边界

2026-10-23。下文保留本日先前的只读盘点基线；后续已经实现三份场景 DSL
和 FixedUI 直接表。用户随后确定的新边界是：原有 sheet 不拆、不重排，
整张原样装进新 atlas，局部 view 仅通过矩形加 origin 定位。
表中的拆图建议作为历史记录保留，已被这一决定取代，不是当前实施计划。

## 计数与证据

- 原版参考清单 `../pvz-decomp-ruslan/SexyAppFramework/properties/resources.xml`
  有 60 个 Image 节点声明了多行或多列。它是本地原版源码参考，不能据此声称
  已逐项核对某一零售 EXE 的全部素材。
- 审计时的 286 张普通图片中，有 23 张在离线清单声明多格布局。
  另有成就图标由代码手写矩形，因此共确认 24 张帧图或图标集合。
- `assets/definitions/particle-frame-images.json` 已记录 36 组源图、
  213 张无损拆帧 PNG，含 Fog 和 ZombiePogo；这两组也有普通 C++ 消费，
  因此不能把这三个计数直接相加。
- 投掷物阴影 `pea_shadows` 已由 projectile DSL 明确记录两个源矩形。
- 字体字形页另计；九宫格、三段拉伸、揭露裁剪不算多个独立 sprite。

审计基线的图片尺寸来自当时生产包的离线图鉴；不是所有尺寸都声称与零售原图相同。
图鉴复核输出位于系统 Temp 的 `pvz-original-atlas-audit/`。
本轮场景迁移后命名 `Image*` 全局为 210 项，删除 76 对没有剩余 C++ 消费端的
声明与定义；这不追改上述 286/23/24 的历史盘点分母。

## 运行时行列已经退役

`ImageMetadata` 仅含宽高。普通 `Image`、借用绘制参数 `TextureSource`、
reanim/particle 根定义均不保存图片总行数/总列数。
`GpuTexture` 是编译期选定的具体后端纹理类型别名。
动画定义使用图片槽位和矩形，粒子使用帧数及帧矩形；帧数不是图集行列。

本次统计的 rows/cols 来自离线作者清单和图鉴，还原原素材怎么切图，
不会被搬回 GPU 图片对象。
NRSC4 资源加载计划不写入行列或图片动画参数，C++ 解析器也不读取。
`Image::AppendAlphaImage`、CPU alpha 合成层和 GPU 合成接口均无行列参数，
alpha 图与底图逐像素对应并要求尺寸相同。源图布局仅由离线工具处理。

## 历史审计基线中的帧图/图标集合

| 图片（省略 IMAGE_） | 审计布局与单格尺寸 | 当时调用依据 | 原建议（已由整 sheet 规则取代） |
|---|---|---|---|
| FOG | 8×1，210×190 | Board::DrawFog；CreditScreen | 拆成 8 张逻辑帧；适合雾自身重排，普通 Board 与粒子图集的重复需一起处理 |
| WAVECENTER、WAVESIDE | 各 1×12，160×27 | Board::DrawUIBottom | 两组 24 帧可合为一图集，保留动画往返顺序、镜像和水平延伸接缝 |
| CHALLENGE_THUMBNAILS | 22×1，80×65 | ChallengeScreen::Draw | 拆 22 图标再装箱；保留 challenge 图标索引的语义映射 |
| SURVIVAL_THUMBNAILS | 11×1，80×65 | ChallengeScreen::Draw | 拆 11 图标；可与上组共 atlas |
| SEEDS | 9×1，50×70 | SeedPacketDrawBackground 等 | 拆 9 个卡底，保持卡底选择、灰暗覆盖和冷却裁剪 |
| FLAGMETER | 1×2，158×27 | Board 7906–7912 | 可拆两层，保留进度区域动态源裁剪 |
| FLAGMETERPARTS | 3×1，25×25 | Board 7970–7992 | 拆三部件，与进度条同 atlas |
| SELECTORSCREEN_LEVELNUMBERS | 10×1，12×17 | GameSelector 834–842 | 数字单独入主菜单 atlas；保持 0–9 顺序映射 |
| TOMBSTONES、TOMBSTONE_MOUNDS | 各 5×4，86×91 | GridItem::DrawGraveStone | 共 40 格可合；保留石碑/土堆叠层、生成/被吃时局部裁剪 |
| CRATER、CRATER_FADING | 各 2×1，90×61 | GridItem::DrawCrater；Challenge | 可拆 4 格，与其他弹坑外观合图 |
| CRATER_ROOF_CENTER | 2×1，75×77 | GridItem::DrawCrater | 拆两格，保留屋顶偏移 |
| CRATER_ROOF_LEFT | 2×1，75×87 | GridItem::DrawCrater | 拆两格，保留屋顶偏移 |
| CRATER_WATER_DAY、CRATER_WATER_NIGHT | 各 2×1，85×53 | GridItem::DrawCrater | 共 4 格，与弹坑组共 atlas，位置波动保持原逻辑 |
| SUNFLOWER_TROPHY | 2×1，157×269 | Coin、AwardScreen、GameSelector | 银/金两张可拆，所有消费者一起迁移矩形 |
| SCARY_POT | 3×2，80×101 | GridItem::DrawScaryPot；Coin | 六格拆开，保留三状态与上下层配对 |
| PACKET_PLANTS | 13×1，50×70 | SeedPacketDrawSeed | 拆 13 图标；当前只覆盖部分植物，其他种子仍调用植物绘制 |
| ZEN_NEED_ICONS | 3×1，30×30 | ZenGarden 2418 | 拆三图标，与花园小型 UI 合图 |
| CONVEYORBELT | 1×6，502×16 | SeedPacket 967 | 六条动画帧可以重排，保持帧序和绘制裁剪 |
| ZOMBIEPOGO | 3×1，44×86 | Plant::DrawMagnetItems | 磁铁 DSL 分别描述三种损伤状态，生成最终矩形 |
| ACHEESEMENTS_ICONS | 512×256，按 70×70、每行 7 格取图；当前使用 20 图标 | AchievementsWidget 137；AwardScreen 636 | 必须纳入成就 DSL；拆有效图标，去掉无用尾部，两个页面共同消费生成矩形 |

上表按历史口径共 23 张离线清单多格图片，加一张手工图标集合。
其中“拆”“重排”“去掉无用尾部”等方案不再执行。新场景 atlas 保留整张
sheet 的逻辑 RGBA、尺寸、内部排列、透明 RGB、空白和未引用区域，
仅给局部源矩形加整张 sheet 的装箱 origin。不能偷偷裁透明边或改变缩放和视觉原点。

## 此轮决定前已有的拆分与重组

粒子原有的爆米花、大小泥土、碎石、豌豆碎屑/溅射、雪豌豆碎屑/
溅射/烟团、星星碎屑/溅射、雪花、土豆雷、瓜类碎屑、花瓶碎片、
坚果碎屑、各类 Boss 冰火碎屑等，已经是源级无损拆帧和 definition atlas。
完整 36 组见 `particle-frame-images.json`，无需再从发行图集切一次。
这些既有粒子输入及其历史证据保持原口径；新场景图集不继续对原有 sheet
实施这一拆分方式，也不为逻辑 view 新建拆帧源 PNG。

`assets/definitions/projectiles/Projectiles.projectile.dsl` 中的 day/night
阴影矩形分别为 `[0,0,21,9]` 和 `[21,0,21,9]`。
其运行时矩形已经由离线装箱换算。

字体作者文件的 `RectList` / `LayerSetImageMap` 已描述字形区域。
此轮不拆字形页；字距、基线、图层共享和渲染批次需独立评估。

## 不能混同于帧图的切片

- `EDITBOX`：90×42，`LawnCommon:108 → Graphics::DrawImageBox`，
  按 3×3 切为 30×14 的九宫格。若后续合图，只能整张 sheet 装箱，
  绘制沿用局部矩形，不再采用九块分别装箱的旧建议。
- `OPTIONS_SLIDERSLOT`：135×10，Slider 按左右端和中段切成三段 45×10。
  合图后需保留中段重复及尾段局部裁剪。
- `SEEDBANK`：完整绘制后复用右尾扩展槽位，不是独立动画帧。
- Almanac 三张 1400×600 背景：当前宽屏逻辑保留左右 16px 边缘，
  伸展中间；这是完整背景的布局切片。实际 Almanac DSL 保留整张背景，
  装箱只改变整张源图的 origin，宽屏绘制继续使用其局部像素区域。
- ICE、草皮、草坪背景按长度/揭露进度裁剪，不应切成固定格子。
- Pool caustic compute 输入/输出、自定义水面 UV 与 wrap 语义保持独立，
  不能按普通 UI sprite 直接机械合图。

## 已实现的场景图集范围

`assets/definitions/ui/{Magnet,Almanac,Achievements}.atlas.dsl` 分别描述磁铁
物件、Almanac 和成就页；FixedUI 以 Python 明确列出的 24 张源图直接合图：
六张石质按钮、十三张对话框部件和五张选卡按钮状态。
四模块分别为 21/19、19/19、35/16、24/24 个 view/完整 sheet，
合计 99 个 view、78 张完整 sheet。

Pogo 三种损伤状态只是在原 132×86 sheet 上声明三个 44×86 矩形；
整个 sheet 只装箱一次。成就图标在原 512×256 sheet 上声明二十个 70×70
矩形，未用尾部仍保留。`AchievementsAtlas::Icons` 按 `ICON_n` 数字顺序
独立生成并校验从零连续，业务不再假设 DSL 声明顺序或枚举值相邻。

生成的 `SceneAtlasData.h/.cpp` 为四 namespace 各提供一个 GPU 指针、
静态矩形及加载/解绑函数；Magnet 另有实际使用的 `Scales`。
没有逐 view 的 Image 包装、运行时行列或资源 SymbolId。
新增内容从 DSL 引用源路径即可，不要求为新图加入 `resources.json`；
既有 `IMAGE_*` 名称仅为离线作者 alias。语法见
[scene-atlas-dsl.md](scene-atlas-dsl.md)。

所有新 sheet 使用现有装箱器、两像素外扩边、不旋转和每单元 60 秒预算，
复用已有布局缓存；限时可行解保留真实证明状态，不冒充最优解。
本页只记录源布局边界和实施结构，不预记最终 atlas 尺寸、构建结论、
包条目/摘要或 FPS 收益。
