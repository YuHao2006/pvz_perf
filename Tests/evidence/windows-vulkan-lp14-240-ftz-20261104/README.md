# FTZ／DAZ 无尽观察

2026-11-04，Windows Vulkan Release/LTO，LP14（0x4000），240FPS上限，用户设定11x。观察器不设置或采集实际CPU/GPU频率。正式性能总账未更新。

运行时改变仅为在游戏主线程和加载线程初始化时开启非正规数输入／结果归零；未启用 `/fp:fast`，无每帧寄存器设置、统计或额外分支，存档格式不变。ARM64对应FZ代码通过NDK编译检查，但本轮没有Android运行或测量。启动后通过外部线程上下文读取确认主线程MXCSR为0x9FE0，FTZ与DAZ均开启；该短暂上下文检查发生在按Enter武装观察器之前。

按Enter开始、+3秒恢复战斗、Quit结束。起点验证为暂停、2291960000000ns、wave0、20波、9990阳光。只统计valid=1、segment=game的前台战斗：374秒记录中364秒有效，70095次绘制，326.625秒进程CPU时间，最终正常game-exited。

| 指标 | v3.2.4历史干净版 | 3.3 SDR分相插桩版 | 本轮FTZ／DAZ无插桩版 |
| --- | ---: | ---: | ---: |
| 有效战斗秒数 | 359.000 | 363.000 | 364.000 |
| 平均绘制FPS | 196.736 | 188.898 | 192.569 |
| CPU占用，单核=100% | 89.550% | 90.121% | 89.732% |
| 进程CPU ms／绘制帧 | 4.55180 | 4.77090 | 4.65975 |

本轮比上次SDR观测FPS高1.94%，CPU ms／帧低2.33%；仍比v3.2.4历史观察FPS低2.12%、CPU ms／帧高2.37%。这两组都不是FTZ的干净A/B：SDR基线带插桩且源码存在其他差别，v3.2.4更早；战斗对象、操作、随机数消费及步长轨迹也不完全一致。因此仅记为观察值，尚无明确证据证明游戏受到denormal瓶颈限制，不能套用刻意构造的次正规数微基准倍率。

`fps-cpu.png/svg`将本轮FPS和进程CPU占用放在同一时间轴，使用不同颜色和左右坐标轴。`comparison.png/svg`按Board时间对齐最近SDR基线；三项分别为FPS、CPU占用和CPU ms／帧。均为原始一秒样本，无平滑。CPU ms／帧为整个进程累计CPU时间除以绘制计数，不是单帧耗时或延迟；FPS p10同样只描述一秒采样区间，不是逐帧p10。

重建：

```powershell
python Tests/performance/compare_endless_runs.py Tests/evidence/windows-vulkan-lp14-240-sdr-phases-20261104 Tests/evidence/windows-vulkan-lp14-240-ftz-20261104 Tests/evidence/windows-vulkan-lp14-240-ftz-20261104 --baseline-label "3.3 SDR（含分相插桩）" --current-label "3.3 FTZ/DAZ（无分相插桩）" --overlay-fps-cpu
```

被测EXE哈希、起点和退出状态保存在measurement.json；浮点控制、配置和测量条件分别见conditions.json、settings-used.json、scale-used.json。build.txt包含当前模式测试结果：输入／结果归零、普通乘法、舍入与异常掩码保留、重复设置和工作线程初始化均通过。未提交或推送本轮代码与数据。

## BASS内部线程的独立核对

游戏附带的Windows x64 BASS为2.4.17.0（BASS_GetVersion=0x02041100），DLL哈希见bass-thread-check.json。使用同一DLL的独立静音FP32流，分别在调用线程FTZ/DAZ关闭和开启的两种状态下初始化真实输出、安装流与DSP回调并播放2.2秒。

关闭模式下，主线程控制为0x1F80，加载和初始化BASS没有把它改为FTZ。内部更新线程的22次流回调、22次DSP回调均为0x9FC0（FTZ/DAZ均开）；主线程预缓冲回调中也为0x9FC0，处理完成后调用者控制恢复为0x1F80。开启模式下，两类内部回调同样为0x9FC0。日志中的0x1FA0/0x9FE0多出的0x20属于异常粘滞状态位，不改变FTZ/DAZ结论。

因此本机这份BASS的上述音频处理路径原本就自行归零非正规数，本轮游戏初始化改变没有为它新增这项保护。这里不是对游戏进程全部音频线程的采样，也没有据此宣称DirectSound、OpenAL、插件或其他平台全部覆盖。无须向BASS私有线程注入寄存器设置，生产代码未因此新增回调。

官方作者对x64 BASS处理时启用flush-to-zero并在处理后恢复调用者状态的说明：https://www.un4seen.com/forum/?topic=19062.0 。本地探针源码及结果为bass-thread-probe.cpp、bass-thread-check.txt；编译时使用MSVC /O2 /fp:strict，头文件取当前仓库bass.h，无需BASS导入库，DLL路径为命令行第一参数，第二参数存在时显式开启调用者FTZ/DAZ。
