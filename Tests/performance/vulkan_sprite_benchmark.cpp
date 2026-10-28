// Explicit desktop-only experiment using the real renderer. No game or phone state.
#include "VulkanRenderer.h"
#include "tests/TestWin32Window.h"
#include <algorithm>
#include <array>
#include <atomic>
#include <chrono>
#include <cmath>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <utility>
#include <stdexcept>
#include <string>
#include <vector>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    path = (std::filesystem::temp_directory_path() / name).string();
    return path.c_str();
}
}
namespace {
using namespace Sexy;
unsigned int vendor = 0x10de;
VkFormat bakeFormat=VK_FORMAT_R32G32B32A32_SFLOAT;
bool separateBlend=false;
bool manualBaked=false, compareIndexWidths=false, trimExperiment=false, packedColor=false, packedColor16=false, discardScene=false, instancedQuads=false, tightBarriers=false, nativeInstances=false, presentCopy=false, solidFill=false, generatePrefix=false;
unsigned int inputWidth=128,inputHeight=128;
std::vector<unsigned int> inputPixels;
std::array<float,4> trimBounds{0,0,1,1};
std::atomic<unsigned int> validationErrors = 0;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
void Check(VkResult result, const char* message) { Require(result == VK_SUCCESS, message); }
VkBool32 VKAPI_CALL Validate(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types, const VkDebugUtilsMessengerCallbackDataEXT* data, void* user) {
    if (severity >= VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++validationErrors;
    return VulkanInitConfig::DefaultDebugCallback(severity, types, data, user);
}
bool Select(VkPhysicalDevice device) {
    VkPhysicalDeviceProperties properties{}; vkGetPhysicalDeviceProperties(device, &properties);
    return properties.vendorID == vendor;
}
auto Quad(VulkanTexture* texture, float x, float y, float width, float height,
    float red = 1, float green = 1, float blue = 1, float alpha = 1) {
    const auto slot = VulkanRenderer::SlotOf(texture);
    return std::array<VulkanVertex, 4>{{
        {x+width,y,red,green,blue,alpha,1,0,slot,1},
        {x+width,y+height,red,green,blue,alpha,1,1,slot,1},
        {x,y,red,green,blue,alpha,0,0,slot,1},
        {x,y+height,red,green,blue,alpha,0,1,slot,1}}};
}
struct Scenario { const char* name; unsigned int sprites, generatedEvery; float side=64,angle=0,fadeAlpha=-1; unsigned int mixedGroup=0,blendGroup=0; };
constexpr std::array scenarios{
    Scenario{"raw_only",3000,0}, Scenario{"sparse_generated",3000,256},
    Scenario{"frequent_generated",3000,8}};
constexpr std::array largeScenarios{
    Scenario{"below_uint16",16000,0},Scenario{"cross_uint16",20000,0},Scenario{"far_uint16",50000,0}};
constexpr std::array trimScenarios{
    Scenario{"trim_64",3000,0,64,0},Scenario{"trim_128",750,0,128,0},
    Scenario{"trim_rotated",3000,0,64,.37f}};
constexpr std::array instanceScenarios{
    Scenario{"raw_only",3000,0},Scenario{"sparse_generated",3000,256},
    Scenario{"frequent_generated",3000,8},Scenario{"rotated",3000,256,64,.37f},
    Scenario{"large_instances",50000,0,2,0}};
constexpr std::array presentScenarios{
    Scenario{"background_only",0,0},Scenario{"raw_only",3000,0},
    Scenario{"sparse_generated",3000,256},Scenario{"frequent_generated",3000,8}};
constexpr std::array fadeScenarios{
    Scenario{"white_0",3000,0,64,0,0},Scenario{"white_25",3000,0,64,0,.25f},
    Scenario{"white_50",3000,0,64,0,.5f},Scenario{"white_75",3000,0,64,0,.75f},
    Scenario{"white_100",3000,0,64,0,1}};
constexpr std::array prefixScenarios{
    Scenario{"mixed_16",4096,0,2,0,-1,16},Scenario{"mixed_256",4096,0,2,0,-1,256},
    Scenario{"mixed_4096",12288,0,2,0,-1,4096}};
constexpr std::array blendScenarios{
    Scenario{"blend_small_g1",4096,0,8,0,-1,0,1},
    Scenario{"blend_small_g16",4096,0,8,0,-1,0,16},
    Scenario{"blend_small_g256",4096,0,8,0,-1,0,256},
    Scenario{"blend_dense_g1",512,0,512,0,-1,0,1},
    Scenario{"blend_dense_g16",512,0,512,0,-1,0,16},
    Scenario{"blend_dense_g256",512,0,512,0,-1,0,256}};
struct Fixture {
    VulkanRenderer* renderer = nullptr;
    Fixture() = default;
    Fixture(const Fixture&) = delete;
    Fixture& operator=(const Fixture&) = delete;
    Fixture(Fixture&& source) noexcept : renderer(std::exchange(source.renderer,nullptr)),
        directInstances(source.directInstances),quads(source.quads), filterExperiment(source.filterExperiment), prebaked(source.prebaked), trimmed(source.trimmed),
        filtered(source.filtered), raw(source.raw), generated(source.generated) {}
    ~Fixture() { delete renderer; }
    unsigned int hostCalls=0;
    bool directInstances=false;
    bool quads = false, filterExperiment = false, prebaked = false, trimmed = false;
    std::array<VulkanTexture*,3> filtered{};
    VulkanTexture* raw = nullptr;
    VulkanTexture* generated = nullptr;
};
void Submit(Fixture& f,const std::array<VulkanVertex,4>& quad,VulkanTexture* texture,VulkanBlend blend) {
    ++f.hostCalls;
    if (f.quads) f.renderer->SubmitQuads(quad,texture,true,false,blend,nullptr);
    else {
        const std::array<VulkanVertex,6> triangles{quad[0],quad[1],quad[2],quad[1],quad[2],quad[3]};
        f.renderer->SubmitTriangles(triangles,texture,true,false,blend,nullptr);
    }
}
Fixture MakeFixture(VulkanContext& context, bool candidate, bool indexed, bool filters) {
    VulkanRenderer::benchmarkSimpleGenerated = candidate && !separateBlend && !indexed && !filters && !compareIndexWidths && !trimExperiment && !packedColor && !discardScene && !instancedQuads && !tightBarriers && !presentCopy && !solidFill && !generatePrefix;
    VulkanRenderer::benchmarkSeparateBlend=separateBlend && candidate;
    VulkanRenderer::benchmarkManualBakedFilters=filters && candidate && manualBaked;
    VulkanRenderer::benchmarkNonIndexedTriangles = indexed && !candidate;
    VulkanRenderer::benchmark32BitQuads=compareIndexWidths && candidate;
    VulkanRenderer::benchmarkPackedColor=packedColor && candidate;
    VulkanRenderer::benchmarkPackedColor16=packedColor16 && candidate;
    VulkanRenderer::benchmarkDiscardScene=discardScene && candidate;
    VulkanRenderer::benchmarkInstancedQuads=instancedQuads && candidate;
    VulkanRenderer::benchmarkTightSceneBarriers=tightBarriers && candidate;
    VulkanRenderer::benchmarkPresentCopy=presentCopy && !candidate;
    VulkanRenderer::benchmarkSolidFill=solidFill && candidate;
    VulkanRenderer::benchmarkGenerateIndexPrefix=!generatePrefix || candidate;
    const std::filesystem::path shaders = PVZ_NATIVE_SHADER_DIR;
    Fixture f;
    f.quads=(candidate && indexed) || filters || compareIndexWidths || trimExperiment || packedColor || discardScene || instancedQuads || tightBarriers || presentCopy || solidFill || generatePrefix || separateBlend;
    f.trimmed=trimExperiment && candidate;
    f.filterExperiment=filters; f.prebaked=filters && candidate;
    f.renderer = new VulkanRenderer(context,1333,600,
        (shaders/"game_vs.spv").string(),(shaders/"game_ps.spv").string());
    auto& r = *f.renderer;
    std::array<unsigned int,128*128> pixels;
    for (unsigned int y=0;y<128;++y) for(unsigned int x=0;x<128;++x) {
        const auto a=(x+y)%9==0 ? 0u : ((x*13+y*7)&255u);
        pixels[y*128+x]=(a<<24)|(((x*3)&255)<<16)|(((y*5)&255)<<8)|((x+y)*7&255);
    }
    f.raw=trimExperiment ? r.CreateTexture(inputWidth,inputHeight,inputPixels.data(),inputWidth*4,false) :
        r.CreateTexture(128,128,pixels.data(),128*4,false);
    if (!filters && !trimExperiment) {
        f.generated=r.CreateRenderImage(128,128);
        r.SetRenderImage(f.generated);
        Require(r.BeginScene(),"Cannot prepare generated source");
        Submit(f,Quad(f.raw,0,0,128,128),f.raw,VulkanBlend::Normal);
        r.EndSceneAndPresent(); r.SetRenderImage(nullptr);
    }
    if (f.prebaked) {
        if (manualBaked) r.PrepareLoadingPipelines();
        for (unsigned int kind=1;kind<=3;++kind) {
            f.filtered[kind-1]=r.CreateRenderImage(128,128);
            r.SetRenderImage(f.filtered[kind-1]);
            Require(r.BeginScene(),"Cannot prepare filtered source");
            auto q=Quad(f.raw,0,0,128,128);
            for (auto& v:q) { v.slot|=kind<<28;v.sampler=0; }
            Submit(f,q,f.raw,VulkanBlend::Normal);
            r.EndSceneAndPresent();r.SetRenderImage(nullptr);
            if (bakeFormat!=VK_FORMAT_R32G32B32A32_SFLOAT) {
                auto* old=f.filtered[kind-1];
                if (manualBaked) {
                    const VulkanImageProcessing copy{0,0,128,128,255,255,255,255,VulkanImageOperation::Copy};
                    f.filtered[kind-1]=r.ProcessImage(old,copy);
                } else f.filtered[kind-1]=r.ConvertBenchmarkTexture(old,bakeFormat);
                r.DestroyTexture(old);
            }
        }
    }
    f.directInstances=nativeInstances && candidate;
    return f;
}
struct Sample { double gpuUs, hostSubmitUs; unsigned int draws,triangles,hostSubmitCalls; };
Sample Draw(Fixture& fixture, VulkanContext& context, const Scenario& scenario,
    double timestampPeriod, unsigned long long mask) {
    auto& r=*fixture.renderer;
    Require(r.BeginScene(),"Cannot begin benchmark scene");
    const float sine=std::sin(scenario.angle),cosine=std::cos(scenario.angle);
    fixture.hostCalls=0;
    const auto hostStart=std::chrono::steady_clock::now();
    const auto background=Quad(r.whiteTexture,0,0,1333,600,.08f,.11f,.14f,.6f);
    Submit(fixture,background,r.whiteTexture,VulkanBlend::Opaque);
    for(unsigned int i=0;i<scenario.sprites;++i) {
        const bool appearance=scenario.generatedEvery && i%scenario.generatedEvery==scenario.generatedEvery-1;
        const unsigned int kind=i%3+1;
        auto* source=appearance ? (fixture.filterExperiment ?
            (fixture.prebaked ? fixture.filtered[kind-1] : fixture.raw) : fixture.generated) : fixture.raw;
        const float x=float((i*37)%1269), y=float((i*19)%536);
        const float side=compareIndexWidths ? 2.f : scenario.side;
        const float left=x+.25f,top=y+.375f;
        const auto bounds=fixture.trimmed ? trimBounds : std::array<float,4>{0,0,1,1};
        if (fixture.directInstances) {
            const float l=left+bounds[0]*side,t=top+bounds[1]*side;
            const float w=(bounds[2]-bounds[0])*side,h=(bounds[3]-bounds[1])*side;
            VulkanSpriteInstance sprite{
                {l+w,t,l+w,t+h,l,t,l,t+h},
                {bounds[2],bounds[1],bounds[2],bounds[3],bounds[0],bounds[1],bounds[0],bounds[3]},
                {.6f+float(i%5)*.08f,.7f,.9f,.15f+float(i%7)*.08f},VulkanRenderer::SlotOf(source),1};
            if (scenario.angle!=0) for(unsigned int corner=0;corner<4;++corner) {
                const float px=sprite.positions[corner*2]-(left+side*.5f);
                const float py=sprite.positions[corner*2+1]-(top+side*.5f);
                sprite.positions[corner*2]=left+side*.5f+px*cosine-py*sine;
                sprite.positions[corner*2+1]=top+side*.5f+px*sine+py*cosine;
            }
            ++fixture.hostCalls;
            r.SubmitBenchmarkSprite(sprite,source,i%5==1 ? VulkanBlend::Additive : VulkanBlend::Normal,nullptr);
            continue;
        }
        auto q=Quad(source,left+bounds[0]*side,top+bounds[1]*side,
            (bounds[2]-bounds[0])*side,(bounds[3]-bounds[1])*side,
            .6f+float(i%5)*.08f,.7f,.9f,.15f+float(i%7)*.08f);
        q[0].u=q[1].u=bounds[2];q[2].u=q[3].u=bounds[0];
        q[0].v=q[2].v=bounds[1];q[1].v=q[3].v=bounds[3];
        if (scenario.angle!=0) for(auto& vertex:q) {
            const float px=vertex.x-(left+side*.5f),py=vertex.y-(top+side*.5f);
            vertex.x=left+side*.5f+px*cosine-py*sine;
            vertex.y=top+side*.5f+px*sine+py*cosine;
        }
        if (appearance && fixture.filterExperiment && (!fixture.prebaked || manualBaked))
            for (auto& v:q) v.slot|=kind<<28;
        const auto blend=scenario.blendGroup ? ((i/scenario.blendGroup)%2 ? VulkanBlend::Additive : VulkanBlend::Normal) :
            (i%5==1 ? VulkanBlend::Additive : VulkanBlend::Normal);
        if (scenario.mixedGroup) {
            const unsigned int clipX=(i/scenario.mixedGroup)%2;
            const VulkanClip clip{static_cast<int>(clipX),0,1333-static_cast<int>(clipX),600};
            ++fixture.hostCalls;
            r.SubmitQuads(q,source,true,false,blend,&clip);
            if ((i+1)%scenario.mixedGroup==0 || i+1==scenario.sprites) {
                ++fixture.hostCalls;
                r.SubmitTriangles(std::span<const VulkanVertex>(q.data(),3),source,true,false,blend,&clip);
            }
        } else Submit(fixture,q,source,blend);
    }
    if (scenario.fadeAlpha>=0)
        Submit(fixture,Quad(r.whiteTexture,0,0,1333,600,1,1,1,scenario.fadeAlpha),r.whiteTexture,VulkanBlend::Normal);
    const auto hostEnd=std::chrono::steady_clock::now();
    r.EndSceneAndPresent();
    context.WaitForFrame(); // Outside timestamp region; protects query/result reuse.
    Sample result{0,std::chrono::duration<double,std::micro>(hostEnd-hostStart).count(),
        VulkanRenderer::benchmarkSceneDraws,VulkanRenderer::benchmarkSceneTriangles,fixture.hostCalls};
    if(VulkanRenderer::benchmarkQueries) {
        unsigned long long ticks[2]{};
        Check(vkGetQueryPoolResults(VulkanContext::device,VulkanRenderer::benchmarkQueries,0,2,
            sizeof(ticks),ticks,sizeof(ticks[0]),VK_QUERY_RESULT_64_BIT),"Cannot read completed GPU timestamps");
        result.gpuUs=double((ticks[1]-ticks[0])&mask)*timestampPeriod/1000.;
    }
    return result;
}
void IndexBoundaries(Fixture& reference,Fixture& actual,VulkanContext& context) {
    for (const auto test:std::array<std::array<unsigned int,2>,4>{{{4,1},{16384,0},{16385,0},{16384,1}}}) {
        const auto capture=[&](Fixture& f) {
            auto& r=*f.renderer;
            Require(r.BeginScene(),"Boundary scene failed");
            Submit(f,Quad(r.whiteTexture,0,0,1333,600,0,0,0,1),r.whiteTexture,VulkanBlend::Opaque);
            const auto triangle=Quad(r.whiteTexture,2,2,2,2,1,0,0,1);
            if (test[1]) r.SubmitTriangles(std::span<const VulkanVertex>(triangle.data(),3),
                r.whiteTexture,false,false,VulkanBlend::Normal,nullptr);
            std::vector<VulkanVertex> vertices;
            for(unsigned int i=0;i<test[0];++i) {
                const auto q=Quad(r.whiteTexture,4,4,2,2,float(i%13)/12,float(i%7)/6,float(i%5)/4,1);
                if(f.quads) vertices.insert(vertices.end(),q.begin(),q.end());
                else for(unsigned int v:{0u,1u,2u,1u,2u,3u})vertices.push_back(q[v]);
            }
            if(f.quads)r.SubmitQuads(vertices,r.whiteTexture,false,false,VulkanBlend::Normal,nullptr);
            else r.SubmitTriangles(vertices,r.whiteTexture,false,false,VulkanBlend::Normal,nullptr);
            r.SubmitTriangles(std::span<const VulkanVertex>(triangle.data(),3),
                r.whiteTexture,false,false,VulkanBlend::Normal,nullptr);
            r.EndSceneAndPresent();context.WaitForFrame();return r.ReadScenePixels();
        };
        Require(capture(reference)==capture(actual),"16-bit boundary/mixed topology changed pixels");
        std::cout<<"PASS uint16 boundary quads="<<test[0]<<" prefix_triangle="<<test[1]<<'\n';
    }
}

void NativeSpritePixelCases(Fixture& reference,Fixture& candidate,VulkanContext& context) {
    unsigned int cases=0,maximum=0;
    for(unsigned int source=0;source<2;++source)
        for(unsigned int sampler=0;sampler<4;++sampler)
            for(unsigned int mode=0;mode<3;++mode) {
                const auto capture=[&](Fixture& fixture) {
                    auto& r=*fixture.renderer;
                    Require(r.BeginScene(),"Native pixel scene failed");
                    Submit(fixture,Quad(r.whiteTexture,0,0,1333,600,.2f,.3f,.4f,1),r.whiteTexture,VulkanBlend::Opaque);
                    auto* texture=source ? fixture.generated : fixture.raw;
                    auto q=Quad(texture,21.25f,17.75f,401.5f,299.5f,1.125f,-.125f,.875f,.55f);
                    const VulkanClip clip{45,36,333,217};
                    // Explicit shear/non-axis-aligned corners and flipped/out-of-range UVs.
                    q[0].x+=13.25f;q[1].x-=9.5f;q[2].y+=7.75f;q[3].y-=5.25f;
                    for(unsigned int i=0;i<4;++i) {
                        q[i].u=q[i].u==1 ? -.25f : 1.25f;
                        q[i].v=q[i].v==1 ? .875f : .125f;
                        q[i].sampler=sampler;
                        if(sampler==3) q[i].slot|=1u<<28;
                    }
                    if(fixture.directInstances) {
                        VulkanSpriteInstance sprite{};
                        for(unsigned int i=0;i<4;++i) {
                            sprite.positions[i*2]=q[i].x;sprite.positions[i*2+1]=q[i].y;
                            sprite.uvs[i*2]=q[i].u;sprite.uvs[i*2+1]=q[i].v;
                        }
                        sprite.color[0]=q[0].r;sprite.color[1]=q[0].g;
                        sprite.color[2]=q[0].b;sprite.color[3]=q[0].a;
                        sprite.slot=q[0].slot;sprite.sampler=q[0].sampler;
                        r.SubmitBenchmarkSprite(sprite,texture,static_cast<VulkanBlend>(mode),&clip);
                    } else r.SubmitQuads(q,texture,true,false,static_cast<VulkanBlend>(mode),&clip);
                    r.EndSceneAndPresent();context.WaitForFrame();return r.ReadScenePixels();
                };
                const auto a=capture(reference),b=capture(candidate);
                Require(a.size()==b.size(),"Native sprite pixel dimensions differ");
                for(size_t i=0;i<a.size();++i) for(unsigned int shift:{0u,8u,16u,24u})
                    maximum=std::max(maximum,unsigned(std::abs(int((a[i]>>shift)&255)-int((b[i]>>shift)&255))));
                ++cases;
            }
    std::cout<<"NATIVE_PIXELS cases="<<cases<<" max="<<maximum<<'\n';
    Require(maximum<=2,"Native sprite clip/sampling/blend/color semantics changed");
}

}
int main(int argc,char** argv) {
    try {
        bool validation=false,indexed=false,filters=false;
        unsigned int samples=32, rounds=6;
        std::filesystem::path output=std::filesystem::temp_directory_path()/"pvz-desktop-sprite-benchmark";
        for(int i=1;i<argc;++i) {
            const std::string arg=argv[i];
            if(arg=="--validate") validation=true;
            else if(arg=="--separate-blend") separateBlend=true;
            else if(arg=="--indexed-quads") indexed=true;
            else if(arg=="--tight-scene-barriers") tightBarriers=true;
            else if(arg=="--generate-index-prefix") generatePrefix=true;
            else if(arg=="--solid-fill") solidFill=true;
            else if(arg=="--present-copy") presentCopy=true;
            else if(arg=="--native-instances") {instancedQuads=true;nativeInstances=true;}
            else if(arg=="--instanced-quads") instancedQuads=true;
            else if(arg=="--discard-scene") discardScene=true;
            else if(arg=="--packed-color16") {packedColor=true;packedColor16=true;}
            else if(arg=="--packed-color") packedColor=true;
            else if(arg=="--compare-index-widths") compareIndexWidths=true;
            else if(arg.starts_with("--trim-input=")) {
                trimExperiment=true;std::ifstream input(arg.substr(13),std::ios::binary);
                unsigned int header[3]{};input.read(reinterpret_cast<char*>(header),sizeof(header));
                Require(input && header[0]==0x38564750 && header[1] && header[2] &&
                    header[1]<=16384 && header[2]<=16384,"Invalid trim fixture header");
                inputWidth=header[1];inputHeight=header[2];inputPixels.resize(size_t(inputWidth)*inputHeight);
                input.read(reinterpret_cast<char*>(inputPixels.data()),inputPixels.size()*4);
                Require(bool(input),"Truncated trim fixture");
                unsigned int left=inputWidth,top=inputHeight,right=0,bottom=0;
                for(unsigned int y=0;y<inputHeight;++y)for(unsigned int x=0;x<inputWidth;++x)
                    if(inputPixels[size_t(y)*inputWidth+x]>>24) {
                        left=std::min(left,x);top=std::min(top,y);right=std::max(right,x+1);bottom=std::max(bottom,y+1);
                    }
                Require(right>left && bottom>top,"Empty trim fixture");
                if(left) --left;if(top) --top;
                right=std::min(right+1,inputWidth);bottom=std::min(bottom+1,inputHeight);
                trimBounds={float(left)/inputWidth,float(top)/inputHeight,float(right)/inputWidth,float(bottom)/inputHeight};
            }
            else if(arg=="--baked-filters") filters=true;
            else if(arg=="--bake-format=rgba16f") bakeFormat=VK_FORMAT_R16G16B16A16_SFLOAT;
            else if(arg=="--bake-format=rgba8") bakeFormat=VK_FORMAT_R8G8B8A8_UNORM;
            else if(arg=="--bake-format=rgba8-manual") {bakeFormat=VK_FORMAT_R8G8B8A8_UNORM;manualBaked=true;}
            else if(arg.starts_with("--vendor=")) vendor=std::stoul(arg.substr(9),nullptr,0);
            else if(arg.starts_with("--samples=")) samples=std::stoul(arg.substr(10));
            else if(arg.starts_with("--rounds=")) rounds=std::stoul(arg.substr(9));
            else if(arg.starts_with("--output=")) output=arg.substr(9);
            else throw std::runtime_error("Unknown benchmark option");
        }
        Require(samples && rounds,"Nonempty measurements required");
        Require(unsigned(indexed)+unsigned(filters)+unsigned(compareIndexWidths)+unsigned(trimExperiment)+unsigned(packedColor)+unsigned(discardScene)+unsigned(instancedQuads)+unsigned(tightBarriers)+unsigned(presentCopy)+unsigned(solidFill)+unsigned(generatePrefix)+unsigned(separateBlend)<=1,"Select one experiment at a time");
        const std::span<const Scenario> cases=separateBlend ? std::span<const Scenario>(blendScenarios) : generatePrefix ? std::span<const Scenario>(prefixScenarios) : solidFill ? std::span<const Scenario>(fadeScenarios) : presentCopy ? std::span<const Scenario>(presentScenarios) : instancedQuads ? std::span<const Scenario>(instanceScenarios) :
            trimExperiment ? std::span<const Scenario>(trimScenarios) :
            compareIndexWidths ? std::span<const Scenario>(largeScenarios) : std::span<const Scenario>(scenarios);
        std::filesystem::create_directories(output);
        std::cout<<std::unitbuf;
        VulkanTest::Window native(64,64);
        VulkanInitConfig init;
        init.enableValidation=validation;init.debugCallback=Validate;init.gpuFilter=Select;
        VulkanContext context(init,native.hwnd,VulkanTest::SwapchainConfig());
        Require(context.dualSourceBlendEnabled,"This experiment needs dualSrcBlend");
        VkPhysicalDeviceProperties properties{};
        vkGetPhysicalDeviceProperties(context.physicalDevice,&properties);
        unsigned int count=0;vkGetPhysicalDeviceQueueFamilyProperties(context.physicalDevice,&count,nullptr);
        std::vector<VkQueueFamilyProperties> queues(count);
        vkGetPhysicalDeviceQueueFamilyProperties(context.physicalDevice,&count,queues.data());
        const auto bits=queues[context.graphicsFamily].timestampValidBits;
        Require(bits>0,"Graphics timestamps unsupported");
        const auto mask=bits==64 ? ~0ull : (1ull<<bits)-1;
        const auto period=properties.limits.timestampPeriod;
        std::ofstream metadata(output/"metadata.json");
        metadata<<"{\"gpu\":"<<std::quoted(properties.deviceName)<<",\"vendor\":"<<properties.vendorID
            <<",\"device\":"<<properties.deviceID<<",\"driver_version\":"<<properties.driverVersion
            <<",\"timestamp_period_ns\":"<<period<<",\"valid_bits\":"<<bits
            <<",\"validation\":"<<(validation?"true":"false")
            <<",\"tight_scene_barriers\":"<<(tightBarriers?"true":"false")
            <<",\"separate_blend\":"<<(separateBlend?"true":"false")
            <<",\"generate_index_prefix\":"<<(generatePrefix?"true":"false")
            <<",\"solid_fill_experiment\":"<<(solidFill?"true":"false")
            <<",\"present_copy_experiment\":"<<(presentCopy?"true":"false")
            <<",\"native_instances\":"<<(nativeInstances?"true":"false")
            <<",\"instanced_quads\":"<<(instancedQuads?"true":"false")
            <<",\"discard_scene\":"<<(discardScene?"true":"false")
            <<",\"packed_color_bits\":"<<(packedColor16?16:packedColor?8:32)
            <<",\"packed_color\":"<<(packedColor?"true":"false")
            <<",\"trim_experiment\":"<<(trimExperiment?"true":"false")
            <<",\"trim_bounds\":["<<trimBounds[0]<<','<<trimBounds[1]<<','<<trimBounds[2]<<','<<trimBounds[3]<<']'
            <<",\"compare_index_widths\":"<<(compareIndexWidths?"true":"false")
            <<",\"manual_filter_sampling\":"<<(manualBaked?"true":"false")
            <<",\"bake_format_vk\":"<<unsigned(bakeFormat)
            <<",\"baked_filter_experiment\":"<<(filters?"true":"false")
            <<",\"indexed_experiment\":"<<(indexed?"true":"false")
            <<",\"clocks_controlled\":false,\"width\":1333,\"height\":600,\"scene_format\":\"BGRA8\"}\n";
        std::cout<<"GPU "<<properties.deviceName<<" period_ns="<<period<<" validation="<<validation<<'\n';
        {
            auto baseline=MakeFixture(context,false,indexed,filters),candidate=MakeFixture(context,true,indexed,filters);
            bool pixelContractPassed=true;
            std::ofstream pixels(output/"pixels.csv");pixels<<"scenario,max_channel_difference,changed_pixels\n";
            for(const auto& scenario:cases) {
                Draw(baseline,context,scenario,period,mask);
                const auto reference=baseline.renderer->ReadScenePixels();
                Draw(candidate,context,scenario,period,mask);
                const auto actual=candidate.renderer->ReadScenePixels();
                unsigned int maximum=0,changed=0;
                Require(reference.size()==actual.size(),"Pixel dimensions differ");
                for(size_t i=0;i<reference.size();++i) {
                    changed+=reference[i]!=actual[i];
                    for(unsigned int shift:{0u,8u,16u,24u})maximum=std::max(maximum,
                        unsigned(std::abs(int((reference[i]>>shift)&255)-int((actual[i]>>shift)&255))));
                }
                pixels<<scenario.name<<','<<maximum<<','<<changed<<'\n';
                std::cout<<"PIXELS "<<scenario.name<<" max="<<maximum<<" changed="<<changed<<'\n';
                pixelContractPassed &= maximum<=2;
            }
            pixels.flush();
            std::cout<<"PIXEL_CONTRACT passed="<<pixelContractPassed<<" validation_errors="<<validationErrors.load()<<'\n';
            Require(pixelContractPassed,"Candidate differs from the current renderer pixel contract (all scenarios recorded)");
            if(indexed || generatePrefix) IndexBoundaries(baseline,candidate,context);
            if(nativeInstances) NativeSpritePixelCases(baseline,candidate,context);
            if(!validation) {
                VkQueryPoolCreateInfo info{VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO};
                info.queryType=VK_QUERY_TYPE_TIMESTAMP;info.queryCount=2;
                Check(vkCreateQueryPool(context.device,&info,nullptr,&VulkanRenderer::benchmarkQueries),"Query pool failed");
                std::ofstream csv(output/"samples.csv");
                csv<<"scenario,round,path,sample,gpu_scene_us,host_submit_calls_us,scene_draws,scene_triangles,host_submit_calls\n";
                csv<<std::setprecision(12);
                for(const auto& scenario:cases) {
                    for(unsigned int i=0;i<24;++i) {
                        Draw(baseline,context,scenario,period,mask);Draw(candidate,context,scenario,period,mask);
                    }
                    for(unsigned int round=0;round<rounds;++round) {
                        // Alternate AB and BA blocks to reduce monotonic warm-up bias.
                        for(unsigned int position=0;position<2;++position) {
                            const bool b=(position^(round&1))!=0;
                            for(unsigned int sample=0;sample<samples;++sample) {
                                const auto result=Draw(b?candidate:baseline,context,scenario,period,mask);
                                csv<<scenario.name<<','<<round<<','<<(b?'B':'A')<<','<<sample<<','
                                    <<result.gpuUs<<','<<result.hostSubmitUs<<','<<result.draws<<','<<result.triangles<<','<<result.hostSubmitCalls<<'\n';
                            }
                        }
                        std::cout<<"DONE "<<scenario.name<<" round="<<round<<'\n';
                    }
                }
                vkDestroyQueryPool(context.device,VulkanRenderer::benchmarkQueries,nullptr);
                VulkanRenderer::benchmarkQueries=VK_NULL_HANDLE;
            }
        }
        Require(validationErrors.load()==0,"Validation errors occurred");
        std::cout<<"PASS pixel correctness; validation_errors="<<validationErrors<<" output="<<output<<'\n';
        return 0;
    } catch(const std::exception& e) {
        std::cerr<<"FAIL "<<e.what()<<'\n';return 1;
    }
}
