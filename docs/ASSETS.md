# 资产与发行边界

## 需要保存的输入

| 类别 | 内容与现状 |
| --- | --- |
| 游戏源码 | pvzPerf 下的入口、Lawn、Sexy.TodLib、SexyAppFramework，以及平台和图形后端 |
| 构建与依赖定义 | 根 CMake、tools 中现行构建/资源/转换/打包工具、vcpkg.json、overlay ports、平台启动脚本 |
| 定义编译器 | tools/resourceCompiler/src，C++23 编写；由主 CMake 构建 |
| 存档转换器 | tools/saveConverter/src，C++ 编写；和资源编译器分别使用独立构建子目录 |
| 定义源 | assets/definitions/reanim、particles；particle-reference 为现有粒子编译器需要的对照输入 |
| 资源注册输入 | image_symbol_ids.bin、font symbol sidecar、reanim 类型/轨道映射；生产资源清单为 assets/definitions/resources.json |
| 字体 | assets/definitions/fonts 中的 20 份定义，以及 assets/runtime/data 中的字库图片；不再读取原版安装目录 |
| 运行资源 | 被定义和游戏代码引用的图片、音效、音乐、字体、UI 文本和其他实际读取的数据 |
| 内置 shader | HLSL，以及 Vulkan 当前使用的 GLSL .frag/.comp 和 include；输出 DXIL/SPIR-V 是可再生构建产物 |
| 应用标识与默认配置 | assets/branding、应用使用的光标、平台图标描述、根目录 scale.json；个人 settings 和个人存档不作为源资产 |
| 测试与文档 | Tests 中统一 DAT/DAT64、Tests/performance 中的性能工具、测试源码和夹具、docs、README；性能原始证据不能用未完成的新测量替代 |
| 来源和许可 | 根 LICENSE、第三方依赖与外部效果各自的来源、许可说明 |

稳定图像注册表采用显式追加，不能任意重排现有 ID。
游戏代码中的 ImageSymbolId 引用也是资源闭包的根，不能只从 reanim/particle DSL 收集图片。
字体图片、UI 资源、遮罩/alpha 配图也必须计入依赖。

## Shader 对应关系

| Vulkan 当前源码 | DX12 对应源码 |
| --- | --- |
| game_vs.hlsl、game_ps.frag | d3d12/shaders/game.hlsl 的 VSMain、PSMain |
| game_alpha_cs.comp | d3d12/shaders/game_alpha_cs.hlsl |
| game_color_cs.comp | d3d12/shaders/game_color_cs.hlsl |
| game_font_cs.comp | d3d12/shaders/game_font_cs.hlsl |
| game_caustic_cs.comp | d3d12/shaders/game_caustic_cs.hlsl |
| game_hdr_ps.hlsl | d3d12/shaders/game_hdr.hlsl 中的呈现逻辑 |
| game_coverage_ps.frag | DX12 主像素 shader 的 coverageInput 分支承担相关覆盖率处理；不是独立同名入口 |

这些运算可以用 HLSL 表达，DX12 的实现已经证明这一点。
Vulkan 当前使用 GLSL 的部分与其 glslc HLSL 前端的能力有关：
主像素路径需要非一致索引，计算路径需要明确的 storage image 格式。
项目的 ScaleEffectCompiler.cpp 已经使用 DXC 的 -spirv 路径，
并生成 vk::binding、vk::constant_id 和 vk::image_format 属性；
因此 HLSL 到 SPIR-V 的工具链在项目里已有使用依据。
统一到 HLSL 时需要选择能表达这些约定的 SPIR-V 编译路径，
并保持 descriptor set/binding、push constant、特化常量、顶点位置和混合语义。
现阶段不能只换后缀或直接拿 DX12 输出替换 SPIR-V；统一前保留正在使用的源文件。

Shader 源码按图形后端隔离，不按操作系统复制：Windows 的 Vulkan 与
Linux 的 Vulkan 共用 Vulkan shader；DX12 使用其对应 shader。
现有 graphics/vulkan/shaders 和 graphics/d3d12/shaders 已实现这一编译期边界，
无需为 shader 选择增加运行时分派。不能仅凭源语言或编译器名称判定运行性能，
需要比较编译结果和同条件测量。

## 发行输出

- main.pak64：运行所需的数值 compiled 定义及资源引用闭包；不包含内置 DXIL/SPIR-V。
- shaders/：构建期生成的 DXIL/SPIR-V。当前保留目录方式；尚未实现 shaders.pak64 加载。
- effects/：外部缩放效果，发行时可携带，用户可从 Magpie 获取替换文件；不作为项目自有素材。
- 可执行文件、平台动态依赖、默认配置、图标和许可说明。构建缓存与个人数据不进入发行包。

## 构建流程

主 CMake 通过 CMake/Resources.cmake 构建 reanimc，再调用
tools/resourcePipeline/src/build_resources.py：

