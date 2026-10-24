#pragma once
#if defined(PVZ_D3D12_REANIM_RESIDENT)
#include "../../../misc/FastMath.h"
#include <cmath>
namespace D3d12ReanimTest {
using namespace Sexy;
using Point = std::array<float, 4>;
struct CpuTriangles {
    std::array<GpuVertex, 18> vertices;
    size_t count = 0;
    operator std::span<const GpuVertex>() const { return {vertices.data(), count}; }
};
inline void Check(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}
inline CpuTriangles Reference(const GpuReanimKey& a, const GpuReanimKey& b,
    const GpuReanimGeometry& base, const GpuReanimGeometry& source,
    const GpuReanimInstance& instance, const GpuReanimTrackDraw& draw, uint32_t slot,
    uint32_t sampler, const GpuClip* clip) {
    const auto lerp = [&](float x, float y) { return x + (y - x) * instance.fraction; };
    int alpha = std::clamp(int(lerp(a.alpha, b.alpha) * float(draw.color >> 24) + .5f), 0, 255);
    if (a.frame < 0 || !a.imageSlot || !alpha || source.width <= 0 || source.height <= 0 ||
        ((draw.flags & 1) && a.frame != -1 && b.frame == -1 && instance.fraction > 0)) return {};
    float x = -lerp(a.skewX, b.skewX) * .017453292f;
    float y = -lerp(a.skewY, b.skewY) * .017453292f;
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
        const float px = polygon[i][0], py = polygon[i][1];
        polygon[i][0] = xx * px + xy * py + ox; polygon[i][1] = yx * px + yy * py + oy;
    }
    if (clip && !(draw.flags & 2)) {
        const float bounds[]{float(clip->x), float(clip->y),
            float(int64_t(clip->x) + clip->width), float(int64_t(clip->y) + clip->height)};
        for (int edge = 0; edge < 4; ++edge) {
            std::array<Point, 8> output{};
            size_t written = 0;
            int axis = edge % 2;
            for (size_t i = 0; i < count; ++i) {
                const auto& p = polygon[(i + count - 1) % count];
                const auto& q = polygon[i];
                const bool pin = edge < 2 ? p[axis] >= bounds[edge] : p[axis] < bounds[edge];
                const bool qin = edge < 2 ? q[axis] >= bounds[edge] : q[axis] < bounds[edge];
                if (pin != qin) {
                    const float t = (bounds[edge] - p[axis]) / (q[axis] - p[axis]);
                    Point hit{};
                    for (int j = 0; j < 4; ++j) hit[j] = p[j] + (q[j] - p[j]) * t;
                    output[written++] = hit;
                }
                if (qin) output[written++] = q;
            }
            count = written; polygon = output;
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
inline void Run(D3d12Renderer& renderer) {
    const std::array<GpuReanimKey, 2> keys{{
        {5.25f, 8.125f, -15, 23, 1.15f, .9f, .8f, 0, 1},
        {13.5f, 11.25f, 37, -18, -.75f, 1.1f, .35f, -1, 1}}};
    const std::array<GpuReanimTrack, 3> tracks{{{0, 2}, {GpuReanimNoKeys, 0}, {0, 2}}};
    const std::array<GpuReanimGeometry, 6> geometry{{
        {}, {20, 24, 0, 0, 1, 1}, {}, {28, 12, 1, 0, 0, 1}, {}, {}}};
    auto uploadKeys = keys; auto uploadGeometry = geometry;
    auto* definition = renderer.UploadReanimDefinition({tracks, uploadKeys, uploadGeometry, 2, 3});
    Check(definition != nullptr, "Experimental D3D12 resident upload disabled");
    uploadKeys = {}; uploadGeometry = {};
    const uint32_t texels[]{0xffff0000, 0xff00ff00, 0xff0000ff, 0xffffff00};
    auto* texture = renderer.CreateTexture(2, 2, texels, 8);
    const auto clear = [&] {
        const auto slot = D3d12Renderer::SlotOf(renderer.whiteTexture);
        const GpuVertex quad[]{
            {0,0,0,0,0,1,0,0,slot,0},{800,0,0,0,0,1,1,0,slot,0},{800,600,0,0,0,1,1,1,slot,0},
            {0,0,0,0,0,1,0,0,slot,0},{800,600,0,0,0,1,1,1,slot,0},{0,600,0,0,0,1,0,1,slot,0}};
        renderer.SubmitTriangles(quad, renderer.whiteTexture, false, false, GpuBlend::Opaque);
    };
    unsigned cases = 0;
    uint32_t stale = UINT32_MAX;
    const GpuClip clip{10, 10, 22, 25};
    for (uint32_t variant : {0u, 1u, 2u})
        for (float fraction : {0.f, .375f, 1.f})
            for (uint32_t flags : {0u, 1u, 2u, 3u})
                for (uint32_t sampler : {0u, 1u, 2u, 3u}) {
                    GpuReanimInstance instance{};
                    instance.after = 1; instance.variant = variant; instance.fraction = fraction;
                    instance.translateX = .25f; instance.translateY = 1.25f;
                    instance.overlay00 = 1; instance.overlay01 = .15f; instance.overlay02 = 8;
                    instance.overlay10 = -.1f; instance.overlay11 = 1; instance.overlay12 = 5;
                    GpuReanimTrackDraw draw{2, 0xc0e0d0ff};
                    draw.samplingFlags = ((cases % 4) << 28) |
                        ((cases % 3) == 0 ? GpuVertex::kIndependentColorFilter : 0u) |
                        ((cases % 5) == 0 ? GpuVertex::kAlphaEdgeFilter : 0u);
                    draw.flags = flags; draw.shakeX = -.25f; draw.shakeY = .5f;
                    const GpuClip* requested = ((cases / 4 + cases) % 2) ? &clip : nullptr;
                    const auto vertices = Reference(keys[0], keys[1], geometry[1], geometry[variant * 2 + 1],
                        instance, draw, D3d12Renderer::SlotOf(texture), sampler, requested);
                    Check(renderer.BeginScene(), "Cannot begin D3D12 reference");
                    clear();
                    renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Normal);
                    renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Additive);
                    renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Normal);
                    renderer.EndSceneAndPresent();
                    const auto expected = renderer.ReadScenePixels();
                    Check(renderer.BeginScene(), "Cannot begin D3D12 resident");
                    clear();
                    Check(!renderer.SubmitReanimTrack(stale, draw, GpuBlend::Normal), "Stale instance token survived frame");
                    const auto token = renderer.BeginReanimInstance(definition, texture, instance,
                        (sampler & 1) != 0, (sampler & 2) != 0, requested, true);
                    Check(token != UINT32_MAX, "D3D12 instance rejected");
                    auto invalid = draw; invalid.track = 1;
                    Check(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "CPU logical track lost sentinel");
                    invalid = draw; invalid.track = 3;
                    Check(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "Invalid logical track accepted");
                    invalid = draw; invalid.flags = 4;
                    Check(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "Invalid track flags accepted");
                    invalid = draw; invalid.samplingFlags = 1;
                    Check(!renderer.SubmitReanimTrack(token, invalid, GpuBlend::Normal), "Invalid sampling flags accepted");
                    Check(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "D3D12 resident track rejected");
                    renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Additive);
                    Check(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal), "D3D12 mixed track rejected");
                    stale = token;
                    renderer.EndSceneAndPresent();
                    const auto actual = renderer.ReadScenePixels();
                    for (size_t i = 0; i < actual.size(); ++i)
                        for (unsigned shift : {0u, 8u, 16u, 24u})
                            Check(std::abs(int((actual[i] >> shift) & 255) - int((expected[i] >> shift) & 255)) <= 3,
                                "D3D12 resident reference pixel mismatch");
                    ++cases;
                }
    // Begin without a successful track must leave an ordinary-only scene valid.
    Check(renderer.BeginScene(), "Cannot begin D3D12 begin-only scene"); clear();
    GpuReanimInstance instance{}; instance.overlay00 = instance.overlay11 = 1;
    auto token = renderer.BeginReanimInstance(definition, texture, instance, false, false, nullptr, true);
    Check(token != UINT32_MAX, "Begin-only instance rejected");
    renderer.DestroyReanimDefinition(definition);
    Check(!renderer.SubmitReanimTrack(token, {2, 0xffffffff}, GpuBlend::Normal), "Destroyed definition accepted");
    renderer.DestroyTexture(texture);
    renderer.EndSceneAndPresent();
    const auto black = renderer.ReadScenePixels();
    Check(std::all_of(black.begin(), black.end(), [](auto p) { return p == 0xff000000; }),
        "Begin-only scene changed ordinary output");
    // First-frame policy must reject allocation; an eligible previous batch
    // enables the next batch, and a mixed ordinary-heavy batch disables it.
    auto* policyDefinition = renderer.UploadReanimDefinition({tracks, keys, geometry, 2, 3});
    texture = renderer.CreateTexture(2, 2, texels, 8);
    // Image targets have their own output format/premultiplication PSOs. A
    // target switch invalidates tokens while retaining painter-order work.
    auto* image = renderer.CreateRenderImage(800, 600);
    std::vector<uint32_t> imageExpected;
    for (bool resident : {false, true}) {
        renderer.SetRenderImage(image);
        Check(renderer.BeginScene(), "Cannot begin resident image target"); clear();
        const auto imageToken = renderer.BeginReanimInstance(policyDefinition, texture, instance,
            false, false, nullptr, true);
        Check(imageToken != UINT32_MAX, "Image target rejected resident instance");
        GpuReanimTrackDraw draw{2, 0xc0e0d0ff};
        const auto reference = Reference(keys[0], keys[0], geometry[1], geometry[1], instance,
            draw, D3d12Renderer::SlotOf(texture), 0, nullptr);
        if (resident) Check(renderer.SubmitReanimTrack(imageToken, draw, GpuBlend::Normal), "Image target track rejected");
        else renderer.SubmitTriangles(reference, texture, false, false, GpuBlend::Normal);
        if (resident) {
            GpuReanimDraw legacy{};
            legacy.track = 2; legacy.color = draw.color;
            legacy.overlay00 = legacy.overlay11 = 1;
            legacy.translateX = legacy.translateY = -.5f;
            Check(renderer.SubmitReanim(policyDefinition, texture, legacy, false, false,
                GpuBlend::Normal, nullptr, true), "Forced legacy resident draw rejected");
        } else renderer.SubmitTriangles(reference, texture, false, false, GpuBlend::Normal);
        renderer.EndSceneAndPresent();
        const auto imagePixels = renderer.ReadTexturePixels(image).pixels;
        if (!resident) imageExpected.assign(imagePixels.begin(), imagePixels.end());
        else {
            Check(imagePixels.size() == imageExpected.size(), "Image output dimensions changed");
            for (size_t i = 0; i < imagePixels.size(); ++i)
                for (unsigned shift : {0u, 8u, 16u, 24u})
                    Check(std::abs(int((imagePixels[i] >> shift) & 255) -
                        int((imageExpected[i] >> shift) & 255)) <= 3, "Image resident output mismatch");
        }
        renderer.SetRenderImage(nullptr);
    }
    renderer.DestroyTexture(image);
    Check(renderer.BeginScene(), "Cannot begin policy seed"); clear();
    Check(!renderer.reanimFrameEligible, "Sparse prior frame enabled GPU policy");
    Check(renderer.BeginReanimInstance(policyDefinition, texture, instance, false, false) == UINT32_MAX,
        "Default policy allocated a sparse-frame packet");
    renderer.reanimPictureCandidates = 256;
    renderer.EndSceneAndPresent(); renderer.ReadScenePixels();
    Check(renderer.BeginScene(), "Cannot begin eligible policy batch"); clear();
    Check(renderer.reanimFrameEligible, "Dense prior frame did not enable GPU policy");
    token = renderer.BeginReanimInstance(policyDefinition, texture, instance, false, false);
    Check(token != UINT32_MAX, "Eligible policy rejected instance");
    Check(renderer.SubmitReanimTrack(token, {2, 0xffffffff}, GpuBlend::Normal), "Eligible policy rejected track");
    renderer.reanimPictureCandidates = 256;
    auto* switched = renderer.CreateRenderImage(8, 8);
    renderer.SetRenderImage(switched);
    Check(!renderer.SubmitReanimTrack(token, {2, 0xffffffff}, GpuBlend::Normal),
        "Target switch retained an old instance token");
    Check(renderer.reanimFrameEligible && renderer.reanimPictureCandidates == 256,
        "Internal main-batch target switch reset adaptive policy");
    renderer.SetRenderImage(nullptr);
    renderer.DestroyTexture(switched);
    // More than 256*32 ordinary triangles, with no GPU candidate double count.
    std::vector<GpuVertex> ordinary(3 * (256 * 32 + 1));
    for (auto& vertex : ordinary) vertex.slot = D3d12Renderer::SlotOf(renderer.whiteTexture);
    renderer.SubmitTriangles(ordinary, renderer.whiteTexture, false, false, GpuBlend::Opaque);
    Check(renderer.reanimPictureCandidates == 256, "Backend duplicated common candidate accounting");
    renderer.EndSceneAndPresent(); renderer.ReadScenePixels();
    Check(renderer.BeginScene(), "Cannot begin policy rejection batch"); clear();
    Check(!renderer.reanimFrameEligible, "Ordinary-heavy prior batch enabled GPU policy");
    // Forced tracks bypass only policy and retain destruction-before-fence safety.
    token = renderer.BeginReanimInstance(policyDefinition, texture, instance, false, false, nullptr, true);
    Check(renderer.SubmitReanimTrack(token, {2, 0xffffffff}, GpuBlend::Normal), "Forced track rejected");
    renderer.DestroyReanimDefinition(policyDefinition);
    renderer.DestroyTexture(texture);
    renderer.EndSceneAndPresent();
    const auto retiredPixels = renderer.ReadScenePixels();
    Check(std::any_of(retiredPixels.begin(), retiredPixels.end(), [](auto p) { return p != 0xff000000; }),
        "Destroy-before-fence discarded the resident draw");
    // Cover each resource independently, both before its first track and with
    // queued GPU work. Definitions load between scenes; replacement instances
    // and a newly created replacement texture are usable in the same scene.
    const uint32_t replacementTexels[]{0xff00ffff, 0xffff00ff, 0xffffffff, 0xff0080ff};
    for (bool destroyDefinition : {false, true})
        for (bool queued : {false, true}) {
            auto* oldDefinition = renderer.UploadReanimDefinition({tracks, keys, geometry, 2, 3});
            auto* replacementDefinition = renderer.UploadReanimDefinition({tracks, keys, geometry, 2, 3});
            auto* oldTexture = renderer.CreateTexture(2, 2, texels, 8);
            auto* expectedTexture = renderer.CreateTexture(2, 2, replacementTexels, 8);
            GpuReanimInstance oldInstance{};
            oldInstance.overlay00 = oldInstance.overlay11 = 1;
            oldInstance.translateX = 40; oldInstance.translateY = 60;
            auto replacementInstance = oldInstance; replacementInstance.translateX = 140;
            auto whiteInstance = oldInstance; whiteInstance.translateX = 240;
            const GpuReanimTrackDraw draw{2, 0xffffffff};
            const auto reference = [&](D3d12Texture* source, const GpuReanimInstance& pose) {
                const auto triangles = Reference(keys[0], keys[0], geometry[1], geometry[1],
                    pose, draw, D3d12Renderer::SlotOf(source), 0, nullptr);
                renderer.SubmitTriangles(triangles, source, false, false, GpuBlend::Normal);
            };
            Check(renderer.BeginScene(), "Cannot begin destroy-token CPU reference");
            clear();
            if (queued) reference(oldTexture, oldInstance);
            reference(expectedTexture, replacementInstance);
            reference(renderer.whiteTexture, whiteInstance);
            renderer.EndSceneAndPresent();
            const auto expected = renderer.ReadScenePixels();
            renderer.DestroyTexture(expectedTexture);
            expectedTexture = nullptr;
            Check(renderer.BeginScene(), "Cannot begin destroy-token resident scene");
            clear();
            const auto oldToken = renderer.BeginReanimInstance(oldDefinition, oldTexture,
                oldInstance, false, false, nullptr, true);
            Check(oldToken != UINT32_MAX, "Destroy-token original instance rejected");
            if (queued)
                Check(renderer.SubmitReanimTrack(oldToken, draw, GpuBlend::Normal),
                    "Destroy-token queued original track rejected");
            if (destroyDefinition) {
                renderer.DestroyReanimDefinition(oldDefinition);
                oldDefinition = nullptr;
            } else {
                renderer.DestroyTexture(oldTexture);
                oldTexture = nullptr;
            }
            Check(!renderer.SubmitReanimTrack(oldToken, draw, GpuBlend::Normal),
                "Destroyed resource retained a usable instance token");
            auto* replacementTexture = renderer.CreateTexture(2, 2, replacementTexels, 8);
            const auto replacementToken = renderer.BeginReanimInstance(replacementDefinition,
                replacementTexture, replacementInstance, false, false, nullptr, true);
            Check(replacementToken != UINT32_MAX &&
                renderer.SubmitReanimTrack(replacementToken, draw, GpuBlend::Normal),
                "Same-scene replacement instance rejected");
            Check(!renderer.SubmitReanimTrack(oldToken, draw, GpuBlend::Normal),
                "Same-scene replacement resurrected a destroyed-resource token");
            const auto whiteToken = renderer.BeginReanimInstance(replacementDefinition,
                renderer.whiteTexture, whiteInstance, false, false, nullptr, true);
            Check(whiteToken != UINT32_MAX, "White-texture lifetime instance rejected");
            bool whiteRejected = false;
            try { renderer.DestroyTexture(renderer.whiteTexture); }
            catch (const std::invalid_argument&) { whiteRejected = true; }
            Check(whiteRejected, "White texture destruction unexpectedly succeeded");
            Check(renderer.SubmitReanimTrack(whiteToken, draw, GpuBlend::Normal),
                "Failed white-texture destruction invalidated a live instance");
            Check(!renderer.SubmitReanimTrack(oldToken, draw, GpuBlend::Normal),
                "Unrelated valid instance resurrected a destroyed-resource token");
            renderer.EndSceneAndPresent();
            const auto actual = renderer.ReadScenePixels();
            Check(actual.size() == expected.size(), "Destroy-token scene dimensions changed");
            for (size_t i = 0; i < actual.size(); ++i)
                for (unsigned shift : {0u, 8u, 16u, 24u})
                    Check(std::abs(int((actual[i] >> shift) & 255) -
                        int((expected[i] >> shift) & 255)) <= 3,
                        "Resource destruction lost queued pixels or changed replacement pixels");
            renderer.DestroyReanimDefinition(oldDefinition);
            renderer.DestroyReanimDefinition(replacementDefinition);
            renderer.DestroyTexture(oldTexture);
            renderer.DestroyTexture(replacementTexture);
        }
    std::cout << "d3d12-resident-destroy-token-cases=4 queued-pixels-replacement-white-rejection=PASS\n";
    // A CPU-only definition needs no GPU keys and retains its original table.
    const GpuReanimTrack cpu{GpuReanimNoKeys, 0};
    const GpuReanimGeometry empty{};
    auto* cpuOnly = renderer.UploadReanimDefinition({{&cpu, 1}, {}, {&empty, 1}, 1, 1});
    renderer.DestroyReanimDefinition(cpuOnly);
    std::cout << "d3d12-resident-reference-cases=" << cases << " logical-indices-lifetime=PASS\n";
}
inline void ArenaStress(D3d12Renderer& renderer) {
    // Each definition exceeds 24 MiB. Three live definitions force growth
    // beyond the original 64 MiB arena; 192 replacements exceed its 4 GiB
    // address space unless retired interior ranges are actually reused.
    std::vector<GpuReanimKey> keys(512 * 1024);
    constexpr uint32_t selected = 12345;
    const std::array<GpuReanimTrack, 3> tracks{{
        {selected, 2}, {GpuReanimNoKeys, 0}, {selected, 2}}};
    const std::array<GpuReanimGeometry, 2> geometry{{{}, {32, 24, 0, 0, 1, 1}}};
    struct Live { D3d12Reanim* handle; GpuReanimKey key; };
    const auto upload = [&](unsigned seed) {
        const GpuReanimKey key{float(5 + seed % 19), 20, 0, 0, 1, 1, 1, 0, 1};
        keys[selected] = keys[selected + 1] = key;
        return Live{renderer.UploadReanimDefinition({tracks, keys, geometry, 2, 1}), key};
    };
    const uint32_t texels[]{0xffff0000, 0xff00ff00, 0xff0000ff, 0xffffff00};
    auto* texture = renderer.CreateTexture(2, 2, texels, 8);
    const auto clear = [&] {
        const auto slot = D3d12Renderer::SlotOf(renderer.whiteTexture);
        const GpuVertex quad[]{
            {0,0,0,0,0,1,0,0,slot,0},{800,0,0,0,0,1,1,0,slot,0},{800,600,0,0,0,1,1,1,slot,0},
            {0,0,0,0,0,1,0,0,slot,0},{800,600,0,0,0,1,1,1,slot,0},{0,600,0,0,0,1,0,1,slot,0}};
        renderer.SubmitTriangles(quad, renderer.whiteTexture, false, false, GpuBlend::Opaque);
    };
    const auto render = [&](std::span<const Live> live, bool resident, int retire) {
        Check(renderer.BeginScene(), "Cannot begin D3D12 arena stress scene");
        clear();
        for (size_t i = 0; i < live.size(); ++i) {
            GpuReanimInstance instance{};
            instance.after = 1; instance.fraction = .375f;
            instance.overlay00 = instance.overlay11 = 1;
            instance.translateX = float(40 + i * 90);
            GpuReanimTrackDraw draw{2, 0xffffffff};
            if (resident) {
                const auto token = renderer.BeginReanimInstance(live[i].handle, texture,
                    instance, false, false, nullptr, true);
                Check(token != UINT32_MAX, "D3D12 arena stress instance rejected");
                auto sentinel = draw; sentinel.track = 1;
                Check(!renderer.SubmitReanimTrack(token, sentinel, GpuBlend::Normal),
                    "D3D12 arena growth changed logical track indices");
                Check(renderer.SubmitReanimTrack(token, draw, GpuBlend::Normal),
                    "D3D12 arena stress track rejected");
            } else {
                const auto reference = Reference(live[i].key, live[i].key, geometry[1], geometry[1],
                    instance, draw, D3d12Renderer::SlotOf(texture), 0, nullptr);
                renderer.SubmitTriangles(reference, texture, false, false, GpuBlend::Normal);
            }
        }
        if (retire >= 0) renderer.DestroyReanimDefinition(live[size_t(retire)].handle);
        renderer.EndSceneAndPresent();
    };
    const auto compare = [&](const std::vector<uint32_t>& expected) {
        const auto actual = renderer.ReadScenePixels();
        Check(actual.size() == expected.size(), "D3D12 arena stress dimensions changed");
        for (size_t i = 0; i < actual.size(); ++i)
            for (unsigned shift : {0u, 8u, 16u, 24u})
                Check(std::abs(int((actual[i] >> shift) & 255) -
                    int((expected[i] >> shift) & 255)) <= 3,
                    "D3D12 arena growth/reclamation changed resident pixels");
    };
    std::array<Live, 3> live{{upload(0), upload(1), {}}};
    render({live.data(), 2}, false, -1);
    const auto beforeGrowth = renderer.ReadScenePixels();
    live[2] = upload(2);
    render({live.data(), 2}, true, -1);
    compare(beforeGrowth);
    for (unsigned cycle = 0; cycle < 192; ++cycle) {
        if (cycle % 32 == 0) {
            render(live, false, -1);
            const auto expected = renderer.ReadScenePixels();
            // Retire after recording a real draw, before its submission fence.
            render(live, true, 1);
            live[1] = upload(cycle + 3);
            compare(expected);
        } else {
            renderer.DestroyReanimDefinition(live[1].handle);
            live[1] = upload(cycle + 3);
        }
    }
    render(live, false, -1);
    auto expected = renderer.ReadScenePixels();
    render(live, true, -1);
    compare(expected);
    for (auto entry : live) renderer.DestroyReanimDefinition(entry.handle);
    // Adjacent ranges coalesce and the high-water tail can return to zero.
    for (unsigned cycle = 0; cycle < 4; ++cycle) {
        live = {upload(cycle + 200), upload(cycle + 201), upload(cycle + 202)};
        render(live, false, -1);
        expected = renderer.ReadScenePixels();
        render(live, true, -1);
        compare(expected);
        for (auto entry : live) renderer.DestroyReanimDefinition(entry.handle);
    }
    renderer.DestroyTexture(texture);
    std::cout << "d3d12-resident-arena-growth-old-pixels-interior-reuse-release-reload=PASS"
        " replacements=192 uploaded-bytes>4GiB\n";
}
}
#endif
