Vulkan device selection correction

Removed the discrete-GPU bonus and maxImageDimension2D score. After the
existing extension, feature, caller-filter and surface checks, retain loader
order and select the first non-CPU candidate. A CPU implementation is used
only when no compatible non-CPU candidate exists. No feature requirements,
shader behavior, save layout or frame-loop work changed.

Khronos documents Windows loader sorting as an attempt to put system GPU
preference first, subject to driver/loader support. This application now
preserves that ordering; it does not parse undocumented registry values or
claim to override a loader/layer that does not honor OS preferences.
Source:
https://github.com/KhronosGroup/Vulkan-Loader/blob/main/docs/LoaderDriverInterface.md#physical-device-sorting

Tests:
- sexy_vulkan_device_selection: passed; empty input, preferred integrated,
  preferred discrete, two discrete GPUs with different texture limits,
  software-first with hardware available, software-only and virtual GPU.
- sexy_vulkan_initialization: passed with actual Vulkan validation, including
  reject-all filtering, failure cleanup, concurrent surfaces and release mode.
- The complete render_semantics binary passed both renderer lifetimes and
  zero validation errors in 108.696 seconds (render-full.log). Its existing
  60-second CTest limit expired twice, including once without the Release
  build in progress. Both timeout logs are retained, not reported as passes.
  The CTest timeout was not changed to hide those results.
- Actual new Release startup produced selected-device.txt: NVIDIA GeForce
  RTX 4070 Laptop GPU, driver 591.44, device API 1.4.325. The hidden test
  window was closed normally with WM_CLOSE; no gameplay checkpoint loaded.

Windows overwrites log/gpu-device.txt once when creating its Vulkan context.
It records selected device/API/driver, graphics/present families and the
native nonuniform-indexing property. A failed diagnostic file open does not
disable gameplay. There is no per-frame logging or registry/DXGI dependency.

This host does not validate switching the user's UHD 630 system or prove a
frame-rate improvement there. No hardware-specific performance claim is made.
hashes.json identifies the resulting executable/package and relevant sources.
