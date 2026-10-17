#include "PortablePoolTimingSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "System/PoolEffect.h"
#include "graphics/MemoryImage.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include <array>
#include <algorithm>
#include <cstdint>
#include <fstream>
#include <stdexcept>

namespace
{
// Independent wide-integer model of the original 0046DF60 interpolation.
// Fractional weights deliberately retain the original odd low-bit adjustment
// and each intermediate truncation, not a floating-point bilinear substitute.
unsigned Lookup(const unsigned char* gray, std::uint32_t u, std::uint32_t v)
{
    const std::uint64_t right = (u & 0xfffeu) + 1u, bottom = (v & 0xfffeu) + 1u;
    const auto left = 65536u - right, top = 65536u - bottom;
    const unsigned x = (u >> 16) & 255u, y = (v >> 16) & 255u;
    const unsigned nextX = (x + 1) & 255u, nextY = (y + 1) & 255u;
    const auto term = [](std::uint64_t a, std::uint64_t b, unsigned char pixel)
    { return unsigned(((a * b / 65536u) * pixel) / 65536u); };
    return term(left, bottom, gray[nextY * 256 + x]) + term(right, bottom, gray[nextY * 256 + nextX]) +
        term(left, top, gray[y * 256 + x]) + term(right, top, gray[y * 256 + nextX]);
}
std::int64_t SignedShift16(std::uint32_t value)
{
    const std::uint64_t bits = (std::uint64_t(value) << 16) & 0xffffffffull;
    return bits < 0x80000000ull ? std::int64_t(bits) : std::int64_t(bits) - 0x100000000ll;
}
unsigned Alpha(const unsigned char* gray, std::uint32_t counter, int x, int y)
{
    const auto t0 = SignedShift16(counter), t1 = SignedShift16((counter & 65535u) + 1u);
    const auto a = Lookup(gray, std::uint32_t(std::int64_t(x) * 131072 - t1 / 6),
        std::uint32_t(std::int64_t(256 - y) * 131072 + t0 / 8));
    const auto b = Lookup(gray, std::uint32_t(std::int64_t(x) * 131072 + t0 / 10), std::uint32_t(y * 131072));
    const unsigned value = ((a & 255u) + (b & 255u)) / 2u;
    const unsigned alpha = value >= 160u ? 255u - 2u * (value - 160u) : value >= 128u ? 5u * (value - 128u) : 0u;
    return (alpha & 255u) / 3u;
}

void PoolSamplerCases(LawnApp& app, std::ostream& log)
{
    using namespace Sexy;
    auto& renderer = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    const auto* cpuBits = screen->mBits;
    const auto cpuVersion = screen->mBitsChangedCount;
    MemoryImage texture;
    texture.Create(16, 16);
    constexpr std::array<std::uint32_t, 4> colors{0xffd03020u, 0xff20c040u, 0xff3040d0u, 0xffc0b020u};
    auto* bits = texture.GetBits();
    for (int y = 0; y < 16; ++y) for (int x = 0; x < 16; ++x)
        bits[y * 16 + x] = colors[(x >= 8) + 2 * (y >= 8)];
    texture.BitsChanged();
    const TriVertex vertices[2][3] = {
        {{100,100,0,0,0xffffffffu},{100,228,0,2,0xffffffffu},{228,228,2,2,0xffffffffu}},
        {{100,100,0,0,0xffffffffu},{228,228,2,2,0xffffffffu},{228,100,2,0,0xffffffffu}}
    };
    struct ResetSampler {RenderInterface& renderer; ~ResetSampler(){renderer.sSamplerAddressWrap = false;}} reset{renderer};
    unsigned totalWrong = 0;
    for (bool linear : {false, true}) for (int state = 0; state < 3; ++state)
    {
        screen->FillRect(Rect(0, 0, 800, 600), Color(17, 23, 31), 0);
        renderer.sSamplerAddressWrap = state != 0;
        if (state == 2)
        {
            // The actual pool draw must leave ordinary subsequent draws clamped.
            // Both day and night are exercised without touching the live board.
            Graphics g(screen);
            app.mPoolEffect->PoolEffectDraw(&g, linear);
        }
        renderer.DrawTrianglesTex(vertices, 2, Color::White, Graphics::DRAWMODE_NORMAL,
            &texture, 0, 0, linear);
        renderer.Flush();
        const auto pixels = renderer.mRenderer->ReadScenePixels();
        if (pixels.size() != 480000) throw std::runtime_error("Pool sampler scene readback missing");
        unsigned wrong = 0;
        for (int y = 0; y < 4; ++y) for (int x = 0; x < 4; ++x)
        {
            const int qx = state == 1 ? x % 2 : std::min(x, 1);
            const int qy = state == 1 ? y % 2 : std::min(y, 1);
            const auto expected = colors[qx + qy * 2];
            wrong += pixels[(116 + y * 32) * 800 + 116 + x * 32] != expected;
        }
        log << "gpu-sampler linear=" << linear << " state=" << state
            << " samples=16 wrong=" << wrong << std::endl;
        totalWrong += wrong;
    }
    if (totalWrong || screen->mBits != cpuBits || screen->mBitsChangedCount != cpuVersion)
        throw std::runtime_error("Pool repeat/clamp restoration or GPU-only draw failed");
    ModernSmoke::Report("portable-pool-six-gpu-repeat-clamp-and-real-draw-restore-cases", app);
}
}

