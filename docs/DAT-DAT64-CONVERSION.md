# 存档转换与兼容性

**当前关卡存档为 DAT64 v3.2：转换器只支持原版 DAT、DAT64 v1、v2 和 v3.2。**
游戏只读取 v3.2；原版 DAT、v1、v2 须先由独立转换器升级，原文件保持不动。
v3.0（schema `0x10733`）和 v3.1（schema `0x10734`）从未发布，
输入和输出均不受支持；识别到这些头部也明确拒绝，不当作当前布局。
`users.dat` 摘要与 `PVZUSR64` 版本 13 的玩家详情格式不属于关卡版本变更。
资源包也须使用本版 v6 定义格式的 `main.pak64`，不能混用旧 EXE/PAK64。

## 数据分工

原版直接保存部分对象和池布局，指针宽度、枚举顺序与现代运行时不同。
DAT64 使用显式字段布局和编号映射，不能通过改扩展名转换。
当前游戏与转换器不校验 DAT64 内容 CRC 或哈希，合法字段可直接修改。

DAT64 v3.2 同步了两个音乐属性：`Music.mBaseBPM` 和
`Music.mBaseModSpeed` 在运行时及新写入的 DAT64 中均为 32 位浮点，
仍占 Music 记录的偏移 36、40，各四字节。文件头版本号为 **3**，
schema 为 `0x00010735`，minor 为 **2**。转换器负责旧整数编码与新浮点编码的数值转换。
转换器中的 `LegacyParticleIds.inc` 冻结旧 v2 的粒子编号顺序，
再以冻结的 162 项规范身份比较语义；这些内部身份不是额外支持的文件版本。
v3.2 只在粒子系统固定记录中保存一次基础定义 ID；系统附加段不再重复该 ID，
发射器附加段也不再保存图片覆写 ID，连空值占位都不写。

v3.2 将 ParticleEffect 恢复为原版 106 个基础定义的顺序，56 个历史独立
外观改为根定义内部 variant。ParticleSystem 固定记录偏移 0 保存基础 ID，
偏移 4 的原有空隙保存 `u32 mVariant`，记录和池槽长度不增长，也不增加
附加段身份。`ParticleAppearanceSaveCatalog.h` 明确映射每个旧字典序
ID 到 `(baseEffect, variant)`；Default 为 0，其他外观按 component 字典序。
转换器在离线规范态保留冻结的历史身份以比较完整语义，运行时没有 162 项
兼容编号表。未知基础 ID、variant 或无法表达的旧图片覆写组合均拒绝。

v3.2 将 reanimation 外观保存为实例的 `u32 mVariant`，固定记录使用原有
偏移 12 的四字节空隙，因此 Reanimation 记录及池槽长度不增长。
`mReanimationType` 继续表示根定义，一个根类型包含全部外观。
现有附加段中的根 definition ID 仍保留，但必须与固定记录中的 type 一致。
每个轨道记录物理删除原偏移 80..87 的八字节图片指针保留区，
后续字段前移八字节；附加段也不再写每轨道的四字节图片 ResourceId。
计入两个纳秒字段后，轨道记录由 120 字节缩为 112 字节，
每个轨道总共减少 12 字节，没有空值占位。

转换器使用生成的 `ReanimAppearanceSaveCatalog.h`，按根类型、轨道下标和
规范 ResourceId 将旧覆写组合转换为 mixed-radix 外观索引。
旧 DAT 的资源编号先通过既有 1073→现代 ResourceId 表映射；空覆写使用
ResourceId 879。目录包含全部根类型、轨道数量、每个外观轴的 choices、
radix 和 stride，variant 为各 choice digit 与 stride 乘积之和。
`Resources.cpp::ExtractInitResources` 明确将 `IMAGE_PARTNER_LOGO`
指针赋为 `IMAGE_BLANK`，因此旧反向查找可能将同一空白图片保存为
ResourceId 2 或 0。转换器只对这个有源码依据的历史别名做 2→0 规范化，
导出使用规范的 0；这不创建新的外观 choice。
未知轨道覆写或未声明组合明确报出 root type、track index、ResourceId，
且不创建输出文件，不会用默认外观代替。导出旧格式时反向恢复已声明 choices。

