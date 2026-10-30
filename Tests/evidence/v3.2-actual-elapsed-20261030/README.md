# v3.2 actual elapsed scheduling

Windows Vulkan Release/LTO built successfully. Runtime and focused timing tests passed. Timing tests include 30Hz 33.345ms followed by 33.321666ms, full 10.123456ms at 100Hz, a 1.234567890s stall without subdivision, and 300,000 jittered input samples with exact nanosecond conservation. Existing full image-runtime suite covers owner clocks, pause, credits, pool sparkle, projectile pixels and resources. No save schema or instance field layout changed.

No whole-game 30Hz collision equivalence or performance claim is made. No hidden catch-up substeps remain in normal scheduling. Presentation overshoot is phase credit, not additional simulation time. Minimum FPS is 30; default remains 100. This source/tag is the rollback point before domain-thread experiments.
