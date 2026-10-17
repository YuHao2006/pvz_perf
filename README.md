# pvz_perf

以零售 1073 的游戏行为为基准，优化 CPU 热路径、资源装载和原生呈现。
文档维护当前有效机制与修复；现行实测和历史算法证据分开标注，不按日期追加开发过程。

发行下载：[GitHub Releases](https://github.com/YuHao2006/pvz_perf/releases)。
**Windows 推荐下载 `x64-windows-vulkan.zip`**，完整解压后运行 `pvz_perf.exe`；
另保留 `x64-win32-dx12.zip` 供需要 DirectX 12 的用户选择。
不附个人存档或设置。发行提供 Windows Win32/Vulkan、Win32/DX12、
Linux X11/Vulkan 和 Wayland/Vulkan。
当前 Linux 包基于 Ubuntu 25.10 构建，要求 glibc 2.38、GLIBCXX 3.4.32 及兼容的
Vulkan 驱动；仍使用本机 CPU 优化，不承诺兼容所有 x86-64 CPU 或 Ubuntu 22.04。
Linux 依赖与外部效果许可随包提供，系统图形、窗口、音频运行库由用户安装。
贡献通过 fork 和 Pull Request 提交，由维护者审查，见 [参与开发](CONTRIBUTING.md)。

- [性能总账](docs/perf-fix-ledger.md)：机制、同口径数据、收益范围。
- [修复总账](docs/fix-ledger.md)：触发条件、根因、修复和验证。
- [存档转换](docs/DAT-DAT64-CONVERSION.md)：DAT/DAT64、模式编号和图像 ID。
- [无尽性能基准](Tests/README.md)：原版 DAT 与项目 DAT64 的同状态存档、校验值及测试使用规则。
- [资产与发行边界](docs/ASSETS.md)：源码、编译输入、资源、外部效果及现有工具链缺口。

## 构建与运行

每个 CPU、窗口、图形 API 组合只使用一个构建目录，正式配置为 Release/LTO。
游戏输出名为 `pvz_perf.exe` 或 `pvz_perf`，内部 CMake 目标仍是 `LawnProject`。

| 组合 | 构建入口 | 程序目录 |
| --- | --- | --- |
| Windows x64 / Win32 / Vulkan（推荐） | CMake：`PVZ_RENDER_BACKEND=VULKAN` | `out/x64-win32-vulkan/Release/` |
| Windows x64 / Win32 / DX12 | `tools/build-d3d12-game.ps1` | `out/x64-win32-dx12/Release/` |
| Linux x64 / X11 / Vulkan | `sh tools/build-linux-game.sh x11` | `out/x64-x11-vulkan/Release/` |
| Linux x64 / Wayland / Vulkan | `sh tools/build-linux-game.sh wayland` | `out/x64-wayland-vulkan/Release/` |

Linux 构建脚本按本机架构选择 x64 或 arm64；依赖 vcpkg、编译器、CMake、
Ninja、Vulkan shader 工具以及对应窗口开发库。跨架构不能复用 CMakeCache。
Windows 发行优先推荐 Vulkan，保留 DX12；没有为 DX12 Ultimate 单独创建后端。

源码目录可以命名为 `pvzPerf`，文件夹名称不参与应用身份。
改名或搬迁后重新配置并构建，不复用旧路径的 CMakeCache、Ninja 文件和 PDB。
`out/` 与本机 vcpkg 安装目录不进入版本库。
正常构建的编译器、DSL、字体、图片和音频输入均位于本仓库，
不再要求相邻 openPvz 或原版安装目录。

游戏源码位于 `pvzPerf/`；公共声明通过 CMake 的 `pvz_source_headers`
接口目标共享，不增加 DLL 或运行时分派。资源编译器位于
`tools/resourceCompiler/src/`，存档转换器位于 `tools/saveConverter/src/`。
主 CMake 自动生成源码及数值定义，PAK64 先写入
`out/<组合>/cache/resources/`，再部署到对应 `Release/`。
性能工具集中在 `Tests/performance/`，生产编译和打包工具留在 `tools/`。
主项目同时构建本平台的存档转换器：Windows 生成 `data/pvz_dat64_converter.exe`，
Linux 生成 `data/pvz_dat64_converter`。每次构建都检查并部署转换器，
即使游戏没有重新链接也会更新；安装目标同样放入 `data/`。

同机原生 Ubuntu 可直接读取本工作区并复制到 Linux 文件系统构建，不必先上
GitHub。源码还存在未提交改动时，仅克隆旧提交不能取得全部当前工作。
WSL 可以验证编译与无窗口测试，不能替代原生 Ubuntu 的 GPU/桌面性能验收。

Windows 的 `start-lp14.cmd` 以亲和性 `0x4000` 启动游戏。
Linux 构建目录里的 `start.cmd` 是 Windows 调用 WSL 的入口，原生 Ubuntu
直接运行 ELF。应用图标取自原版多尺寸图标；Linux 应用分组使用
`pvz_perf.desktop`、同名图标及 `pvz_perf` app_id/WM_CLASS。
desktop 文件安装后要求程序或启动器位于 PATH。

## 资源与配置

发行运行目录包含主程序、`main.pak64`、`shaders/`、`effects/`、
`scale.json`、本平台运行库及图标。正式分发使用干净 staging，
不要把个人存档、旧对照程序、烟测程序和历史日志混入发行包。

| 资源 | 位置与规则 |
| --- | --- |
| reanim / particle / font 数值定义 | pak 内 `compiled/<类别>/<名称>.compiled` |
| 数值资源清单 | pak 内 `compiled/resources.compiled` |
| 内置 DXIL/SPIR-V | 构建期生成，包外 `shaders/` |
| 用户缩放 HLSL/HLSLI/DDS | 包外 `effects/`，启动加载时编译 |

根目录 `scale.json` 是默认值，构建只在程序目录缺失该文件时补入，不覆盖
用户配置，游戏不回写它。窗口为一次 Anime4K 2 倍放大；全屏为两次 2 倍
放大后经 SSimDownscaler 按 `fit` 保持比例输出，`overSharp=1`。
自定义缩放仍由游戏选项开关控制。Linux HDR 尚未实现，默认关闭。
`settings.json` 按游戏设置写回；改名不迁移现有存档目录。

原生 Linux 的数据目录依次由 `PVZ_APPDATA_DIR`、XDG 数据目录或
`$HOME/.local/share/PlantsVsZombiesModern` 决定，保留旧名称以保留进度。
显式 `PVZ_SETTINGS_FILE`、`PVZ_LOG_DIR`、`PVZ_SCALE_CONFIG_FILE`
可用于隔离测试。不要把 WSL 的 `./data` 启动约定当作原生 Linux 默认值。

## Linux 运行库

当前直接依赖包括 glibc、C++ 运行库、Vulkan loader、OpenAL Soft、DXC/DXIL、
BASS，以及 X11 或 Wayland/xkbcommon/libdecor 客户端库。
Linux 桌面错误对话框使用系统的 `zenity`（GNOME）或 `kdialog`（KDE）；
启动失败、缺少缩放效果或资源错误会显示诊断，不依赖游戏窗口或 Vulkan 初始化成功。
没有显示会话或两项工具均不可用时，仍保留 stderr/日志与失败退出码。
BASS 只负责解码，Linux 声音输出由 OpenAL Soft 完成；Windows 音效使用
DirectSound，平台代码分离。

`tools/package-linux-runtime.py CLEAN_RELEASE NEW_OUTPUT` 在 Linux 上将可信
ELF 的递归依赖收集到 `env/`，使用配套 loader/libc 启动，生成哈希和来源清单。
输入需要主程序、BASS、资源包和 shader，输出必须是新目录。
`env/shaders -> ../shaders` 保持显式 loader 启动后的资源定位。

该工具的结果仍为候选环境：动态音频后端、libdecor 插件、键盘布局等数据
不在 ELF 闭包内；Vulkan ICD 和显卡驱动来自目标机器。
`-march=native` 也保留构建机指令集要求，因此不能承诺任意 Linux/任意 CPU。
打包回归为 `python3 tools/test-package-linux-runtime.py`。

## 诊断与性能采样

保留原版诊断快捷键：`Ctrl+Alt+D` 启用，`F3` 显示帧率，
`Shift+F3` 切换指标。GNOME 若拦截显示桌面，可单独禁用该系统绑定：

```sh
gsettings set org.gnome.desktop.wm.keybindings show-desktop "[]"
```

正式游戏默认 `PVZ_ENABLE_GAME_PROBES=OFF`。临时开启烟测需显式配置
`-DPVZ_ENABLE_GAME_PROBES=ON`，测试结束后重新构建 OFF 的发行程序。
测试源码保留，发行程序不包含这些入口、逐帧计时和提交计数。
原版 TodLog、错误/崩溃处理和官方诊断功能保留。

Windows 实玩对照双方为原版 1073 与当前项目，均用 **core LP14（`0x4000`）**；
**11x 用户实机确认，25x 尚待切换核实**，不换算具体频率。
亲和性只选择 CPU；观察者避开被测核，不与游戏抢同一个核。
credits 对齐播放区间，无尽使用同源存档、阵型、波次、尺寸和缩放设置，
预热后 ABBA，正式区间至少 120 秒，不并行构建或运行别的基准。
25x 的 credits 与统一无尽 CPU/FPS、平均每帧 CPU 成本已记录在
[性能总账](docs/perf-fix-ledger.md)，包含数据口径、证据和限制；11x 实玩测试已取消。
现行固定 Draw 仅列当前项目值；其他未重测子项明确保留为历史证据、当前值待更新，
不以现代项目冻结旧版作为现行基线。原版算法到已落地算法的确切历史收益仍保留。

| 工具 | 数据口径 |
| --- | --- |
| `Tests/performance/monitor_cpu_native.c` | QPC 实际间隔内的进程 user+kernel CPU 时间，单核满载为 100% |
| `Tests/performance/fps_probe.cpp` | 窗口变化帧及桌面呈现采样，不等于游戏精确 FPS/update/s；窗口必须前台 |
| `Tests/performance/measure-linux-process.py` | 原生 Linux 进程 CPU，逐线程核对亲和性，明确拒绝 WSL |

采样采用起点加绝对截止时间，迟到不累积漂移、不补发假样本。
唤醒仍有调度抖动，报告使用真实间隔。Linux CPU 编号先按拓扑核实，
不能假设 Linux CPU14 自动等于 Windows LP14。

```sh
taskset -c N ./out/x64-x11-vulkan/Release/pvz_perf
python3 Tests/performance/measure-linux-process.py --pid PID --cpu N \
  --scene credits --seconds 120 --output /tmp/pvz-credits-run1
```

无尽改为 `--scene endless`，Wayland 改用其构建目录；两种窗口系统串行测量。
该采样器不推算 FPS，帧率须由同轮独立采集或人工诊断显示补充。
原生 Ubuntu Wayland/Vulkan 已完成 credits 与统一无尽的 FPS/CPU 独立采集，
结果及时间曲线见[性能总账](docs/perf-fix-ledger.md)。新入口为
`Tests/performance/run-linux-game-perf.py`，配套构建与运行说明见
[性能工具](Tests/performance/README.md)。本轮锁 25x 最高倍频上限（用户确认），X11 尚未实测；不能将其直接当作
与 Windows 同核同频的性能对照，也不能把编译通过或 WSL 数据写成实机性能通过。

总账直接引用的精选原始记录位于 `Tests/evidence/`，历史对照夹具位于
`Tests/reference/`；两者均不作为当前发行包或现代项目冻结性能基线。
根目录 `log/` 只用于临时输出，可以整目录清理；新测试需要时会重新创建。

## 来源

This product includes portions of the PopCap Games Framework,
(c) 2005-2009 PopCap Games, Inc. All rights reserved.
(http://popcapframework.sourceforge.net/).

框架许可见 `pvzPerf/SexyAppFramework/PopCap Framework License.txt`；
游戏素材、依赖和外部缩放效果保留各自的权利及许可，根目录 LICENSE 不代替它们。
