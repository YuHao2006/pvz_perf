# 网页 SIMD128 构建策略

日期：2026-11-17。按用户要求直接启用编译开关，本轮停止内核和整局性能对照。

| 组合 | 编译及链接选项 | 最终模块静态检查 |
| --- | --- | --- |
| wasm32＋WebGL2 | 保持标量 | 没有 v128 或 SIMD 指令 |
| wasm32＋WebGPU | -msimd128 | 含 SIMD 指令 |
| wasm64＋WebGL2 | -msimd128 | 含 SIMD 指令 |
| wasm64＋WebGPU | -msimd128 | 含 SIMD 指令 |

保持现有 -Oz、LTO 和浮点策略，没有启用 relaxed SIMD 或 fast-math，没有新增手写热路径内核。四个普通版构建均完成；各模块大小、SHA256 和 SIMD 静态指令数量见 modules.json。数量只用于确认生成了向量指令，不能作为帧率提升的测量。

启动配置标记 SIMD 策略，通过最小 v128 模块的 WebAssembly.validate 检测支持。不支持 SIMD 的浏览器仅提供 wasm32＋WebGL2；固定 Memory64／无标量兜底的诊断包明确报不支持。SIMD 与 Memory64、WebGL／WebGPU 分别检测，不根据 Android／ARM64 的 UA 猜测能力。

代码已同步高清分支，高清现有旧包须重建后才生效。没有修改 DAT64 格式、DSL 或资源布局。Android ARM64 支持 Neon，但网页仍通过 Wasm SIMD→浏览器代码生成来使用硬件向量指令，不能把网页当作原生 ARM 二进制编译。

资料：[Emscripten SIMD](https://emscripten.org/docs/porting/simd)、[V8 SIMD](https://v8.dev/features/simd)、[Android NDK Neon](https://developer.android.com/ndk/guides/cpu-arm-neon)。
