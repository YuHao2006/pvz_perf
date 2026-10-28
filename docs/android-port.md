# Android Vulkan port

The Android target uses the NDK native app glue and the Vulkan Android WSI. The
activity owns `ANativeWindow`; `APP_CMD_INIT_WINDOW` attaches it to the game
window adapter and `APP_CMD_TERM_WINDOW` detaches it. Vulkan creates the surface
with `vkCreateAndroidSurfaceKHR`, and the drawable size is read from
`ANativeWindow_getWidth/Height`. Android currently requests a 600-pixel-high
swapchain at the drawable aspect ratio (subject to surface limits), leaving
physical touch coordinates unchanged. SurfaceFlinger scales the presented layer.

Android Studio is not required. Install the Android command-line tools, an NDK,
the SDK platform and CMake, then configure with the NDK toolchain:

```text
cmake -S . -B out/android-arm64 -G Ninja ^
  -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK%/build/cmake/android.toolchain.cmake ^
  -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-26 ^
  -DPVZ_WINDOW_BACKEND=ANDROID -DPVZ_RENDER_BACKEND=VULKAN ^
  -DPVZ_BUILD_LEGACY_GAME=ON -DCMAKE_BUILD_TYPE=Release
cmake --build out/android-arm64
```

The local SDK/NDK and `adb` are installed under `C:/UserProgram/DevTools`.
Arm64 APK builds have been installed and tested on a nubia Z60 Ultra (Android
14). The APK includes `main.pak64`; no manual data-package copy is required.
Always package the native library, resource archive and SPIR-V from the same
build tree. Shader changes also require clearing the application's pipeline
cache before testing.

## Rendering and submission

Reanimation interpolation/transforms and particle simulation/render parameters
are evaluated on the CPU. The GPU receives ordinary textured triangles. The
resident reanimation and particle paths, generated GPU behavior records and
associated shader stages have been removed, including their experimental build
options.

Vulkan textures and samplers remain bindless, but a pipeline/blend/scissor change
can still end a batch. On devices supporting `dualSrcBlend`, straight-alpha
sprites use one dual-source pipeline for normal and additive blending. It
preserves paint order and destination alpha; it does not reorder translucent
draws. Devices without that feature retain their separate ordinary blend
pipelines.

Plain program images repair fully transparent RGB edges once before upload.
Visible RGB and all alpha bytes stay unchanged. Only alpha-bearing neighbors
in the immediately adjacent rows contribute, matching legacy sanding. The
in-place operation needs no additional pixel buffer; loading pixels are still
released after upload. Deferred alpha compositions keep their existing shader
sampling because their final pixels do not exist at that preparation point.

## GPU concurrency measurement

The current runtime uses vertex and fragment shaders, without resident animation
jobs or animation compute dispatches. Fragment invocation count depends on
covered samples and overdraw, while vertex work depends on submitted triangle
vertices and caching. Hardware concurrency is not a fixed API constant: it
varies with shader resources, occupancy and GPU scheduling.

GPU elapsed timestamps include pipeline stalls and do not directly measure
energy use. Phone power comparisons require a controlled scene and refresh rate,
with device power counters or external power measurement where available.

For presentation measurements, poll SurfaceFlinger latency history more often
than the buffer can wrap. Its finite history must not be sampled every four
seconds at 100 FPS: missing entries create artificial large frame intervals.
Current diagnostic collection polls every half second and retains unique
presentation timestamps. A fixed paused fixture must also match triangle count
and screenshot before runs can be compared. Automatic fixture loading alone
does not guarantee that the user has not subsequently resumed the scene.

## Android 目标帧率与外部设置（2026-10-27）

设置优先使用 `getExternalFilesDir(null)/settings.json`。实际位置由系统返回，
本测试机为 `/storage/emulated/0/Android/data/com.openpvz.perf/files/settings.json`。
存储不可写时沿用已有内部数据目录策略；启动诊断记录最终路径、targetFps 和 intervalNs。
GPU 固定场景仅隔离关卡／用户档，设置不再跟随 fixture 复制到内部 session，
通过现有 `PVZ_SETTINGS_FILE` 路径覆盖统一读写正常外部设置。

Android 提供持久化启动参数，便于受 scoped storage 限制的设备配置：

```text
adb shell am start -n com.openpvz.perf/android.app.NativeActivity --ei targetFps 240
```

该参数在新进程初始化前更新正常 settings.json 的 targetFps，保留其余设置，
然后由统一设置加载器读取；不是初始化后强改字段而遗漏全局时间步进。
应用已运行时，应先正常保存退出再重新启动以应用参数；不要在战斗中强制结束进程。
无参数启动继续读取已保存设置。此参数不改变屏幕支持的物理刷新率。
240FPS 对应目标等待间隔 4166666ns，并非固定逻辑步长。逻辑按实际墙钟纳秒推进，超过10ms则拆分补拍；逾期不额外等待。最终绘制率受硬件、GPU同步和呈现模式影响。

性能采样需区分：GPU timestamp 记录 GPU 命令区间；gpu-workload 的 renderFps
记录每 120 次呈现提交完成的墙钟区间（首批无前界故记 0，需丢弃首批）；
SurfaceFlinger --latency 的实际呈现时间去重后反映上屏节奏，受物理刷新率约束。
不能将这些指标互相替代，手机叠加层显示的 FPS 口径也不能未经核实视为渲染提交率。

实机注意：固定无尽后续 30 秒采样约 100FPS，柱子／后续界面则记录到连续约
239～241FPS 的内部提交；没有统一写死的 100FPS 上限。屏幕实际呈现最高约 120，
而钱袋炫白仍可造成明显下降。配置读取成功与各场景持续性能是独立验收条件。

Android 包名自本次打包起为 `com.openpvz.perf`，显示名为 `pvz_perf`。旧包 `com.openpvz.modern` 的数据不会由系统自动迁移；换包前须备份和显式迁移，不能将新包空数据视为迁移完成。`Android/data` 可能被系统文件管理器隐藏，外部应用专属目录不等于任意文件管理器都可访问。


## APK output directory

Ready-to-install APKs and their `.apk.idsig` sidecars live in `out/android-vulkan/`,
not directly in `out/`. The current signed package is
`out/android-vulkan/pvz-arm64-perf.apk`. Native build intermediates remain in
`out/android-arm64/`.

`tools/build-android-apk.ps1` copies Gradle output into this directory by default;
`-OutputDirectory` can select another package directory. Unsigned Gradle Release
output keeps the `-release-unsigned.apk` suffix and does not replace the current
signed package. Sign and align it before installation.
