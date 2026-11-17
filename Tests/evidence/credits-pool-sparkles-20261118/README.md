# Almanac index shadow and Credits pool sparkles

2026-11-18. Common source changes are applied to main and the HD branch. The
native main Vulkan and OpenGL builds were rebuilt locally on Windows 11.

- Almanac index now calls the existing Zombie::DrawShadow before the body.
  A separate Graphics copy isolates DrawShadow's clip reset from body drawing.
- Credits reuses PARTICLE_POOL_SPARKLY, without changing particle/reanim DSL,
  textures, particle density, animation definitions or save formats.
- One Credits-owned system is created only for visible pool shots: Main1
  frames 203..268 and 305..339; Main2 montage before frame 125 when Background3
  is visible, and night-pool frames 187..249 when Background2 is visible.
- The system uses the Credits movie clock and the existing owner-managed
  attachment flag to exclude it from the global particle update/draw pass.
  It is drawn in the map's coordinates and water clip, behind actors/lyrics.
- Pause freezes the movie clock; leaving water shots, PlayReanim/replay and
  destruction stop the owned system. Draw never creates or updates particles.

Validation in `out/verification/main-credits-sparkles-20261118/`:

- `test-credits.log`, `test-credits-opengl.log`: visible sparkle pixels, pool
  clipping, four water shots, pause, repeated-draw stability, shot cleanup,
  and existing Credits viewport/iris/disco regression checks.
- `test-almanac.log`: index rendering equals an independent composition of
  background + shadow + zombie, and differs from the missing-shadow reference.
- `vulkan-tests/credits-pool-sparkles.png` and
  `vulkan-tests/almanac-index-shadow.png`: local screenshots, not committed.

HD artifacts and the previous web ZIPs have not been rebuilt for this change.
No FPS benchmark was run. No public release or Toy upload was performed.
