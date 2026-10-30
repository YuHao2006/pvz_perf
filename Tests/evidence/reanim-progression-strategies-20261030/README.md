# Reanimation progression strategy experiment

This experiment compares the production implementation with two forward-loop-only candidates, using the same production root-motion and frame-time consumers. No candidate is installed in the game.

- `current`: cached keyframe index plus keyframe-local epoch.
- `divide_update_cached_queries`: cycle-local epoch; derive frame every update, cache it for queries.
- `divide_every_query`: cycle-local epoch; updates wrap cycles without deriving a frame, queries derive it on demand. The ABI still reserves the old frame field, but the measured path does not read or write it.

`summary.json` contains median nanoseconds per complete operation (update, update+root, update+frame, update+root+frame), from ten samples/cell. All samples use real authored tracks and actual production objects/libraries with MSVC O2/GL/LTCG and LP14 affinity. CPU frequency was not set or verified. These are not game FPS or full render timings.

Sources and candidate patches are retained; timing source and strengthened exact-validation source are separate snapshots. Candidate patches are deliberately limited to the positive looping fixtures. Reverse playback, seek/rate changes, stop/hold endpoints and save semantics must be covered before any production adoption.

All timed checksums agree across variants; additional integer phase/loop/event-phase and root/frame validation passes. See manifest.json for scope and limitations.
