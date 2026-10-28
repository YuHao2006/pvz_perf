#pragma once
#include <string_view>

namespace Sexy {
// Stable numeric file-format IDs; backend SDK enums stay in their modules.
bool IsScaleEffectFormat(unsigned int format);

#if defined(SEXY_SCALE_EFFECT_AUTHORING)
struct ScaleAuthoringFormatInfo {
    const char* mName;
    const char* mSrvType;
    const char* mImageFormat;
    unsigned int mFormat;
};
inline constexpr ScaleAuthoringFormatInfo kScaleAuthoringFormats[]{
    {"R32G32B32A32_FLOAT", "float4", "rgba32f", 109},
    {"R16G16B16A16_FLOAT", "MF4", "rgba16f", 97},
    {"R16G16B16A16_UNORM", "MF4", "rgba16", 91},
    {"R16G16B16A16_SNORM", "MF4", "rgba16snorm", 92},
    {"R32G32_FLOAT", "float2", "rg32f", 103},
    {"R10G10B10A2_UNORM", "MF4", "rgb10a2", 64},
    {"R11G11B10_FLOAT", "MF3", "r11g11b10f", 122},
    {"R8G8B8A8_UNORM", "MF4", "rgba8", 37},
    {"R8G8B8A8_SNORM", "MF4", "rgba8snorm", 38},
    {"R16G16_FLOAT", "MF2", "rg16f", 83},
    {"R16G16_UNORM", "MF2", "rg16", 77},
    {"R16G16_SNORM", "MF2", "rg16snorm", 78},
    {"R32_FLOAT", "float", "r32f", 100},
    {"R8G8_UNORM", "MF2", "rg8", 16},
    {"R8G8_SNORM", "MF2", "rg8snorm", 17},
    {"R16_FLOAT", "MF", "r16f", 76},
    {"R16_UNORM", "MF", "r16", 70},
    {"R16_SNORM", "MF", "r16snorm", 71},
    {"R8_UNORM", "MF", "r8", 9},
    {"R8_SNORM", "MF", "r8snorm", 10}
};
inline const ScaleAuthoringFormatInfo* FindScaleEffectFormat(std::string_view name)
{
    for (const auto& format : kScaleAuthoringFormats)
        if (format.mName == name) return &format;
    return nullptr;
}
#endif
}
