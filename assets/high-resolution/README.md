# 高清构建输入与导出

统一母图索引在 ../source-art/catalog.json，浏览页在 ../source-art/index.html，整理规则见 ../source-art/README.md。

current/ 是 images.json 与 fonts.json 当前绑定的已批准输入，当前已切换到4×，逻辑尺寸保持原版。exports4x/ 是已注册的4×构建导出；母图保留实际分辨率，不强制为4×。provenance.json 保留追溯，未通过候选不能自动绑定。

目标为4×/2400p PAK64，图集最大边8192。开发阶段用maxrects快速装箱，不旋转；4×布局对齐偶数网格。派生2×包整体缩小图集页、不重新装箱，归一化UV不变。最终构建须通过完整性门槛，不能用低清回退或运行用2×图放大充数。固定256×256焦散计算输入是单独登记的数据纹理例外。

透明区域可以裁切，必须保留原逻辑画布、局部偏移与护边，由构建/绘制路径消费补偿。原始母图留存，不改变锚点和动画大小。

当前全局pixelScale为4，全部待审项已获通过，实际编译器的2274个活跃图像引用检查无缺口。已完成4×开发PAK（约721.93 MiB）及桌面程序构建，Vulkan启动检查通过。产物位于 out/x64-win32-vulkan/Release/；构建证书为 out/verification/hd4x-built-certificate.json。

加载策略和显存说明仅属于高清分支，见 ../../docs/high-resolution/resource-loading.md；当前没有按场景动态加载／卸载机制。
