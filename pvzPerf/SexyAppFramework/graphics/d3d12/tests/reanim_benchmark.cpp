#ifndef NOMINMAX
#define NOMINMAX
#endif
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#include <tlhelp32.h>
#include <d3d12.h>
#include <wrl/client.h>
#include "D3d12Context.h"
#include "D3d12Renderer.h"
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <filesystem>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <string>
#include <vector>
#include "reanim_checks.h"

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    path = (std::filesystem::temp_directory_path() / name).string();
    return path.c_str();
}
}
namespace {
using namespace Sexy;
using Microsoft::WRL::ComPtr;
using Clock = std::chrono::steady_clock;
constexpr unsigned Frames = 16, Warmup = 8, Rounds = 5;
void Require(bool condition, const char* message) {
    if (!condition) throw std::runtime_error(message);
}
void CheckExternalCompilers() {
    HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    Require(snapshot != INVALID_HANDLE_VALUE, "Cannot inspect compiler contamination");
    PROCESSENTRY32W entry{};
    entry.dwSize = sizeof(entry);
    bool contaminated = false;
    if (Process32FirstW(snapshot, &entry))
        do {
            for (const wchar_t* name : {L"cl.exe", L"link.exe", L"ninja.exe", L"MSBuild.exe",
                    L"dxc.exe", L"clang.exe", L"clang-cl.exe", L"cmake.exe", L"csc.exe",
                    L"gcc.exe", L"g++.exe", L"rustc.exe"})
                if (_wcsicmp(entry.szExeFile, name) == 0) {
                    std::cerr << "INVALID compiler/build contamination pid=" << entry.th32ProcessID << '\n';
                    contaminated = true;
                }
        } while (Process32NextW(snapshot, &entry));
    CloseHandle(snapshot);
    Require(!contaminated, "INVALID benchmark timing: observed external compiler/build process");
}
struct Window {
    HWND handle{};
    Window() {
        WNDCLASSW cls{};
        cls.lpfnWndProc = DefWindowProcW;
        cls.hInstance = GetModuleHandleW(nullptr);
        cls.lpszClassName = L"PvzD3d12ReanimBenchmark";
        Require(RegisterClassW(&cls) != 0, "RegisterClassW benchmark");
        handle = CreateWindowExW(0, cls.lpszClassName, L"D3D12 reanimation benchmark",
            WS_OVERLAPPEDWINDOW, 0, 0, 800, 600, nullptr, nullptr, cls.hInstance, nullptr);
        Require(handle != nullptr, "CreateWindowExW benchmark");
    }
    ~Window() {
        if (handle) DestroyWindow(handle);
        UnregisterClassW(L"PvzD3d12ReanimBenchmark", GetModuleHandleW(nullptr));
    }
};
struct Scenario {
    const char* name;
    unsigned dense, ordinary, sparse;
    bool clipped, mixed, transitions;
};
struct Timing {
    double jobs = 0, gpu = 0;
    uint64_t accepted = 0, fallback = 0;
    std::array<bool, Frames> eligible{};
};
double Median(std::vector<double> samples) {
    std::sort(samples.begin(), samples.end());
    return samples[samples.size() / 2];
}
double Mean(const std::vector<double>& samples) {
    return std::accumulate(samples.begin(), samples.end(), 0.0) / double(samples.size());
}
void Compare(const std::vector<uint32_t>& a, const std::vector<uint32_t>& b) {
    Require(a.size() == b.size(), "Benchmark reference dimensions differ");
    for (size_t i = 0; i < a.size(); ++i)
        for (unsigned shift : {0u, 8u, 16u, 24u})
            Require(std::abs(int((a[i] >> shift) & 255) - int((b[i] >> shift) & 255)) <= 3,
                "Benchmark CPU/GPU reference pixels differ");
}
bool Run() {
    Window native;
    D3d12Context context(native.handle, false);
    UINT64 frequency{};
    Require(SUCCEEDED(context.queue->GetTimestampFrequency(&frequency)) && frequency,
        "D3D12 timestamp frequency unavailable");
    D3D12_QUERY_HEAP_DESC queryDesc{};
    queryDesc.Count = (Frames + Warmup) * 2;
    queryDesc.Type = D3D12_QUERY_HEAP_TYPE_TIMESTAMP;
    ComPtr<ID3D12QueryHeap> queries;
    Require(SUCCEEDED(context.device->CreateQueryHeap(&queryDesc, IID_PPV_ARGS(&queries))),
        "Create timestamp heap");
    D3D12_HEAP_PROPERTIES heap{};
    heap.Type = D3D12_HEAP_TYPE_READBACK;
    D3D12_RESOURCE_DESC resource{};
    resource.Dimension = D3D12_RESOURCE_DIMENSION_BUFFER;
    resource.Width = (Frames + Warmup) * 16;
    resource.Height = resource.DepthOrArraySize = resource.MipLevels = 1;
    resource.SampleDesc.Count = 1;
    resource.Layout = D3D12_TEXTURE_LAYOUT_ROW_MAJOR;
    ComPtr<ID3D12Resource> readback;
    Require(SUCCEEDED(context.device->CreateCommittedResource(&heap, D3D12_HEAP_FLAG_NONE,
        &resource, D3D12_RESOURCE_STATE_COPY_DEST, nullptr, IID_PPV_ARGS(&readback))),
        "Create timestamp readback");
    D3d12Renderer renderer(context, 800, 600, PVZ_D3D12_SHADER_DIRECTORY);
    renderer.frameTimestampQueries = queries.Get();
    renderer.frameTimestampReadback = readback.Get();
    const std::array<GpuReanimGeometry, 2> geometry{{{}, {10, 12, 0, 0, 1, 1}}};
    std::array<GpuReanimTrack, 33> tracks{};
    std::array<GpuReanimKey, 64> keys{};
    for (unsigned i = 0; i < 32; ++i) {
        tracks[i] = {i * 2, 2};
        keys[i * 2] = {float(i % 8) * 10, float(i / 8) * 10, -15, 23, 1.15f, .9f, .8f, 0, 1};
        keys[i * 2 + 1] = {float(i % 8) * 10 + 2, float(i / 8) * 10 + 1,
            37, -18, .75f, 1.1f, .35f, 0, 1};
    }
    tracks[32] = {GpuReanimNoKeys, 0};
    std::array<D3d12Reanim*, 4> definitions{};
    for (auto& definition : definitions)
        definition = renderer.UploadReanimDefinition({tracks, keys, geometry, 2, 1});
    const uint32_t texels[2][4]{{0xffff0000, 0xff00ff00, 0xff0000ff, 0xffffff00},
        {0xff20c040, 0xffe02060, 0xff8060f0, 0xffe0a020}};
    std::array<D3d12Texture*, 2> textures{};
    for (unsigned i = 0; i < textures.size(); ++i)
        textures[i] = renderer.CreateTexture(2, 2, texels[i], 8);
    const GpuClip clip{6, 6, 782, 582};
    const auto white = D3d12Renderer::SlotOf(renderer.whiteTexture);
    const GpuVertex clear[]{
        {0,0,0,0,0,1,0,0,white,0},{800,0,0,0,0,1,1,0,white,0},{800,600,0,0,0,1,1,1,white,0},
        {0,0,0,0,0,1,0,0,white,0},{800,600,0,0,0,1,1,1,white,0},{0,600,0,0,0,1,0,1,white,0}};
    const auto burst = [&](const Scenario& scenario, bool resident, bool policy,
        std::vector<std::vector<uint32_t>>* captured = nullptr) {
        Timing result;
        // Allocation and source setup are outside the CPU record sample.
        const unsigned maximum = std::max(scenario.dense, scenario.ordinary);
        std::vector<uint32_t> tokens((maximum + 31) / 32);
        std::vector<GpuReanimInstance> instances(tokens.size());
        for (unsigned frame = 0; frame < Frames + Warmup; ++frame) {
            // Drain first so the snapshot is outside both CPU record samples
            // and any executing GPU timestamp interval. Sampling cannot detect
            // a process that starts and exits entirely between snapshots.
            context.WaitIdle();
            CheckExternalCompilers();
            renderer.frameTimestampPair = frame;
            Require(renderer.BeginScene(), "Cannot begin D3D12 benchmark frame");
            const auto start = Clock::now(); // Begin's previous-fence wait excluded.
            renderer.SubmitTriangles(clear, renderer.whiteTexture, false, false, GpuBlend::Opaque);
            const bool sparse = scenario.transitions ? (frame % 16 >= 8) : scenario.sparse != 0;
            const unsigned candidates = sparse ? scenario.sparse : scenario.dense;
            const unsigned ordinary = sparse ? scenario.ordinary : 0;
            const unsigned groups = (candidates + 31) / 32;
            for (unsigned group = 0; group < groups; ++group) {
                auto& instance = instances[group];
                instance = {};
                instance.after = 1; instance.fraction = float(frame % 31) / 31;
                instance.overlay00 = instance.overlay11 = 1;
                instance.overlay02 = float(group % 8) * 96 + 20;
                instance.overlay12 = float((group / 8) % 12) * 44 + 20;
                tokens[group] = resident ? renderer.BeginReanimInstance(definitions[group % 4],
                    textures[group % 2], instance, false, false, scenario.clipped ? &clip : nullptr,
                    !policy) : UINT32_MAX;
            }
            const auto emitReanim = [&](unsigned i) {
                const unsigned group = i / 32, track = i % 32;
                auto* texture = textures[group % 2];
                GpuReanimTrackDraw draw{track, 0xc0e0d0ff};
                draw.shakeX = .25f; draw.shakeY = -.125f;
                ++renderer.reanimPictureCandidates;
                const bool accepted = resident && tokens[group] != UINT32_MAX;
                if (accepted) Require(renderer.SubmitReanimTrack(tokens[group], draw, GpuBlend::Normal),
                    "Benchmark resident track rejected");
                else {
                    const auto vertices = D3d12ReanimTest::Reference(keys[track * 2], keys[track * 2 + 1],
                        geometry[1], geometry[1], instances[group], draw, D3d12Renderer::SlotOf(texture),
                        0, scenario.clipped ? &clip : nullptr);
                    renderer.SubmitTriangles(vertices, texture, false, false, GpuBlend::Normal);
                }
                if (frame >= Warmup && resident) {
                    if (accepted) ++result.accepted;
                    else ++result.fallback;
                }
            };
            const auto emitSprite = [&](unsigned i) {
                const float x = float(i % 64) * 12 + 4, y = float((i / 64) % 48) * 12 + 4;
                const auto slot = D3d12Renderer::SlotOf(textures[i % 2]);
                const GpuVertex sprite[]{
                    {x,y,1,1,1,.5f,0,0,slot,0},{x,y+12,1,1,1,.5f,0,1,slot,0},{x+10,y,1,1,1,.5f,1,0,slot,0},
                    {x,y+12,1,1,1,.5f,0,1,slot,0},{x+10,y,1,1,1,.5f,1,0,slot,0},{x+10,y+12,1,1,1,.5f,1,1,slot,0}};
                renderer.SubmitTriangles(sprite, textures[i % 2], false, false, GpuBlend::Normal);
            };
            if (ordinary) {
                unsigned emitted = 0;
                for (unsigned i = 0; i < ordinary; ++i) {
                    if (emitted < candidates && i == uint64_t(emitted) * ordinary / candidates)
                        emitReanim(emitted++);
                    emitSprite(i);
                }
                Require(emitted == candidates, "Sparse benchmark omitted a candidate");
            } else for (unsigned i = 0; i < candidates; ++i) {
                emitReanim(i);
                if (scenario.mixed && i % 32 == 31) emitSprite(i);
            }
            renderer.EndSceneAndPresent();
            if (frame >= Warmup) {
                result.jobs += std::chrono::duration<double, std::micro>(renderer.frameRecordEnd - start).count();
                result.eligible[frame - Warmup] = renderer.reanimFrameEligible;
            }
            if (captured && (frame == 8 || frame == 15 || frame == 16 || frame == 23))
                captured->push_back(renderer.ReadScenePixels());
        }
        context.WaitIdle();
        CheckExternalCompilers();
        // Scalar query collection and correctness pixels are outside CPU samples.
        uint64_t* ticks{};
        const D3D12_RANGE range{0, size_t(resource.Width)};
        Require(SUCCEEDED(readback->Map(0, &range, reinterpret_cast<void**>(&ticks))), "Map timestamp scalar results");
        for (unsigned frame = Warmup; frame < Frames + Warmup; ++frame) {
            Require(ticks[frame * 2 + 1] > ticks[frame * 2], "GPU timestamp query is empty or reversed");
            result.gpu += double(ticks[frame * 2 + 1] - ticks[frame * 2]) * 1e6 / double(frequency);
        }
        const D3D12_RANGE written{0, 0};
        readback->Unmap(0, &written);
        result.jobs /= Frames; result.gpu /= Frames;
        if (resident && policy && scenario.transitions)
            for (unsigned frame = 0; frame < Frames; ++frame)
                Require(result.eligible[frame] == (frame == 0 || frame >= 9),
                    "Adaptive transition policy did not follow the prior completed batch");
        return result;
    };
    std::cout << "adapter=" << context.adapterDescription << " timestampFrequency=" << frequency
        << " frames=" << Frames << " warmup=" << Warmup << " rounds=" << Rounds << '\n'
        << "CPU us=actual transform/classification/API record through final Flush+present-quad, excludes Begin fence/WSI Present; "
        << "GPU us=scene+present-quad command timestamps, excludes CPU classification and WSI Present wait; "
        << "no vertex/image readback in timed burst; correctness image readback follows each route; "
        << "compiler monitoring=frame-boundary snapshots after GPU drain, short processes may be missed.\n";
    std::vector<Scenario> scenarios;
    for (unsigned count : {512u, 2048u, 8192u})
        for (bool clipped : {false, true}) {
            scenarios.push_back({"dense", count, 0, 0, clipped, false, false});
            scenarios.push_back({"mixed", count, 0, 0, clipped, true, false});
        }
    for (unsigned visible : {1u, 16u, 64u})
        for (unsigned sprites : {2048u, 8192u}) {
            scenarios.push_back({"sparse", 0, sprites, visible, false, false, false});
            scenarios.push_back({"transitions", 2048, sprites, visible, false, false, true});
        }
    unsigned actualCases = 0, medianPassed = 0, meanPassed = 0, fallbackCases = 0;
    for (const auto& scenario : scenarios)
        for (bool policy : {false, true}) {
            std::vector<double> cpuRecord, gpuRecord, cpuGpu, gpuGpu;
            uint64_t accepted = 0, fallback = 0;
            for (unsigned round = 0; round < Rounds; ++round) {
                Timing cpu, gpu;
                std::vector<uint32_t> expected, actual;
                if (round % 2 == 0) {
                    cpu = burst(scenario, false, policy); expected = renderer.ReadScenePixels();
                    gpu = burst(scenario, true, policy); actual = renderer.ReadScenePixels();
                } else {
                    gpu = burst(scenario, true, policy); actual = renderer.ReadScenePixels();
                    cpu = burst(scenario, false, policy); expected = renderer.ReadScenePixels();
                }
                Compare(expected, actual);
                cpuRecord.push_back(cpu.jobs); gpuRecord.push_back(gpu.jobs);
                cpuGpu.push_back(cpu.gpu); gpuGpu.push_back(gpu.gpu);
                accepted += gpu.accepted; fallback += gpu.fallback;
                if (policy && scenario.sparse && !scenario.transitions)
                    Require(gpu.accepted == 0 && gpu.fallback > 0, "Sparse policy did not stay on CPU");
                if (policy && scenario.transitions)
                    Require(gpu.accepted > 0 && gpu.fallback > 0, "Transition policy did not exercise both routes");
            }
            if (scenario.transitions) {
                // Separate untimed oracle sequence samples both sides of each
                // policy boundary, including the one-frame decision lag.
                std::vector<std::vector<uint32_t>> expected, actual;
                burst(scenario, false, policy, &expected);
                burst(scenario, true, policy, &actual);
                Require(expected.size() == 4 && actual.size() == 4, "Transition oracle frames missing");
                for (size_t frame = 0; frame < expected.size(); ++frame) Compare(expected[frame], actual[frame]);
            }
            const bool cpuFallback = accepted == 0 && fallback > 0;
            const double saved = Median(cpuRecord) - Median(gpuRecord);
            const double added = Median(gpuGpu) - Median(cpuGpu);
            const double savedMean = Mean(cpuRecord) - Mean(gpuRecord);
            const double addedMean = Mean(gpuGpu) - Mean(cpuGpu);
            const bool gate = saved > std::max(0.0, added);
            const bool meanGate = savedMean > std::max(0.0, addedMean);
            if (cpuFallback) ++fallbackCases;
            else {
                ++actualCases;
                if (gate) ++medianPassed;
                if (meanGate) ++meanPassed;
            }
            std::cout << std::fixed << std::setprecision(3)
                << "mode=" << scenario.name << " dense=" << scenario.dense << " ordinary=" << scenario.ordinary
                << " sparse=" << scenario.sparse << " clip=" << scenario.clipped << " policy=" << policy
                << " cpuRecordUs=" << Median(cpuRecord) << " residentRecordUs=" << Median(gpuRecord)
                << " cpuGpuUs=" << Median(cpuGpu) << " residentGpuUs=" << Median(gpuGpu)
                << " recordRatio=" << Median(gpuRecord) / Median(cpuRecord)
                << " gpuRatio=" << Median(gpuGpu) / Median(cpuGpu)
                << " cpuSavedUs=" << saved << " gpuAddedUs=" << added
                << " meanCpuRecordUs=" << Mean(cpuRecord) << " meanResidentRecordUs=" << Mean(gpuRecord)
                << " meanCpuGpuUs=" << Mean(cpuGpu) << " meanResidentGpuUs=" << Mean(gpuGpu)
                << " meanCpuSavedUs=" << savedMean << " meanGpuAddedUs=" << addedMean
                << " gate=" << (cpuFallback ? "CPU_FALLBACK" : gate ? "PASS" : "FAIL")
                << " meanGate=" << (cpuFallback ? "CPU_FALLBACK" : meanGate ? "PASS" : "FAIL")
                << " accepted=" << accepted << " fallback=" << fallback << " pixels=PASS\n";
        }
    renderer.frameTimestampQueries = nullptr;
    renderer.frameTimestampReadback = nullptr;
    for (auto* definition : definitions) renderer.DestroyReanimDefinition(definition);
    for (auto* texture : textures) renderer.DestroyTexture(texture);
    const bool performance = actualCases > 0 && medianPassed == actualCases && meanPassed == actualCases;
    std::cout << "d3d12-benchmark functional=PASS actualCases=" << actualCases
        << " medianPassed=" << medianPassed << " medianFailed=" << actualCases - medianPassed
        << " meanPassed=" << meanPassed << " meanFailed=" << actualCases - meanPassed
        << " cpuFallbackCases=" << fallbackCases << " performance=" << (performance ? "PASS" : "FAIL") << '\n';
    return performance;
}
}
int main() {
    try { return Run() ? 0 : 2; }
    catch (const std::exception& error) { std::cerr << "D3D12 benchmark failed: " << error.what() << '\n'; return 1; }
}
