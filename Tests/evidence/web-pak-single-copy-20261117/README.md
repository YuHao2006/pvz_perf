# 网页 PAK 单副本验证

日期：2026-11-17。普通版当前无损 PAK 为 39,209,797 字节。

旧路径：下载完整 PAK → MEMFS 持有一份 → mmap 另复制一份到 Wasm。新路径：首次挂载时把数据移交给 Wasm 实例持有的缓冲区，完整校验 ZIP 索引后 unlink MEMFS 原文件。后续读取仍直接使用 C++ 指针，不新增逐帧 JS 调用。LawnApp 退出仅删除索引，第二次启动复用缓冲区，不重新下载或分配整包。

独立无头 Edge 的四套生产构建均通过：wasm32/64 × WebGL/WebGPU；源文件确实被删除且没有包文件 FD；主动 malloc 超过现有线性内存容量使其真实增长，随后经过正常退出与二次启动仍可读资源。损坏 ZIP 会拒绝挂载，MEMFS 源文件保留。

结果见 browser-results.json。growth 数值来自故意分配的测试探针，不能当成正常游戏内存增长。正常加载时 Wasm 线性内存容量仍约 184 MiB，减少的是 JS 侧整包 backing buffer 的引用；不宣称进程 RSS 必定立即等量下降。首次下载／移交时仍短暂有两份数据，本轮未优化这一峰值。

测试入口：tools/wasm/verify_package_memory.mjs。PVZ_PLAYWRIGHT_MODULE 指向本地 playwright-core/index.mjs；PVZ_TEST_MEMORY_MODEL=wasm32 或 wasm64，PVZ_TEST_BACKEND=webgl 或 webgpu，PVZ_TEST_REJECT_PACKAGE=1 检查拒绝坏包。

代码同步高清分支；当前 2×／4× 包分别为 123,729,310／519,013,350 字节，这些是未来同路径可能消除的副本尺寸，并非本轮高清浏览器实测。没有改变桌面或 Android APK 的资源映射方式、DAT64 格式或动态加载策略。

SIMD 审计：当前主游戏编译没有 -msimd128，最终 wasm64 WebGL 模块反汇编不存在 v128 类型或 SIMD 指令；见 simd-audit.json。此处保留启用前的历史审计。随后按用户要求启用三个组合的 SIMD128，wasm32＋WebGL2 仍为标量；详见 ../web-simd128-20261117/。未做安卓真机或内核性能对照。
