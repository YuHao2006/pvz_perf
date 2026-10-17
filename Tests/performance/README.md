# 性能测试工具

性能观测、微基准、性能夹具生成器和结果分析工具统一放在本目录。
tools 仅放生产构建、资源编译、转换和打包工具。
本目录 build 下的可执行文件、DLL 和中间产物可重新生成，不进入 Git。
运行结果写入对应 out 构建组合的 measurements 目录，入账证据保存在 Tests/evidence。
统一无尽输入使用 Tests 根目录的 DAT/DAT64。

主要入口：

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
