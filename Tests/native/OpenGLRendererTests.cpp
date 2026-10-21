#ifndef NOMINMAX
#define NOMINMAX
#endif
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#if defined(PVZ_TEST_D3D9)
#include "graphics/d3d9/D3d9Context.h"
#include "graphics/d3d9/D3d9Renderer.h"
#include "graphics/d3d9/D3d9Shaders.h"
namespace Sexy {
using OpenGLContext = D3d9Context;
using OpenGLRenderer = D3d9Renderer;
using OpenGLTexture = D3d9Texture;
using OpenGLScaleStep = D3d9ScaleStep;
}
#else
#include "graphics/opengl/OpenGLApi.h"
#include "graphics/opengl/OpenGLContext.h"
#include "graphics/opengl/OpenGLRenderer.h"
#include "graphics/opengl/OpenGLShaders.h"
#endif
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
using namespace Sexy;
constexpr int SceneW = 320, SceneH = 280;
#if defined(PVZ_TEST_D3D9)
constexpr const char* AtlasSizeVariable = "PVZ_D3D9_ATLAS_SIZE";
#else
constexpr const char* AtlasSizeVariable = "PVZ_GL_ATLAS_SIZE";
#endif
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
class Window {
public:
    HWND hwnd{};
    Window()
    {
        WNDCLASSW cls{};
        cls.style = CS_OWNDC;
        cls.lpfnWndProc = DefWindowProcW;
        cls.hInstance = GetModuleHandleW(nullptr);
        cls.lpszClassName = L"PvzOpenGLSemanticTests";
        Require(RegisterClassW(&cls) != 0, "RegisterClassW");
        hwnd = CreateWindowExW(0, cls.lpszClassName, L"OpenGL hidden tests",
            WS_POPUP, 0, 0, SceneW, SceneH, nullptr, nullptr, cls.hInstance, nullptr);
        Require(hwnd != nullptr, "CreateWindowExW");
    }
    ~Window()
    {
        if (hwnd) DestroyWindow(hwnd);
        UnregisterClassW(L"PvzOpenGLSemanticTests", GetModuleHandleW(nullptr));
    }
    void Resize(int w, int h)
    {
        Require(SetWindowPos(hwnd, nullptr, 0, 0, w, h,
            SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE) != FALSE, "SetWindowPos");
    }
};
// Restore the caller's setting; a fresh renderer must see the test atlas size.
class SmallAtlas {
    std::string previous_;
    bool existed_{};
public:
    SmallAtlas()
    {
        const char* previous = std::getenv(AtlasSizeVariable);
        existed_ = previous != nullptr;
        if (previous) previous_ = previous;
        // The backend uses getenv: update the CRT environment as well as Win32.
        Require(_putenv_s(AtlasSizeVariable, "64") == 0, "Cannot force small atlas");
    }
    ~SmallAtlas()
    {
        _putenv_s(AtlasSizeVariable, existed_ ? previous_.c_str() : "");
    }
};
using QuadVertices = std::array<GpuVertex, 6>;
QuadVertices Quad(OpenGLTexture* texture, float x, float y, float w, float h,
    float u0 = 0, float v0 = 0, float u1 = 1, float v1 = 1)
{
    const auto slot = OpenGLRenderer::SlotOf(texture);
    return {{{x,y,1,1,1,1,u0,v0,slot,0}, {x+w,y,1,1,1,1,u1,v0,slot,0},
        {x+w,y+h,1,1,1,1,u1,v1,slot,0}, {x,y,1,1,1,1,u0,v0,slot,0},
        {x+w,y+h,1,1,1,1,u1,v1,slot,0}, {x,y+h,1,1,1,1,u0,v1,slot,0}}};
}
void Draw(OpenGLRenderer& r, OpenGLTexture* t, QuadVertices q,
    bool linear = false, bool wrap = false, GpuBlend blend = GpuBlend::Opaque)
{
    for (auto& v : q) v.sampler = (linear ? 1u : 0u) | (wrap ? 2u : 0u);
    r.SubmitTriangles(q, t, linear, wrap, blend);
}
void Pixel(const std::vector<unsigned int>& pixels, int width, int x, int y,
    unsigned int expected, int tolerance = 0)
{
    const auto actual = pixels.at(size_t(y) * width + x);
    for (unsigned int shift = 0; shift < 32; shift += 8) {
        if (std::abs(int((actual >> shift) & 255) - int((expected >> shift) & 255)) > tolerance) {
            std::cerr << "pixel " << x << ',' << y << " actual=0x" << std::hex
                << actual << " expected=0x" << expected << std::dec << '\n';
            throw std::runtime_error("Pixel mismatch");
        }
    }
}
std::vector<unsigned int> Pattern(int w, int h)
{
    std::vector<unsigned int> p(size_t(w) * h);
    for (int y = 0; y < h; ++y) for (int x = 0; x < w; ++x)
        p[size_t(y)*w+x] = 0xff000000u | (((x*53+y*17+3)&255u)<<16) |
            (((x*11+y*71+29)&255u)<<8) | ((x*97+y*7+101)&255u);
    return p;
}
unsigned int Sample(const std::vector<unsigned int>& p, int w, int h,
    double u, double v, bool linear, bool repeat)
{
    // Wrap each tap in logical image coordinates, before atlas placement.
    const auto address = [repeat](int i, int extent) {
        return repeat ? (i % extent + extent) % extent : std::clamp(i, 0, extent-1);
    };
    const auto tap = [&](int x, int y) { return p[size_t(address(y,h))*w+address(x,w)]; };
    if (!linear) return tap(int(std::floor(u*w)), int(std::floor(v*h)));
    const double sx = u*w-0.5, sy = v*h-0.5;
    const int x = int(std::floor(sx)), y = int(std::floor(sy));
    const double fx = sx-x, fy = sy-y;
    const std::array<unsigned int,4> taps{tap(x,y),tap(x+1,y),tap(x,y+1),tap(x+1,y+1)};
    unsigned int result = 0;
    for (unsigned int shift = 0; shift < 32; shift += 8) {
        const auto c = [shift](unsigned int value) { return double((value>>shift)&255u); };
        const double top = c(taps[0])*(1-fx)+c(taps[1])*fx;
        const double bottom = c(taps[2])*(1-fx)+c(taps[3])*fx;
        result |= unsigned(std::lround(top*(1-fy)+bottom*fy)) << shift;
    }
    return result;
}
#if !defined(PVZ_TEST_D3D9)
void CompileShaders()
{
    const auto compile = [](GLenum kind, std::string_view source) {
        Require(source.starts_with("#version 130"), "Shader is not GLSL 130");
        const auto shader = GL3::glCreateShader(kind);
        const char* text = source.data();
        const GLint length = GLint(source.size());
        GL3::glShaderSource(shader, 1, &text, &length);
        GL3::glCompileShader(shader);
        GLint ok = 0;
        GL3::glGetShaderiv(shader, GL_COMPILE_STATUS, &ok);
        if (!ok) {
            std::array<char,8192> log{};
            GL3::glGetShaderInfoLog(shader, GLsizei(log.size()), nullptr, log.data());
            GL3::glDeleteShader(shader);
            throw std::runtime_error(std::string("GLSL compile: ")+log.data());
        }
        return shader;
    };
    const std::array pairs{
        std::pair{GL3::SceneVertexShader(), GL3::SceneFragmentShader()},
        std::pair{GL3::QuadVertexShader(), GL3::ImageFragmentShader()},
        std::pair{GL3::QuadVertexShader(), GL3::FontFragmentShader()},
        std::pair{GL3::QuadVertexShader(), GL3::PresentFragmentShader()}};
    for (const auto& [vs,fs] : pairs) {
        const GLuint vertex = compile(GL_VERTEX_SHADER, vs);
        GLuint fragment{};
        try { fragment = compile(GL_FRAGMENT_SHADER, fs); }
        catch (...) { GL3::glDeleteShader(vertex); throw; }
        const auto program = GL3::glCreateProgram();
        GL3::glAttachShader(program, vertex);
        GL3::glAttachShader(program, fragment);
        GL3::glLinkProgram(program);
        GLint ok = 0;
        std::array<char,8192> log{};
        GL3::glGetProgramiv(program, GL_LINK_STATUS, &ok);
        if (!ok) GL3::glGetProgramInfoLog(program, GLsizei(log.size()), nullptr, log.data());
        GL3::glDeleteProgram(program);
        GL3::glDeleteShader(vertex);
        GL3::glDeleteShader(fragment);
        if (!ok) throw std::runtime_error(std::string("GLSL link: ")+log.data());
    }
}
#endif
void AtlasSampling(OpenGLRenderer& r)
{
    // 24 * 23 * 19 exceeds two 64x64 pages even without gutters.
    std::vector<OpenGLTexture*> textures;
    for (unsigned int i = 0; i < 24; ++i) {
        std::vector<unsigned int> p(23*19, 0xff000000u | (i+1)*0x050307u);
        textures.push_back(r.CreateTexture(23,19,p.data(),23*4));
    }
    const auto small = Pattern(3,5), large = Pattern(79,67);
    // Include row padding and overwrite the upload buffer before readback.
    std::vector<unsigned int> pitched(5*4, 0xffdeadbeu);
    for (int y=0; y<5; ++y) std::copy_n(small.begin()+y*3,3,pitched.begin()+y*4);
    auto* a = r.CreateTexture(3,5,pitched.data(),16);
    std::fill(pitched.begin(),pitched.end(),0);
    auto* b = r.CreateTexture(79,67,large.data(),79*4);
    r.FinishLoadingTextures();
    const auto atlas=r.GetAtlasCounts();
    Require(atlas.pages>=3 && atlas.images>=25 && atlas.capacity>=atlas.pixels,
        "Small textures did not populate multiple packed pages");
    std::cout<<"atlas pages="<<atlas.pages<<" images="<<atlas.images
        <<" occupied_pixels="<<atlas.pixels<<" page_pixels="<<atlas.capacity<<'\n';
    const auto snapshot = r.ReadTexturePixels(a);
    Require(snapshot.width==3 && snapshot.height==5 && snapshot.pixels==small,
        "Pitched NPOT upload lost its snapshot");
    const auto standalone = r.ReadTexturePixels(b);
    Require(standalone.width==79 && standalone.height==67 && standalone.pixels==large,
        "Large standalone NPOT upload mismatch");
    Require(r.BeginScene(), "Begin atlas scene");
    // One submission with A/B/A page changes must preserve primitive order.
    std::vector<GpuVertex> mixed;
    for (int i=0; i<24; ++i) {
        auto q = Quad(textures[i],float(i*2),0,2,2);
        mixed.insert(mixed.end(),q.begin(),q.end());
    }
    r.SubmitTriangles(mixed,textures.front(),false,false,GpuBlend::Opaque);
    for (int image=0; image<2; ++image) for (int mode=0; mode<4; ++mode)
        Draw(r,image?b:a,Quad(image?b:a,float(mode*64),float(8+image*64),64,48,
            -1.25f,-0.75f,2.25f,1.75f),mode&1,mode&2);
    r.EndSceneAndPresent();
    const auto pixels = r.ReadScenePixels();
    for (int i=0; i<24; ++i) Pixel(pixels,SceneW,i*2,0,0xff000000u|(i+1)*0x050307u);
    for (int image=0; image<2; ++image) for (int mode=0; mode<4; ++mode)
        for (int y=0; y<48; ++y) for (int x=0; x<64; ++x) {
            const double u = -1.25+(x+0.5)*3.5/64;
            const double v = -0.75+(y+0.5)*2.5/48;
            Pixel(pixels,SceneW,mode*64+x,8+image*64+y,
                Sample(image?large:small,image?79:3,image?67:5,u,v,mode&1,mode&2),1);
        }
    for (auto* t : textures) r.DestroyTexture(t);
    r.DestroyTexture(a); r.DestroyTexture(b);
}
void AtlasVersusStandalone(OpenGLRenderer& r)
{
    auto pixels=Pattern(7,9);
    for(size_t i=0;i<pixels.size();i+=3) pixels[i]&=0x00ffffffu;
    auto* standalone=r.CreateTexture(7,9,pixels.data(),28);
    standalone=r.ReplaceTexture(standalone,7,9,pixels.data(),28);
    auto* packed=r.CreateTexture(7,9,pixels.data(),28);
    r.FinishLoadingTextures();
    Require(r.GetAtlasCounts().images==2,"Comparison did not separate atlas and standalone images");
    const auto render=[&](OpenGLTexture* texture) {
        Require(r.BeginScene(),"Atlas equivalence scene unavailable");
        auto background=Quad(r.whiteTexture,0,0,SceneW,SceneH);
        for(auto& vertex:background) vertex.r=vertex.g=vertex.b=0;
        Draw(r,r.whiteTexture,background);
        for(unsigned int filter=0;filter<4;++filter)
            for(unsigned int mode=0;mode<4;++mode) {
                auto q=Quad(texture,float(mode*64),float(filter*48),64,48,
                    -1.25f,-0.75f,2.25f,1.75f);
                for(auto& vertex:q) vertex.slot|=GpuVertex::kAlphaEdgeFilter|(filter<<28);
                Draw(r,texture,q,mode&1,mode&2,GpuBlend::Normal);
            }
        r.EndSceneAndPresent();
        return r.ReadScenePixels();
    };
    const auto original=render(standalone);
    const auto atlas=render(packed);
    Require(original==atlas,"Packing changed logical-image filtering or edge semantics");
    r.DestroyTexture(standalone);r.DestroyTexture(packed);
}
struct GroupedImages {
    // A sorts after shared; B and particle sort before it, moving the copy rectangle.
    static constexpr std::array<int,4> Widths{16,8,24,16};
    static constexpr std::array<int,4> Heights{8,8,16,16};
    static constexpr std::array<unsigned int,4> Offsets{0,2,4,6};
    static constexpr std::array<unsigned int,6> Symbols{1,2,1,3,1,4};
    std::array<std::vector<unsigned int>,4> pixels;
    std::array<OpenGLTexture*,4> textures{};
    std::array<unsigned int,4> slots{};