| 文件 | 当前格式 |
| --- | --- |
| `users.dat` | 原版用户摘要表，仍保留 DAT |
| `user<ID>.dat` | 原版版本 12 的玩家详情 |
| `user<ID>.dat64` | `PVZUSR64`、版本 13 的玩家详情 |
| `game<ID>_<mode>.dat` | 原版 1073 关卡中断存档 |
| `game<ID>_<mode>.dat64` | `PVZDAT64`、major 3 / minor 2 的纳秒关卡中断存档；游戏仅接受 v3.2 |

用户名能读到不等于进度已读到：摘要、玩家详情和关卡快照是三个独立文件。
Linux 启动使用的目录规则见[运行说明](../README.md)，改名 `pvz_perf`
不修改原来的存档根目录。

## 转换流程

```text
完整解析源格式
→ 规范化字段、池和对象引用
→ 映射模式与已保存的图像 ID
→ 序列化目标格式
→ 重新解析目标字节
→ 比较完整规范化对象
→ 写出文件
```

源语法、池代次、空闲链、数量、拥有关系和跨对象引用都必须有效。
不能将每个四字节字段机械扩为八字节，也不能把当前 `sizeof(T)` 当磁盘协议。
原生指针不作为可迁移的保存地址；GPU 描述符和纹理句柄不入档。

当前池顺序共 11 个：
Zombie、Plant、Projectile、Coin、LawnMower、GridItem、
ParticleSystem、ParticleEmitter、Particle、Reanimation、Attachment。
旧 Trail 没有运行时对应物，非空旧 Trail 池明确拒绝。
版本 1 的 Zombie 规范槽从 360 字节映射到 376 字节，
Reanimation 从 160 字节映射到 184 字节。版本 2 在版本 1 的记录位置将每个
32 位时间字段替换为 64 位纳秒，槽 ID 随记录尾部后移；索引、计数和帧号不扩展。
完整字段及原单位见[纳秒时间协议](DAT64-TIME-SCHEMA.md)。

实现与校验位于 `pvzPerf/Lawn/System/LevelSaveFormat.h`、
`tools/saveConverter/src/LevelSaveConverter.cpp`、`pvzPerf/Lawn/System/SaveGame.cpp` 和
`pvzPerf/Lawn/System/ProfileMgr.cpp`。
部分早期项目布局只作为转换器的显式输入方言，不成为正常游戏的自动回退。

## 头部与损坏拒绝

原 DAT 头部为长度前缀 12、magic `0xFEEDDEAD`、版本 2、构建指纹。
接受零售指纹 `0xAC9B80AC` 和已记录的早期项目指纹 `0xB7EFF6A8`。
DAT64 字段为小端：

| 偏移 | 字段 | 值 |
| --- | --- | --- |
| `0x00` | 八字节 magic | `PVZDAT64` |
| `0x08` | major 格式版本 | 3（转换器也接受旧格式 1、2） |
| `0x0C` | 头部长度 | 48 |
| `0x10` | 权威构建 | 1073 |
| `0x14` | 标志 | v2/v3.2 为 3；v1 为 1 |
| `0x18` | 载荷字节数 | 与实际一致 |
| `0x20` | 原载荷 CRC32 槽，现忽略 | v2/v3 写 0；读取各版本均忽略旧值 |
| `0x24` | schema | v3.2：`0x00010735`；v2：`0x00010732`；v1：`0x00010731` |
| `0x28` | minor 格式版本（u32） | v3.2 为 2；v1/v2 为 0 |
| `0x2C` | 保留字段（u32） | 0 |

载荷末尾为 `0xB4A9ABBEBBA5A9AF`。版本、长度、schema、其他保留值、结束标记、
字段边界和多余字节仍用于确定如何解析文件。原 `0x20` 槽不要求为零，也不参与读取判断：
直接修改合法时间、阳光或其他字段后无需重算任何 CRC/哈希。新 v3.2 文件在该槽写零，
头部仍为 48 字节，其他偏移不变。转换器显式导出 v1 时继续写真实 CRC，
以兼容已发布的旧 v1 程序；转换器读取 v1 时同样忽略该值。当前游戏只读取 v3.2。
结构错误在修改活池之前拒绝，不靠快照重读回滚掩盖失败。

