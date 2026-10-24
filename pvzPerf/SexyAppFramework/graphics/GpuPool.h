#pragma once
#include "GpuTypes.h"
#include <array>
#include <cstdint>

namespace Sexy {
// One immutable grid is shared by all three pool layers. UVs are generated in
// the vertex shader; phase values preserve the original CPU rounding once.
struct GpuPoolVertex {
    float x, y, phaseX, phaseY;
};
inline constexpr auto GpuPoolVertices = [] {
    std::array<GpuPoolVertex, 96> result{};
    constexpr double pi = 3.14159265358979323846;
    for (int x = 0; x <= 15; ++x)
        for (int y = 0; y <= 5; ++y)
            result[x * 6 + y] = {float(x), float(y),
                float(x * 3.0f * 2 * pi / 15.0f),
                float(y * 3.0f * 2 * pi / 5.0f)};
    return result;
}();
inline constexpr auto GpuPoolIndices = [] {
    std::array<std::uint16_t, 450> result{};
    constexpr int dx[]{0, 0, 1, 0, 1, 1}, dy[]{0, 1, 1, 0, 1, 0};
    int index = 0;
    for (int x = 0; x < 15; ++x)
        for (int y = 0; y < 5; ++y)
            for (int i = 0; i < 6; ++i)
                result[index++] = std::uint16_t((x + dx[i]) * 6 + y + dy[i]);
    return result;
}();
// CPU submission data, not a GPU constant-buffer layout. No image rectangles:
// the shader samples each full texture through normalized UVs.
struct GpuPoolParams {
    float width, height;
    float transX, transY;
    float time1, time2, time3, time5;
    GpuClip clip;
    std::uint32_t layer, night;
    std::uint32_t samplingFlags, sampler;
    GpuBlend blend;
};
}
