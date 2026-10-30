#include "PoolMesh.h"
#include <cmath>
#include <stdexcept>

namespace Sexy {
PoolCausticOffsets EvaluatePoolCaustics(unsigned long long elapsedNs) {
    // The source repeats after 655.36 seconds. This is a spatial coordinate
    // in 16.16 units, not an animation counter. Bound before multiplying.
    const auto coordinate = static_cast<unsigned int>(
        ((elapsedNs % 655'360'000'000ull)*1024ull)/156'250ull);
    const auto nextCoordinate = coordinate+65536u;
    const auto signedDivide = [](unsigned int bits, unsigned int divisor) {
        return (bits & 0x80000000u) ? 0u-((0u-bits)/divisor) : bits/divisor;
    };
    return {signedDivide(coordinate,10),0u-signedDivide(nextCoordinate,6),coordinate>>3};
}
void BuildPoolMesh(const GpuPoolParams& p, std::array<PoolMeshVertex, 96>& vertices) {
    if (p.layer > 2) throw std::invalid_argument("Invalid pool mesh layer");
    float horizontal[6]{}, vertical[16]{};
    // Each column/row shares its wave term; the boundary has no displacement.
    for (int y = 1; y < 5; ++y) {
        const float py = GpuPoolVertices[y].phaseY;
        if (p.layer == 0)
            horizontal[y] = std::sin(py+p.time2)*0.002f + std::sin(py+p.time1)*0.005f;
        else if (p.layer == 1)
            horizontal[y] = std::sin(py*0.2f+p.time2)*0.015f + std::sin(py*0.2f+p.time1)*0.012f;
        else
            horizontal[y] = std::sin(py+p.time1*1.5f)*0.004f + std::sin(py+p.time2*1.5f)*0.005f;
    }
    for (int x = 1; x < 15; ++x) {
        const float px = GpuPoolVertices[x*6].phaseX;
        if (p.layer == 0)
            vertical[x] = std::sin(px+p.time5)*0.01f + std::sin(px+p.time3)*0.015f + std::sin(px+p.time1)*0.005f;
        else if (p.layer == 1)
            vertical[x] = std::sin(px*0.2f+p.time5)*0.005f + std::sin(px*0.2f+p.time3)*0.015f + std::sin(px*0.2f+p.time1)*0.02f;
        else
            vertical[x] = std::sin(px*4+p.time5*2.5f)*0.005f + std::sin(px*2+p.time3*2.5f)*0.04f + std::sin(px*3+p.time1*2.5f)*0.02f;
    }
    for (int x = 0; x <= 15; ++x) for (int y = 0; y <= 5; ++y) {
        const bool interior = x != 0 && x != 15 && y != 0 && y != 5;
        const float u = float(x)/15, vv = float(y)/5;
        auto& out = vertices[x*6+y];
        out.x = (p.layer == 2 ? (704.0f/15)*x+45 : (p.width/15)*x+35)+p.transX;
        out.y = (p.layer == 2 ? 30.0f*y+288 : (p.height/5)*y+279)+p.transY;
        out.u = (interior ? horizontal[y] : 0)+u;
        out.v = (interior ? vertical[x] : 0)+vv;
        if (p.layer == 2) {
            out.u += u; out.v += vv;
            out.alpha = float(x == 0 || x == 15 || y == 0 ? 32 : p.night != 0 ? 48 : x <= 7 ? 192 : 128)/255;
        } else out.alpha = 1;
    }
}
}
