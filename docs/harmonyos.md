# 鸿蒙本地构建

鸿蒙使用根目录 CMake 的 `LawnProject` 和共享 Vulkan 目标。N-API 入口、窗口输入和 OHAudio 位于 `pvzPerf/SexyAppFramework/platform/harmonyos/`。ArkTS 界面在 `harmonyos/`，打包时将原生输出和本地素材放入临时 DevEco 工程。

**发行范围**　鸿蒙正式发行仅提供普通版 600p。高清分支保留 1200p 和 2400p 的鸿蒙本地构建支持，供有兼容设备的用户自行构建和测试。

## 原生库和着色器

需要 DevEco Studio 的 HarmonyOS Native SDK、CMake 3.25 或更新版、Ninja、Vulkan SDK 的 `glslc` 和 `spirv-val`。用同一个 Native SDK 分别构建 x86_64 和 arm64-v8a，依赖按 ABI 构建。构建参数如下。

| CMake 参数 | 用途 |
| --- | --- |
| `CMAKE_TOOLCHAIN_FILE` | Native SDK 下的 `build/cmake/ohos.toolchain.cmake` |
| `OHOS_ARCH` | `arm64-v8a` 或 `x86_64` |
| `OHOS_STL` | `c++_shared` |
| `PVZ_HARMONY_JSON_INCLUDE` | 包含 `nlohmann/json.hpp` 的目录 |
| `PVZ_HARMONY_JPEG_HEADERS` | libjpeg-turbo 源码头和构建生成头目录，用分号分隔 |
| `PVZ_HARMONY_JPEG_LIBRARY` | 相同 ABI 的 `libjpeg.a` |
| `PVZ_HARMONY_SPNG_SOURCE` | 包含 `spng.c` 的 libspng 目录 |
| `PVZ_HARMONY_OPENMPT_SOURCE` | libopenmpt 0.8.10 发行版源码目录 |
| `PVZ_HARMONY_AUDIO_DEPS` | 包含 `minimp3/` 和 `stb_vorbis/` 的源码目录 |
| `PVZ_GLSLC` / `PVZ_SPIRV_VAL` | 主机端编译器和验证器，未显式设置时由 CMake 查找 |

配置时使用 `-DCMAKE_BUILD_TYPE=Release` 并构建 `LawnProject`。输出在构建目录的 `Release/`，包含 `libpvz.so` 和 `shaders/`。普通 600p 可另用 `-DPVZ_VULKAN_LEGACY=ON` 在单独构建目录生成兼容库 `libpvz_legacy.so` 及其着色器。高清 1200p 和 2400p 共用 Vulkan 1.3 原生库，分辨率由各自的 `main.pak64` 声明。

## DevEco 打包

从主项目根目录运行以下命令。替换路径为本机的 SDK、构建输出和可使用的图标目录。

```text
python tools/stage-harmonyos.py --output out/harmony-package --ndk <native-sdk> --runtime arm64-v8a=<arm64-build> --runtime x86_64=<x64-build> --icons <icon-dir>
```

带资源时加 `--pak <main.pak64>`。普通 600p 可为两个 ABI 各加一个 `--legacy-runtime ABI=<build>`。图标目录需包含 `foreground.png`、`background.png` 和 `startIcon.png`。脚本会将两套 ABI 放入同一个 DevEco 工程，签名可在生成目录中用 DevEco Studio 配置。

手机和平板提供启动器和 DAT64 存档工具，PC 在资源齐全时直接启动。内置资源、签名配置和原生构建产物保存在本地。
