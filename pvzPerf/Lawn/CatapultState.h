#pragma once

// Presentation of the existing simulation phase/progress and ammunition.
// No resource identity, persistent member or extra simulation state is needed.
enum class CatapultLoadState : unsigned char
{
    Empty,
    Loaded,
    Released
};

namespace CatapultCycle
{
inline constexpr float ProjectileEvent = 0.545f;

constexpr CatapultLoadState Resolve(bool launching, bool hasAmmunition, float progress)
{
    if (!hasAmmunition) return CatapultLoadState::Empty;
    if (!launching) return CatapultLoadState::Loaded;
    // The launch cycle spans 25..56: release the carried ball at 42 and
    // reload at 56. Keep the same float boundary arithmetic as action progress.
    // Projectile creation is a separate, earlier event at ProjectileEvent.
    const float position = 25.0f + progress * 31.0f;
    return position >= 42.0f && position < 56.0f
        ? CatapultLoadState::Released : CatapultLoadState::Loaded;
}
}
