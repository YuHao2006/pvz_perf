#pragma once

class LawnApp;

// Optional fixture generation before app.Init(). Enabled only by
// PVZ_NATIVE_GAME_SMOKE=1; requires an explicit, empty, isolated appdata root.
// Existing entries are an error. Uses production profile serialization.
void PrepareNativeLinuxGameSmoke(LawnApp& app);

// Opt in with PVZ_NATIVE_GAME_SMOKE=1. Call at the Linux UpdateApp tail,
// after the ordinary update/draw and deferred widget deletion work.
// PVZ_NATIVE_GAME_SMOKE_MODE: roundtrip (default), or ui (four-frame chain).
void NativeLinuxGameSmokeTick(LawnApp& app);