游戏仅写出和读取 v3.2，没有原 DAT 或 DAT64 v1/v2 的运行时兼容路径。
major、minor、标志和 schema 必须成组匹配；旧版本须先通过独立转换器升级。
转换器默认将原 DAT 转为 v3.2，将 DAT64 转为原 DAT；
可用 `--target legacy|dat64-v1|dat64-v2|dat64-v3.2` 明确选择。
`dat64-v3`、`dat64-v3.0` 和 `dat64-v3.1` 均为不支持的目标，拒绝后不生成输出。
例如升级旧关卡档并保留原件：`pvz_dat64_converter.exe game1_58.dat64 game1_58-v32.dat64 --target dat64-v3.2`。
显式导出 v2 会恢复旧粒子编号、基础定义加图片覆写及整数音乐参数；v3 保留浮点参数的小数。
版本 1 与原 DAT 导出默认要求每个时间值都是其原单位（10ms、毫秒或秒）的整倍数，
否则拒绝且不创建目标文件；`--round-time nearest` 明确启用最接近舍入，恰半时远离零。
超出原 32 位范围始终拒绝。版本 2/3 的纳秒转换和游戏读写不经旧 tick 量化。

## 模式与图像编号

玩家详情版本 12 使用旧挑战模式索引，版本 13 按当前 GameMode 直接下标。
小游戏完成项、文件名中的模式值分别映射；其他已识别字段和变长列表语义保留。
无法反向表示的数据拒绝导出，例如非零的新挑战槽 72。
`CUSTOM_LEVEL` 的枚举和槽 72 继续保留，删除 DLL 功能不压缩编号。

关卡模式来自 `game<profileId>_<mode>` 文件名，而不是 Board 载荷中的字段。
自动输出名应用 `kGameModeRemapV1ToV3` 或反向表；显式指定输出名时，
调用者负责使用目标格式的模式编号。正常读取不猜测曾经命名错误的文件。

| 编号空间 | 用途 | v3.2 是否保存 |
| --- | --- | --- |
| 历史 `ResourceId` | 转换器专属的 879 项冻结编号；旧存档图片覆写使用其图像子集 | 否，运行时也不保留旧混合槽表 |
| `ImageSymbolId` | 独立程序图片绑定；不是定义外观身份 | 否 |
| Reanimation variant | 根定义内的整套外观行索引 | 是，固定实例记录偏移 12 的 `u32` |
| Particle base + variant | 原版 106 个基础 ID 和根内部外观索引 | 是，固定系统记录偏移 0、4，各 `u32` |
| GPU descriptor slot | 设备运行时绑定 | 否 |

旧 `SaveGameContext::SyncImage` 曾通过 `GetIdByImage` / `GetImageById`
转换，现已删除。旧空图像哨兵为 `RESOURCE_ID_MAX == 879`，
离线重映射见 `tools/saveConverter/src/ResourceIdRemap.h`。
旧图像 override 必须按字段语法访问，不能全文件搜索替换同值整数。

879 个历史编号、图片类型判断和已确证的 2→0 别名冻结在转换器专属的
`tools/saveConverter/src/FrozenResourceIds.h`，使用 `FrozenSaveResources`
命名空间。转换器不再 include 程序 `Resources.h` 或依赖运行时资源表；
资源编号重映射保留原版与历史现代空间之间的双向表。
`generate_reanim_appearances.py` 也从这份冻结头生成旧图片 choices，
不从当前程序的公开图片符号重建历史编号。退休图片及 FONT_IMAGE 字形图集的
历史图片类型仍须保持，不能按当前是否加载纹理决定旧档是否合法。
当前 v3.2 不写 ResourceId，因此本次解耦没有改变 schema、wire 或外观索引。

保存槽 2 与已删除的合作商标图像符号不是同一编号。
历史 `IMAGE_PARTNER_LOGO` 变量与 Blank 别名，反向映射可能将同一图像记为 2；
因此槽 2 不能随纹理符号清理而移除。若将来改变已保存图像的编号空间，
必须显式升级版本/schema、生成映射并验证全部图像字段，不能沿用旧版本重排。

