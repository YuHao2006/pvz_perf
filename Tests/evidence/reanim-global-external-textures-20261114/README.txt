Global external-only reanimation texture table, 2026-11-14

Runtime: each definition keeps its owned atlas per variant. One global array holds five ResourceManager map textures. Eight global uint32 IDs cover only the external slots of four Credits definitions. No owned atlas pointers or ordinary image-slot entries appear in those arrays. The range scalars fit existing x64 definition padding: sizeof(ReanimatorDefinition)==88 is checked by the compiled static runtime test. No fields added to Reanimation instances, keyframes, track instances or save layout.

Generator remaps only the four shared definitions: 41890 frame rows and100 UV rows checked against the pre-change generated sources; all ordinary arrays unchanged. Those pre-change snapshots remain under out/verification/global-external-textures/generated-before; remap-proof.json records the check. No image bytes changed: package SHA256 remained identical.

Tests: static definition normal/missing/corrupt/wrong-dimension resource cases passed, including exact five map bindings, exclusion of every owned atlas from the global table, same-process unload/reload and pointer reuse. Credits runtime and14 snapshots matched the earlier RGBA pixels exactly. Step events and card atlas regressions also passed.

Performance: fixed 800x600 DrawScreen,32 plants/40 zombies, LP14 pinned. Sequential process order old/new/new/old; old executable is the previous per-definition pointer-table implementation and its per-group samples are selected. Each process executes640 total samples; old contributes320 per-group samples, new640. Logic/flush/readback excluded. Frequency not independently verified; an unrelated compiler existed on the host. Pixel hashes agree in all four runs. The roughly1% difference is not a whole-game speedup claim. No production instrumentation added.

Reproduce current tests:
 tools/test-static-definition-runtime.ps1 -BuildDirectory out/x64-win32-vulkan
 tools/test-image-runtime.ps1 -BuildDirectory out/x64-win32-vulkan -Case credits
 same runtime fixture: step-events, card-atlas

No publish/push performed. Tool source remains in PvzDevTools/resourceBuilder/NativeGenerate.cpp; game repository carries only the rebuilt tool binary and manifest.
