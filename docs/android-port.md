# Android Vulkan port

The Android target uses the NDK native app glue and the Vulkan Android WSI. The
activity owns `ANativeWindow`; `APP_CMD_INIT_WINDOW` attaches it to the game
window adapter and `APP_CMD_TERM_WINDOW` detaches it. Vulkan creates the surface
with `vkCreateAndroidSurfaceKHR`, and the swapchain extent is read from
`ANativeWindow_getWidth/Height`.

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

The current host does not have an NDK or `adb`, so an APK build and device run
cannot be verified here. After the NDK build produces
`out/android-arm64/Release/libpvz_perf.so`, run
`tools/build-android-apk.ps1 -BuildDirectory out/android-arm64 -Install`; the
script stages the native library and the generated `main.pak64` into the APK,
and the native entry point extracts the archive into the app's private data
directory on first launch. No manual data-package copy is required.

## GPU concurrency measurement

There are three different quantities:

* **Submitted logical work:** one reanimation track is one resident track job.
  The OpenGL compute experiment groups 64 jobs in a workgroup, so it dispatches
  `ceil(trackCount / 64)` workgroups.
* **Shader invocations:** Vulkan/DX12 use the graphics pipeline. Geometry/vertex
  work is roughly one invocation per submitted track (subject to vertex cache and
  pipeline details), while the fragment shader runs once per covered sample.
  A 100x100 sprite is about 10,000 fragment samples; an 800x600 image is about
  480,000 before overdraw. The existing OpenGL test queries vertex invocations;
  Vulkan/DX12 benchmark paths already use GPU timestamps.
* **Hardware concurrency:** the number of lanes resident at one instant is not a
  fixed API value. It depends on the phone GPU's shader cores, register and
  shared-memory usage, occupancy, tiling, and driver scheduling. A workgroup size
  of 64 is not a claim that 64 threads execute simultaneously.

Consequently, a few hundred sine/cosine evaluations are usually one to four
orders of magnitude fewer invocations than drawing the covered pixels of the
same images. Small sprites with many tracks are the case where transform math can
become visible. Device measurements must report GPU timestamps and invocation
counts together; CPU time alone cannot establish phone power savings.

For Android, collect an A/B run with the same scene and refresh rate using
Perfetto GPU counters where the device exposes them. `adb shell dumpsys gfxinfo`
is useful for frame pacing but does not report shader invocation counts. A
pipeline-statistics query is the reliable route for Vulkan-capable drivers; if a
driver does not expose it, keep the timestamp measurement and report invocation
counts from submitted jobs as a lower-bound estimate.
