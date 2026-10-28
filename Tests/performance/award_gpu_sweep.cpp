// Isolated desktop experiment. Link the runtime with sexy_vulkan_sprite_experiment.lib.
// All simulation states are shared by drawing ablations; no gameplay update is run.
#include "LawnApp.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/graphics/vulkan/VulkanRenderer.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/Definition.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <vector>

bool AwardFixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = AwardFixtureCloseRequest;
namespace {
using namespace Sexy;
constexpr int Width=1333,Height=600;
void Require(bool value,const char* message) { if(!value) throw std::runtime_error(message); }
class TestApp final: public LawnApp {
public:
    void ButtonPress(int) override {} void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {} void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {} void ButtonMouseMove(int,int,int) override {}
};
struct HiddenWindow {
    HWND handle{};
    HiddenWindow() {
        WNDCLASSW wc{};wc.lpfnWndProc=DefWindowProcW;wc.hInstance=GetModuleHandleW(nullptr);
        wc.lpszClassName=L"PvzAwardGpuSweep";
        Require(RegisterClassW(&wc)!=0,"Cannot register hidden window");
        handle=CreateWindowExW(0,wc.lpszClassName,L"Award GPU sweep",WS_POPUP,
            0,0,64,64,nullptr,nullptr,wc.hInstance,nullptr);
        Require(handle!=nullptr,"Cannot create hidden window");
    }
    ~HiddenWindow() { DestroyWindow(handle);UnregisterClassW(L"PvzAwardGpuSweep",GetModuleHandleW(nullptr)); }
};
enum Mode { Full,NoGlow,NoRays,None };
constexpr const char* Names[]{"full","no_glow","no_rays","no_award"};
bool Selected(TodParticleEmitter* emitter,int mode) {
    const auto name=emitter->mEmitterDef->mNameId;
    return mode!=None && !(mode==NoGlow && name==ParticleEmitterName::awardglow) &&
        !(mode==NoRays && name>=ParticleEmitterName::awardray1 && name<=ParticleEmitterName::awardray8);
}
void DrawAward(TodParticleSystem& system,Graphics& graphics,int mode,bool manual) {
    if(!manual && mode==Full) { system.Draw(&graphics);return; }
    for(int e=0;e<system.EmitterRosterCount();++e) {
        auto* emitter=system.EmitterRosterEmitterAt(e);
        if(Selected(emitter,mode)) emitter->Draw(&graphics);
    }
}
struct Coverage { int active{},drawn{};double quadArea{},clippedAabbArea{}; };
// Sum of clipped AABBs is an explicitly conservative coverage proxy. It counts
// overlapping layers repeatedly and includes transparent texels; it is not GPU work.
Coverage Measure(TodParticleSystem& system,int mode,std::ostream& emitterLog,int second) {
    Coverage total;
    for(int e=0;e<system.EmitterRosterCount();++e) {
        auto* emitter=system.EmitterRosterEmitterAt(e);
        Coverage row;row.active=emitter->ParticleRosterCount();total.active+=row.active;
        float largestScale=0;int sourceWidth=0,sourceHeight=0;
        for(int p=0;p<emitter->ParticleRosterCount();++p) {
            auto* particle=emitter->ParticleRosterParticleAt(p);ParticleRenderParams params{};
            if(!Selected(emitter,mode) || particle->mCrossFadeDurationNs>0 ||
                !TodParticleEmitter::GetRenderParams(particle,&params) || params.mAlpha<=0 ||
                emitter->mEmitterDef->mImageRectCount==0) continue;
            const auto& region=system.mParticleDef->mImageRects[
                system.mVariant*system.mParticleDef->mImageRectCount+emitter->mEmitterDef->mImageRectOffset];
            sourceWidth=region.mWidth;sourceHeight=region.mHeight;
            const double w=std::abs(region.mWidth*params.mParticleScale);
            const double h=std::abs(region.mHeight*params.mParticleScale*params.mParticleStretch);
            const double c=std::abs(std::cos(params.mSpinPosition)),s=std::abs(std::sin(params.mSpinPosition));
            const double aw=c*w+s*h,ah=s*w+c*h;
            const double cw=std::max(0.,std::min(double(Width),params.mPosX+aw/2)-std::max(0.,params.mPosX-aw/2));
            const double ch=std::max(0.,std::min(double(Height),params.mPosY+ah/2)-std::max(0.,params.mPosY-ah/2));
            ++row.drawn;row.quadArea+=w*h;row.clippedAabbArea+=cw*ch;
            largestScale=std::max(largestScale,params.mParticleScale);
        }
        total.drawn+=row.drawn;total.quadArea+=row.quadArea;total.clippedAabbArea+=row.clippedAabbArea;
        emitterLog<<second<<','<<Names[mode]<<','<<int(emitter->mEmitterDef->mNameId)<<','<<row.active<<','
            <<row.drawn<<','<<sourceWidth<<','<<sourceHeight<<','<<largestScale<<','<<row.quadArea<<','
            <<row.clippedAabbArea<<'\n';
    }
    return total;
}
double Render(TestApp& app,TodParticleSystem& system,int mode,int second,bool fade,
    bool manual,double period,std::uint64_t mask) {
    auto& render=*app.mDDInterface->mRenderInterface;
    Graphics graphics(app.mDDInterface->mScreenImage);
    graphics.mColor=Color(25,40,55,255);graphics.FillRect(Rect(0,0,Width,Height));
    // Fixed modest contrast background reveals white/additive appearance without
    // recreating a game's workload. Identical in every case and included in timing.
    for(int x=0;x<Width;x+=100) {
        graphics.mColor=Color(45,65,80,255);graphics.FillRect(Rect(x,0,4,Height));
    }
    DrawAward(system,graphics,mode,manual);
    if(fade) {
        const int alpha=std::clamp((second-4)*255/2,0,255);
        graphics.mColor=Color(255,255,255,alpha);graphics.FillRect(Rect(0,0,Width,Height));
    }
    render.Flush(); // Experimental renderer submits offscreen and waits imageFence.
    std::uint64_t ticks[2]{};
    Require(vkGetQueryPoolResults(VulkanContext::device,VulkanRenderer::benchmarkQueries,0,2,
        sizeof(ticks),ticks,sizeof(ticks[0]),VK_QUERY_RESULT_64_BIT)==VK_SUCCESS,"GPU queries unavailable");
    return double((ticks[1]-ticks[0])&mask)*period/1000.;
}
void Run(TestApp& app,const char* pak,const std::filesystem::path& output,int samples) {
    Require(gPakInterface && gPakInterface->AddPakFile(pak),"Cannot mount production package");
    TodParticleLoadDefinitions(gLawnParticleArray,ParticleEffect::NUM_PARTICLES);
    struct CatalogCleanup { ~CatalogCleanup(){ TodParticleFreeDefinitions();DefinitionFreeAtlasImages(); } } catalogs;
    auto& render=*app.mDDInterface->mRenderInterface;render.ResizeScene(Width,Height);
    app.mDDInterface->mScreenImage->mWidth=Width;app.mDDInterface->mScreenImage->mHeight=Height;
    VkPhysicalDeviceProperties properties{};vkGetPhysicalDeviceProperties(VulkanContext::physicalDevice,&properties);
    uint32_t queueCount=0;vkGetPhysicalDeviceQueueFamilyProperties(VulkanContext::physicalDevice,&queueCount,nullptr);
    std::vector<VkQueueFamilyProperties> queues(queueCount);
    vkGetPhysicalDeviceQueueFamilyProperties(VulkanContext::physicalDevice,&queueCount,queues.data());
    auto bits=queues[VulkanContext::graphicsFamily].timestampValidBits;Require(bits!=0,"No GPU timestamps");
    const auto mask=bits==64?UINT64_MAX:(uint64_t(1)<<bits)-1;
    VkQueryPoolCreateInfo query{VK_STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO};query.queryType=VK_QUERY_TYPE_TIMESTAMP;query.queryCount=2;
    Require(vkCreateQueryPool(VulkanContext::device,&query,nullptr,&VulkanRenderer::benchmarkQueries)==VK_SUCCESS,"Cannot create query pool");
    struct QueryCleanup { ~QueryCleanup(){vkDestroyQueryPool(VulkanContext::device,VulkanRenderer::benchmarkQueries,nullptr);VulkanRenderer::benchmarkQueries=VK_NULL_HANDLE;} } queryCleanup;
    std::ofstream raw(output/"raw.csv"),summary(output/"summary.csv"),emitters(output/"emitters.csv"),meta(output/"metadata.txt");
    raw<<"second,mode,board_fade,iteration,gpu_us,draws\n";
    summary<<"second,mode,board_fade,active_particles,drawn_particles,quad_area,clipped_aabb_area,gpu_median_us,gpu_p95_us,draws\n";
    emitters<<"second,mode,emitter_name_id,active,drawn,source_width,source_height,max_scale,quad_area,clipped_aabb_area\n";
    meta<<"device="<<properties.deviceName<<"\ndriver="<<properties.driverVersion<<"\ncanvas="<<Width<<'x'<<Height
        <<"\nformat=BGRA8_UNORM main scene (HDR disabled)\nclock=CPU 10ms steps; identical frozen state for all ablations"
        <<"\ncoverage=unclipped quad sum and sum of viewport-clipped rotated AABB areas; overlap counted repeatedly"
        <<"\nGPU=TOP to BOTTOM offscreen elapsed, includes pipeline stalls, excludes WSI; frequency not locked"
        <<"\nbackground=fixed dark color and vertical bars; no live game scene\n";
    TodParticleData data;data.Initialize();TodParticleHolder holder(&data);
    struct PoolCleanup {TodParticleData& data;~PoolCleanup(){data.Dispose();}} poolCleanup{data};
    Sexy::SRand(123456);
    auto* system=holder.AllocParticleSystem(Width*.5f,Height*.5f,0,ParticleEffect::PARTICLE_SEED_PACKET_PICKUP);
    Require(system!=nullptr,"Cannot allocate Award");
    int ageTicks=0;
    for(int second=1;second<=6;++second) {
        while(ageTicks<second*100) {system->Update(10'000'000);++ageTicks;}
        Render(app,*system,Full,second,false,false,properties.limits.timestampPeriod,mask);
        const auto reference=render.mRenderer->ReadScenePixels();
        Render(app,*system,Full,second,false,true,properties.limits.timestampPeriod,mask);
        Require(reference==render.mRenderer->ReadScenePixels(),"Manual emitter traversal differs from system Draw");
        std::cout<<"PASS manual draw equality at "<<second<<"s\n";
        std::array<std::vector<double>,8> timings;
        std::array<Coverage,4> coverage;
        std::array<unsigned,8> draws{};
        for(int mode=0;mode<4;++mode) coverage[mode]=Measure(*system,mode,emitters,second);
        for(int iteration=-20;iteration<samples;++iteration) {
            // Rotate case order each round to reduce systematic frequency drift.
            for(int k=0;k<8;++k) {
                const int index=(k+iteration+24)%8,mode=index%4;const bool fade=index>=4;
                const double us=Render(app,*system,mode,second,fade,true,properties.limits.timestampPeriod,mask);
                draws[index]=VulkanRenderer::benchmarkSceneDraws;
                if(iteration>=0) {timings[index].push_back(us);raw<<second<<','<<Names[mode]<<','<<fade<<','<<iteration<<','<<us<<','<<draws[index]<<'\n';}
            }
        }
        for(int index=0;index<8;++index) {
            const int mode=index%4;const bool fade=index>=4;
            Render(app,*system,mode,second,fade,true,properties.limits.timestampPeriod,mask);
            const auto pixels=render.mRenderer->ReadScenePixels();
            const auto png=output/(std::to_string(second)+"s_"+Names[mode]+(fade?"_fade.png":".png"));
            Require(ImageLib::WritePNGImage(png.string(),Width,Height,pixels),"Cannot write screenshot");
            auto& values=timings[index];std::sort(values.begin(),values.end());const auto& c=coverage[mode];
            summary<<second<<','<<Names[mode]<<','<<fade<<','<<c.active<<','<<c.drawn<<','<<c.quadArea<<','<<c.clippedAabbArea
                <<','<<values[values.size()/2]<<','<<values[(values.size()-1)*95/100]<<','<<draws[index]<<'\n';
        }
        std::cout<<"Finished frozen "<<second<<"s state\n";
    }
}
}
int main(int argc,char** argv) {
    std::cout<<std::unitbuf;
    SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX|SEM_NOOPENFILEERRORBOX);
    try {
        Require(argc>=3,"Usage: award_gpu_sweep main.pak64 output-directory [samples]");
        std::filesystem::create_directories(argv[2]);HiddenWindow window;TestApp app;gLawnApp=&app;
        app.mPrimaryThreadId=CurrentNativeThreadIdentity();app.mScaleHDREnabled=false;app.mReadFromRegistry=false;
        app.mWidth=Width;app.mHeight=Height;
        VulkanInitConfig init{};init.appInfo.pApplicationName="Award GPU sweep";
        VkSwapchainCreateInfoKHR swapchain{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};
        swapchain.imageFormat=VK_FORMAT_B8G8R8A8_UNORM;swapchain.imageColorSpace=VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
        swapchain.imageUsage=VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;swapchain.compositeAlpha=VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR;
        swapchain.presentMode=VK_PRESENT_MODE_FIFO_KHR;swapchain.clipped=VK_TRUE;
        app.mGpuContext=std::make_unique<GpuContext>(init,window.handle,swapchain);
        app.mDDInterface=new DDInterface(&app);
        Require(app.mDDInterface->Init(window.handle,true)==DDInterface::RESULT_OK,"Cannot initialize renderer");
        Run(app,argv[1],argv[2],argc>3?std::max(10,std::atoi(argv[3])):120);
        std::cout<<"PASS Award sweep\n";
    } catch(const std::exception& error) {std::cerr<<"FAIL Award sweep: "<<error.what()<<'\n';return 1;}
}
