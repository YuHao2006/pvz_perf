# 高清母图库

唯一索引为 catalog.json，浏览入口为 index.html。母图保留原生或已批准 AI 输出的实际分辨率，不强制为4×；4×是最终 PAK64 的导出规格，不能放大运行用2×图冒充母图。

- masters/native、ai、vector、generated：按来源和资源类型归并的母图，共享文件复用。
- reference/original：原版对照，不计入高清母图。
- work/<资源ID>：后续候选、裁切及配方；不要再建立散落的新轮次母图库。
- archive/2026-11-16-pre-library：旧轮次、原始配方、审核记录及变体集中归档。
- ../high-resolution/current：当前绑定的已批准输入。
- ../high-resolution/exports4x：注册的4×构建导出，与实际分辨率母图分开。

添加或更新资源时同步索引的来源、哈希、像素尺寸、逻辑尺寸、配方和审核记录。新 reanim 和 particle 须展示完整效果供用户审核，通过后绑定。旧轮次脚本属于历史配方，不要直接重跑覆盖当前输入。

## 透明裁切

保留原始来源，可裁工作母图和构建导出。记录原逻辑画布、像素密度、物理裁切框和局部绘制偏移，不能根据裁后PNG尺寸重算角色大小。偏移先进入部件局部坐标，再随原变换旋转、缩放。UV对应裁后图集区域，补偿并入现有顶点计算，无需新增draw call。

4×导出裁切留采样护边，坐标和尺寸对齐偶数像素，以支持整体降为2×且归一化UV不变。trim-export只生成工作候选与描述，不修改运行时绑定；正式接入仍须修改相应构建/绘制消费路径并验证。

运行 python tools/hd_assets.py check 检查索引；show <资源ID> 查看来源；work <资源ID> 创建工作区；trim-export <资源ID> 生成裁切候选。python tools/build_hd_library_index.py 重建总览和缩略图。check --require-ready 用于最终完整性门槛，当前待处理项为零，全量4×包已构建并通过启动检查。

## 当前入口与清理

- 看全部素材：index.html；母图只从 masters/ 取，待审图只从 work/ 取。
- 本轮原生补缺审核：work/live-build-coverage/native-heads/index.html；18项包括10种头部、2种手臂、2件跳跳撑杆损坏部件和4帧冰球尾迹，已获用户“全部通过”并绑定4×输入。chat-approval.json记录候选哈希，批准批次禁止原地重生成覆盖。
- 实际编译器发现的缺口与恢复记录：work/live-build-coverage/recovery.json、integration.json。
- 清理记录：work/cleanup/report.json。本轮删除94个冗余中间文件，共380606027字节；没有删除母图、原版参考或审核证据。

历史轮次只放 archive/，不要再把旧候选复制回工作区。与PNG像素逐字节一致的.rgba裸缓存已删除；历史配方确需重跑时，可由记录中的无损PNG用Pillow的 convert("RGBA").tobytes() 精确恢复。

最新补缺：menu-last3/ 的天空与2张阴影已通过并绑定。sunflower-composed-v1/ 保存6种原生部件组合、离线配方及完整动画对照，尚未绑定；动态口型循环仅为审核演示，不代表原版歌词时间轴。

4×构建已完成：原版wink与保留高清外轮廓的5种AI唱歌表情均已通过并绑定；此前组合与无描边候选只作为历史审核记录保留。详见 work/live-build-coverage/status.json。

不透明独立图片的JPEG构建导出：按用户2026-11-17指令，current中17张完全不透明的图片使用JPEG95／4:4:4；无损母图及exports4x仍保留PNG。具体导出与压缩记录在work/opaque-jpeg-20261117/conversion.json。JPEG不能作为下一轮修复的母图，2×派生也从保留的无损4×PNG生成。
