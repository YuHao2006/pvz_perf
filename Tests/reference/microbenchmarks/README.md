# 历史小基准源码

`historical-fixtures.tar.gz` 保存从 `_shared/bench35` 收回的 151 个 `.cpp`、`.h` 文件。
逐文件路径和 SHA256 见 `manifest.json`。不包含旧 EXE、OBJ 或测量结果。

这些文件包含历史游戏函数片段、旧算法、简化对象和下游桩，并不是完整的原版
1073 反编译源码。部分文件直接包含项目枚举或轨道头，部分完全独立。
代码里的 “HEAD”“现行” 均指创建夹具时的历史版本，不能理解为当前工作树。

复测时先解压到系统临时目录，再调用
`Tests/performance/refresh-small-benchmarks.py --archive <解压目录> --output <新的结果目录>
--vs-root <Visual Studio安装目录>`。测量通过原生启动器在挂起状态绑定 LP14，
随后串行运行；构建和 EXE 均留在系统临时目录。

工具仅修正临时头文件副本中指向旧项目根目录的绝对 include 路径。
旧r3夹具使用`dependencies`中的冻结枚举、轨道和字符串声明，来源提交及哈希
见其manifest；不使用重排后的当前枚举替代旧输入含义。
`current_table_in_historical_harness` 额外从当前游戏源码提取表声明，保留原夹具的
输入、旧实现、下游桩和计时边界。它测量的是这个受限范围，不等于当前完整业务函数。
`historical_fixture_reproduction` 仅复现历史夹具，不能作为当前生产代码的性能。

已退役的解码器、标志位、资源参数表，以及布局或业务含义已变化的模型，
须单独标记，不用其他测量项目替换它们的历史指标。
