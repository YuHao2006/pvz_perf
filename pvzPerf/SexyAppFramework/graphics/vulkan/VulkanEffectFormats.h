#pragma once
#include <vulkan/vulkan.h>
#if defined(SEXY_SCALE_EFFECT_AUTHORING)
#include <string_view>
#endif

namespace Sexy {
// Runtime allocation properties contain Vulkan enums only.
struct FormatInfo { VkFormat mVulkan; uint32_t mBytes; };
inline constexpr FormatInfo kFormatInfos[] = {
    {VK_FORMAT_R32G32B32A32_SFLOAT,16}, {VK_FORMAT_R16G16B16A16_SFLOAT,8},
    {VK_FORMAT_R16G16B16A16_UNORM,8}, {VK_FORMAT_R16G16B16A16_SNORM,8},
    {VK_FORMAT_R32G32_SFLOAT,8}, {VK_FORMAT_A2B10G10R10_UNORM_PACK32,4},
    {VK_FORMAT_B10G11R11_UFLOAT_PACK32,4}, {VK_FORMAT_R8G8B8A8_UNORM,4},
    {VK_FORMAT_R8G8B8A8_SNORM,4}, {VK_FORMAT_R16G16_SFLOAT,4},
    {VK_FORMAT_R16G16_UNORM,4}, {VK_FORMAT_R16G16_SNORM,4},
    {VK_FORMAT_R32_SFLOAT,4}, {VK_FORMAT_R8G8_UNORM,2},
    {VK_FORMAT_R8G8_SNORM,2}, {VK_FORMAT_R16_SFLOAT,2},
    {VK_FORMAT_R16_UNORM,2}, {VK_FORMAT_R16_SNORM,2},
    {VK_FORMAT_R8_UNORM,1}, {VK_FORMAT_R8_SNORM,1}
};
inline const FormatInfo* FindFormat(VkFormat value) {
    for (const auto& format : kFormatInfos) if (format.mVulkan == value) return &format;
    return nullptr;
}
#if defined(SEXY_SCALE_EFFECT_AUTHORING)
// These protocol/source declarations exist only in the offline authoring target.
struct AuthoringFormatInfo {
    const char* mName;
    const char* mSrvType;
    const char* mImageFormat;
    VkFormat mVulkan;
};
inline constexpr AuthoringFormatInfo kAuthoringFormatInfos[] = {
    {"R32G32B32A32_FLOAT","float4","rgba32f",VK_FORMAT_R32G32B32A32_SFLOAT},
    {"R16G16B16A16_FLOAT","MF4","rgba16f",VK_FORMAT_R16G16B16A16_SFLOAT},
    {"R16G16B16A16_UNORM","MF4","rgba16",VK_FORMAT_R16G16B16A16_UNORM},
    {"R16G16B16A16_SNORM","MF4","rgba16snorm",VK_FORMAT_R16G16B16A16_SNORM},
    {"R32G32_FLOAT","float2","rg32f",VK_FORMAT_R32G32_SFLOAT},
    {"R10G10B10A2_UNORM","MF4","rgb10a2",VK_FORMAT_A2B10G10R10_UNORM_PACK32},
    {"R11G11B10_FLOAT","MF3","r11g11b10f",VK_FORMAT_B10G11R11_UFLOAT_PACK32},
    {"R8G8B8A8_UNORM","MF4","rgba8",VK_FORMAT_R8G8B8A8_UNORM},
    {"R8G8B8A8_SNORM","MF4","rgba8snorm",VK_FORMAT_R8G8B8A8_SNORM},
    {"R16G16_FLOAT","MF2","rg16f",VK_FORMAT_R16G16_SFLOAT},
    {"R16G16_UNORM","MF2","rg16",VK_FORMAT_R16G16_UNORM},
    {"R16G16_SNORM","MF2","rg16snorm",VK_FORMAT_R16G16_SNORM},
    {"R32_FLOAT","float","r32f",VK_FORMAT_R32_SFLOAT},
    {"R8G8_UNORM","MF2","rg8",VK_FORMAT_R8G8_UNORM},
    {"R8G8_SNORM","MF2","rg8snorm",VK_FORMAT_R8G8_SNORM},
    {"R16_FLOAT","MF","r16f",VK_FORMAT_R16_SFLOAT},
    {"R16_UNORM","MF","r16",VK_FORMAT_R16_UNORM},
    {"R16_SNORM","MF","r16snorm",VK_FORMAT_R16_SNORM},
    {"R8_UNORM","MF","r8",VK_FORMAT_R8_UNORM},
    {"R8_SNORM","MF","r8snorm",VK_FORMAT_R8_SNORM}
};
inline const AuthoringFormatInfo* FindFormat(std::string_view name) {
    for (const auto& format : kAuthoringFormatInfos) if (format.mName == name) return &format;
    return nullptr;
}
#endif
}
