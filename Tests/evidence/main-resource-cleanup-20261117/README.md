# main 透明度固化与大头贴 UI 验证

2026-11-17，本地 Windows 11 上的 Vulkan／OpenGL Release。`verification.json` 记录原生测试结果，`actual-pak-alpha-audit.json` 来自最终生产 PAK，`new-layout-caches.json` 列出新增可复用装箱缓存。

图像源、归档和 PNG 证据只在本机保存，见 `assets/source-art/main-resource-cleanup-20261117.json`。源图固化以资源编译器色值为准；旧 JPEGli 运行时的 JPG 解码存在差异，不宣称与其逐像素相同。45 项新 PNG 的实际两后端解码均与原始输入重建的基准一致。未增加 Android、Win7 实机或手机浏览器覆盖。

本地复核：先运行 `tools/test-image-runtime.ps1 -BuildDirectory out/x64-win32-vulkan -Case almanac-clock`，再用 OpenGL 构建目录运行同一用例。额外原图核对需要设置 `PVZ_ZOMBATAR_REFERENCE` 为原始大头贴 PNG 目录、`PVZ_ALPHA_COMPARISON_LIST` 为四列 TSV（目标 PNG、原始底图、原始透明蒙版或 `-`、编译器色值基准 PNG 的绝对路径）。缺少本地原图时不执行额外素材对拍，仍执行图鉴与标准对话框回归。
