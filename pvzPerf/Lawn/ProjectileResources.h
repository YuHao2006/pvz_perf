#pragma once
#include "misc/Rect.h"
#include "graphics/GpuBackend.h"
#include <array>

// Complete program-resident projectile appearance and its borrowed GPU field.
struct ProjectileVisual
{
    Sexy::Rect mSource;
    float mScale = 1.0f;
};

struct ProjectileAtlasDefinition
{
    int mWidth = 0;
    int mHeight = 0;
    std::array<ProjectileVisual, 14> mProjectiles{};
    std::array<Sexy::Rect, 2> mShadows{};
    Sexy::GpuTexture* mTexture = nullptr;
};

