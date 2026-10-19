#define NOMINMAX
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "graphics/GpuTypes.h"
#include "graphics/ImageReadback.h"
#if defined(PVZ_COMPARE_D3D9)
#include "graphics/d3d9/D3d9Context.h"
#include "graphics/d3d9/D3d9Renderer.h"
using Context = Sexy::D3d9Context;
using Renderer = Sexy::D3d9Renderer;
using Texture = Sexy::D3d9Texture;
constexpr const char* Backend = "Direct3D9";
#elif defined(PVZ_COMPARE_GL)
#include "graphics/opengl/OpenGLContext.h"
#include "graphics/opengl/OpenGLRenderer.h"
using Context = Sexy::OpenGLContext;
using Renderer = Sexy::OpenGLRenderer;
using Texture = Sexy::OpenGLTexture;
constexpr const char* Backend = "OpenGL";
#else
#include "graphics/vulkan/VulkanContext.h"
#include "graphics/vulkan/VulkanRenderer.h"
using Context = VulkanContext;
using Renderer = Sexy::VulkanRenderer;
using Texture = Sexy::VulkanTexture;
constexpr const char* Backend = "Vulkan";
#endif
#include <algorithm>
#include <array>
#include <cstdio>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <memory>
#include <numeric>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
constexpr int Width = 320, Height = 256;
void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}
struct Window {
    HWND handle = nullptr;
    Window()
    {
        WNDCLASSW type{};
        type.style = CS_OWNDC;
        type.lpfnWndProc = DefWindowProcW;
        type.hInstance = GetModuleHandleW(nullptr);
        type.lpszClassName = L"PvzBackendComparison";
        Require(RegisterClassW(&type) != 0, "Comparison window registration");
        handle = CreateWindowW(type.lpszClassName, L"", WS_POPUP, 0, 0, Width, Height,
            nullptr, nullptr, type.hInstance, nullptr);
        Require(handle != nullptr, "Comparison hidden window creation");
    }
    ~Window() { if (handle) DestroyWindow(handle); }
};
std::array<GpuVertex, 6> Quad(Texture* texture, float x, float y, float w, float h,
    unsigned int sampler = 0, unsigned int flags = 0)
{
    const unsigned int slot = Renderer::SlotOf(texture) | flags;
    constexpr float u0 = -0.9375f, v0 = -0.8125f, u1 = 1.8125f, v1 = 1.9375f;
    return {{{x,y,1,1,1,1,u0,v0,slot,sampler}, {x+w,y,1,1,1,1,u1,v0,slot,sampler},
        {x+w,y+h,1,1,1,1,u1,v1,slot,sampler}, {x,y,1,1,1,1,u0,v0,slot,sampler},
        {x+w,y+h,1,1,1,1,u1,v1,slot,sampler}, {x,y+h,1,1,1,1,u0,v1,slot,sampler}}};
}
std::vector<unsigned int> Pattern(int width, int height)
{
    std::vector<unsigned int> pixels(size_t(width) * height);
    for (int y = 0; y < height; ++y) for (int x = 0; x < width; ++x) {
        const unsigned int alpha = (x + 2*y) % 4 == 0 ? 0 : 40 + (x*17+y*23)%216;
        pixels[size_t(y)*width+x] = alpha<<24 | ((x*37+y*13)%256)<<16 |
            ((x*11+y*41)%256)<<8 | (x*53+y*7)%256;
    }
    return pixels;
}
unsigned long long Qpc()
{
    LARGE_INTEGER value{}; QueryPerformanceCounter(&value); return value.QuadPart;
}
double CpuTime()
{
    FILETIME created{}, exited{}, kernel{}, user{};
    Require(GetProcessTimes(GetCurrentProcess(), &created, &exited, &kernel, &user), "Process times");
    const auto number = [](FILETIME time) {
        return static_cast<unsigned long long>(time.dwHighDateTime)<<32 | time.dwLowDateTime;
    };
    return (number(kernel) + number(user)) / 10000000.0;
}
void Wait(Context& context)
{
#if defined(PVZ_COMPARE_GL) || defined(PVZ_COMPARE_D3D9)
    context.WaitIdle();
#else
    context.WaitForFrame();
#endif
}
void Benchmark(Renderer& renderer, Context& context, bool standalone)
{
    std::vector<Texture*> textures;
    const int extent = standalone ? 260 : 32;
    auto pixels = Pattern(extent, extent);
    for (unsigned int i = 0; i < 16; ++i)
        textures.push_back(renderer.CreateTexture(extent, extent, pixels.data(), extent*4));
#if defined(PVZ_COMPARE_GL) || defined(PVZ_COMPARE_D3D9)
    renderer.FinishLoadingTextures();
#endif
    auto* target = renderer.CreateRenderImage(Width, Height);
    renderer.SetRenderImage(target);
    std::vector<GpuVertex> vertices;
    vertices.reserve(1024 * 6);
    for (unsigned int i = 0; i < 1024; ++i) {
        auto q = Quad(textures[i % textures.size()], float((i*7)%Width), float((i*11)%Height), 8, 8, i%4);
        vertices.insert(vertices.end(), q.begin(), q.end());
    }
    for (int frame = 0; frame < 10; ++frame) {
        renderer.BeginScene();
        renderer.SubmitTriangles(vertices, textures.front(), false, false, GpuBlend::Normal);
        renderer.EndSceneAndPresent();
        Wait(context);
    }
    LARGE_INTEGER frequency{}; QueryPerformanceFrequency(&frequency);
    std::vector<double> times;
    std::vector<double> submits;
    const double cpu = CpuTime();
    unsigned long long cycles = 0; QueryProcessCycleTime(GetCurrentProcess(), &cycles);
    const auto begin = Qpc();
    for (int frame = 0; frame < 90 || double(Qpc()-begin)/frequency.QuadPart < 3.0; ++frame) {
        const auto start = Qpc();
        renderer.BeginScene();
        renderer.SubmitTriangles(vertices, textures.front(), false, false, GpuBlend::Normal);
        submits.push_back(double(Qpc()-start)*1000/frequency.QuadPart);
        renderer.EndSceneAndPresent();
        Wait(context);
        times.push_back(double(Qpc()-start)*1000/frequency.QuadPart);
    }
    const double elapsed = double(Qpc()-begin)/frequency.QuadPart;
    unsigned long long endCycles = 0; QueryProcessCycleTime(GetCurrentProcess(), &endCycles);
    const double cpuMs = (CpuTime()-cpu)*1000/times.size();
    std::sort(times.begin(), times.end());
    std::sort(submits.begin(),submits.end());
    std::cout << "BENCH backend=" << Backend << " workload=" << (standalone?"standalone":"atlas-eligible")
        << " affinity=LP14 multiplier=unverified frames=" << times.size()
        << " quads=1024 mean_ms=" << std::accumulate(times.begin(),times.end(),0.0)/times.size()
        << " p90_ms=" << times[size_t((times.size()-1)*0.9)]
        << " prepare_submit_mean_ms=" << std::accumulate(submits.begin(),submits.end(),0.0)/submits.size()
        << " prepare_submit_p90_ms=" << submits[size_t((submits.size()-1)*0.9)]
        << " cpu_ms_per_frame=" << cpuMs << " cycles_per_frame=" << (endCycles-cycles)/times.size()
        << " elapsed_s=" << elapsed << '\n';
    renderer.SetRenderImage(nullptr); renderer.DestroyTexture(target);
    for (auto* texture : textures) renderer.DestroyTexture(texture);
}
}
int main(int argc, char** argv)
{
    try {
        Require(argc >= 3, "Usage: backend_pixel_cases output.bin shader_directory [bench]");
#if defined(PVZ_COMPARE_D3D9)
        Require(SetProcessAffinityMask(GetCurrentProcess(), argc>3 ? 0x4000 : 0x8000),
            "Cannot bind DX9 functional comparison/benchmark");
#else
        Require(SetProcessAffinityMask(GetCurrentProcess(), 0x4000), "Cannot bind comparison to LP14");
#endif
        Window window;
#if defined(PVZ_COMPARE_GL) || defined(PVZ_COMPARE_D3D9)
        Context context(window.handle, true, false);
        Renderer renderer(context, Width, Height, argv[2]);
#else
        VulkanInitConfig config;
        config.features.shaderFloat64 = VK_TRUE;
        VkSwapchainCreateInfoKHR swapchain{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};
        swapchain.imageFormat = VK_FORMAT_B8G8R8A8_UNORM;
        swapchain.imageColorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
        swapchain.imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
        swapchain.compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
        swapchain.presentMode = VK_PRESENT_MODE_FIFO_KHR;
        swapchain.clipped = VK_TRUE;
        Context context(config, window.handle, swapchain);
        const std::filesystem::path shaders(argv[2]);
        Renderer renderer(context, Width, Height, (shaders/"game_vs.spv").string(),
            (shaders/"game_ps.spv").string());
#endif
        renderer.PrepareLoadingPipelines();
        std::ofstream output(argv[1], std::ios::binary);
        Require(output.good(), "Cannot create diagnostic comparison output");
        const auto record = [&](const std::vector<unsigned int>& pixels) {
            output.write(reinterpret_cast<const char*>(pixels.data()), pixels.size()*sizeof(unsigned int));
            Require(output.good(), "Cannot write diagnostic comparison output");
        };
        const auto pixels = Pattern(7, 9);
        auto* source = renderer.CreateTexture(7,9,pixels.data(),7*4);
#if defined(PVZ_COMPARE_GL) || defined(PVZ_COMPARE_D3D9)
        renderer.FinishLoadingTextures();
#endif
        Require(renderer.BeginScene(), "Comparison scene unavailable");
        for (unsigned int filter = 0; filter < 4; ++filter)
            for (unsigned int sampling = 0; sampling < 4; ++sampling) {
                const auto q = Quad(source, float(sampling*64), float(filter*48), 64,48,
                    sampling, (filter<<28) | GpuVertex::kAlphaEdgeFilter);
                renderer.SubmitTriangles(q,source,false,false,GpuBlend::Normal);
            }
        renderer.EndSceneAndPresent(); record(renderer.ReadScenePixels());
        auto* generated = renderer.CreateRenderImage(Width,Height);
        renderer.SetRenderImage(generated); renderer.BeginScene();
        for (unsigned int independent = 0; independent < 2; ++independent)
            for (unsigned int sampling = 0; sampling < 4; ++sampling) {
                const auto q = Quad(source, float(sampling*64), float(independent*64),64,64,sampling,
                    independent ? GpuVertex::kIndependentColorFilter : 0);
                renderer.SubmitTriangles(q,source,false,false,GpuBlend::Normal);
            }
        renderer.EndSceneAndPresent(); renderer.SetRenderImage(nullptr);
        record(renderer.ReadTexturePixels(generated).pixels);
        Require(renderer.BeginScene(),"Generated image composite scene unavailable");
        auto background=Quad(renderer.whiteTexture,0,0,Width,Height);
        for(auto& vertex:background) vertex.r=vertex.g=vertex.b=0;
        renderer.SubmitTriangles(background,renderer.whiteTexture,false,false,GpuBlend::Opaque);
        auto displayed=Quad(generated,0,0,Width,Height);
        for(size_t i=0;i<displayed.size();++i) {
            displayed[i].u=(i==1 || i==2 || i==4)?1.0f:0.0f;
            displayed[i].v=(i==2 || i==4 || i==5)?1.0f:0.0f;
        }
        renderer.SubmitTriangles(displayed,generated,false,false,GpuBlend::Normal);
        renderer.EndSceneAndPresent(); record(renderer.ReadScenePixels());
        const std::array<GpuFontGlyph,4> glyphs{{
            {1,1,5,7,0,0,17,19}, {0,0,7,9,20,0,3,4},
            {2,3,1,1,30,0,8,8}, {0,0,7,9,40,0,7,9}}};
        auto* font = renderer.CreateRenderImage(Width,Height);
        renderer.SetRenderImage(font);
        Require(renderer.BeginScene(),"Font comparison image batch unavailable");
        renderer.RenderFontAtlas(font,source,glyphs,GpuVertex::kAlphaEdgeFilter,false);
        renderer.EndSceneAndPresent(); renderer.SetRenderImage(nullptr);
        record(renderer.ReadTexturePixels(font).pixels);
        renderer.DestroyTexture(font); renderer.DestroyTexture(generated); renderer.DestroyTexture(source);
        output.close();
        std::cout << "PIXELS backend=" << Backend << " cases=4 pixels=" << 4*Width*Height
            << " width=" << Width << " height=" << Height << '\n';
        if (argc > 3) {
            for (const bool standalone : {false,true}) {
#if defined(PVZ_COMPARE_GL) || defined(PVZ_COMPARE_D3D9)
                Renderer benchmark(context,Width,Height,argv[2]);
#else
                Renderer benchmark(context,Width,Height,(shaders/"game_vs.spv").string(),
                    (shaders/"game_ps.spv").string());
#endif
                benchmark.PrepareLoadingPipelines();
                Benchmark(benchmark,context,standalone);
            }
        }
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n'; return 1;
    }
}
