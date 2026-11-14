// Generated native definitions and loading functions. Do not edit.
#pragma once
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Lawn/ProjectileResources.h"
#include <span>
namespace GeneratedDefinitions {
inline constexpr int ReanimationCount=144, ParticleCount=106;
inline constexpr unsigned ExternalTextureCount=5u;
inline constexpr unsigned ExternalBindingCount=8u;
extern Sexy::GpuTexture* ExternalTextures[ExternalTextureCount ? ExternalTextureCount : 1];
extern const std::uint32_t ExternalTextureIds[ExternalBindingCount ? ExternalBindingCount : 1];
extern ReanimatorDefinition Reanimations[ReanimationCount];
extern TodParticleDefinition Particles[ParticleCount];
extern const char* const ParticlePaths[ParticleCount];
extern ProjectileAtlasDefinition Projectiles;
extern std::span<AttacherSegmentRT> AttacherSegments[ReanimationCount];
void LoadReanimationImages(int type);
void LoadParticleImages();
void LoadProjectileImages();
void LoadAllImages();
void BindFonts();
void ReleaseReanimationImages();
void ReleaseParticleImages();
void ReleaseProjectileImages();
void ReleaseImages();
}
