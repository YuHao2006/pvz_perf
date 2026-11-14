# 高清图鉴边框与牌匾

原始素材来自本机《植物大战僵尸：重植版》Steam build 21398230，分别从
`uiatlasalmanac_assets_all.bundle` 和 `defaultlocalgroup_assets_ui/sprites_*.bundle`
联合读取 Sprite，保留原生透明度与方向。此目录保留原始分辨率，不覆盖原图。

| 图鉴页面 | 外框 | 标题牌匾 |
| --- | --- | --- |
| 索引 | `SPR_Almanac_Frame_Grey` | `SPR_Almanac_Header_Stone_01` |
| 植物 | `SPR_Almanac_Frame_Wood` | `SPR_Almanac_Header_Wood_01` |
| 僵尸 | `SPR_Almanac_Frame_Stone` | `SPR_Almanac_Header_Stone_02` |

索引页左右面板使用 `SPR_Almanac_PlantPanel`、`SPR_Almanac_ZombiePanel`。
牌匾投影使用素材自身的透明像素，不从有色纸背景中抠取。

最终背景为 2800×1200，对应现有 1400×600 逻辑画布。保留现有纸背景、
植物卡片占位虚线及文字/按钮坐标；边框和牌匾按 Unity 的九宫格边界合成，
边角等比缩放，中间延展。`composition.json` 记录九宫格边界和输出映射。
资源编译后仍是一张页面背景，不增加运行时绘制次数，也不改变存档。
