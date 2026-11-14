Main resource/cache candidate, 2026-11-14

One controlled Vulkan run; compare to ../vulkan-memory-20261113. Same all-resource-groups fixture, not a real heavy endless battle or FPS measurement. Empty formation, 800x600 SDR, extra 800x600 RGBA16F test target.

Texture requirements / pool-used bytes reduced; retained 64MiB pool reservations did not fall. Do not label reserved+host buffers as dedicated VRAM, or private-process deltas as a deterministic causal saving. Prebuilt actor portraits remain.

Static binding table: 2830 owned variant pointers plus 100 shared slot pointers; four shared-image definitions only. With 144 nullable static definition members, additional static CPU cost over original design is 1952 bytes (x64); no instance/save fields.

Pixel proof compares reconstructed Almanac/common-layer and baked Zombatar static UI to original visible pixels/alpha; exact. Credits ownership/pixels and card atlas prices/lifetime also passed focused runtime cases.

Final fixed-draw binding comparison: run3-binding.csv/run4-binding.csv and binding-performance.json. Both processes pin LP14; frequency was not independently verified and no 11x claim is made. ABBA blocks alternate ordinary per-group texture selection and an equivalent per-slot binding table through the same production DrawScreen path. 640 samples/process, 320/mode; 32 plants,40 zombies,800x600, frozen scene; all readbacks exact within and between runs. Timing excludes logic, RenderInterface::Flush, fence waits and readback. This isolates lookup strategy, not whole-game FPS or an exact historical-executable comparison. The fixture source and Release-linked build manifest are retained beside the CSVs. Per-group means:1.175/1.185ms; per-slot:1.191/1.185ms. Differences are small; do not advertise a whole-game speedup.
Lossless proof refreshed for the current exact pak SHA256:745 entries,539 byte-identical,206 images reencoded with exact RGBA. Current lossless pak39053104B; normal source39429341B. Full Web ZIP not rebuilt as part of this audit.

Final main Release objects reran card-atlas and gpu-memory successfully. run2-final.jsonl retains the last allocation sample; completion-audit.json identifies the paired main/HD binaries, packages and evidence scope. Source hashes match all final gameplay regression inputs.