void PortablePoolTimingSmoke(LawnApp& app)
{
    auto& pool = *app.mPoolEffect;
    auto& render=*app.mDDInterface->mRenderInterface;
    struct Restore { PoolEffect& pool; std::uint32_t counter;
        RenderInterface& render;
        ~Restore(){ pool.mPoolCounter = counter; render.SetCausticsFrame(counter); }
    } restore{pool, pool.mPoolCounter,render};
    std::ofstream log(ModernSmoke::ProbePath("pool-time-cases.txt"));
    if (!log || pool.mCausticImage->mBits || !pool.mCausticGPU)
        throw std::runtime_error("Pool timing fixture is not initialized");
    render.Flush();
    const auto lookupImage=render.ReadImagePixels(*static_cast<MemoryImage*>(IMAGE_POOL_CAUSTIC_EFFECT));
    std::array<unsigned char,65536> gray{};
    for(size_t i=0;i<gray.size();++i) gray[i]=lookupImage.pixels.at(i)&255;
    unsigned totalWrong = 0;
    for (auto counter : {0u, 1u, 32766u, 32767u, 32768u, 65534u, 65535u, 65536u, 0x7fffffffu, 0x80000000u, 0xffffffffu})
    {
        pool.mPoolCounter = counter; render.SetCausticsFrame(counter);
        app.mDDInterface->mScreenImage->FillRect(Rect(0,0,800,600),Color(0,0,0),0);
        render.Flush();
        const auto actualPixels=render.mRenderer->ReadTexturePixels(render.GetCausticsTexture());
        unsigned wrong = 0, nonzero = 0;
        for (int y = 0; y < CAUSTIC_IMAGE_HEIGHT; ++y) for (int x = 0; x < CAUSTIC_IMAGE_WIDTH; ++x)
        {
            const auto expected = 0x00ffffffu | (Alpha(gray.data(), counter, x, y) << 24);
            const auto actual = actualPixels.pixels.at(y * CAUSTIC_IMAGE_WIDTH + x);
            wrong += actual != expected; nonzero += (expected >> 24) != 0;
        }
        totalWrong += wrong;
        log << "counter=" << counter << " pixels=8192 mismatches=" << wrong << " nonzero-alpha=" << nonzero << std::endl;
    }
    pool.mPoolCounter = 0xffffffffu; pool.PoolEffectUpdate();
    if (pool.mPoolCounter != 0 || pool.mCausticImage->mBits!=nullptr)
        throw std::runtime_error("Pool counter wrap or GPU-only storage changed");
    log << "counter-wrap=0 host-pixels=0 total-wrong=" << totalWrong << std::endl;
    if (totalWrong) throw std::runtime_error("Pool time division differs from signed 1073 arithmetic; see pool-time-cases.txt");
    ModernSmoke::Report("portable-pool-gpu-source-11-signed-time-pixel-cases", app);
    PoolSamplerCases(app, log);
}
