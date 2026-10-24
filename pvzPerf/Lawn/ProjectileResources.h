#pragma once
#include "graphics/TextureRegion.h"
#include "graphics/GpuBackend.h"
#include <array>

// Complete program-resident projectile appearance and its borrowed GPU field.
struct ProjectileVisual
{
    Sexy::TextureRegion mSource;
    float mScale = 1.0f;
};

struct ProjectileAtlasDefinition
{
    std::array<ProjectileVisual, 14> mProjectiles{};
    std::array<Sexy::TextureRegion, 2> mShadows{};
    Sexy::GpuTexture* mTexture = nullptr;
};