## 使用转换器

程序为 `pvz_dat64_converter.exe` 或 Linux 的 `pvz_dat64_converter`，
构建后部署到 `data/`。优先对副本指定单文件输入和新输出：

```powershell
.\pvz_dat64_converter.exe .\copies\user3.dat .\converted\user3.dat64
.\pvz_dat64_converter.exe .\copies\game3_13.dat
```

第二条由工具生成带目标模式编号的文件名。单文件模式保留输入；
写入成功可以替换已有输出，应使用新的目标路径。

无参数模式扫描转换器自身目录：存在匹配的旧 DAT 时做 DAT→DAT64，
否则做反向转换；每个文件成功后删除该输入，失败输入保留。
`users.dat` 不匹配玩家详情模式。这个批量删除行为属于 CLI，
不是转换核心 API 的隐含副作用。

## 验证

原版/现代往返需要比较规范化语义；适用输入再做字节往返。
游戏加载、重存、拥有关系、图像 ID、空引用和坏输入拒绝要分别验证。
已有 Pool 回归包含 44/44 保存语义案例，41 个坏输入验证拒绝后完整存档不变；
玩家详情还覆盖模式重映射。对应证据索引见[修复总账](fix-ledger.md)。
发行整理的四轮 Pool 均通过，固定场景的 1,920,000 字节画面一致；
这些历史结果不替代当前 v3.2 自身的格式验证。

`pvz_reanimation_appearance_tests` 遍历全部根类型及其全部 variant，
验证 mixed-radix 与 ResourceId choices 双向映射、0/2 确证别名、越界拒绝、
legacy/v1/v2/v3.2 wire 往返、每轨物理减少 12 字节和无 CRC 读取，
并明确拒绝未发布 v3.0/v3.1、混用 schema/minor 和未知 minor。
粒子回归验证全部 162 个历史身份与 106 个基础定义的内部外观映射，
包括原版记录的可表达成功、混合覆写拒绝，以及当前无效 base/variant 拒绝。
实际原版 DAT、v1、v2 副本均可导入，v3.2 再次转换为 v3.2 字节稳定。
旧格式导出通过规范语义和可表达字段的往返检查。
收窄支持范围后，Vulkan 与 Win7 OpenGL 的转换器及三个专项测试目标均已
重新构建，`pvz_dat64_nanosecond`、`pvz_particle_image_variants`、
`pvz_reanimation_appearances` 在两构建中各 3/3 通过。
两份部署到 `Release/data` 的转换器也通过 CLI 回归：六种未发布或混用
schema/minor 的头部、三个未发布目标均拒绝，不创建输出、不改动输入；
支持格式、纳秒精度、浮点音乐参数及旧格式数值导出均通过。
历史编号解耦后，两后端转换器和两项 appearance 专项再次构建、CTest 各
2/2 通过，部署副本的完整 CLI 回归也通过。另有 7 项 program image
测试通过，包含历史 879 项编号连续值与顺序摘要、转换器不得依赖运行时
ResourceId 的边界检查；未借此重新生成外观编号。
`tools/test-save-upgrade-runtime.ps1` 另复用生产对象和新资源包，
在隐藏测试进程加载转换副本、写到独立测试文件并重载，比较全部根类型与
variant 快照。原输入按 SHA256 核对保持不变。
最终 Vulkan 与 Win7 OpenGL Release 构建均通过；两后端均通过当前 v3.2
真实副本的完整加载、写入和重载：
187 个 reanimation（其中 36 个非默认外观）的 root/variant 快照完全相同，
17 个粒子系统（其中 3 个非默认外观）的 base/variant 快照也完全相同，
同时保留 50 个僵尸和 87 株植物。两后端均通过粒子与 reanimation 的
越界 variant 拒绝测试；测试只修改独立副本，原输入保持不变。
当前副本为 833,004 字节，SHA256 为
`73B2C45F32B7DE5287073101A27615DA8083557D3EE308C14069446515896B53`。
本轮 21 项相关 CTest 全部通过。