1. 按 reanim、particle、游戏代码顺序扫描图像符号，保留现有编号并显式追加新符号。
2. 编译 DSL 和字体、生成数值资源清单，生成的 C++ 头文件与源文件写回 pvzPerf 的源码目录。
3. 验证数值定义和资源引用，收集图片及 alpha 配图、音效、音乐和 UI 数据。
4. 将引用闭包写入 out/<组合>/cache/resources/main.pak64，再部署到 Release/main.pak64。

资源编译器与存档转换器的构建输出分别位于
out/<组合>/tools/resourceCompiler/build 和 out/<组合>/tools/saveConverter/build，
不与工具源码混放。只更新资源也会触发部署，不依赖可执行文件重新链接。
输入未变化时不重复资源编译，生成源码内容未变化时不改写文件。
shader 继续由各后端构建规则单独生成，外部缩放 HLSL 继续在启动时编译。

## 已核实机制

音效有 SOUND_* 符号，经数值资源清单绑定到资源槽；
音乐使用 MusicFile、MusicTune 等数值标识和装载计划，
没有与所有 ImageSymbolId 共用一个命名域。
PAK64 使用 Stored ZIP，不加密，不含 DXIL/SPIR-V 条目。
AU 解码和 MO3 播放是格式处理，不是包加密。
原始图片、音频与 UI 数据已收拢到 assets/runtime；编译器和 DSL 也已收拢，
正常主构建不依赖相邻 openPvz 或原版安装目录。
历史算法对拍脚本可以保留其明确指定的旧对照输入，不属于正常游戏构建依赖。

引用选择使用编译资源清单、字体图层和游戏源码中的路径，
图像符号盘点覆盖两类 DSL 和代码；未选入项记录在缓存 manifest 中。
旧 build_numeric_runtime_pak64.py 的历史包转换模式仍按排除清单保留旧条目，
它不再充当主构建的资源选入策略。

### 保留 QuickPlay 菜单素材

用户要求保留整套 QuickPlay 素材，以便后续探索其用途。下一版将以下
10 个 author Image 描述符恢复为原始路径和自动 alpha 设置，不再指向
`blank`，不再设置 `noalpha`。id、slot、symbol、group 完全不变；
源图片和运行包内图片均保留。已发布 v1.3 的包与 tag 保持不变，
其历史清理策略及对应验证器以 v1.3 tag 为准。

| 源图片（assets/runtime/images/ 下） | 稳定 slot | 原包图片字节 |
| --- | ---: | ---: |
| selector_morewaystoplay_background.png | 100 | 432,161 |
| quickplay_minigames_button.png | 113 | 31,499 |
| quickplay_minigames_button_highlight.png | 114 | 32,890 |
| quickplay_minigames_cloud.png | 115 | 31,688 |
| quickplay_puzzles_button.png | 116 | 20,725 |
| quickplay_puzzles_button_highlight.png | 117 | 21,875 |
| quickplay_puzzles_cloud.png | 118 | 27,903 |
| quickplay_survival_button.png | 119 | 31,281 |
| quickplay_survival_button_highlight.png | 120 | 32,474 |
| quickplay_survival_cloud.png | 121 | 36,278 |
| 合计 | | 698,774 |

698,774 字节是审计时这 10 张图片的原始 payload 之和，不包含 ZIP 条目
开销。恢复后的资源描述符把它们纳入主流水线引用闭包，不以当前界面
是否绘制或代码是否直接使用图像变量作为删除依据。
quickplay_back_button.png 和 quickplay_back_button_highlight.png 仍被
GameSelector 构造按钮时使用，同样保留。字体 glyph 和独立 alpha 配图
继续按完整引用闭包校验。

构建后运行 `python -B tools/verify_runtime_resources.py <Release/main.pak64>`
验证所有数值记录及文件闭包、字体 glyph、10 个保留资源的稳定身份、
原始路径和自动 alpha，以及全部原图和返回按钮仍在包内。工具检查全部
compiled reanim/particle 的真实 image ID 均有可加载的描述符。
QuickPlay 符号可以被代码、动画或粒子重新使用，不再触发退休项错误。
当前验证器仅校验包与当前作者清单，不提供历史 `--predict-retirement`
分支；检查已发布 v1.3 时使用该 tag 自带的验证器。

Tests/reference/render-groups/source-baseline.tar.gz 是旧渲染分组审计的默认输入，
旧资源包位于 Tests/reference/legacy1073-resources；它们不进入当前发行包。
若撤除此历史审计，应同时移除或改造其入口，不能只删除夹具而留下失效工具。
总账实际引用的精选原始记录位于 Tests/evidence；根 log 为可清理的临时输出。

## 无尽基准来源

Tests/game3_13.dat 来自原版使用的
C:/ProgramData/PopCap Games/PlantsVsZombies/userdata/game3_13.dat，
经临时测试夹具复制后纳入 Tests，未改写游戏状态。
Tests/game3_58.dat64 由项目转换器生成。
当前为进行中状态，不是选卡检查点；用户已确认它是典型出怪组合，
可直接用于正式性能测试。每轮恢复基准副本，不使用试玩推进后的状态。
校验值和使用规则见 [Tests 说明](../Tests/README.md)。
