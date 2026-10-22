# v4 纹理符号三方使用审计

基线：`0c1c98755ce11a599a39f9b0ba2258ccc447ca37`。数据直接读取 Git blobs，不依赖工作区 DSL 入口、当前 v5 包或当前生成资源表。

复现：

```powershell
python -B tools/audit_texture_symbol_usage.py --ref 0c1c987 --output out/v4-texture-symbol-usage.json --markdown docs/v4-texture-symbol-usage.md
```

R 为发布 reanim 作者定义引用；P 为发布 particle 作者定义引用；C 为真实 C++ 标识符引用。排除 Resources.cpp/h 自动绑定、generated/unused/tests、注释和字符串。资源 manifest 声明或字体页保护不构成 C，manifest 声明本身也不等于 UI 实际使用。此审计证明源码直接引用，不声称每条分支都会在某次运行执行。

语料：146 个 reanim、106 个发布粒子；扫描 416 个 C++ 文件。R/P/C 各含 1615/93/620 个符号；三方交集 **1 个**。完整引用及每个定义的具体行号见 JSON。

| Symbol ID | 符号 | Reanim 定义 | Particle 定义 | C++ 直接引用 |
| --- | --- | --- | --- | --- |
| 1360 | `IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL` | Zombie_catapult | CatapultExplosion, UmbrellaReflect | `pvzPerf/Lawn/Projectile.cpp:1094` |

## 豌豆族实际定义

| 植物 | ReanimationType | 作者定义 | 基线 C++ 位置 |
| --- | --- | --- | --- |
| `SEED_PEASHOOTER` | `REANIM_PEASHOOTER` | `PeaShooterSingle` | `pvzPerf/Lawn/Plant.cpp:30` |
| `SEED_SNOWPEA` | `REANIM_SNOWPEA` | `SnowPea` | `pvzPerf/Lawn/Plant.cpp:35` |
| `SEED_REPEATER` | `REANIM_REPEATER` | `PeaShooter` | `pvzPerf/Lawn/Plant.cpp:37` |
| `SEED_THREEPEATER` | `REANIM_THREEPEATER` | `ThreePeater` | `pvzPerf/Lawn/Plant.cpp:48` |
| `SEED_SPLITPEA` | `REANIM_SPLITPEA` | `SplitPea` | `pvzPerf/Lawn/Plant.cpp:58` |
| `SEED_GATLINGPEA` | `REANIM_GATLINGPEA` | `GatlingPea` | `pvzPerf/Lawn/Plant.cpp:70` |
| `SEED_LEFTPEATER` | `REANIM_REPEATER` | `PeaShooter` | `pvzPerf/Lawn/Plant.cpp:82` |

七种植物对应六份定义：普通豌豆使用 `PeaShooterSingle`，双发和反向双发共用 `PeaShooter`。因此不能把 `REANIM_PEASHOOTER` 误认作全部豌豆植物共享的一份定义。建议主族 group 使用以下六份，不为反向双发重复创建成员：

`GatlingPea`, `PeaShooter`, `PeaShooterSingle`, `SnowPea`, `SplitPea`, `ThreePeater`

共享纹理关系：

| Symbol ID | 符号 | 共享定义 |
| --- | --- | --- |
| 774 | `IMAGE_REANIM_PEASHOOTER_BACKLEAF` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 775 | `IMAGE_REANIM_PEASHOOTER_BACKLEAF_LEFTTIP` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 776 | `IMAGE_REANIM_PEASHOOTER_BACKLEAF_RIGHTTIP` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 777 | `IMAGE_REANIM_PEASHOOTER_BLINK1` | PeaShooter, PeaShooterSingle, SplitPea |
| 778 | `IMAGE_REANIM_PEASHOOTER_BLINK2` | PeaShooter, PeaShooterSingle, SplitPea |
| 779 | `IMAGE_REANIM_PEASHOOTER_EYEBROW` | GatlingPea, PeaShooter, SplitPea |
| 780 | `IMAGE_REANIM_PEASHOOTER_FRONTLEAF` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 781 | `IMAGE_REANIM_PEASHOOTER_FRONTLEAF_LEFTTIP` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 782 | `IMAGE_REANIM_PEASHOOTER_FRONTLEAF_RIGHTTIP` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea, ThreePeater |
| 783 | `IMAGE_REANIM_PEASHOOTER_HEAD` | PeaShooter, PeaShooterSingle, SplitPea |
| 790 | `IMAGE_REANIM_PEASHOOTER_MOUTH` | PeaShooter, PeaShooterSingle, SplitPea |
| 791 | `IMAGE_REANIM_PEASHOOTER_STALK_BOTTOM` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea |
| 792 | `IMAGE_REANIM_PEASHOOTER_STALK_TOP` | GatlingPea, PeaShooter, PeaShooterSingle, SnowPea, SplitPea |

`FirePea` 是火焰豌豆效果定义，不是上述七种植物的主体定义。它使用 5 个符号，与上述六份定义的符号交集为 0。因此为减少共享源图片重复打包而建立的主族 group 建议不纳入它；若希望弹丸效果和植物一同驻留，应显式将其作为效果成员并衡量生命周期和额外像素。其全部符号已列在 JSON 的 `pea_family.firepea_symbols`，可据实际重叠决定。
