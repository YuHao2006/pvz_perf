# Pool birth-time clock

Windows Vulkan Release/LTO built; complete ImageRuntime suite passed (exit 0). Added actual PoolEffect clock coverage at 30/100/240/1000Hz: jitter, frozen frames, unupdated freeze gaps and exact resume, duplicate timestamps, inactive scene gaps, clock-epoch changes and invalid interval exception safety. Existing pool pixel comparison passed at 800/1400 widths and day/night, max channel delta 1. Source, texture handles and GPU command ownership remain unchanged by this clock patch. No save fields changed; PoolEffect is not serialized.

PoolEffect retains birth and published sample timestamps, not an accumulated age. A skipped/frozen interval is absorbed into birth once at resume, using the owner's current time and allowed interval. Published sample time keeps frozen draws immutable and detects inactive scene gaps or duplicate owners. Asynchronous texture production is still a separate experiment, not enabled here.

Full audit_1073_render_semantics.py could not run: external ignored tools/ghidra_output/reanim_draw_1073_exact.c is absent. Its pool contract was updated and Python syntax parsed; this is not reported as a full audit pass. The exact EXE clock evidence remains in visual-domain-owners-1073-20261030.
