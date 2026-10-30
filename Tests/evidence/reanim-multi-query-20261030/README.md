# Reanimation independent consumers, 2026-10-30

Real Advance plus 1/2/4/8 independent noinline consumer calls; odd calls query FrameTime, even calls query Root. Each cell has ten samples, one million updates per sample, two executable orders. Times include update and all queries, not per-query time. Indirect-call overhead is shared across candidates. Real normal zombie ground data, rates 12 and 30. Steps 33,333,333 ns and 133,333,333 ns are experiments; production frame-rate limits are unchanged.

production_div is the installed keyframe-anchor implementation, with quotient/remainder advancement and same-time snapshot reuse. The cycle_div variants use an experimental cycle anchor and support forward looping only; neither was installed. Comparing the two cycle variants isolates frame-cache maintenance more closely. Single-consumer no-cache can win; repeated consumers benefit from reuse. This is not a whole-game FPS measurement and excludes transforms and GPU submission.

All sample checksums match across variants. Validation CSVs retain continuous frame/root checks. Production runtime tests additionally passed 7,722 exact signed/forward/stopped/endpoint/offset cases and the full image runtime suite; pvz_reanim_clock also passed. No field layout, anchor meaning or save format changed. Published v3.0 timings use an older implementation and remain historical evidence.
