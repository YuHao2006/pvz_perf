#include "MetalRenderer.h"
#include "MetalContext.h"
#include "../../../platform/macos/MacWindow.h"
#include "../../../misc/FastMath.h"
#import <AppKit/AppKit.h>
#include <algorithm>
#include <array>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <string>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    path = (std::filesystem::temp_directory_path() / name).string();
    return path.c_str();
}
}
namespace {
using namespace Sexy;
using Point = std::array<float, 4>;
void Require(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}
struct CpuTriangles {
    std::array<GpuVertex, 18> vertices;
    size_t count = 0;
    operator std::span<const GpuVertex>() const { return {vertices.data(), count}; }
};
CpuTriangles Reference(const GpuReanimKey& a, const GpuReanimKey& b,
    const GpuReanimGeometry& base, const GpuReanimGeometry& source,
    const GpuReanimInstance& instance, const GpuReanimTrackDraw& draw, uint32_t slot,
    uint32_t sampler, const GpuClip* clip) {
    const auto lerp = [&](float x, float y) { return x + (y - x) * instance.fraction; };
    int alpha = std::clamp(int(lerp(a.alpha, b.alpha) * float(draw.color >> 24) + .5f), 0, 255);
    if (a.frame < 0 || !a.imageSlot || !alpha || source.width <= 0 || source.height <= 0 ||
        ((draw.flags & 1) && a.frame != -1 && b.frame == -1 && instance.fraction > 0)) return {};
    float x = -lerp(a.skewX, b.skewX) * .017453292f, y = -lerp(a.skewY, b.skewY) * .017453292f;
    float sx = lerp(a.scaleX, b.scaleX), sy = lerp(a.scaleY, b.scaleY);
    float m00 = FastCos(x) * sx, m10 = -FastSin(x) * sx;
    float m01 = FastSin(y) * sy, m11 = FastCos(y) * sy;
    float cx = m00 * (base.width * .5f) + m01 * (base.height * .5f) + lerp(a.transX, b.transX);
    float cy = m10 * (base.width * .5f) + m11 * (base.height * .5f) + lerp(a.transY, b.transY);
    float xx = instance.overlay00 * m00 + instance.overlay01 * m10;
    float xy = instance.overlay00 * m01 + instance.overlay01 * m11;
    float yx = instance.overlay10 * m00 + instance.overlay11 * m10;
    float yy = instance.overlay10 * m01 + instance.overlay11 * m11;
    float ox = instance.overlay00 * cx + instance.overlay01 * cy + instance.overlay02;
    float oy = instance.overlay10 * cx + instance.overlay11 * cy + instance.overlay12;
    ox += (draw.shakeX + instance.translateX) - .5f;
    oy += (draw.shakeY + instance.translateY) - .5f;
    std::array<Point, 8> polygon{{
        {-source.width / 2, -source.height / 2, source.u0, source.v0},
        {-source.width / 2, source.height / 2, source.u0, source.v1},
        {source.width / 2, source.height / 2, source.u1, source.v1},
        {source.width / 2, -source.height / 2, source.u1, source.v0}}};
    size_t count = 4;
    for (size_t i = 0; i < count; ++i) {
        float px = polygon[i][0], py = polygon[i][1];
        polygon[i][0] = xx * px + xy * py + ox; polygon[i][1] = yx * px + yy * py + oy;
    }
    if (clip && !(draw.flags & 2)) {
        const float bounds[]{float(clip->x), float(clip->y),
            float(int64_t(clip->x) + clip->width), float(int64_t(clip->y) + clip->height)};
        for (int edge = 0; edge < 4; ++edge) {
            std::array<Point, 8> next{};
            size_t written = 0;
            int axis = edge % 2;
            for (size_t i = 0; i < count; ++i) {
                const auto& p = polygon[(i + count - 1) % count]; const auto& q = polygon[i];
                bool pin = edge < 2 ? p[axis] >= bounds[edge] : p[axis] < bounds[edge];
                bool qin = edge < 2 ? q[axis] >= bounds[edge] : q[axis] < bounds[edge];
                if (pin != qin) {
                    float t = (bounds[edge] - p[axis]) / (q[axis] - p[axis]);
                    Point hit{};
                    for (int j = 0; j < 4; ++j) hit[j] = p[j] + (q[j] - p[j]) * t;
                    next[written++] = hit;
                }
                if (qin) next[written++] = q;
            }
            polygon = next; count = written;
        }
    }
    CpuTriangles result;
    const auto emit = [&](const Point& p) {
        result.vertices[result.count++] = {p[0], p[1], float((draw.color >> 16) & 255) / 255,
            float((draw.color >> 8) & 255) / 255, float(draw.color & 255) / 255,
            float(alpha) / 255, p[2], p[3], slot | draw.samplingFlags, sampler};
    };
    if (clip && !(draw.flags & 2)) {
        for (size_t i = 1; i + 1 < count; ++i) { emit(polygon[0]); emit(polygon[i]); emit(polygon[i + 1]); }
    } else for (int i : {0, 1, 3, 1, 3, 2}) emit(polygon[size_t(i)]);
    return result;
}
void Compare(const std::vector<uint32_t>& a, const std::vector<uint32_t>& b) {
    Require(a.size() == b.size(), "Metal reference dimensions differ");
    for (size_t i = 0; i < a.size(); ++i)
        for (unsigned shift : {0u, 8u, 16u, 24u})
            Require(std::abs(int((a[i] >> shift) & 255) - int((b[i] >> shift) & 255)) <= 3,
                "Metal resident interpolation/clip/variant/order pixel mismatch");
}
void Run() {
    MacWindowConfig config;
    config.title = "Metal resident correctness"; config.width = config.height = 64;
    MacWindow window(config);
    MetalContext context(&window, true);
    MetalRenderer renderer(context, 64, 64, PVZ_METAL_SHADER_DIRECTORY);
    auto* target = renderer.CreateRenderImage(64, 64);
    renderer.SetRenderImage(target);
    const std::array<GpuReanimKey, 2> keys{{
        {5.25f, 8.125f, -15, 23, 1.15f, .9f, .8f, 0, 1},
        {13.5f, 11.25f, 37, -18, -.75f, 1.1f, .35f, -1, 1}}};
    const std::array<GpuReanimTrack, 3> tracks{{{0, 2}, {GpuReanimNoKeys, 0}, {0, 2}}};
    const std::array<GpuReanimGeometry, 6> geometry{{
        {}, {20, 24, 0, 0, 1, 1}, {}, {28, 12, 1, 0, 0, 1}, {}, {}}};
    auto uploadKeys = keys; auto uploadGeometry = geometry;
    auto* definition = renderer.UploadReanimDefinition({tracks, uploadKeys, uploadGeometry, 2, 3});
    Require(definition != nullptr, "Resident Metal kernel unavailable with experimental build enabled");
    uploadKeys = {}; uploadGeometry = {};
    const uint32_t texels[]{0xffff0000, 0xff00ff00, 0xff0000ff, 0xffffff00};
    auto* texture = renderer.CreateTexture(2, 2, texels, 8);
    const auto white = MetalRenderer::SlotOf(renderer.whiteTexture);
    const GpuVertex clear[]{
        {0,0,0,0,0,1,0,0,white,0},{64,0,0,0,0,1,1,0,white,0},{64,64,0,0,0,1,1,1,white,0},
        {0,0,0,0,0,1,0,0,white,0},{64,64,0,0,0,1,1,1,white,0},{0,64,0,0,0,1,0,1,white,0}};
    const auto begin = [&] {
        Require(renderer.BeginScene(), "Cannot begin Metal image-only fixture");
        renderer.SubmitTriangles(clear, renderer.whiteTexture, false, false, GpuBlend::Opaque);
    };
    const auto finish = [&] {
        renderer.EndSceneAndPresent();
        return renderer.ReadTexturePixels(target).pixels;
    };
    const GpuClip clips[]{{10, 10, 22, 25}, {100, 100, 4, 5}, {10, 10, 0, 8}};
    unsigned cases = 0;
    uint32_t stale = UINT32_MAX;
    for (uint32_t variant : {0u, 1u, 2u}) for (float fraction : {0.f, .375f, 1.f})
        for (uint32_t flags : {0u, 1u, 2u, 3u}) for (uint32_t sampler : {0u, 1u, 2u, 3u}) {
            GpuReanimInstance instance{};
            instance.after = 1; instance.variant = variant; instance.fraction = fraction;
            instance.translateX = .25f; instance.translateY = 1.25f;
            instance.overlay00 = 1; instance.overlay01 = .15f; instance.overlay02 = 8;
            instance.overlay10 = -.1f; instance.overlay11 = 1; instance.overlay12 = 5;
            GpuReanimTrackDraw draw{2, cases % 7 == 0 ? 0u : 0xc0e0d0ffu};
            draw.flags = flags; draw.shakeX = -.25f; draw.shakeY = .5f;
            draw.samplingFlags = ((cases % 4) << 28) |
                (cases % 3 == 0 ? GpuVertex::kIndependentColorFilter : 0u) |
                (cases % 5 == 0 ? GpuVertex::kAlphaEdgeFilter : 0u);
            const auto* clip = (cases / 4 + cases) % 2 ? &clips[(cases / 8) % 3] : nullptr;
            const auto vertices = Reference(keys[0], keys[1], geometry[1], geometry[variant * 2 + 1],
                instance, draw, MetalRenderer::SlotOf(texture), sampler, clip);
            begin();
            renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Normal);
            renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Additive);
            renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Normal);
            const auto expected = finish();
            begin();
            Require(!renderer.SubmitReanimTrack(stale, draw, GpuBlend::Normal), "Metal stale instance accepted");
            const auto token = renderer.BeginReanimInstance(definition, texture, instance,
                sampler & 1, sampler & 2, clip, true);
            Require(token != UINT32_MAX, "Metal resident instance rejected");
            auto invalid = draw; invalid.track = 1;
            Require(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "Metal CPU-only logical index accepted");
            invalid = draw; invalid.flags = 4;
            Require(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "Metal invalid flags accepted");
            Require(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Metal track rejected");
            renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Additive);
            Require(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Metal later mixed track rejected");
            stale = token;
            Compare(expected, finish()); ++cases;
        }
    auto secondKeys = keys; secondKeys[0].transX += 4; secondKeys[1].transY -= 3;
    auto* second = renderer.UploadReanimDefinition({tracks, secondKeys, geometry, 2, 3});
    const uint32_t otherTexels[]{0xff20c040, 0xffe02060, 0xff8060f0, 0xffe0a020};
    auto* other = renderer.CreateTexture(2, 2, otherTexels, 8);
    std::vector<uint32_t> mixedExpected;
    for (bool resident : {false, true}) {
        begin();
        for (unsigned i = 0; i < 24; ++i) {
            bool alternate = i % 2 != 0;
            auto* source = alternate ? other : texture;
            GpuReanimInstance mixed{};
            mixed.after = 1; mixed.variant = i % 3; mixed.fraction = float(i % 7) / 7;
            mixed.overlay00 = i % 4 == 0 ? -.75f : 1.f; mixed.overlay11 = .8f;
            mixed.overlay02 = 14 + float(i % 3); mixed.overlay12 = 10 + float(i % 5);
            GpuReanimTrackDraw track{2, 0xc0e0d0ff};
            track.shakeX = .375f; track.shakeY = -.125f;
            track.flags = i % 5 == 0 ? GpuReanimTrackDraw::IgnoreDefaultClip : 0u;
            const auto* requested = i % 3 == 0 ? &clips[0] : nullptr;
            const auto& sourceKeys = alternate ? secondKeys : keys;
            const auto vertices = Reference(sourceKeys[0], sourceKeys[1], geometry[1],
                geometry[mixed.variant * 2 + 1], mixed, track, MetalRenderer::SlotOf(source), 0, requested);
            const auto blend = GpuBlend((i / 4) % 3);
            if (resident) {
                const auto token = renderer.BeginReanimInstance(alternate ? second : definition, source,
                    mixed, false, false, requested, true);
                Require(renderer.SubmitReanimTrack(token, track, blend), "Metal mixed definition/texture rejected");
            } else renderer.SubmitTriangles(vertices, source, false, false, blend);
            if (i % 7 == 6) renderer.SubmitTriangles(vertices, source, false, false, GpuBlend::Additive);
        }
        const auto pixels = finish();
        if (resident) Compare(mixedExpected, pixels); else mixedExpected = pixels;
    }
    renderer.DestroyReanimDefinition(second); renderer.DestroyTexture(other);
    // A queued source must remain immutable when that stable image handle
    // becomes a feedback target. The later packet must see the new version.
    auto* mutableImage = renderer.CreateRenderImage(2, 2);
    const auto quad = [](uint32_t slot, float red) {
        return std::array<GpuVertex, 6>{{
            {0,0,red,1,1,1,0,0,slot,0},{2,0,red,1,1,1,1,0,slot,0},{2,2,red,1,1,1,1,1,slot,0},
            {0,0,red,1,1,1,0,0,slot,0},{2,2,red,1,1,1,1,1,slot,0},{0,2,red,1,1,1,0,1,slot,0}}};
    };
    std::vector<uint32_t> mutationExpected;
    for (bool resident : {false, true}) {
        renderer.SetRenderImage(mutableImage);
        Require(renderer.BeginScene(), "Cannot seed mutable Metal source");
        auto seed = quad(MetalRenderer::SlotOf(texture), 1);
        renderer.SubmitTriangles(seed, texture, false, false, GpuBlend::Opaque);
        renderer.EndSceneAndPresent();
        renderer.SetRenderImage(target); begin();
        GpuReanimInstance version{};
        version.overlay00 = version.overlay11 = 1; version.overlay02 = 5; version.overlay12 = 8;
        GpuReanimTrackDraw track{2, 0xc0e0d0ff};
        auto vertices = Reference(keys[0], keys[0], geometry[1], geometry[1], version, track,
            MetalRenderer::SlotOf(mutableImage), 0, nullptr);
        if (resident) {
            auto token = renderer.BeginReanimInstance(definition, mutableImage, version, false, false, nullptr, true);
            Require(renderer.SubmitReanimTrack(token, track, GpuBlend::Normal), "Mutable source track rejected");
        } else renderer.SubmitTriangles(vertices, mutableImage, false, false, GpuBlend::Normal);
        renderer.SetRenderImage(mutableImage);
        auto feedback = quad(MetalRenderer::SlotOf(mutableImage), .25f);
        renderer.SubmitTriangles(feedback, mutableImage, false, false, GpuBlend::Opaque);
        renderer.SetRenderImage(target);
        version.overlay02 = 32;
        vertices = Reference(keys[0], keys[0], geometry[1], geometry[1], version, track,
            MetalRenderer::SlotOf(mutableImage), 0, nullptr);
        if (resident) {
            GpuReanimDraw legacy{};
            legacy.track = 2; legacy.color = track.color;
            legacy.overlay00 = legacy.overlay11 = 1; legacy.overlay02 = 32; legacy.overlay12 = 8;
            legacy.translateX = legacy.translateY = -.5f;
            Require(renderer.SubmitReanim(definition, mutableImage, legacy, false, false,
                GpuBlend::Normal, nullptr, true), "Mutable source legacy packet rejected");
        } else renderer.SubmitTriangles(vertices, mutableImage, false, false, GpuBlend::Normal);
        const auto pixels = finish();
        if (resident) Compare(mutationExpected, pixels); else mutationExpected = pixels;
    }
    renderer.DestroyTexture(mutableImage);
    // More than one output-buffer batch, with different geometry in the second
    // batch, exposes missing compute->render->compute resource dependencies.
    GpuReanimInstance instance{}; instance.overlay00 = instance.overlay11 = 1;
    instance.overlay02 = 5; instance.overlay12 = 8;
    GpuReanimTrackDraw draw{2, 0xc0e0d0ff};
    std::vector<uint32_t> expected;
    for (bool resident : {false, true}) {
        begin();
        std::vector<GpuVertex> cpu;
        cpu.reserve(5000 * 6);
        for (unsigned group = 0; group < 2; ++group) {
            instance.overlay02 = group ? 32.f : 5.f;
            const auto token = resident ? renderer.BeginReanimInstance(definition, texture, instance,
                false, false, nullptr, true) : UINT32_MAX;
            const auto vertices = Reference(keys[0], keys[0], geometry[1], geometry[1], instance, draw,
                MetalRenderer::SlotOf(texture), 0, nullptr);
            for (unsigned i = 0; i < (group ? 904u : 4096u); ++i) {
                if (resident) Require(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Metal batched track rejected");
                else cpu.insert(cpu.end(), vertices.vertices.begin(), vertices.vertices.begin() + vertices.count);
            }
        }
        if (!resident) renderer.SubmitTriangles(cpu, texture, false, false, GpuBlend::Normal);
        const auto pixels = finish();
        if (resident) Compare(expected, pixels); else expected = pixels;
    }
    begin();
    Require(!renderer.reanimFrameEligible, "Sparse Metal prior batch enabled policy");
    Require(renderer.BeginReanimInstance(definition, texture, instance, false, false) == UINT32_MAX,
        "Metal sparse policy allocated packets");
    renderer.reanimPictureCandidates = 256;
    finish();
    begin();
    Require(renderer.reanimFrameEligible, "Dense Metal prior batch did not enable policy");
    auto token = renderer.BeginReanimInstance(definition, texture, instance, false, false);
    Require(token != UINT32_MAX, "Eligible Metal instance rejected");
    Require(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Eligible Metal track rejected");
    auto* alternate = renderer.CreateRenderImage(64, 64);
    renderer.SetRenderImage(alternate);
    Require(!renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Metal target switch kept token");
    Require(renderer.reanimFrameEligible, "Metal target switch reset policy");
    renderer.SetRenderImage(target);
    token = renderer.BeginReanimInstance(definition, texture, instance, false, false, nullptr, true);
    Require(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "Metal lifetime track rejected");
    renderer.DestroyReanimDefinition(definition);
    renderer.DestroyTexture(texture);
    const auto pixels = finish();
    Require(std::any_of(pixels.begin(), pixels.end(), [](auto p) { return p != 0xff000000; }),
        "Metal retirement discarded queued draw");
    renderer.DestroyTexture(alternate);
    const GpuReanimTrack cpuOnly{GpuReanimNoKeys, 0};
    const GpuReanimGeometry empty{};
    auto* cpuDefinition = renderer.UploadReanimDefinition({{&cpuOnly, 1}, {}, {&empty, 1}, 1, 1});
    Require(cpuDefinition != nullptr, "Metal CPU-only no-key definition rejected");
    renderer.DestroyReanimDefinition(cpuDefinition);
    renderer.SetRenderImage(nullptr);
    renderer.DestroyTexture(target);
    std::cout << "Metal resident cases=" << cases
        << " batch5000/sentinel/variant/clip/alpha/truncate/mixed/feedback/mutation/legacy/policy/target/lifetime=PASS\n";
}
}
int main() {
    @autoreleasepool {
        try { Run(); return 0; }
        catch (const std::exception& error) { std::cerr << "Metal resident fixture failed: " << error.what() << '\n'; return 1; }
    }
}
