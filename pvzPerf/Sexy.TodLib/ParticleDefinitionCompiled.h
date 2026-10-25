#pragma once
class TodParticleDefinition;

// Load one validated PTC1 stream. All pointers are owned until Free is called.
void TodParticleLoadCompiledDefinition(TodParticleDefinition& definition, const char* path);
void TodParticleFreeCompiledDefinition(TodParticleDefinition& definition);
