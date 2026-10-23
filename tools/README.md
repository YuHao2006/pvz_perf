# 生产工具

本目录保存构建、资源编译、存档转换和发行打包工具。
性能工具及其夹具、运行脚本和分析脚本位于 Tests/performance。

关卡存档转换器只支持原版 1.2.0.1073 DAT、DAT64 v1、v2 和当前 v3.2，
输入和输出均适用。`--target` 可选 `legacy|dat64-v1|dat64-v2|dat64-v3.2`；
未发布的 v3.0/v3.1 文件和目标明确拒绝。游戏本身只读取 v3.2。
原版和旧 DAT64 的 879 项历史资源编号、图片类型及确证别名由
`saveConverter/src/FrozenResourceIds.h` 冻结，转换器不依赖游戏运行时资源表。
编号考古工具 `_resid_order.py` 默认读取记录的原版 EXE 映射，也可通过
`--original-resources` 显式指定原版 XML；`_gen_remap_header.py` 从冻结枚举及
图片类型判断重建转换器候选头，必须指定新的 `--output`，拒绝覆盖已有文件。
两者都不读取当前程序的图片声明，也不会生成运行时 ResourceId 头。

| 工具 | 源码 | 主构建中的输出 |
| --- | --- | --- |
| reanim/particle/投掷物 DSL 编译器 | resourceCompiler/src | out/<组合>/tools/resourceCompiler/build |
| DAT/DAT64 转换器 | saveConverter/src | out/<组合>/tools/saveConverter/build |
| 资源流水线 | resourcePipeline/src | out/<组合>/cache/resources |

reanimc 和存档转换器已是 C++；资源清单、字体编译及打包的 Python
实现暂时保留。主 CMake 自动调用流水线，生成头文件和 C++ 文件回到
pvzPerf 源码目录；数值定义和 main.pak64 进入缓存，再部署到 Release。
内置 shader 由图形后端独立编译到包外 shaders 目录。

资源原始输入位于 assets/definitions 和 assets/runtime，
不使用相邻 openPvz 仓库或本机原版安装目录作为正常构建输入。
历史算法审计工具所需的旧对照输入仍由其显式参数和说明定义。

投掷物前端命令为 `reanimc compile-projectile --input FILE.dsl --output FILE.json`。
公共流水线继续完成图片解码、装箱（每图集 60 秒预算）、PNG 合成和离线 PRJ1 记录写入。
限时输出须标记真实的 FEASIBLE/最优证明状态和 gap，不保证每张图集已证明最优。
`definition_order` 是 reanim/particle 完整静态定义的显式 ID 顺序输入，
`definition_catalog.py` 核对运行时目录并生成离线类型映射。
`static_definitions.py` 协调 `static_reanim_codegen.py` 和 `static_particle_codegen.py`，
生成 `GeneratedDefinitions.h/.cpp`、存储声明头、十六份数据分片和
`GeneratedDefinitionLoading.cpp`。定义及其 backing 数组静态初始化；加载函数通过
公共 renderer 接口绑定 GPU 指针及字幕字体，释放函数只解绑。
reanim/particle/projectile 的 `.compiled` 仅作离线中间输入，不进入发行包；
字体与资源计划仍使用各自的 compiled 格式。
`DefinitionImageBindings.h` 只供离线包校验，游戏不包含或查找该表。
运行时 `ResourceId`、`ImageSymbolId` 和字体 SymbolId 已全部退役，
`ProgramImageSymbols.h/.cpp` 已删除。定义编译器独立解析源标签和路径，
普通图片绑定则来自 `Resources.h` 的 210 个命名 `Image*` 及其实际 C++ 消费端；
场景图集迁移后已删除 76 对没有剩余消费端的声明与定义。

`compile_numeric_resources.py` 从当前源清单生成 NRSC4 临时加载计划：29 组、
210 图片、168 声音、20 字体，共 398 条步骤。记录仅保存 kind、flags、同路径缓存
variant、组内字体引用序号及加载参数，没有资源或图片 ID。
`ResourceLoadBindings.inc` 逐个命名目标直接赋值，图片显式传入具名
`SharedImageRef` owner；释放调用与加载对应，组内逆序释放。
绑定契约 CRC 覆盖组、步骤、类型和目标名称，payload CRC 覆盖序列化参数。
共享图片缓存按 `(路径, variant)` 复用完整相同的加载配方，普通路径
variant 为零；这不是全局图片编号。字幕字体通过 `TodLoadCreditsFont()`
直接取得 `FONT_BRIANNETOD32`，离线字体 sidecar 不再对应运行时查找接口。

QuickPlay 的界面代码及 12 个图片绑定已移除；12 张原始 PNG 继续保存在
`assets/runtime/images/`，不进入资源加载计划或 PAK。
`verify_runtime_resources.py` 验证当前具名契约、完整文件闭包和上述源图保存/
运行包排除规则。`inspect_program_images.py` 输出无图片 ID 的 v3 图鉴，
使用 `images` 字段保存具名图片，并检查所有定义外观的源图复用。
历史数值资源编译器和冻结映射仅通过隔离的离线夹具入口使用，不参与生产加载。

`scene_atlas.py` 编译 `assets/definitions/ui/` 中 Magnet、Almanac、
Achievements 三份 `.atlas.dsl`；FixedUI 的 24 项源图由 Python 明确列出，
不新增 DSL。四模块共 99 个逻辑 view、78 张完整源 sheet。
原有 sheet 整张原样装箱，内部像素、空白和帧排列不变；view 的局部 `rect`
仅加装箱 origin，不裁切或生成单独的源 PNG。

配置使用 `sources(scene ...)` 与 `atlas(group scene:Module)`，沿用公共
60 秒、不旋转、两像素扩边和完成布局缓存；未证明最优时保留真实状态与 gap。
生成 `SceneAtlasData.h/.cpp`，四 namespace 各持有一个直接 GPU 指针、
静态矩形、局部枚举和加载/解绑函数；仅 Magnet 有实际使用的 `Scales`。
Achievements 的 `Icons` 按 `ICON_n` 数字顺序独立生成，校验从零连续，
不依赖 DSL 声明顺序。`SceneAtlasBindings.h` 只作离线整 sheet 像素校验，
不在游戏中形成新表查询或行为 compiled。
DSL 直接图片路径可新增素材，无需新增 `resources.json` 标签；旧
`IMAGE_*` 只作离线作者 alias，不是运行时 ID。完整语法见
[场景图集 DSL](../docs/scene-atlas-dsl.md)。

Zombatar 编辑器素材由 `zombatar_atlas.py` 和独立的
`assets/definitions/zombatar/Zombatar.zombatar.json` 编译，不再占用全局图片符号。
它与投掷物共用装箱和 PNG 合成路径，生成 `ZombatarImage.h`、
`ZombatarAtlasData.cpp` 及 `ZombatarLoadResources()` / `ZombatarFreeResources()`；
209 个子图共用一份 GPU 指针，几何数据位于程序静态数据中。
运行包只有图集 PNG，没有 Zombatar compiled 元数据。
`test-zombatar-atlas-runtime.ps1 -BuildDirectory <build> -ReferencePakFile <reference.pak64>`
复用生产对象，逐项对比图集和独立原图的 GPU 绘制，并验证按钮状态、头像叠层及
无损 PNG 导出；证据输出放在系统 Temp。
