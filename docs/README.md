# 变化与验证

只维护当前有效的变化、底层原理和验证结果，不保留开发编年、任务书或交接故事。

| 文档 | 内容 |
| --- | --- |
| [v2.0 发布说明](releases/v2.0.md) | 存档/PAK64 不兼容升级、离线图集和发行使用方法 |
| [性能总账](perf-fix-ledger.md) | 当前最终测量结果，以及超过 10% 的优化成果；机制、范围和证据 |
| [修复总账](fix-ledger.md) | bug 的触发条件、根因、修复与验证数据 |
| [存档转换](DAT-DAT64-CONVERSION.md) | DAT/DAT64 协议、模式和图像编号、转换器行为 |
| [资产边界](ASSETS.md) | 编译输入、发行资源、外部效果和 shader 对应关系 |
| [定义图集 v5](RESOURCE-V5-FORMAT.md) | 定义持有 GPU 图集、内联矩形协议、程序赋值与纹理归属 |
| [图集共享审计](definition-atlas-overlap-audit.md) | 全量定义纹理交集、候选合并收益与加载边界 |

构建、运行、缩放配置、Linux 打包和采样入口见[项目说明](../README.md)。
性能测试固定使用 **LP14**，按用户指定的 **11x / 25x** 分别记录，不换算具体频率；
本轮 25x 无尽的时间曲线、CPU/帧及数据限制已写入性能总账。
功能通过不能替代实玩 CPU/FPS 数据，历史未锁或不同负载不能混成提速倍率。

`particle-emitter-corpus-verification.json` 和 `particle-emitter-names.txt`
保留为数值化语料的机器可读证据，不是开发日志。
总账实际引用的精选原始记录保存在 `Tests/evidence/`；
历史对照夹具位于 `Tests/reference/`。根目录 `log/` 只用于可清理的临时输出。
