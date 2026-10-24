# 文档索引

维护当前机制、使用边界与最终验证。原版证据和已发布版本独立保存；
本地进行中的存档改造不等于已发布。开发中的最终协议以实现完成后的版本说明为准，
不从旧发布包或历史协议页推断当前可执行文件支持范围。

| 文档 | 内容 |
| --- | --- |
| [v2.0 发布说明](releases/v2.0.md) | 存档/PAK64 不兼容升级、离线图集和发行使用方法 |
| [运行时](runtime.md) | 共享时钟、根运动、发射、弹道、曲线、粒子及静态定义 |
| [验证说明](validation.md) | 实际验收覆盖、复现入口与平台限制 |
| [性能总账](perf-fix-ledger.md) | 受控测量的最终结果、落地机制及证据边界 |
| [修复总账](fix-ledger.md) | bug 的触发条件、根因、修复与验证数据 |
| [存档转换](DAT-DAT64-CONVERSION.md) | DAT/DAT64 协议、模式和图像编号、转换器行为 |
| [资产边界](ASSETS.md) | 编译输入、发行资源、外部效果和 shader 对应关系 |
| [资源格式](RESOURCE-V5-FORMAT.md) | 静态定义、NRSC4、图集生成与纹理所有权 |
| [场景 DSL](scene-atlas-dsl.md) | 完整源 sheet、局部 view、作者语法和生成接口 |
| [GPU 泳池](gpu-pool-production.md) | 静态网格、专用顶点路径、五后端契约及绘制回归 |
| [粒子轨道修复](particle-track-migration-regression.md) | 原版 wire 顺序、独立 decoder 与实际出生验证 |
| [历史时间协议](DAT64-TIME-SCHEMA.md) | 原版时间字段及 DAT64 v2 映射，不是当前对象字段清单 |
| [原有拼图调查](original-atlas-audit.md) | 原始 sheet 布局与完整保存边界 |
| [1073 传送门](portal-relocation-1073.md) | 原版二进制地址、候选行规则与回归 |
| [1073 首次教学](research/1073-first-tutorial.md) | 原版启动与持续规则、纳秒时钟适配 |
| [1073 磁铁起点](research/1073-magnet-coordinates.md) | 原版轨道坐标、偏移证据及当前中心连续约定 |
| [运动时间求值](research/coin-magnet-time-motion.md) | 钱币、阳光、磁铁、老虎机公式与验证 |
| [v1.3 发布说明](releases/v1.3.md) | 该发布版本的使用、资源与验收边界 |
| [空裁剪临时清单](empty-clip-notes.tmp.md) | 用户指定保留的测量用途、已删无效绘制及不可整树跳过的边界 |

构建、运行、缩放配置、Linux 打包和采样入口见[项目说明](../README.md)。
性能以同场景、同核、明确频率条件和被测构建哈希登记；未锁 CPU/GPU
的临时耗时与倍率不写入文档。历史条件不同的数据不能混成当前提速。
总账实际引用的精选原始记录保存在 `Tests/evidence/`；
历史对照夹具位于 `Tests/reference/`。根目录 `log/` 只用于可清理的临时输出。
