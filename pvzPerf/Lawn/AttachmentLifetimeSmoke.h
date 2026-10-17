#pragma once
#include <cstdint>
#include <vector>
class LawnApp;
class Board;
void AttachmentLifetimeSmoke(LawnApp& app);
void AttachmentCrossFadeSmoke(LawnApp& app);
void CreditsAttachmentRetentionProbe(LawnApp& app);
std::vector<std::uint64_t> SnapshotAttachmentBindings(Board& board);

void ParticleEmitterSmokeTick(LawnApp& app);