    explicit GroupedImages(OpenGLRenderer& r)
    {
        r.ReserveStaticTextureSlots(32);
        for(size_t i=0;i<textures.size();++i) {
            pixels[i]=Pattern(Widths[i],Heights[i]);
            for(size_t j=0;j<pixels[i].size();++j) {
                pixels[i][j]^=static_cast<unsigned int>(i+1)*0x00132749u;
                if(j%3==0) pixels[i][j]&=0x00ffffffu;
            }
            textures[i]=r.CreateTextureStatic(Widths[i],Heights[i],pixels[i].data(),
                Widths[i]*4,false,static_cast<unsigned int>(i+1));
            slots[i]=OpenGLRenderer::SlotOf(textures[i]);
        }
    }
    void CheckOriginals(OpenGLRenderer& r) const
    {
        for(size_t i=0;i<textures.size();++i) {
            Require(OpenGLRenderer::SlotOf(textures[i])==slots[i],
                "Grouped packing changed a stable static slot");
            const auto original=r.ReadTexturePixels(textures[i]);
            Require(original.width==Widths[i] && original.height==Heights[i] &&
                original.pixels==pixels[i],"Grouped canonical image changed pixels");
        }
    }
    void Finish(OpenGLRenderer& r) const
    {
        CheckOriginals(r);
        r.FinishLoadingTextures(Offsets,Symbols,2);
        const auto counts=r.GetAtlasCounts();
        Require(counts.reanimationPages==2 && counts.particlePages==1,
            "Each reanimation/particle definition must have its own page");
        Require(counts.pages>=3 && (counts.images==4 || counts.images==5) && counts.copies>=6,
            "Grouped atlas is missing pages, logical images or physical copies");
        // Any ungrouped image (including white) contributes one physical copy.
        Require(counts.copies-counts.images==2 &&
            counts.copies-(counts.images-4)==6,
            "Four grouped logical images must occupy six physical copies");
        CheckOriginals(r);
    }
    void Destroy(OpenGLRenderer& r) const
    {
        for(auto* texture:textures) r.DestroyTexture(texture);
    }
};
void ClearGroupedScene(OpenGLRenderer& r)
{
    Require(r.BeginScene(),"Begin grouped background scene");
    auto background=Quad(r.whiteTexture,0,0,SceneW,SceneH);
    for(auto& vertex:background) vertex.r=vertex.g=vertex.b=0;
    Draw(r,r.whiteTexture,background);
    r.EndSceneAndPresent();
    Require(r.GetResourceCounts().queuedBatches==0,
        "Completed background scene retained pending batches");
}
void GroupedAtlasBatches(OpenGLRenderer& r)
{
    GroupedImages images(r);
    images.Finish(r);
    ClearGroupedScene(r);
    Require(r.BeginScene(),"Begin grouped batch scene");
    const std::array<size_t,8> order{1,0,1,2,0,2,3,0};
    for(size_t i=0;i<order.size();++i) {
        const auto pending=r.GetResourceCounts().queuedBatches;
        r.SetRenderImage(nullptr); // DDImage selects its destination before every draw.
        Require(r.GetResourceCounts().queuedBatches==pending,
            "Selecting the same main target flushed grouped batches");
        const auto image=order[i];
        auto* texture=images.textures[image];
        Draw(r,texture,Quad(texture,float(i*32),0,
            float(GroupedImages::Widths[image]),float(GroupedImages::Heights[image])));
        const size_t expected=i<3 ? 1 : i<6 ? 2 : 3;
        Require(r.GetResourceCounts().queuedBatches==expected,
            "Shared image did not use the current page copy for batching");
    }
    Require(r.GetResourceCounts().queuedBatches==3,
        "A/shared/A, B/shared/B, particle/shared must queue exactly three batches");
    r.EndSceneAndPresent();
    Require(r.GetResourceCounts().queuedBatches==0,
        "Presented grouped batches were not drained");
    const auto result=r.ReadScenePixels();
    for(size_t i=0;i<order.size();++i)
        for(int y=0;y<GroupedImages::Heights[order[i]];++y)
            for(int x=0;x<GroupedImages::Widths[order[i]];++x)
                Pixel(result,SceneW,int(i)*32+x,y,
                    images.pixels[order[i]][size_t(y)*GroupedImages::Widths[order[i]]+x]);
    images.CheckOriginals(r);
    images.Destroy(r);
}
void RepeatedTargetSelection(OpenGLRenderer& r)
{
    auto* image=r.CreateRenderImage(8,1);
    for(auto* target:{static_cast<OpenGLTexture*>(nullptr),image}) {
        r.SetRenderImage(target);
        Require(r.BeginScene(),"Begin repeated target selection scene");
        for(int x=0;x<8;++x) {
            const auto pending=r.GetResourceCounts().queuedBatches;
            r.SetRenderImage(target);
            Require(r.GetResourceCounts().queuedBatches==pending && r.sceneOpen,
                "Repeated destination selection flushed or closed the active scene");
            auto q=Quad(r.whiteTexture,float(x),0,1,1);
            for(auto& vertex:q){vertex.r=1;vertex.g=float(x&1);vertex.b=0;}
            Draw(r,r.whiteTexture,q);
            Require(r.GetResourceCounts().queuedBatches==1,
                "Same-target sprite draws did not accumulate into one batch");
        }
        r.EndSceneAndPresent();
        r.SetRenderImage(nullptr);
        const auto pixels=target?r.ReadTexturePixels(target).pixels:r.ReadScenePixels();
        for(int x=0;x<8;++x)
            Pixel(pixels,target?8:SceneW,x,0,(x&1)?0xffffff00U:0xffff0000U);
    }
    r.DestroyTexture(image);
}
void GroupedAtlasDistinctRectangles(OpenGLRenderer& r)
{
    r.ReserveStaticTextureSlots(16);
    const std::array<std::array<int,2>,4> sizes{{{7,9},{5,4},{24,16},{16,16}}};
    std::array<OpenGLTexture*,4> images{};
    for(size_t i=0;i<images.size();++i) {
        const auto pixels=Pattern(sizes[i][0],sizes[i][1]);
        images[i]=r.CreateTextureStatic(sizes[i][0],sizes[i][1],pixels.data(),
            sizes[i][0]*4,false,static_cast<unsigned int>(i+1));
    }
    const auto capture=[&](bool packed,unsigned int sampler) {
        ClearGroupedScene(r);
        Require(r.BeginScene(),"Begin different-layout grouped scene");
        for(size_t group=0;group<3;++group) {
            auto* anchor=images[group+1];
            Draw(r,anchor,Quad(anchor,280,200+float(group)*16,16,8),
                sampler&1U,sampler&2U,GpuBlend::Normal);
            auto q=Quad(images[0],float(group)*80,0,72,64,-0.75f,-0.5f,1.75f,1.5f);
            for(auto& vertex:q)vertex.slot|=GpuVertex::kAlphaEdgeFilter;
            Draw(r,images[0],q,sampler&1U,sampler&2U,GpuBlend::Normal);
            if(packed)Require(r.GetResourceCounts().queuedBatches==group+1,
                "Shared image used a canonical rectangle instead of the current page rectangle");
        }
        r.EndSceneAndPresent();
        return r.ReadScenePixels();
    };
    std::array<std::vector<unsigned int>,4> original;
    for(unsigned int sampler=0;sampler<4;++sampler)original[sampler]=capture(false,sampler);
    r.FinishLoadingTextures(GroupedImages::Offsets,GroupedImages::Symbols,2);
    for(unsigned int sampler=0;sampler<4;++sampler)
        Require(capture(true,sampler)==original[sampler],
            "Different physical rectangles changed a shared image's sampling");
    for(auto* image:images)r.DestroyTexture(image);
}
void GroupedAtlasSampling(OpenGLRenderer& r)
{
    GroupedImages images(r);
    // Exercise shared on all three pages, then each unique image's canonical page.
    const std::array<std::pair<size_t,size_t>,6> cases{
        std::pair<size_t,size_t>{1,0},{2,0},{3,0},{1,1},{2,2},{3,3}};
    const auto render=[&](size_t anchor,size_t image,bool packed) {
        ClearGroupedScene(r);
        Require(r.BeginScene(),"Begin grouped sampler equivalence scene");
        auto* unique=images.textures[anchor];
        Draw(r,unique,Quad(unique,300,260,16,8),false,false,GpuBlend::Normal);
        auto* texture=images.textures[image];
        for(unsigned int filter=0;filter<4;++filter)
            for(unsigned int mode=0;mode<4;++mode) {
                auto q=Quad(texture,float(mode*64),float(filter*48),64,48,
                    -1.25f,-0.75f,2.25f,1.75f);
                for(auto& vertex:q) vertex.slot|=GpuVertex::kAlphaEdgeFilter|(filter<<28);
                Draw(r,texture,q,mode&1,mode&2,GpuBlend::Normal);
            }
        if(packed)
            Require(r.GetResourceCounts().queuedBatches==1,
                "Sampler comparison did not sample the anchor page copy");
        r.EndSceneAndPresent();
        return r.ReadScenePixels();
    };
    std::array<std::vector<unsigned int>,cases.size()> standalone;
    for(size_t i=0;i<cases.size();++i)
        standalone[i]=render(cases[i].first,cases[i].second,false);
    images.Finish(r);
    for(size_t i=0;i<cases.size();++i)
        Require(standalone[i]==render(cases[i].first,cases[i].second,true),
            "Grouped copy changed clamp/repeat, negative UV, filtering or alpha edges");
    images.CheckOriginals(r);
    images.Destroy(r);
}
void GroupedAtlasExclusions(OpenGLRenderer& r)
{
    GroupedImages images(r);
    const auto largePixels=Pattern(257,8);
    auto* large=r.CreateTextureStatic(257,8,largePixels.data(),257*4,false,5);
    auto* floating=r.CreateRenderImage(16,8);
    r.BindStaticTexture(floating,6);
    const auto mutablePixels=Pattern(16,8);
    auto* mutableImage=r.CreateTextureStatic(16,8,mutablePixels.data(),64,false,7);
    mutableImage=r.ReplaceTexture(mutableImage,16,8,mutablePixels.data(),64);
    auto* dynamicImage=r.CreateTexture(16,8,mutablePixels.data(),64);
    // Repeat the exclusions in every group: admitting them would add copies.
    // Symbol 8 has no static binding; an ordinary dynamic image is not a definition member.
    constexpr std::array<unsigned int,4> offsets{0,6,12,18};
    constexpr std::array<unsigned int,18> symbols{
        1,2,5,6,7,8,1,3,5,6,7,8,1,4,5,6,7,8};
    r.FinishLoadingTextures(offsets,symbols,2);
    const auto counts=r.GetAtlasCounts();
    Require(counts.reanimationPages==2 && counts.particlePages==1,
        "Oversized, float or mutable images created grouped pages");
    Require(counts.images>=4 && counts.copies==counts.images+2,
        "Oversized, float or mutable images were copied into definition pages");
    Require(r.ReadTexturePixels(large).pixels==largePixels,
        "Excluded oversized image changed pixels");
    Require(r.ReadTexturePixels(mutableImage).pixels==mutablePixels,
        "Excluded mutable image changed pixels");
    Require(r.ReadTexturePixels(dynamicImage).pixels==mutablePixels,
        "Ungrouped dynamic image changed pixels");
    const auto floats=r.ReadTextureFloats(floating);
    Require(floats.size()==16*8*4 &&
        std::all_of(floats.begin(),floats.end(),[](float value){return value==0;}),
        "Excluded float image changed format or contents");
    // Use each excluded image after every anchor so a stale page lookup is visible.
    ClearGroupedScene(r);
    Require(r.BeginScene(),"Begin grouped exclusion draws");
    int column=0;
    for(size_t anchor=1;anchor<4;++anchor)
        for(auto* excluded:{large,floating,mutableImage,dynamicImage}) {
            auto* unique=images.textures[anchor];
            Draw(r,unique,Quad(unique,300,260,16,8));
            Draw(r,excluded,Quad(excluded,float(column++*16),0,16,8));
        }
    r.EndSceneAndPresent();
    const auto result=r.ReadScenePixels();
    for(int group=0;group<3;++group) {
        Pixel(result,SceneW,group*64,0,
            Sample(largePixels,257,8,0.5/16.0,0.5/8.0,false,false));
        Pixel(result,SceneW,group*64+16,0,0);
        Pixel(result,SceneW,group*64+32,0,mutablePixels[0]);
        Pixel(result,SceneW,group*64+48,0,mutablePixels[0]);
    }
    images.CheckOriginals(r);
    r.DestroyTexture(large);r.DestroyTexture(floating);r.DestroyTexture(mutableImage);
    r.DestroyTexture(dynamicImage);
    images.Destroy(r);
}
void GroupedAtlasVersions(OpenGLRenderer& r)
{
    GroupedImages images(r);
    images.Finish(r);
    const auto sharedSlot=images.slots[0];
    const std::vector<unsigned int> green(16*8,0xff00ff00u),blue(16*8,0xff0000ffu);
    ClearGroupedScene(r);
    Require(r.BeginScene(),"Begin grouped same-slot versions");
    const auto drawOnPages=[&](int firstColumn) {
        for(size_t anchor=1;anchor<4;++anchor) {
            auto* unique=images.textures[anchor];
            Draw(r,unique,Quad(unique,300,260,16,8));
            Draw(r,images.textures[0],Quad(images.textures[0],
                float((firstColumn+int(anchor)-1)*16),0,16,8));
        }
    };
    drawOnPages(0);
    images.textures[0]=r.ReplaceTexture(images.textures[0],16,8,green.data(),64);
    Require(OpenGLRenderer::SlotOf(images.textures[0])==sharedSlot,
        "Replacing grouped shared image changed its static slot");
    drawOnPages(3);
    r.DestroyTexture(images.textures[0]);
    images.textures[0]=r.CreateTextureStatic(16,8,blue.data(),64,false,1);
    Require(OpenGLRenderer::SlotOf(images.textures[0])==sharedSlot,
        "Reallocating grouped static symbol did not reuse the same slot");
    drawOnPages(6);
    // Keep both destroyed versions and the final version in recorded geometry.
    r.DestroyTexture(images.textures[0]);
    images.textures[0]=nullptr;
    r.EndSceneAndPresent();
    const auto result=r.ReadScenePixels();
    for(int column=0;column<9;++column)
        for(int y=0;y<8;++y) for(int x=0;x<16;++x)
            Pixel(result,SceneW,column*16+x,y,column<3 ?
                images.pixels[0][size_t(y)*16+x] : column<6 ? green[0] : blue[0]);
    for(size_t i=1;i<images.textures.size();++i) r.DestroyTexture(images.textures[i]);
}
void GroupedAtlasBlendAndClipOrder(OpenGLRenderer& r)
{
    GroupedImages images(r);
    auto* target=r.CreateRenderImage(SceneW,SceneH);
    struct Layer { size_t image; GpuBlend blend; GpuClip clip; };
    const std::array<Layer,8> layers{{
        {1,GpuBlend::Normal,{0,0,24,24}},
        {0,GpuBlend::Additive,{8,0,24,24}},
        {2,GpuBlend::Normal,{0,8,32,16}},
        {0,GpuBlend::Normal,{0,0,16,32}},
        {3,GpuBlend::Additive,{0,0,32,32}},
        {0,GpuBlend::Normal,{8,8,16,16}},
        {1,GpuBlend::Normal,{0,0,24,24}},
        {0,GpuBlend::Additive,{8,0,24,24}}}};
    const auto render=[&](bool packed) {
        r.SetRenderImage(target);
        Require(r.BeginScene(),"Clear grouped blend float target");
        auto background=Quad(r.whiteTexture,0,0,SceneW,SceneH);
        for(auto& vertex:background)vertex.r=vertex.g=vertex.b=0;
        Draw(r,r.whiteTexture,background);
        r.EndSceneAndPresent();
        Require(r.BeginScene(),"Begin grouped blend/clip ordering scene");
        for(size_t i=0;i<layers.size();++i) {
            const auto& layer=layers[i];
            auto* texture=images.textures[layer.image];
            const float u=1.5f/GroupedImages::Widths[layer.image];
            const float v=0.5f/GroupedImages::Heights[layer.image];
            auto q=Quad(texture,0,0,32,32,u,v,u,v);
            for(auto& vertex:q) vertex.a=0.5f;
            r.SubmitTriangles(q,texture,false,false,layer.blend,&layer.clip);
            if(packed)
                Require(r.GetResourceCounts().queuedBatches==i+1,
                    "Blend/clip changes were merged or earlier batches were reordered");
        }
        r.EndSceneAndPresent();
        const auto result=r.ReadTextureFloats(target);
        r.SetRenderImage(nullptr);
        return result;
    };
    const auto before=render(false);
    images.Finish(r);
    const auto after=render(true);
    Require(before==after,"Grouped pages reordered interleaved transparent blend/clip draws");
    // Independent per-pixel painter's-order reference, including uncovered pixels.
    for(int y=0;y<32;++y) for(int x=0;x<32;++x) {
        std::array<double,3> expected{};
        for(const auto& layer:layers) {
            if(x<layer.clip.x || y<layer.clip.y ||
                x>=layer.clip.x+layer.clip.width || y>=layer.clip.y+layer.clip.height) continue;
            const auto source=images.pixels[layer.image][1];
            for(unsigned int channel=0;channel<3;++channel) {
                const unsigned int shift=(2-channel)*8;
                expected[channel]=double((source>>shift)&255u)/255.0*0.5+
                    expected[channel]*(layer.blend==GpuBlend::Additive?1.0:0.5);
            }
        }
        const auto pixel=(size_t(y)*SceneW+x)*4;
        for(size_t channel=0;channel<3;++channel)
            Require(std::abs(after[pixel+channel]-expected[channel])<0.000001,
                "Grouped float blending changed painter order or blend equations");
        Require(after[pixel+3]==1.0f,"Grouped float blending changed destination alpha");
    }
    r.DestroyTexture(target);
    images.CheckOriginals(r);
    images.Destroy(r);
}
void OrderAndVersions(OpenGLRenderer& r)
{
    unsigned int red=0xffff0000u, blue=0xff0000ffu, green=0xff00ff00u;
    auto* a = r.CreateTexture(1,1,&red,4);
    auto* b = r.CreateTexture(1,1,&blue,4);
    Require(r.BeginScene(), "Begin ordering scene");
    Draw(r,r.whiteTexture,Quad(r.whiteTexture,0,0,8,8));
    std::vector<GpuVertex> mixed;
    for (auto* t : {a,b,a}) {
        auto q = Quad(t,0,0,8,8);
        for (auto& v : q) v.a=0.5f;
        mixed.insert(mixed.end(),q.begin(),q.end());
    }
    r.SubmitTriangles(mixed,a,false,false,GpuBlend::Normal);
    Draw(r,a,Quad(a,10,0,1,1));
    a = r.ReplaceTexture(a,1,1,&green,4);
    Draw(r,a,Quad(a,11,0,1,1));
    a = r.ReplaceTexture(a,1,1,&blue,4);
    Draw(r,a,Quad(a,12,0,1,1));
    r.DestroyTexture(a); r.DestroyTexture(b);
    // Encourage slot reuse before the recorded draws finish.
    auto* reuse = r.CreateTexture(1,1,&green,4);
    Draw(r,reuse,Quad(reuse,13,0,1,1));
    r.DestroyTexture(reuse);
    r.EndSceneAndPresent();
    const auto p = r.ReadScenePixels();
    Pixel(p,SceneW,3,3,0xffbf2060u,1);
    Pixel(p,SceneW,10,0,red); Pixel(p,SceneW,11,0,green);
    Pixel(p,SceneW,12,0,blue); Pixel(p,SceneW,13,0,green);
}
void FlagsAndCoverage(OpenGLRenderer& r)
{
    const unsigned int source=0x00402010u;
    auto* t = r.CreateTexture(1,1,&source,4);
    Require(r.BeginScene(), "Begin flags scene");
    auto q = Quad(t,0,0,1,1);
    for (auto& v : q) v.slot |= GpuVertex::kOpaqueInput;
    Draw(r,t,q);
    q = Quad(t,1,0,1,1);
    for (auto& v : q) v.slot |= GpuVertex::kOpaqueInput |
        GpuVertex::kIndependentColorFilter | 0x10000000u;
    Draw(r,t,q,true,true);
    std::array<unsigned char,256> ramp{};
    for (unsigned int i=0; i<256; ++i) ramp[i]=static_cast<unsigned char>(i);
    auto* mask = r.CreateCoverageMask(256,1,ramp,256);
    ramp.fill(0);
    auto black = Quad(r.whiteTexture,0,8,256,256);
    for (auto& v : black) v.r=v.g=v.b=0;
    Draw(r,r.whiteTexture,black);
    std::vector<GpuVertex> rows;
    for (int alpha=0; alpha<256; ++alpha) {
        auto row = Quad(mask,0,float(8+alpha),256,1);
        for (auto& v : row) v.a=float(alpha)/255;
        rows.insert(rows.end(),row.begin(),row.end());
    }
    r.SubmitCoverageTriangles(rows,mask,GpuBlend::Normal);
    r.DestroyTexture(t); r.DestroyTexture(mask);
    r.EndSceneAndPresent();
    const auto p = r.ReadScenePixels();
    Pixel(p,SceneW,0,0,0xff402010u);
    Pixel(p,SceneW,1,0,0xffffffffu);
    for (unsigned int alpha=0; alpha<256; ++alpha) for (unsigned int cover=0; cover<256; ++cover)
        Pixel(p,SceneW,int(cover),8+int(alpha),0xff000000u|(((cover+1)*alpha)>>8)*0x010101u);
}
void FloatAndSelfSample(OpenGLRenderer& r)
{
    auto* t = r.CreateRenderImage(4,1);
    const auto zero = r.ReadTextureFloats(t);
    Require(zero.size()==16 && std::all_of(zero.begin(),zero.end(),
        [](float v) { return v==0; }), "RGBA32F initial clear");
    r.SetRenderImage(t);
    Require(r.BeginScene(), "Begin float scene");
    auto q = Quad(r.whiteTexture,0,0,4,1);
    for (auto& v : q) { v.r=1.125123f; v.g=0.1234567f; v.b=0.00012345f; }
    Draw(r,r.whiteTexture,q);
    r.EndSceneAndPresent();
    r.SetRenderImage(nullptr);
    const auto p = r.ReadTextureFloats(t);
    Require(p.size()==16, "Float readback extent");
    for (size_t i=0; i<p.size(); i+=4)
        Require(std::abs(p[i]-1.125123f)<0.000002f &&
            std::abs(p[i+1]-0.1234567f)<0.000002f &&
            std::abs(p[i+2]-0.00012345f)<0.0000001f &&
            std::abs(p[i+3]-1)<0.000002f, "RenderImage quantized or clamped RGBA32F");
    auto* floatCopy = r.CopyTextureRegion(t,0,0,4,1);
    Require(r.ReadTextureFloats(floatCopy)==p, "Region copy quantized a float render image");
    r.DestroyTexture(floatCopy);
    const std::array<unsigned int,4> colors{0xffff0000u,0xff00ff00u,0xff0000ffu,0xffffffffu};
    auto* source = r.CreateTexture(4,1,colors.data(),16);
    r.SetRenderImage(t);
    Require(r.BeginScene(), "Begin self-sample initialization");
    Draw(r,source,Quad(source,0,0,4,1));
    r.EndSceneAndPresent();
    Require(r.BeginScene(), "Begin self-sample snapshot");
    Draw(r,t,Quad(t,1,0,3,1,0,0,0.75f,1));
    r.EndSceneAndPresent();
    r.SetRenderImage(nullptr);
    const auto self = r.ReadTexturePixels(t);
    const std::array<unsigned int,4> shifted{colors[0],colors[0],colors[1],colors[2]};
    Require(std::equal(shifted.begin(),shifted.end(),self.pixels.begin(),self.pixels.end()),
        "Self-sample did not read a stable pre-draw snapshot");
    r.DestroyTexture(source); r.DestroyTexture(t);
}
void FloatBlending(OpenGLRenderer& r)
{
    auto* target=r.CreateRenderImage(1,1);
    r.SetRenderImage(target);Require(r.BeginScene(),"Begin float blending image");
    auto q=Quad(r.whiteTexture,0,0,1,1);
    for(auto& vertex:q) {vertex.r=0.25f;vertex.g=0.5f;vertex.b=1.5f;vertex.a=0.5f;}
    Draw(r,r.whiteTexture,q,false,false,GpuBlend::Normal);
    Draw(r,r.whiteTexture,q,false,false,GpuBlend::Additive);
    r.EndSceneAndPresent();r.SetRenderImage(nullptr);
    const auto result=r.ReadTextureFloats(target);
    const std::array<float,4> expected{0.25f,0.5f,1.5f,0.75f};
    for(size_t i=0;i<expected.size();++i)
        Require(std::abs(result[i]-expected[i])<0.000002f,"RGBA32F blending clamped or used the wrong factors");
    r.DestroyTexture(target);
}
void ImageFactories(OpenGLRenderer& r)
{
    const std::array<unsigned int,4> source{0x80402010u,0xffaabbccu,0x204080c0u,0xff123456u};
    auto* t = r.CreateTexture(2,2,source.data(),8);
    auto* copy = r.CopyTextureRegion(t,-1,-1,4,4);
    const auto p = r.ReadTexturePixels(copy);
    Require(p.width==4 && p.height==4, "Copy extent");
    for (int y=0; y<4; ++y) for (int x=0; x<4; ++x)
        Pixel(p.pixels,4,x,y,(x>=1&&x<=2&&y>=1&&y<=2)?source[(y-1)*2+x-1]:0);
    const std::array<unsigned int,2> maskBytes{0x00000033u,0x000000c1u};
    auto* mask = r.CreateTexture(1,2,maskBytes.data(),4);
    auto* composed = r.ComposeAlpha(t,mask,2,1,0,false);
    auto* colorOnly = r.ComposeAlpha(t,mask,2,1,0x00472513u,true);
    const auto composedPixels = r.ReadTexturePixels(composed);
    const auto colorPixels = r.ReadTexturePixels(colorOnly);
    for (int y=0; y<2; ++y) for (int x=0; x<2; ++x) {
        const auto alpha=(maskBytes[y]&255u)<<24;
        Pixel(composedPixels.pixels,2,x,y,(source[y*2+x]&0xffffffu)|alpha);
        Pixel(colorPixels.pixels,2,x,y,0x00472513u|alpha);
    }
    for (const auto tint : {std::array<int,4>{255,0,255,255},std::array<int,4>{400,300,257,511}}) {
        auto* colored = r.ProcessImage(composed,
            {0,0,2,2,tint[0],tint[1],tint[2],tint[3],GpuImageOperation::Colorize});
        const auto actual = r.ReadTexturePixels(colored);
        for (int i=0; i<4; ++i) {
            unsigned int expected=0;
            const std::array<int,4> bgraTint{tint[2],tint[1],tint[0],tint[3]};
            for (unsigned int c=0; c<4; ++c) {
                const auto product=((composedPixels.pixels[i]>>(8*c))&255u)*bgraTint[c];
                expected |= (tint[0]<=255 ? (product>>8)&255u : std::min(product/255,255u))<<(8*c);
            }
            Pixel(actual.pixels,2,i%2,i/2,expected);
        }
        r.DestroyTexture(colored);
    }
    for (auto* image : {t,copy,mask,composed,colorOnly}) r.DestroyTexture(image);
}
void ResourceLifetime(OpenGLRenderer& r)
{
    r.FinishLoadingTextures();
    const unsigned int hiddenColor=0x00402010u;
    auto* opaque=r.CreateTexture(1,1,&hiddenColor,4,true);
    auto* copied=r.CopyTextureRegion(opaque,0,0,1,1);
    Require(r.ReadTexturePixels(copied).pixels[0]==0xff402010u,
        "Region copy lost opaque image metadata");
    r.DestroyTexture(copied); r.DestroyTexture(opaque);
    bool rejected=false;
    try { r.DestroyTexture(r.whiteTexture); }
    catch (const std::invalid_argument&) { rejected=true; }
    Require(rejected,"White image destruction accepted");
    rejected=false;
    try { r.ReplaceTexture(r.whiteTexture,1,1,&hiddenColor,4); }
    catch (const std::invalid_argument&) { rejected=true; }
    Require(rejected,"White image replacement accepted");
    const auto data=Pattern(32,32);
    for(int i=0;i<200;++i) {
        auto* image=r.CreateTexture(32,32,data.data(),128);
        r.DestroyTexture(image);
    }
    const auto pages=r.GetAtlasCounts().pages;
    Require(pages<=3,"Empty atlas pages were not reused");
    auto* changing=r.CreateTexture(32,32,data.data(),128);
    for(int i=0;i<200;++i) changing=r.ReplaceTexture(changing,32,32,data.data(),128);
    r.DestroyTexture(changing);
    Require(r.GetAtlasCounts().pages<=pages+1,
        "Replacing mutable textures grew immutable atlas pages");
}
void StaticIdentity(OpenGLRenderer& r)
{
    r.ReserveStaticTextureSlots(32);
    const std::array<unsigned int,4> red{0xffff0000u,0xffff0000u,0xffff0000u,0xffff0000u};
    const std::array<unsigned int,4> blue{0xff0000ffu,0xff0000ffu,0xff0000ffu,0xff0000ffu};
    auto* old=r.CreateTextureStatic(2,2,red.data(),8,false,5);
    const auto slot=OpenGLRenderer::SlotOf(old);
    Require(r.BeginScene(),"Static identity first scene");
    Draw(r,old,Quad(old,0,0,2,2));
    r.EndSceneAndPresent();
    r.FinishLoadingTextures();
    Require(OpenGLRenderer::SlotOf(old)==slot,"Atlas migration changed the static logical slot");
    auto* next=r.CreateTextureStatic(2,2,blue.data(),8,false,5);
    Require(OpenGLRenderer::SlotOf(next)==slot,"Static replacement changed logical identity");
    r.DestroyTexture(old);
    Require(r.BeginScene(),"Static identity replacement scene");
    Draw(r,next,Quad(next,2,0,2,2));
    r.EndSceneAndPresent();
    const auto pixels=r.ReadScenePixels();
    Pixel(pixels,SceneW,0,0,red[0]); Pixel(pixels,SceneW,2,0,blue[0]);
    r.DestroyTexture(next);
}
void CollectionPaths(OpenGLRenderer& r)
{
    const std::array<unsigned int,4> color{0xff234567u,0xff234567u,0xff234567u,0xff234567u};
    auto* first=r.ReplaceTexture(nullptr,2,2,color.data(),8);
    auto* raw=r.CreateRawTexture(2,2,color.data(),8);
    auto* composed=r.AdoptComposedTexture(r.ComposeAlphaRaw(raw,raw,1,1,0,false));
    r.FinishLoadingTextures();
    Require(r.GetAtlasCounts().images==3,"First upload or adopted composition escaped collection");
    Require(r.ReadTexturePixels(first).pixels[0]==color[0],"First upload changed during packing");
    Require(r.ReadTexturePixels(composed).pixels[0]==0x67234567u,"Adopted composition changed during packing");
    auto* late=r.ComposeAlpha(first,first,1,1,0,false);
    Require(r.GetAtlasCounts().images==4,"Late immutable composition did not enter an atlas");
    Require(r.ReadTexturePixels(late).pixels[0]==0x67234567u,"Late composition atlas copy changed pixels");
    r.DestroyTexture(first);r.DestroyTexture(composed);r.DestroyTexture(late);
}
void FullDynamicStaticReplace(OpenGLRenderer& r)
{
    r.ReserveStaticTextureSlots(4093);
    const unsigned int red=0xffff0000u,blue=0xff0000ffu;
    auto* filler=r.CreateTexture(1,1,&red,4);
    auto* fixed=r.CreateTextureStatic(1,1,&red,4,false,1);
    const auto slot=OpenGLRenderer::SlotOf(fixed);
    fixed=r.ReplaceTexture(fixed,1,1,&blue,4);
    Require(OpenGLRenderer::SlotOf(fixed)==slot,"Static replacement required a spare dynamic slot");
    Require(r.ReadTexturePixels(fixed).pixels[0]==blue,"Static replacement failed with full dynamic region");
    r.DestroyTexture(filler);r.DestroyTexture(fixed);
}
void PackagedShapes(OpenGLRenderer& r,const char* path)
{
    std::ifstream input(path);
    Require(input.good(),"Cannot open packaged image shape manifest");
    std::vector<std::pair<OpenGLTexture*,unsigned int>> images;
    std::vector<unsigned int> pixels;
    int width=0,height=0;
    while(input>>width>>height) {
        Require(width>0 && height>0 && width<=256 && height<=256,"Invalid small image shape");
        const unsigned int color=0xff000000u |
            ((static_cast<unsigned int>(images.size()+1)*2654435761u)&0x00ffffffu);
        pixels.assign(size_t(width)*height,color);
        images.emplace_back(r.CreateTexture(width,height,pixels.data(),width*4),color);
    }
    Require(!images.empty(),"Empty packaged image shape corpus");
    r.FinishLoadingTextures();
    const auto atlas=r.GetAtlasCounts();
    Require(atlas.images==images.size()+1,"Packaged small images escaped the atlas");
    std::cout<<"corpus atlas pages="<<atlas.pages<<" images="<<atlas.images
        <<" occupied_pixels="<<atlas.pixels<<" page_pixels="<<atlas.capacity
        <<" occupancy="<<double(atlas.pixels)/atlas.capacity<<'\n';
    for(const auto& [image,color]:images) {
        const auto result=r.ReadTexturePixels(image);
        Require(std::all_of(result.pixels.begin(),result.pixels.end(),
            [color](auto pixel){return pixel==color;}),"Atlas migration changed/overlapped packaged image pixels");
    }
}
// Scalar legacy caustics reference. uint32 arithmetic intentionally wraps.
unsigned int Caustic(const std::vector<unsigned int>& source, unsigned int x,
    unsigned int y, unsigned int counter)
{
    const auto lookup = [&](unsigned int u, unsigned int v) {
        const auto fu=(u&65534u)+1u, fv=(v&65534u)+1u;
        const auto tap = [&](unsigned int dx, unsigned int dy) {
            return source[((v/65536+dy)%256)*256+(u/65536+dx)%256]&255u;
        };
        return (((65536-fu)*fv/65536)*tap(0,1)/65536) +
            ((fu*fv/65536)*tap(1,1)/65536) +
            (((65536-fu)*(65536-fv)/65536)*tap(0,0)/65536) +
            ((fu*(65536-fv)/65536)*tap(1,0)/65536);
    };
    const auto trunc = [](unsigned int bits, unsigned int divisor) {
        return bits&0x80000000u ? 0u-((0u-bits)/divisor) : bits/divisor;
    };
    const auto time=counter<<16, next=((counter&65535u)+1)<<16;
    const auto a0=lookup((x<<17)+trunc(time,10),y<<17)&255u;
    const auto a1=lookup((x<<17)-trunc(next,6),((256-y)<<17)+(time>>3))&255u;
    const auto a=(a0+a1)/2;
    const auto alpha=a>=160 ? 255-2*(a-160) : a>=128 ? 5*(a-128) : 0;
    return ((alpha/3)<<24)|0xffffffu;
}
void Caustics(OpenGLRenderer& r)
{
    const auto source = Pattern(256,256);
    auto* t = r.CreateTexture(256,256,source.data(),256*4);
    auto* output = r.CreateCausticsTexture(128,64,t);
    r.UseCausticsTexture(output,t);
    for (unsigned int frame : {0u,1u,32768u,65535u,65536u}) {
        r.SetCausticsFrame(frame);
        Require(r.BeginScene(), "Begin caustics frame");
        Draw(r,output,Quad(output,0,0,128,64));
        r.EndSceneAndPresent();
        const auto pixels=r.ReadTexturePixels(output);
        Require(pixels.width==128 && pixels.height==64, "Caustics extent");
        for (unsigned int y=0; y<64; ++y) for (unsigned int x=0; x<128; ++x)
            Pixel(pixels.pixels,128,int(x),int(y),Caustic(source,x,y,frame));
    }
    const auto beforeIdle=r.ReadTexturePixels(output).pixels;
    Require(r.BeginScene(),"Begin idle caustics scene");r.EndSceneAndPresent();
    Require(r.ReadTexturePixels(output).pixels==beforeIdle,"Idle scene changed caustics pixels");
    r.DestroyTexture(output); r.DestroyTexture(t);
}
void FontEndpoints(OpenGLRenderer& r)
{
    const auto source=Pattern(5,4);
    auto* t=r.CreateTexture(5,4,source.data(),20);
    // Exercise offset source rectangles, expansion, singleton and shrinking.
    for (const auto glyph : {GpuFontGlyph{1,1,3,2,1,1,7,5},
        GpuFontGlyph{1,1,1,1,1,1,3,3},GpuFontGlyph{0,0,4,4,1,1,2,2}}) {
        auto* target=r.CreateRenderImage(10,8);
        r.SetRenderImage(target);
        Require(r.BeginScene(), "Begin font scene");
        r.RenderFontAtlas(target,t,std::span<const GpuFontGlyph>(&glyph,1),0,false);
        r.EndSceneAndPresent();
        r.SetRenderImage(nullptr);
        const auto pixels=r.ReadTexturePixels(target);
        const auto weights=[](int input,int output,int index) {
            std::vector<unsigned int> result(input);
            if (input<output) {
                const double pos=double(index)*(input-1)/(output-1);
                const int first=int(pos), last=std::min(first+1,input-1);
                const auto a=unsigned(256*(1-(pos-first)));
                result[first]+=a; result[last]+=256-a;
            } else {
                // Area overlap, with legacy truncation of each endpoint.
                const double scale=double(output)/input;
                for (int i=0; i<input; ++i) {
                    const double a=i*scale, b=(i+1)*scale;
                    const double overlap=std::max(0.0,std::min(b,double(index+1))-std::max(a,double(index)));
                    result[i]=unsigned(256*overlap);
                }
            }
            return result;
        };
        for (int y=0; y<8; ++y) for (int x=0; x<10; ++x) {
            if (x<1 || y<1 || x>=1+glyph.targetWidth || y>=1+glyph.targetHeight) {
                Pixel(pixels.pixels,10,x,y,0); continue;
            }
            const auto wx=weights(glyph.sourceWidth,glyph.targetWidth,x-1);
            const auto wy=weights(glyph.sourceHeight,glyph.targetHeight,y-1);
            unsigned int expected=0xff000000u;
            for (unsigned int shift=0; shift<24; shift+=8) {
                unsigned int total=0;
                for (int sy=0; sy<glyph.sourceHeight; ++sy) for (int sx=0; sx<glyph.sourceWidth; ++sx)
                    total+=((source[(glyph.sourceY+sy)*5+glyph.sourceX+sx]>>shift)&255u)*wx[sx]*wy[sy];
                expected|=(((total>>16)*255)>>8)<<shift;
            }
            Pixel(pixels.pixels,10,x,y,expected,1);
        }
        r.DestroyTexture(target);
    }
    r.DestroyTexture(t);
}
void EffectsBoundary(OpenGLRenderer& r)
{
    ScaleEffectRuntimeDesc effect{};
    const OpenGLScaleStep step{&effect,{}};
    for (bool fullscreen : {false,true}) {
        bool rejected=false;
        try { r.PrepareScale(fullscreen,std::span<const OpenGLScaleStep>(&step,1),640,560); }
        catch (const std::exception& e) {
            const std::string message=e.what();
            Require(!message.empty(), "Effect rejection needs a diagnostic");
            std::cout << "effect preparation rejected: " << message << '\n';
            rejected=true;
        }
        Require(rejected, "Unsupported effects silently accepted during preparation");
    }
}
void Retained(OpenGLRenderer& r, OpenGLContext& context, Window& window)
{
    Require(!r.PresentRetainedScene(), "Uninitialized retained scene accepted");
    Require(r.ResizePresent(),"Unchanged drawable resize was reported as deferred");
    Require(r.BeginScene(), "Begin retained scene");
    Draw(r,r.whiteTexture,Quad(r.whiteTexture,0,0,SceneW,SceneH));
    auto mark=Quad(r.whiteTexture,2,3,5,7);
    for (auto& v : mark) { v.g=0; v.b=0; }
    Draw(r,r.whiteTexture,mark);
    r.EndSceneAndPresent();
    const auto before=r.ReadScenePixels();
    const auto generation=context.swapchainGeneration;
    window.Resize(427,311);
    Require(r.ResizePresent(), "ResizePresent did not resize hidden surface");
    Require(context.width==427 && context.height==311 &&
        context.swapchainGeneration>generation, "Surface size/generation not updated");
    Require(r.PresentRetainedScene(), "Retained present after resize failed");
    Require(r.ReadScenePixels()==before, "Retained resize changed scene pixels");
    // Explicit hidden-fixture simulation, not evidence about real desktop minimization.
    context.NotifySurfaceSuspended(true);
    for (int i=0; i<3; ++i) {
        Require(!r.BeginScene(), "Suspended scene began");
        Require(!r.PresentRetainedScene(), "Suspended retained present succeeded");
    }
    Require(r.ReadScenePixels()==before, "Suspension lost retained pixels");
    context.NotifySurfaceSuspended(false);
    Require(r.PresentRetainedScene(), "Resume retained present failed");
    Require(r.ReadScenePixels()==before, "Resume changed retained scene");
    Require(!IsWindowVisible(window.hwnd), "Test unexpectedly showed a user window");
    window.Resize(SceneW,SceneH);
    r.ResizePresent();
}
}
int main(int argc, char** argv)
{
    try {
#if defined(PVZ_TEST_D3D9)
        Require(SetProcessAffinityMask(GetCurrentProcess(),0x8000)!=FALSE,
            "Cannot pin DX9 functional tests to LP15");
#endif
        SmallAtlas smallAtlas;
        Window window;
        OpenGLContext context(window.hwnd,true,false);
        context.MakeCurrent();
        std::cout << "adapter=" << context.adapterDescription << " context="
            << context.majorVersion << '.' << context.minorVersion
#if defined(PVZ_TEST_D3D9)
            << " backend=Direct3D9Ex; shaders=SM3.0\n";
#else
            << " GLSL=" << reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION))
            << "\nrequested=3.0; actual version above is driver-reported, not a 3.0-only certification\n";
