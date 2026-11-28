#pragma once
#include <algorithm>
#include <array>
#include <cstdint>
#include <stdexcept>

namespace AlphaComposeGpuChecks {

template<class Renderer>
void Verify(Renderer& renderer)
{
    constexpr std::array<std::uint32_t, 9> base{
        0x00000000, 0x00ff0000, 0x00000000,
        0x0000ff00, 0x00ffffff, 0x00000000,
        0x00000000, 0x000000ff, 0x00000000};
    constexpr std::array<std::uint32_t, 9> mask{
        0, 255, 0,
        128, 0, 0,
        0, 64, 0};
    constexpr std::array<std::uint32_t, 9> expected{
        0x0000ff00, 0xffff0000, 0x00000000,
        0x8000ff00, 0x007f007f, 0x007f007f,
        0x0000ff00, 0x400000ff, 0x00000000};
    constexpr std::array<std::uint32_t, 9> colorOnly{
        0x00472513, 0xff472513, 0x00000000,
        0x80472513, 0x00472513, 0x00472513,
        0x00472513, 0x40472513, 0x00000000};
    auto* source = renderer.CreateTexture(3, 3, base.data(), 12);
    auto* alpha = renderer.CreateTexture(3, 3, mask.data(), 12);
    auto* layered = renderer.ComposeAlphaRaw(source, source, 0, false);
    auto* result = renderer.AdoptComposedTexture(
        renderer.ComposeAlphaRaw(layered, alpha, 0, false, true));
    const auto pixels = renderer.ReadTexturePixels(result);
    if (!std::equal(pixels.pixels.begin(), pixels.pixels.end(), expected.begin(), expected.end()))
        throw std::runtime_error("The final mask did not repair transparent pixels");
    auto* colored = renderer.AdoptComposedTexture(
        renderer.ComposeAlphaRaw(source, alpha, 0x00472513, true, true));
    const auto coloredPixels = renderer.ReadTexturePixels(colored);
    if (!std::equal(coloredPixels.pixels.begin(), coloredPixels.pixels.end(), colorOnly.begin(), colorOnly.end()))
        throw std::runtime_error("Solid-color alpha composition did not repair transparent pixels");
    for (auto* texture : {source, alpha, result, colored})
        renderer.DestroyTexture(texture);
}

}

