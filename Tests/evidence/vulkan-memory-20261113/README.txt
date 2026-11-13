Vulkan memory baseline, main branch, 2026-11-13

Run: pwsh -File tools/measure-gpu-memory.ps1
Three independent processes, production objects and production PAK64, 800x600 SDR.
No personal saves: the native fixture uses a process-isolated save directory.
All resource groups are loaded; this measures controlled allocation/lifecycle costs,
not a full-game startup trace, heavy endless battle, FPS, or memory-pressure performance.
The empty-formation endless and 5-10 conveyor phases instantiate real Board objects.

Renderer bytes use vkGetImage/BufferMemoryRequirements. Buffer bytes include
host-visible upload/geometry allocations: renderer_allocated_bytes is NOT dedicated VRAM.
Pool reservation counts each 64MiB chunk once, while pool_used_bytes measures suballocation.
Image requirements are not summed again into pool reservation.
DXGI local/nonlocal CurrentUsage is queried for the same Vulkan device LUID and current
process; this is a separate driver accounting metric, not a sum to add to renderer bytes.
Swapchain, driver-private allocations and external scaling effects are outside renderer totals.
Process private/working-set bytes are Windows process metrics, not texture CPU copies alone.

A fixed 800x600 offscreen drawing target is added at fixed_probe_target (4096000 bytes).
Do not attribute that target or a resulting pool chunk to the game cache.
The final drain leaves one retired 1x1 probe image (512 bytes).

preview_cache_destroy_requested intentionally destroys ALL preview caches to expose
retirement behavior; this is an upper-bound diagnostic, not an implemented optimization.
Filtered sampled textures remain independently owned. Scene-atlas Free does not remove
resource-manager ownership; the test records this rather than pretending memory was freed.
Compare matching phases and identical PAK/viewport on subsequent runs.

No cache policy or save format has changed. The checkpoint predates instrumentation;
summary.json records the measured instrumentation source hashes.
