# 独立透明度蒙版审计（2026-11-15）

以实际 PAK 的 compiled/resources.compiled 和包内文件为依据，按 ImageLib 的自动查找规则解析。只统计独立透明度蒙版／alpha-grid，不把染色图层、效果遮罩或字体 alpha 算成同一类。

## 实际运行包

- 高清（两张固化 PNG 接入后）：0 项资源使用外置透明蒙版。
  - 固化前的两项为 images/blank 和 images/PvZ_Logo，当前均已改为自带 alpha 的 PNG，并关闭对应侧车蒙版查找。
- main v4.0.4：22 项资源，20 个不同蒙版文件。
  - images/fog → images/fog_.jpg
  - images/sod1row → images/sod1row_.png
  - images/sod3row → images/sod3row_.png
  - images/Credits_ZombieNoteBlack → images/credits_zombienote.png
  - images/Store_Car → images/store_car_.png
  - images/Store_CarClosed → images/store_carclosed_.png
  - images/ZombieFinalNoteBlack → images/zombiefinalnote.png
  - images/ZombieNote → images/zombienote_.png
  - images/ZombieNoteBlack1 → images/zombienote1.png
  - images/ZombieNoteBlack2 → images/zombienote2.png
  - images/ZombieNoteBlack3 → images/zombienote3.png
  - images/ZombieNoteBlack4 → images/zombienote4.png
  - images/ZombieNoteHelpBlack → images/zombienotehelp.png
  - images/blank → images/blank_.gif
  - images/PvZ_Logo → images/pvz_logo_.png
  - images/options_menuback → images/options_menuback_.png
  - images/Tombstones → images/tombstones_.png
  - images/Zen_GoldToolReticle → images/zen_goldtoolreticle_.png
  - images/pool_base → images/pool_base_.png
  - images/pool_base_night → images/pool_base_.png
  - images/pool_shading → images/pool_shading_.jpg
  - images/pool_shading_night → images/pool_shading_.jpg

原 blank 是从单独 mask 生成的占位资源，没有 JPEG/PNG 主图，因此最初只检查主图＋蒙版配对会漏掉它。现已固化为 107×34 全透明 PNG。其余五项虽然开启自动查找，包内没有匹配蒙版，不发生拼接。

## 源工程旧式关系

当前引用的 31 项素材仍保留旧式透明度来源关系，对应 29 个不同文件。高清替代图和生成图集通常已经自带 alpha，不能把这份源清单误当成运行时加载次数。

| 原素材 | 旧透明度来源 |
|---|---|
| images/credits_bigbrain | assets/runtime/images/Credits_BigBrain_.png |
| images/credits_zombienoteblack | assets/runtime/images/Credits_ZombieNote.png |
| images/fog | assets/runtime/images/fog_.jpg |
| images/pool_base | assets/runtime/images/pool_base_.png |
| images/pool_base_night | assets/runtime/images/pool_base_.png |
| images/pool_shading | assets/runtime/images/pool_shading_.jpg |
| images/pool_shading_night | assets/runtime/images/pool_shading_.jpg |
| images/sod1row | assets/runtime/images/sod1row_.png |
| images/sod3row | assets/runtime/images/sod3row_.png |
| images/store_car | assets/runtime/images/Store_Car_.png |
| images/store_carclosed | assets/runtime/images/Store_CarClosed_.png |
| images/tombstones | assets/runtime/images/Tombstones_.png |
| images/zen_goldtoolreticle | assets/runtime/images/Zen_GoldToolReticle_.png |
| images/zombiefinalnoteblack | assets/runtime/images/Zombiefinalnote.png |
| images/zombienote | assets/runtime/images/ZombieNote_.png |
| images/zombienoteblack1 | assets/runtime/images/ZombieNote1.png |
| images/zombienoteblack2 | assets/runtime/images/ZombieNote2.png |
| images/zombienoteblack3 | assets/runtime/images/ZombieNote3.png |
| images/zombienoteblack4 | assets/runtime/images/ZombieNote4.png |
| images/zombienotehelpblack | assets/runtime/images/ZombieNoteHelp.png |
| reanim/crazydave_body1 | assets/runtime/reanim/CrazyDave_body1_.png |
| reanim/credits_wearetheundead | assets/runtime/reanim/Credits_wearetheundead_.png |
| reanim/tree6 | assets/runtime/reanim/tree6_.png |
| reanim/tree7 | assets/runtime/reanim/tree7_.png |
| reanim/tree8 | assets/runtime/reanim/tree8_.png |
| reanim/tree9 | assets/runtime/reanim/tree9_.png |
| reanim/tree_overlay8 | assets/runtime/reanim/tree_overlay8_.png |
| reanim/tree_overlay9 | assets/runtime/reanim/tree_overlay9_.png |
| reanim/zombie_boss_neck | assets/runtime/reanim/Zombie_boss_neck_.png |
| reanim/zombie_boss_upperbody | assets/runtime/reanim/Zombie_boss_upperbody_.png |
| reanim/zombieswon | assets/runtime/reanim/ZombiesWon_.png |

## 本轮菜单背景

完整底座候选已获用户确认并接入。author 资源明确指向 options_menuback.png，并禁用独立 alpha 自动查找；当前高清绑定为完整底座 RGBA PNG，逻辑尺寸仍为 423×498。原 JPEG 和旧蒙版保留供历史审核，未再套回高清图。

带正确 alpha 的图片无需再次加蒙版。旧图转换应离线合入灰度透明度，不能全局把所有黑色像素删除，否则会误删内部黑色或丢失半透明边缘。

## 本轮剩余两项固化

PvZ_Logo 与 blank 已获用户确认并接入高清分支，保持原来的 700×116、107×34 逻辑尺寸。PNG 解码像素与固化参考逐字节相同，实际 PAK 描述符审计确认外置透明蒙版为零。main 仅新增待办文档 `docs/main-resource-baking-backlog.md`，其程序和资源没有改动。
