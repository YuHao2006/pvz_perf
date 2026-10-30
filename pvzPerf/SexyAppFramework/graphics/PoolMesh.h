#pragma once
#include "GpuPool.h"
#include <array>

namespace Sexy {
struct PoolCausticOffsets {
    unsigned int u0, u1, v1;
};
// Integer nanoseconds -> fixed-point texture coordinate offsets, never frame counts.
PoolCausticOffsets EvaluatePoolCaustics(unsigned long long elapsedNs);
struct PoolMeshVertex {
    float x, y, u, v, alpha;
};
// Final destination pixels and UVs. Contains no time or phase for the GPU.
void BuildPoolMesh(const GpuPoolParams& params, std::array<PoolMeshVertex, 96>& vertices);
}
