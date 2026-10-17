# 性能测试工具

性能观测、微基准、性能夹具生成器和结果分析工具统一放在本目录。
tools 仅放生产构建、资源编译、转换和打包工具。
本目录 build 下的可执行文件、DLL 和中间产物可重新生成，不进入 Git。
运行结果写入对应 out 构建组合的 measurements 目录，入账证据保存在 Tests/evidence。
统一无尽输入使用 Tests 根目录的 DAT/DAT64。

主要入口：

- run-linux-game-perf.py：原生 Linux 外部只读 FPS/CPU 采集，游戏所有线程绑定
  Linux CPU14（LP14），采集器绑定 Linux CPU15（LP15）。读取已有 mDrawCount，
  统计的是游戏绘制帧，不是显示器实际呈现帧。
- report-linux-game-perf.py：归档 Linux credits/无尽采样，仅分析 segment=game，
  生成无尽 FPS/CPU 时间曲线、区间 CPU ms/绘制帧及文件哈希；需要 matplotlib 与中文字体。
- run-windows-game-perf.py、windows_game_probe.py：外部只读采样游戏已有计数器及进程 CPU 时间。
- report-windows-game-perf.py：仅分析 segment=game，生成 FPS/CPU 时间叠加图、
  区间平均 CPU ms/绘制帧、原始记录与汇总；绘图依赖 matplotlib。
- analyze-credits.py：重算已人工确认的本轮 credits 共同区间；保留项目场景 5
  被误标 other-scene 的原始证据，另存 CPU/帧明细、汇总与 SHA256，不生成图片。
- measure-linux-process.py：原生 Linux 的进程 CPU 观测。
- game_perf_layout.cpp：用当前源码生成当前项目的内存字段偏移。
- fps_probe.cpp：窗口变化帧和呈现采样，不作为游戏精确帧计数。
- monitor_cpu_native.c：按 QPC 实际采样间隔计算进程 CPU 占用。
- bench_*.cpp、对应运行及夹具生成脚本：独立微基准。

正式性能测量仍由主对话串行执行，Windows 使用 LP14。
Windows 观测器直接执行构建目录已有的 pvz_game_perf_layout，从其输出生成字段偏移；
准备和启动测量不会触发 CMake。布局工具须与被测程序对应，源码布局改变时在测量前更新。
游戏界面由用户操作：第一次 Enter 开始观测，第 3 秒启动或恢复场景，
再次 Enter 或游戏退出结束观测；按 Enter 停止后，正常退出游戏再进入下一轮。
旧夹具的存档哈希若与 Tests 的当前基准不同会直接拒绝。
正式采样必须显式指定 --multiplier 11x 或 25x；工具不修改倍频，
也不将构建期间的解禁频率自动记成锁频测量。prepare-only 不要求倍频标签。
启动游戏不传 -nosound。runner 读取原版注册表的音乐、音效和静音设置，
将同组音量写入项目的独立设置文件，并保存两侧配置证据。
samples.csv 保存有效区间的平均 CPU ms/绘制帧，measurement.json 保存累计 CPU 时间、
绘制帧数与二者之比；不代表逐帧独立计时。
跨程序对拍须对齐声音条件，未对齐的历史记录必须注明，不能发布严格同条件提升百分比。
旧微基准的历史输入、编译器安装路径和方法在各脚本中明确记录，
没有迁移成当前版本实玩 FPS 结论。

## 原生 Linux 无尽采集

先构建与被测程序配套的布局工具和校验清单，两套后端分别准备：

```sh
cmake --build out/x64-x11-vulkan --target pvz_linux_perf_tools --parallel 8
cmake --build out/x64-wayland-vulkan --target pvz_linux_perf_tools --parallel 8
```

不修改游戏计数器，不注入代码，不写进程内存，也不需要 sudo。
运行器作为游戏父进程，满足默认 Linux ptrace 权限限制；不能改为先手动启动游戏
再让无关进程读取。启动采集不会自动重新编译，程序或布局工具哈希变化时拒绝测量，
要求重新构建上述目标。

准备好玩家 ID1 的全通关 DAT64 后，正常退出所有游戏，再在终端执行其中一项：

```sh
./out/x64-x11-vulkan/Release/measure-endless.sh
./out/x64-wayland-vulkan/Release/measure-endless.sh
```

每次运行都会验证 Tests/manifest.json 中的无尽基准哈希，然后覆盖实际存档目录的
game1_58.dat64，保证从同一关卡状态开始；users.dat 与 user1.dat64 不会被运行器替换。
默认存档目录为 ~/.local/share/PlantsVsZombiesModern，可用 PVZ_APPDATA_DIR 指定独立目录。
不要把 PVZ_APPDATA_DIR 指向仓库 Tests/，后者必须保持只读基准用途。
启动前可核对 Linux CPU14/15 的拓扑；编号不自动证明与 Windows 同名 LP 对应。

进入生存无尽并准备恢复后，回到终端按 Enter，随后 3 秒内切回游戏、恢复关卡。
默认不限制采集时长，退出游戏结束采集。启动后 8 秒开始等待 Enter；
--seconds 可设置可选的时长上限，--warmup 可调整启动等待。菜单、暂停、失焦、其他模式和
棋盘切换区间保留原始记录，但不进入有效区间汇总。菜单烟测不算正式游戏性能结果。

输出位于对应构建目录的 measurements/<场景>-<时间>/：samples.csv 同步记录
FPS、update Hz、单核 CPU 百分比、CPU ms/绘制帧、波次和游戏计数器，
measurement.json 记录程序/布局/配置/关卡哈希、亲和性、CPU 拓扑与频率信息。
CPU 时间来自 /proc 的进程累计 user+system tick，默认每秒采样，存在 tick 量化。
有效区间的 FPS、CPU 和 CPU ms/帧按真实时间和帧数加权，不能当作逐帧 CPU 计时。
工具只设 CPU 亲和性，不锁倍频，不将 scaling_cur_freq 当作锁频证据。

音频或驱动库可能放宽新线程的继承亲和性；运行器在初始化后及采样前逐线程锁定
CPU14，采样期间若发现任一线程离开 CPU14 则拒绝本轮，不静默纠正后继续出成绩。

生成与总账配套的分析（输出目录必须尚不存在；中文字体可用 --font 指定）：

```sh
python3 Tests/performance/report-linux-game-perf.py \
  --credits out/x64-wayland-vulkan/measurements/credits-20261018-014530-612976 \
  --endless out/x64-wayland-vulkan/measurements/endless-20261018-014936-174820 \
  --destination /tmp/pvz-linux-report --max-ratio 25x
```

脚本核对原始采样、场景、模式、亲和性和测量汇总，保留原时间轴、剔除区间缺口，
不平滑、不生成逐帧独立耗时。归档中的事后硬件/设置快照单独注明采集时点，
不得用它们倒推整轮频率、音量或缩放开关状态。
--max-ratio 仅登记用户已确认的最高倍频限制，允许降频，不等于全程恒定频率，
也不改写采集器原始元数据。本轮用户确认的上限为 25x。
