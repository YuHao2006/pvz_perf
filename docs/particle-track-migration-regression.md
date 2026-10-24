# 粒子轨道归属回归修复

2026-10-24 根据泳池白色闪点越过池沿、樱桃爆炸异常的反馈，查明早前原版粒子记录转 DSL 时的字段错位。该问题先于 GPU 泳池波纹改造；真实泳池素材在 800、1400 宽度、昼夜四种场景下，新 GPU 水面与旧 Graphics 三角绘制的最大通道差均为 1。

## 原因和修复

`tools/migrate_particle_v7.py` 曾把原版 compiled 的序列化顺序误认为 C++ 成员顺序：

- 原版保存 `EmitterPath, EmitterSkewX, EmitterSkewY`，错误读取顺序为 `EmitterSkewX, EmitterSkewY, EmitterPath`。
- 原版保存 `SystemRed, SystemGreen, SystemBlue, SystemAlpha, SystemBrightness, LaunchSpeed, LaunchAngle`，错误读取时将速度和角度放在了系统颜色之前。

PoolSparkly 的原版 `EmitterSkewX = -0.3` 因此被写成 `EmitterSkewY = -0.3`。以 `(450,295)` 为锚点，正确的 Y 出生范围是 `295～430`；错误的纵向斜切使其最低可到 `208`，把右侧粒子抬到了池沿上方。原版 XML、保留的 compiled 参考、早期 DSL 三者均确认应使用 X 轴。

樱桃爆炸 Powie 的烟云发射速度也被误写进系统透明度等轨道，影响烟云扩散和淡出。另有独立的默认渲染快速路径错误：缺省 `ParticleStretch` 被设为 0，而普通求值及生成默认值均为 1，导致 PowieWord 的纵向缩放归零。该快速路径已恢复为 1。

修复保留所有节点正文，仅纠正 88 份粒子 DSL 的属性名称，并修正只读迁移审计工具的原版字段顺序。未重新注入行为文件，没有改节点数值、曲线、分布或采样时间；没有新增运行期字段、覆写或特殊位置钳位。生成 C++ 定义随资源构建更新。

旧数值回归测试曾同时用迁移工具的顺序解释新 source record，导致同一个错误自我验证。现在测试分别声明两种记录的字段顺序，并增加独立原版 wire decoder 对拍。

## 验证

- `test_particle_native_track_names.py`：全部 112 个根定义、222 个发射器的 2,220 个相关字段，与独立解码的原版记录逐节点比较；时间、上下界、曲线及分布的 float32 位模式零差异。包含省略空轨和隐式时间测试。
- `test_v7_definition_numbers.py`：实际运行 DSL 编译器，比较全部 3,133 个节点与保留的原版记录，五项测试通过。
- `test_static_particle_codegen.py`：五项生成存储与默认值测试通过。
- `ParticleRenderParamsTests.cpp`：真实粒子池验证 PowieWord 在出生、中段和末段的快、慢路径参数与非退化变换；真实烟云出生速度和系统颜色／透明度符合原版轨道。
- 同一原生测试以固定随机种子对 PoolSparkly 的两个发射器各进行 512 次真实出生，验证 Y 均处于 `295～430`，横向偏斜反解后的 BoxX 也在各自定义范围内。
- `ImageRuntimeTests.cpp` 额外经过实际 `PoolEffectDraw` 入口，以真实背景和泳池资源验证昼夜、宽屏平移及旧 CPU 三角路径，避免只测试后端参数。

修复后的 Vulkan 和 Win7 OpenGL 主程序均已直接构建到各自 Release；两者的完整 ImageRuntimeTests 均通过。行为数据位于生成的 C++ 中，本次两份 `main.pak64` 的 SHA-256 均保持为 `58444F294A2A03B94708CCFF613F33BAA3B52C8FBC22B3EB130C6EAEF7DF20F7`。没有改变存档结构。

已有运行中粒子的出生位置不会被这项定义修复倒推重写。重新进入关卡使新粒子使用修正后的生成参数。
