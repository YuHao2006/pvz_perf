#pragma once

#include "SexyAppFramework/graphics/GpuPool.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <iostream>
#include <span>
#include <stdexcept>
#include <string>
#include <type_traits>
#include <vector>

// Native-only oracle for production SubmitPool. Include this header after the
// selected backend's renderer header, then call PoolGpuChecks::Run(renderer).
// All uploads/readbacks below belong to the fixture, never the game draw path.
namespace PoolGpuChecks {
using namespace Sexy;
inline constexpr int Width = 800, Height = 600;
inline constexpr std::size_t NoPixel = std::size_t(-1);

inline void Check(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}

inline GpuPoolParams Parameters(std::uint32_t counter, std::uint32_t layer,
    bool night, GpuBlend blend, bool partialClip, bool nearest)
{
    // Preserve the legacy expression's float/double rounding, including the
    // float multiply by two before multiplication by double PI.
    constexpr double pi = 3.141592653589793;
    const float phase = static_cast<float>(counter % 158400u) * 2 * pi;
    GpuPoolParams p{};
    p.width = 720.f;
    p.height = 159.f;
    p.transX = partialClip ? 7.375f : 0.f;
    p.transY = partialClip ? -5.625f : 0.f;
    p.time1 = phase / 800.0;
    p.time2 = phase / 150.0;
    p.time3 = phase / 900.0;
    p.time5 = phase / 110.0;
    // This is vertex-alpha clipping in untransformed coordinates. Deliberately
    // place edges between mesh points so raster scissoring cannot match it.
    p.clip = partialClip ? GpuClip{127, 304, 513, 112} :
        GpuClip{0, 0, Width, Height};
    p.layer = layer;
    p.night = night ? 1u : 0u;
    p.sampler = (nearest ? 0u : 1u) | (layer == 2 ? 2u : 0u);
    p.blend = blend;
    return p;
}

inline std::array<GpuVertex, 450> LegacyVertices(
    const GpuPoolParams& p, std::uint32_t slot)
{
    // Intentionally independent of GpuPoolVertices/GpuPoolIndices: an incorrect
    // shared grid, winding, edge classification or phase must fail this oracle.
    constexpr double pi = 3.141592653589793;
    constexpr int dx[]{0, 0, 1, 0, 1, 1};
    constexpr int dy[]{0, 1, 1, 0, 1, 0};
    std::array<GpuVertex, 450> vertices{};
    int next = 0;
    for (int x = 0; x < 15; ++x)
        for (int y = 0; y < 5; ++y)
            for (int i = 0; i < 6; ++i)
            {
                const int ix = x + dx[i], iy = y + dy[i];
                const float baseU = ix / 15.0f, baseV = iy / 5.0f;
                float u = p.layer == 2 ? baseU : 0.f;
                float v = p.layer == 2 ? baseV : 0.f;
                if (ix != 0 && ix != 15 && iy != 0 && iy != 5)
                {
                    const float xp = ix * 3.0f * 2 * pi / 15.0f;
                    const float yp = iy * 3.0f * 2 * pi / 5.0f;
                    if (p.layer == 0)
                    {
                        u = std::sin(yp + p.time2) * 0.002f +
                            std::sin(yp + p.time1) * 0.005f;
                        v = std::sin(xp + p.time5) * 0.01f +
                            std::sin(xp + p.time3) * 0.015f +
                            std::sin(xp + p.time1) * 0.005f;
                    }
                    else if (p.layer == 1)
                    {
                        u = std::sin(yp * 0.2f + p.time2) * 0.015f +
                            std::sin(yp * 0.2f + p.time1) * 0.012f;
                        v = std::sin(xp * 0.2f + p.time5) * 0.005f +
                            std::sin(xp * 0.2f + p.time3) * 0.015f +
                            std::sin(xp * 0.2f + p.time1) * 0.02f;
                    }
                    else
                    {
                        u += std::sin(yp + p.time1 * 1.5f) * 0.004f +
                            std::sin(yp + p.time2 * 1.5f) * 0.005f;
                        v += std::sin(xp * 4.f + p.time5 * 2.5f) * 0.005f +
                            std::sin(xp * 2.f + p.time3 * 2.5f) * 0.04f +
                            std::sin(xp * 3.f + p.time1 * 2.5f) * 0.02f;
                    }
                }
                const float px = p.layer == 2 ? (704.f / 15.f) * ix + 45.f :
                    ix * (p.width / 15.f) + 35.f;
                const float py = p.layer == 2 ? 30.f * iy + 288.f :
                    iy * (p.height / 5.f) + 279.f;
                // Rect<int>::Contains receives the original float positions
                // through an implicit truncating conversion.
                const int cx = static_cast<int>(px), cy = static_cast<int>(py);
                const bool inside = cx >= p.clip.x && cy >= p.clip.y &&
                    cx < p.clip.x + p.clip.width && cy < p.clip.y + p.clip.height;
                unsigned alpha = 255;
                if (!inside) alpha = 0;
                else if (p.layer == 2)
                    alpha = ix == 0 || ix == 15 || iy == 0 ? 32 :
                        p.night ? 48 : ix <= 7 ? 192 : 128;
                vertices[next++] = {px + p.transX, py + p.transY,
                    1.f, 1.f, 1.f, alpha / 255.f, u + baseU, v + baseV,
                    slot | p.samplingFlags, p.sampler};
            }
    return vertices;
}

template<class Renderer, class Texture>
void Rectangle(Renderer& renderer, Texture* texture, float x, float y,
    float w, float h, const std::array<float, 4>& tint, GpuBlend blend,
    bool linear = false)
{
    const auto slot = Renderer::SlotOf(texture);
    const unsigned sampler = linear ? 1u : 0u;
    const auto vertex = [&](float px, float py, float u, float v) {
        return GpuVertex{px, py, tint[0], tint[1], tint[2], tint[3],
            u, v, slot, sampler};
    };
    const std::array<GpuVertex, 6> vertices{
        vertex(x, y, 0, 0), vertex(x + w, y, 1, 0),
        vertex(x + w, y + h, 1, 1), vertex(x, y, 0, 0),
        vertex(x + w, y + h, 1, 1), vertex(x, y + h, 0, 1)};
    renderer.SubmitTriangles(vertices, texture, linear, false, blend);
}

template<class Renderer, class Texture>
void Pool(Renderer& renderer, Texture* texture, const GpuPoolParams& p, bool gpu,
    float offsetU = 0.f, float offsetV = 0.f)
{
    if (gpu) renderer.SubmitPool(texture, p);
    else
    {
        auto vertices = LegacyVertices(p, Renderer::SlotOf(texture));
        for (auto& vertex : vertices) { vertex.u += offsetU; vertex.v += offsetV; }
        // No scissor: legacy pool clipping fades triangles through vertex alpha.
        renderer.SubmitTriangles(vertices, texture, (p.sampler & 1u) != 0,
            (p.sampler & 2u) != 0, p.blend);
    }
}

// Compare every RGBA channel, including transparent pixels and image borders.
// max<=3 is a local 8-bit rounding allowance; mean<=0.04 is measured only in
// the pool's bounding region so the empty canvas cannot conceal a regression.
template<class Pixels>
void Compare(const Pixels& expected, const Pixels& actual, const char* label,
    std::size_t boundaryPixel = NoPixel)
{
    Check(expected.width == Width && expected.height == Height &&
        actual.width == Width && actual.height == Height &&
        expected.pixels.size() == std::size_t(Width) * Height &&
        actual.pixels.size() == expected.pixels.size(), "Pool readback extent");
    unsigned maximum = 0, maximumOutsideBoundary = 0;
    std::uint64_t total = 0, poolTotal = 0, poolChannels = 0;
    std::size_t worstPixel = 0, changed = 0;
    for (std::size_t i = 0; i < expected.pixels.size(); ++i)
    {
        if (expected.pixels[i] != actual.pixels[i]) ++changed;
        const int x = int(i % Width), y = int(i / Width);
        const bool inPool = x >= 20 && x < 780 && y >= 250 && y < 470;
        for (unsigned shift = 0; shift < 32; shift += 8)
        {
            const unsigned error = unsigned(std::abs(
                int((expected.pixels[i] >> shift) & 255u) -
                int((actual.pixels[i] >> shift) & 255u)));
            if (error > maximum) { maximum = error; worstPixel = i; }
            if (i != boundaryPixel)
                maximumOutsideBoundary = std::max(maximumOutsideBoundary, error);
            total += error;
            if (inPool) { poolTotal += error; ++poolChannels; }
        }
    }
    const double mean = double(total) / (expected.pixels.size() * 4);
    const double poolMean = double(poolTotal) / poolChannels;
    std::cout << "pool GPU " << label << ": RGBA max=" << maximum
        << " mean=" << mean << " poolMean=" << poolMean
        << " changedPixels=" << changed << " worst=(" << worstPixel % Width
        << ',' << worstPixel / Width << ") outsideBoundaryMax="
        << maximumOutsideBoundary << '\n';
    if (maximumOutsideBoundary > 3 || poolMean > 0.04)
        throw std::runtime_error(std::string("GPU pool differs from legacy CPU mesh: ") + label);
}

template<class Renderer, class Texture>
void CompareFloatsIfAvailable(Renderer& renderer, Texture* expected,
    Texture* actual, const char* label, std::size_t boundaryPixel = NoPixel)
{
    if constexpr (requires { renderer.ReadTextureFloats(expected); })
    {
        const auto a = renderer.ReadTextureFloats(expected);
        const auto b = renderer.ReadTextureFloats(actual);
        Check(a.size() == std::size_t(Width) * Height * 4 && a.size() == b.size(),
            "Pool float readback extent");
        double total = 0;
        float maximum = 0, maximumOutsideBoundary = 0;
        for (std::size_t i = 0; i < a.size(); ++i)
        {
            Check(std::isfinite(a[i]) && std::isfinite(b[i]), "Non-finite GPU pool output");
            const float error = std::abs(a[i] - b[i]);
            maximum = std::max(maximum, error);
            if (i / 4 != boundaryPixel)
                maximumOutsideBoundary = std::max(maximumOutsideBoundary, error);
            total += error;
        }
        const double mean = total / a.size();
        std::cout << "pool GPU " << label << ": premultiplied float max="
            << maximum << " mean=" << mean << " outsideBoundaryMax="
            << maximumOutsideBoundary << '\n';
        // Float checks also expose premultiply/unpremultiply cancellation that
        // could otherwise disappear during straight-alpha RGBA8 readback.
        Check(maximumOutsideBoundary <= 0.012f && mean <= 0.00005,
            "Pool floating target differs from legacy CPU mesh");
    }
}

template<class Renderer>
void Run(Renderer& renderer)
{
    using Texture = std::remove_pointer_t<decltype(renderer.CreateRenderImage(1, 1))>;
    // Raw pointers match the renderer's ownership contract; unwind cleanup is
    // scoped here so an assertion does not contaminate later fixture tests.
    struct Owned {
        Renderer& renderer;
        std::vector<Texture*> textures;
        bool sceneOpen = false;
        bool Begin()
        {
            sceneOpen = renderer.BeginScene();
            return sceneOpen;
        }
        void End()
        {
            renderer.EndSceneAndPresent();
            sceneOpen = false;
        }
        ~Owned()
        {
            if (sceneOpen) renderer.EndSceneAndPresent();
            renderer.SetRenderImage(nullptr);
            for (auto* texture : textures) renderer.DestroyTexture(texture);
        }
        Texture* Keep(Texture* texture) { textures.push_back(texture); return texture; }
    } owned{renderer, {}};
    constexpr int sourceWidth = 67, sourceHeight = 37;
    std::array<Texture*, 3> sources{};
    for (unsigned layer = 0; layer < sources.size(); ++layer)
    {
        std::array<unsigned, sourceWidth * sourceHeight> pixels{};
        for (int y = 0; y < sourceHeight; ++y)
            for (int x = 0; x < sourceWidth; ++x)
            {
                const bool checker = ((x / 7 + y / 5) & 1) != 0;
                const bool line = x % 7 == 0 || y % 5 == 0;
                const unsigned alpha = (x < 4 && y < 8) ? 0 :
                    line ? 232 : checker ? 83 + layer * 17 : 171 - layer * 23;
                const unsigned red = line ? 241 : checker ? 37 + layer * 29 : 173;
                const unsigned green = checker ? 211 - layer * 31 : 41 + layer * 37;
                const unsigned blue = line ? 47 : checker ? 187 : 59 + layer * 43;
                pixels[y * sourceWidth + x] =
                    (alpha << 24) | (red << 16) | (green << 8) | blue;
            }
        sources[layer] = owned.Keep(renderer.CreateTexture(sourceWidth,
            sourceHeight, pixels.data(), sourceWidth * 4));
    }
    auto* expected = owned.Keep(renderer.CreateRenderImage(Width, Height));
    auto* actual = owned.Keep(renderer.CreateRenderImage(Width, Height));
    struct Scenario {
        const char* name;
        std::uint32_t counter;
        bool night, partial, nearest;
        GpuBlend blend;
    };
    const std::array<Scenario, 6> scenarios{{
        {"day-normal-nearest", 0u, false, false, true, GpuBlend::Normal},
        {"night-normal-linear", 1073u, true, false, false, GpuBlend::Normal},
        {"day-additive-partial-fractional", 158399u, false, true, false, GpuBlend::Additive},
        {"night-additive-phase-wrap", 158400u, true, false, false, GpuBlend::Additive},
        {"day-opaque-partial-fractional", 32768u, false, true, false, GpuBlend::Opaque},
        {"night-opaque-large-counter", 0xfffffffdu, true, false, false, GpuBlend::Opaque}
    }};
    for (const auto& s : scenarios)
    {
        const auto draw = [&](Texture* target, bool gpu, int shiftedLayer = -1,
            float offsetU = 0.f, float offsetV = 0.f) {
            renderer.SetRenderImage(target);
            Check(owned.Begin(), "Begin pool GPU comparison scene");
            Rectangle(renderer, renderer.whiteTexture, 0, 0, Width, Height,
                {0.13f, 0.23f, 0.41f, 0.37f}, GpuBlend::Opaque);
            for (unsigned layer = 0; layer < 3; ++layer)
            {
                // Alternating ordinary draws overlap both previous and next
                // pool layers; incorrect batch flushes visibly change order.
                Rectangle(renderer, renderer.whiteTexture, 62.f + 119.f * layer,
                    295.f + 23.f * layer, 153.f, 91.f,
                    {0.83f, 0.17f, 0.31f, 0.43f}, GpuBlend::Normal);
                const auto p = Parameters(s.counter, layer, s.night,
                    s.blend, s.partial, s.nearest);
                Pool(renderer, sources[layer], p, gpu,
                    int(layer) == shiftedLayer ? offsetU : 0.f,
                    int(layer) == shiftedLayer ? offsetV : 0.f);
            }
            Rectangle(renderer, renderer.whiteTexture, 418.25f, 323.75f, 127.f, 69.f,
                {0.17f, 0.79f, 0.27f, 0.51f}, GpuBlend::Normal);
            owned.End();
            renderer.SetRenderImage(nullptr);
        };
        draw(expected, false);
        draw(actual, true);
        const auto expectedPixels = renderer.ReadTexturePixels(expected);
        const auto actualPixels = renderer.ReadTexturePixels(actual);
        std::size_t boundaryPixel = NoPixel;
        if (s.nearest)
        {
            // A nearest sample exactly at a texel edge can choose either
            // neighbor after an otherwise harmless float interpolation round.
            // Identify at most one outlying pixel; never exempt it merely
            // because the overall image error is small.
            std::size_t outlier = NoPixel, outlierCount = 0;
            for (std::size_t pixel = 0; pixel < expectedPixels.pixels.size(); ++pixel)
            {
                bool different = false;
                for (unsigned shift = 0; shift < 32; shift += 8)
                    different = different || std::abs(
                        int((expectedPixels.pixels[pixel] >> shift) & 255u) -
                        int((actualPixels.pixels[pixel] >> shift) & 255u)) > 3;
                if (different) { outlier = pixel; ++outlierCount; }
            }
            if (outlierCount == 1)
            {
                std::vector<float> actualFloats;
                if constexpr (requires { renderer.ReadTextureFloats(actual); })
                    actualFloats = renderer.ReadTextureFloats(actual);
                auto* candidateTarget = owned.Keep(renderer.CreateRenderImage(Width, Height));
                bool matched = false;
                for (int layer = 0; layer < 3 && !matched; ++layer)
                    for (int axis = 0; axis < 2 && !matched; ++axis)
                        for (int sign : {-1, 1})
                        {
                            // Only one layer and one UV axis change. This is
                            // 1/10000 of a texel, not a pixel/mesh displacement
                            // or a color tolerance; it can only select an
                            // immediately neighboring nearest texel.
                            const float delta = sign * 0.0001f /
                                (axis == 0 ? sourceWidth : sourceHeight);
                            draw(candidateTarget, false, layer,
                                axis == 0 ? delta : 0.f, axis == 1 ? delta : 0.f);
                            const auto candidate = renderer.ReadTexturePixels(candidateTarget);
                            bool pixelMatches = true;
                            for (unsigned shift = 0; shift < 32; shift += 8)
                                pixelMatches = pixelMatches && std::abs(
                                    int((candidate.pixels[outlier] >> shift) & 255u) -
                                    int((actualPixels.pixels[outlier] >> shift) & 255u)) <= 3;
                            if constexpr (requires { renderer.ReadTextureFloats(candidateTarget); })
                            {
                                if (pixelMatches)
                                {
                                    const auto candidateFloats = renderer.ReadTextureFloats(candidateTarget);
                                    Check(candidateFloats.size() == std::size_t(Width) * Height * 4 &&
                                        actualFloats.size() == candidateFloats.size(),
                                        "Pool boundary candidate float extent");
                                    for (unsigned channel = 0; channel < 4; ++channel)
                                    {
                                        const auto index = outlier * 4 + channel;
                                        pixelMatches = pixelMatches &&
                                            std::isfinite(candidateFloats[index]) &&
                                            std::isfinite(actualFloats[index]) &&
                                            std::abs(candidateFloats[index] -
                                                actualFloats[index]) <= 0.012f;
                                    }
                                }
                            }
                            if (pixelMatches)
                            {
                                matched = true;
                                boundaryPixel = outlier;
                                std::cout << "pool GPU " << s.name
                                    << ": verified nearest boundary candidate pixel=("
                                    << outlier % Width << ',' << outlier / Width
                                    << ") layer=" << layer << " axis=" << (axis == 0 ? 'U' : 'V')
                                    << " texelOffset=" << sign * 0.0001f << '\n';
                                break;
                            }
                        }
                Check(matched, "Nearest pool outlier matches no adjacent-texel RGBA/float candidate");
            }
        }
        // Means always include the original boundary error. Only the single
        // pixel already validated against the same RGBA+float candidate is
        // excluded from the ordinary per-channel maximum checks.
        Compare(expectedPixels, actualPixels, s.name, boundaryPixel);
        CompareFloatsIfAvailable(renderer, expected, actual, s.name, boundaryPixel);
    }

    // Ordinary CPU triangles already define the feedback-snapshot contract.
    // Sample a float target as the pool source to exercise that same contract
    // and premultiplied-input interpretation through the dedicated pool path.
    auto* snapshot = owned.Keep(renderer.CreateRenderImage(Width, Height));
    const auto feedback = [&](Texture* target, bool gpu) {
        renderer.SetRenderImage(target);
        Check(owned.Begin(), "Begin pool feedback initialization");
        Rectangle(renderer, sources[1], 0, 0, Width, Height,
            {0.91f, 0.77f, 0.83f, 0.63f}, GpuBlend::Opaque, true);
        owned.End();
        renderer.SetRenderImage(nullptr);
        Texture* source = gpu ? target : snapshot;
        renderer.SetRenderImage(target);
        Check(owned.Begin(), "Begin pool feedback comparison");
        // Leave a pending ordinary batch before self-sampling: the dedicated
        // path must flush it before creating its pre-draw snapshot.
        Rectangle(renderer, renderer.whiteTexture, 112, 296, 171, 77,
            {0.71f, 0.19f, 0.87f, 0.47f}, GpuBlend::Normal);
        if (!gpu)
        {
            // The CPU oracle must capture the pending mark too. Selecting a
            // different target closes/drains the existing ordinary batch.
            owned.End();
            renderer.SetRenderImage(snapshot);
            Check(owned.Begin(), "Begin marked pool feedback oracle snapshot");
            Rectangle(renderer, target, 0, 0, Width, Height,
                {1.f, 1.f, 1.f, 1.f}, GpuBlend::Opaque);
            owned.End();
            renderer.SetRenderImage(target);
            Check(owned.Begin(), "Begin marked pool feedback oracle");
        }
        const auto p = Parameters(1901u, 2, false, GpuBlend::Normal, true, false);
        Pool(renderer, source, p, gpu);
        Rectangle(renderer, renderer.whiteTexture, 527, 351, 101, 53,
            {0.23f, 0.83f, 0.37f, 0.39f}, GpuBlend::Normal);
        owned.End();
        renderer.SetRenderImage(nullptr);
    };
    feedback(expected, false);
    feedback(actual, true);
    Compare(renderer.ReadTexturePixels(expected), renderer.ReadTexturePixels(actual),
        "feedback-float-source-pending-batch");
    CompareFloatsIfAvailable(renderer, expected, actual, "feedback-float-source-pending-batch");
    std::cout << "PASS production GPU pool vs independent legacy CPU mesh: day/night, "
        "normal/additive/opaque, nearest/linear/repeat, phase wrap, vertex-alpha clip, "
        "fractional translation, ordinary painter order and float target feedback\n";
}
} // namespace PoolGpuChecks
