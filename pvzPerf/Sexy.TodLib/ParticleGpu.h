#pragma once
class TodParticleDefinition;
class TodParticle;
namespace Sexy { class Graphics; }

// Primary-thread resource ownership and raw instance submission. Author data
// is compiled offline; the loading buffer is discarded after GPU upload.
void TodParticleUploadGpuDefinitionData();
void TodParticleFreeGpuDefinition(TodParticleDefinition& definition);
void TodParticleDrawGpu(Sexy::Graphics& graphics, TodParticle& particle);
void TodParticleDrawFormulaGpu(Sexy::Graphics& graphics, TodParticle& particle);
void TodParticleDrawDiscreteGpu(Sexy::Graphics& graphics, TodParticle& particle);
