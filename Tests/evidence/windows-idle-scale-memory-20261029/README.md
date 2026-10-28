# Idle-loop recovery and optional scale residency

The captured Windows main thread was sleeping in Process with gScreenSaverActive=true and mUpdateAppState=PROCESS_1. Refused updates failed to finish the processing cycle, so the next cycle could not pump messages or clear idle state. The shared loop now discards frozen backlog and finishes the cycle before retrying. The existing message-pump budget is unchanged.

Custom scaling was disabled, but mModernScalePrepared=true: startup still prepared and warmed both scale chains. Disabled startup now skips allocation; enabling prepares and warms, disabling releases intermediate images. No save fields changed.

Real linked Vulkan and DX12 runtime tests passed: idle refusal/recovery, all four static-definition cases, disabled startup, enable/disable/re-enable, and combined fullscreen/scale transactions. Scale fixture loads no game catalog: Vulkan startup private commit 216.160 MiB, DX12 177.879 MiB. Both have zero intermediate images when disabled and 71 when enabled. Driver caches retain some private commit after release; zero intermediate images does not mean all driver memory returns to baseline.

The hung process was observed after full dump capture with ~2033 MiB working set and ~1518 MiB private commit. Reading pages during capture can increase residency; no pre-capture working-set baseline was collected. Dump memory information showed ~1199 MiB write-combined private committed regions, which cannot be attributed one-for-one to specific Vulkan allocations.

The full process dump and old executable/PDB remain in TEMP, not in this repository. No blue-screen diagnosis is included. These fixes occurred after the final microbenchmark capture; those benchmark hashes/results remain unchanged. Fixed build hashes are recorded separately here. Whole-game performance for this build still requires a new run.