#endif
        const std::filesystem::path shaderDirectory=argc>1 ? argv[1] : ".";
        unsigned int failed=0;
        const auto run=[&](const char* name, auto test) {
            try {
                test();
#if !defined(PVZ_TEST_D3D9)
                GL3::CheckError(name);
#endif
                std::cout << "PASS " << name << '\n';
            } catch (const std::exception& e) {
                ++failed;
                context.NotifySurfaceSuspended(false);
                std::cerr << "FAIL " << name << ": " << e.what() << '\n';
            }
        };
#if defined(PVZ_TEST_D3D9)
        run("SM3.0-compiled-bytecode", [&] {
            for(const auto& program : D3d9Shaders::Programs) {
                std::ifstream input(shaderDirectory/program.bytecode, std::ios::binary);
                unsigned int version=0;
                input.read(reinterpret_cast<char*>(&version),sizeof(version));
                const unsigned int expected=program.profile[0]=='v' ? 0xfffe0300u : 0xffff0300u;
                Require(input.good() && version==expected,"Shader bytecode is not SM3.0");
            }
        });
#else
        run("GLSL130-compile-link",[] { CompileShaders(); });
#endif
        const auto rendererTest=[&](const char* name,auto test) {
            run(name,[&] {
                OpenGLRenderer renderer(context,SceneW,SceneH,shaderDirectory,nullptr);
                renderer.PrepareLoadingPipelines();
                test(renderer);
            });
        };
        rendererTest("atlas-multipage-NPOT-negative-UV-CPU-taps",AtlasSampling);
        rendererTest("atlas-vs-standalone-all-samplers-filters-zero-difference",AtlasVersusStandalone);
        rendererTest("repeated-main-and-offscreen-target-selection-preserves-batching",RepeatedTargetSelection);
        rendererTest("grouped-atlas-two-reanimations-one-particle-current-page-three-batches",GroupedAtlasBatches);
        rendererTest("grouped-atlas-shared-different-rectangles-zero-difference",GroupedAtlasDistinctRectangles);
        rendererTest("grouped-atlas-canonical-and-all-copies-samplers-filters-zero-difference",GroupedAtlasSampling);
        rendererTest("grouped-atlas-excludes-oversized-float-mutable",GroupedAtlasExclusions);
        rendererTest("grouped-atlas-shared-replace-destroy-static-slot-reuse",GroupedAtlasVersions);
        rendererTest("grouped-atlas-transparent-blend-clip-painter-order",GroupedAtlasBlendAndClipOrder);
        rendererTest("primitive-order-replace-destroy-recorded-versions",OrderAndVersions);
        rendererTest("slot-flags-coverage-65536",FlagsAndCoverage);
        rendererTest("RGBA32F-self-sample-snapshot",FloatAndSelfSample);
        rendererTest("RGBA32F-normal-additive-no-clamp",FloatBlending);
        rendererTest("copy-zero-fill-compose-process",ImageFactories);
        rendererTest("resource-lifetime-copy-metadata-page-reuse",ResourceLifetime);
        rendererTest("static-slot-identity-atlas-migration",StaticIdentity);
        rendererTest("all-immutable-upload-collection-paths",CollectionPaths);
        rendererTest("static-replace-with-full-dynamic-region",FullDynamicStaticReplace);
        rendererTest("caustics-CPU-reference",Caustics);
        rendererTest("font-endpoint-expand-shrink-singleton",FontEndpoints);
        rendererTest("effects-prepare-rejection",EffectsBoundary);
        rendererTest("canvas-resize-preserves-resident-image", [](OpenGLRenderer& r) {
            const unsigned int color = 0xff2468ac;
            auto* source = r.CreateTexture(1, 1, &color, 4);
            const auto slot = OpenGLRenderer::SlotOf(source);
            for (const int width : {801, 960, 999, 1065, 1066, SceneW}) {
                r.ResizeScene(width, SceneH);
                Require(r.sceneWidth == width && r.sceneHeight == SceneH,
                    "Incorrect canvas extent");
                Require(!r.PresentRetainedScene(), "Old-size canvas survived resize");
                Require(OpenGLRenderer::SlotOf(source) == slot &&
                    r.ReadTexturePixels(source).pixels[0] == color,
                    "Canvas resize changed resident image");
                Require(r.BeginScene(), "Begin resized canvas");
                Draw(r, source, Quad(source, 0, 0, float(width), SceneH));
                r.EndSceneAndPresent();
                const auto pixels = r.ReadScenePixels();
                Require(pixels.size() == size_t(width) * SceneH &&
                    std::all_of(pixels.begin(), pixels.end(),
                        [=](auto pixel) { return pixel == color; }),
                    "Canvas resize left incorrect pixels");
            }
            r.DestroyTexture(source);
        });
        rendererTest("hidden-retained-resize-simulated-suspension",
            [&](OpenGLRenderer& r) { Retained(r,context,window); });
        if(argc>2) {
            Require(_putenv_s(AtlasSizeVariable,"")==0,"Cannot select device atlas limit");
            rendererTest("packaged-small-image-shapes",
                [&](OpenGLRenderer& r){PackagedShapes(r,argv[2]);});
        }
        context.WaitIdle();
        std::cout << "failed=" << failed << "; hidden HWND only; no Win7/old-GPU certification\n";
        return failed ? 1 : 0;
    } catch (const std::exception& e) {
        std::cerr << "FAIL OpenGL test initialization: " << e.what() << '\n';
        return 1;
    }
}
