# 高清运行资源

本目录是已审核素材的运行时输入；原图与审核记录位于本机 source-art 工作目录，不参与游戏加载。

- `images.json` 将原资源名映射到已处理的 PNG，并记录原版逻辑尺寸。图片像素统一为逻辑尺寸的两倍，目标为 1200 像素高的游戏画面。
- `provenance.json` 保留来源、处理区域和来源校验值。
- 未列入映射的图片继续使用 `assets/runtime` 原图。未通过的候选不会自动替换。
- Zombatar 暂时整套保留原分辨率；共享部件通过构建期别名隔离，不影响普通僵尸的高清素材。
- 生成图集使用实际像素计算 UV，绘制宽高和动画坐标使用原版逻辑像素。缓存的角色缩略图同样保存两倍像素。
- `cards` 是已审核的完整竖版卡牌；价格仍由游戏绘制。未提供完整卡牌的类型沿用原绘制路径。
- `fonts.json` 是高清字体图层映射。BrianneTod、DwarvenTodcraft、HouseofTerror、Continuum 共十八份字体定义使用两倍像素纹理；四倍母图与原始字形指标保留在 source-art。字身按原亮色笔画范围生成，字符逻辑宽高、基线、偏移、字距和图层颜色保持原值。字体编译格式 v2 在加载时区分物理纹理尺寸与逻辑尺寸，逐字绘制路径不增加分支；未替换字体仍使用 v1。

开发期间 `assets/definitions/ResourceBuild.pvzbuild` 使用 `solver maxrects` 快速装箱；定版前可切为 `solver exact` 做面积优化。两种方式均禁止旋转，并限制图集宽高不超过 4096。

构建工具源码位于独立的 PvzDevTools 仓库 high-resolution 分支；本仓库使用 tools/bin 下的预编译工具。

运行时超分辨率入口、状态和配置解析已删除；原 Custom Scale 复选框保留为禁用的占位控件，等待以后改作其他设置。scale.json 仅保留 HDR 配置。窗口客户区高度固定为 1200，只允许横向调整宽度；settings.json 的 windowWidth 记录窗口宽度。旧的 customScale、windowHeight 字段不再使用。
