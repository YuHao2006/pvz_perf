# 无尽性能基准

唯一输入为原版 1073 的 `game3_13.dat`。测试时校验 `manifest.json` 中的 SHA-256，再用当前转换器生成独立的 DAT64 v5.1。原版模式 13 对应项目模式 58。

当前基准来自用户将原版无尽推进到典型出怪组合后，
于 2026 年 10 月 17 日 22:37:54（Asia/Shanghai）落盘的最新存档，
已替换最初收集的旧存档。保存的 currentWave 字段为 0，
mainCounter 为 229196，nextSurvivalStageCounter 为 0。
原版和项目每轮均从本目录副本恢复相同状态，
统一手动恢复游戏和开始计时的操作，不混用推进后的存档。
观测只读游戏已有计数器和操作系统指标，不修改存档字段或写进程内存。

性能工具统一位于 [performance](performance/README.md)，不放入 tools。

## 重新生成 DAT64

在项目根目录运行：

```powershell
python tools/endless_checkpoint.py out/x64-win32-vulkan/Release/data/pvz_dat64_converter.exe out/benchmark/game1_58.dat64
```
