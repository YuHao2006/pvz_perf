#include "VulkanRenderer.h"
#include "TestWin32Window.h"
#include "VulkanSurfaceExtent.h"
#include <array>
#include <algorithm>
#include <atomic>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <filesystem>
#include <string>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("render-test-output");
    path=std::string("render-test-output/")+name;
    return path.c_str();
}
}
namespace {
std::atomic<unsigned> validationErrors = 0;
VkBool32 VKAPI_CALL Validation(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types, const VkDebugUtilsMessengerCallbackDataEXT* data, void* user) {
    if (severity >= VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++validationErrors;
    return VulkanInitConfig::DefaultDebugCallback(severity, types, data, user);
}
void Require(bool value, const char* message) {
    if (!value) throw std::runtime_error(message);
}
template<class Vertices>
void EncodeSource(Vertices& vertices,Sexy::VulkanTexture* texture,bool linear,bool wrap) {
    const auto slot=Sexy::VulkanRenderer::SlotOf(texture);
    const uint32_t sampler=(linear?1u:0u)|(wrap?2u:0u);
    for(auto& vertex:vertices) {vertex.slot=slot;vertex.sampler=sampler;}
}
template<class Vertices>
void SubmitImage(Sexy::VulkanRenderer& renderer,Vertices vertices,Sexy::VulkanTexture* texture,
    bool linear,bool wrap,Sexy::VulkanBlend blend,const Sexy::VulkanClip* clip=nullptr) {
    EncodeSource(vertices,texture,linear,wrap);
    renderer.SubmitTriangles(vertices,texture,linear,wrap,blend,clip);
}
template<class Vertices>
void SubmitCoverage(Sexy::VulkanRenderer& renderer,Vertices vertices,Sexy::VulkanTexture* mask,
    Sexy::VulkanBlend blend,const Sexy::VulkanClip* clip=nullptr) {
    EncodeSource(vertices,mask,false,false);
    renderer.SubmitCoverageTriangles(vertices,mask,blend,clip);
}
auto Quad(float x, float y, float w, float h, float r=1, float g=1, float b=1, float a=1,
          float u1=0, float v1=0, float u2=1, float v2=1) {
    return std::array<Sexy::VulkanVertex, 6>{{
        {x,y,r,g,b,a,u1,v1},{x+w,y,r,g,b,a,u2,v1},{x+w,y+h,r,g,b,a,u2,v2},
        {x,y,r,g,b,a,u1,v1},{x+w,y+h,r,g,b,a,u2,v2},{x,y+h,r,g,b,a,u1,v2}}};
}
void Pixel(const std::vector<uint32_t>& pixels, int x, int y, uint32_t expected, int tolerance=0) {
    const uint32_t actual = pixels.at(size_t(y)*800+x);
    for (int shift = 0; shift <= 24; shift += 8)
        if (std::abs(int((actual >> shift) & 255)-int((expected >> shift) & 255)) > tolerance) {
            std::cerr << "pixel " << x << ',' << y << ": actual 0x" << std::hex << actual
                      << " expected 0x" << expected << std::dec << '\n';
            throw std::runtime_error("Pixel mismatch");
        }
}
void CanvasHash(const std::vector<uint32_t>& pixels,const char* label) {
    uint64_t hash=14695981039346656037ull;
    for (auto pixel:pixels) for (unsigned shift=0;shift<32;shift+=8)
        hash=(hash^((pixel>>shift)&255))*1099511628211ull;
    std::cout<<"canvas hash "<<label<<"="<<std::hex<<hash<<std::dec<<'\n';
}
void CoveragePixels(Sexy::VulkanRenderer& renderer) {
    using namespace Sexy;
    Require(renderer.BeginScene(),"Cannot test GPU byte coverage");
    SubmitImage(renderer,Quad(0,100,256,256,0,0,0),renderer.whiteTexture,false,false,VulkanBlend::Opaque);
    std::array<uint8_t,256> ramp{};
    for(unsigned i=0;i<ramp.size();++i) ramp[i]=uint8_t(i);
    auto* mask=renderer.CreateCoverageMask(256,1,ramp,256);
    ramp.fill(0);
    std::vector<VulkanVertex> rows;
    for(int alpha=0;alpha<256;++alpha) {
        const auto row=Quad(0,float(100+alpha),256,1,1,1,1,alpha/255.0f);
        rows.insert(rows.end(),row.begin(),row.end());
    }
    SubmitCoverage(renderer,rows,mask,VulkanBlend::Normal);
    renderer.DestroyTexture(mask); // Its queued upload/draw must both survive.
    renderer.EndSceneAndPresent();
    auto pixels=renderer.ReadScenePixels();
    for(unsigned alpha=0;alpha<256;++alpha) for(unsigned cover=0;cover<256;++cover) {
        const auto value=((cover+1)*alpha)>>8;
        Pixel(pixels,int(cover),100+int(alpha),0xff000000u|value*0x010101u);
    }

    Require(renderer.BeginScene(),"Cannot test odd R8 pitch/alignment and pipeline state");
    SubmitImage(renderer,Quad(298,99,7,6,0,0,32/255.0f),renderer.whiteTexture,false,false,VulkanBlend::Opaque);
    std::array<uint8_t,15> bytes{0,64,255,237,238,128,192,32,237,238,255,0,127,237,238};
    mask=renderer.CreateCoverageMask(3,3,bytes,5);
    const uint32_t magenta=0xffff00ff;
    auto* image=renderer.CreateTexture(1,1,&magenta,4); // Must start after aligned 9-byte mask.
    bytes.fill(0);
    const VulkanClip clip{300,101,2,2};
    SubmitCoverage(renderer,Quad(299,100,3,3),mask,VulkanBlend::Additive,&clip);
    SubmitImage(renderer,Quad(310,100,1,1),image,false,false,VulkanBlend::Opaque);
    SubmitCoverage(renderer,Quad(311,100,3,3),mask,VulkanBlend::Normal);
    bool rejected=false;
    try {SubmitCoverage(renderer,Quad(0,0,1,1),renderer.whiteTexture,VulkanBlend::Normal);}
    catch(const std::invalid_argument&) {rejected=true;}
    Require(rejected,"Coverage draw accepted a non-mask texture");
    renderer.DestroyTexture(mask);renderer.DestroyTexture(image);
    renderer.EndSceneAndPresent();
    pixels=renderer.ReadScenePixels();
    Pixel(pixels,300,101,0xffc0c0e0);Pixel(pixels,301,101,0xff202040);
    Pixel(pixels,300,102,0xff000020);Pixel(pixels,301,102,0xff7f7f9f);
    Pixel(pixels,299,101,0xff000020);Pixel(pixels,310,100,magenta);Pixel(pixels,313,100,0xffffffff);
    rejected=false;
    try {renderer.CreateCoverageMask(3,3,std::span<const uint8_t>(bytes.data(),8),3);}
    catch(const std::invalid_argument&) {rejected=true;}
    Require(rejected,"Coverage upload accepted a short source buffer");
    Require(renderer.BeginScene(),"Cannot retire coverage mask resources");
    renderer.EndSceneAndPresent();
    Require(renderer.GetResourceCounts().textures==1 && !renderer.GetResourceCounts().retiredTextures,
        "Coverage drawing leaked transient mask resources");
    std::cout<<"PASS GPU coverage: all 65536 byte/alpha pairs exact, odd R8 pitch+BGRA alignment, source snapshot, clip/additive/pipeline switching, retirement\n";
}
void DynamicUpdates(Sexy::VulkanRenderer& renderer,VulkanContext& window) {
    using namespace Sexy;
    auto color=0xff123456u;
    auto* texture=renderer.CreateTexture(1,1,&color,4);
    auto* identity=texture;
    const auto resources=renderer.GetResourceCounts();
    for (int frame=0;frame<24;++frame) {
        Require(renderer.BeginScene(),"Cannot test dynamic texture reuse");
        color=0xff000000u|uint32_t((frame+1)*0x030609);
        texture=renderer.ReplaceTexture(texture,1,1,&color,4);
        Require(texture==identity,"Dynamic texture reallocates its GPU image every frame");
        const auto expected=color;
        color=0xffdeadbe; // Update must snapshot caller data immediately.
        SubmitImage(renderer,Quad(1,90,1,1),texture,false,false,VulkanBlend::Opaque);
        renderer.EndSceneAndPresent();
        Pixel(renderer.ReadScenePixels(),1,90,expected);
        Require(renderer.GetResourceCounts().textures==resources.textures,
            "In-place update leaked texture handles");
        Require(renderer.GetResourceCounts().retiredTextures==0,"In-place update retires GPU resources");
    }

    Require(renderer.BeginScene(),"Cannot test same-frame texture versions");
    color=0xffff0000;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    SubmitImage(renderer,Quad(3,90,1,1),texture,false,false,VulkanBlend::Opaque);
    auto* red=texture;
    color=0xff00ff00;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    Require(texture!=red,"Replacement overwrites an already recorded draw");
    SubmitImage(renderer,Quad(5,90,1,1),texture,false,false,VulkanBlend::Opaque);
    auto* green=texture;
    color=0xff0000ff;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    Require(texture!=green,"Second replacement overwrites an already recorded draw");
    SubmitImage(renderer,Quad(7,90,1,1),texture,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    auto pixels=renderer.ReadScenePixels();
    Pixel(pixels,3,90,0xffff0000);Pixel(pixels,5,90,0xff00ff00);Pixel(pixels,7,90,0xff0000ff);

    // Consecutive unsampled versions need only one pending snapshot/copy.
    Require(renderer.BeginScene(),"Cannot test update coalescing");
    identity=texture;
    color=0xffabcdef;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    color=0xff102030;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    color=0;
    Require(texture==identity && renderer.GetTextureUploadState().pending==1,"Unsampled updates not coalesced");
    SubmitImage(renderer,Quad(9,90,1,1),texture,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    Pixel(renderer.ReadScenePixels(),9,90,0xff102030);
    Require(!renderer.GetTextureUploadState().pending,"Coalesced update remained queued after presentation");

    // Submit, then immediately replace outside a frame without a CPU readback.
    Require(renderer.BeginScene(),"Cannot test out-of-frame update");
    SubmitImage(renderer,Quad(11,90,1,1),texture,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    color=0xffff00ff;
    identity=texture;
    texture=renderer.ReplaceTexture(texture,1,1,&color,4);
    Require(texture==identity,"Out-of-frame replacement needlessly reallocates");
    // Fill the arena so the replacement is actually submitted before the next
    // BeginScene fence wait. Its barrier must wait for the preceding draw.
    {
        std::vector<uint32_t> fill(1024*1024,0xff304050);
        auto* unused=renderer.CreateTexture(1024,1024,fill.data(),1024*4);
        renderer.DestroyTexture(unused);
    }
    Require(renderer.BeginScene(),"Cannot finish out-of-frame update");
    SubmitImage(renderer,Quad(13,90,1,1),texture,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    pixels=renderer.ReadScenePixels();
    Pixel(pixels,11,90,0xff102030);Pixel(pixels,13,90,0xffff00ff);

    // Extent/view-alpha changes require a new image or immutable image view.
    Require(renderer.BeginScene(),"Cannot test resized/opaque update");
    std::array<uint32_t,6> source{0x00112233,0x00445566,0xffbadbad,0x00778899,0x00aabbcc,0xffbadbad};
    identity=texture;
    texture=renderer.ReplaceTexture(texture,2,2,source.data(),3*4);
    Require(texture!=identity,"Resized texture kept incompatible GPU extent");
    identity=texture;
    texture=renderer.ReplaceTexture(texture,2,2,source.data(),3*4,true);
    Require(texture!=identity,"Opaque replacement kept transparent-alpha image view");
    source.fill(0);
    SubmitImage(renderer,Quad(15,90,2,2),texture,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    pixels=renderer.ReadScenePixels();
    Pixel(pixels,15,90,0xff112233);Pixel(pixels,16,90,0xff445566);
    Pixel(pixels,15,91,0xff778899);Pixel(pixels,16,91,0xffaabbcc);

    bool rejected=false;
    try {renderer.ReplaceTexture(texture,2,2,&color,4,true);} catch(const std::invalid_argument&) {rejected=true;}
    Require(rejected,"Invalid replacement row pitch was accepted");
    rejected=false;
    try {renderer.ReplaceTexture(renderer.whiteTexture,1,1,&color,4);} catch(const std::invalid_argument&) {rejected=true;}
    Require(rejected,"Renderer-owned white texture can be replaced");

    VulkanTest::Window::Minimized(window.hwnd,true);
    source.fill(0x00402010);
    identity=texture;
    texture=renderer.ReplaceTexture(texture,2,2,source.data(),3*4,true);
    Require(texture==identity && !renderer.BeginScene(),"Suspended replacement did not stay queued");
    renderer.DestroyTexture(texture);
    VulkanTest::Window::Minimized(window.hwnd,false);
    Require(renderer.BeginScene(),"Cannot retire suspended dynamic texture");
    renderer.EndSceneAndPresent();
    Require(renderer.ReadScenePixels()==pixels,"Destroying suspended update changed retained scene");
    Require(renderer.GetResourceCounts().textures==1,"Dynamic texture versions leaked");
    std::cout<<"PASS dynamic textures: 24 frames with stable handles and no retired textures; same-frame versions, coalescing, pitch, resize, alpha, suspension\n";
}
void UploadEdges(Sexy::VulkanRenderer& renderer,VulkanContext& window) {
    using namespace Sexy;
    Require(renderer.BeginScene(),"Cannot test queued texture snapshots");
    std::array<std::array<uint32_t,6>,32> expected{};
    for (int i=0;i<32;++i) {
        std::array<uint32_t,10> source{};
        source.fill(0xffffffff); // Padding is not part of the image.
        for (int y=0;y<2;++y) for (int x=0;x<3;++x) {
            const auto pixel=0xff000000u|uint32_t((i+1)*0x40300+(y*3+x)*0x1001);
            expected[i][y*3+x]=pixel;source[y*5+x]=pixel;
        }
        auto* texture=renderer.CreateTexture(3,2,source.data(),5*4);
        source.fill(0xffdeadbe); // Caller storage changes before GPU submission.
        SubmitImage(renderer,Quad(float(4*i),80,3,2),texture,false,false,VulkanBlend::Opaque);
        renderer.DestroyTexture(texture); // Both pending copy and draw must survive.
    }
    Require(renderer.GetTextureUploadState().pending==32,"Small uploads were not deferred into one batch");
    renderer.EndSceneAndPresent();
    auto pixels=renderer.ReadScenePixels();
    for (int i=0;i<32;++i) for (int y=0;y<2;++y) for (int x=0;x<3;++x)
        Pixel(pixels,4*i+x,80+y,expected[i][y*3+x]);
    Require(!renderer.GetTextureUploadState().pending,
        "Padded source snapshot batch was not completed");

    Require(renderer.BeginScene(),"Cannot test upload arena overflow");
    const auto baseline=renderer.GetTextureUploadState();
    std::array<uint32_t,5> colors{};
    for (int i=0;i<5;++i) {
        colors[i]=0xff000000u|uint32_t((i+1)*0x203040);
        std::vector<uint32_t> source(512*512,colors[i]); // 1 MiB each; fifth starts a new batch.
        auto* texture=renderer.CreateTexture(512,512,source.data(),512*4);
        SubmitImage(renderer,Quad(float(150+3*i),80,2,2),texture,false,false,VulkanBlend::Opaque);
        renderer.DestroyTexture(texture);
    }
    auto after=renderer.GetTextureUploadState();
    Require(after.pending==1,"Arena overflow did not flush at its capacity");
    renderer.EndSceneAndPresent();
    pixels=renderer.ReadScenePixels();
    for (int i=0;i<5;++i) Pixel(pixels,150+3*i,80,colors[i]);
    after=renderer.GetTextureUploadState();
    Require(!after.pending && after.stagingCapacity==4*1024*1024 &&
        after.stagingCapacity==baseline.stagingCapacity,"Arena overflow left uploads queued or grew the reusable buffer");

    Require(renderer.BeginScene(),"Cannot test larger-than-arena upload");
    constexpr int w=1031,h=1024;
    std::vector<uint32_t> source(size_t(w)*h,0xff345678);
    source.back()=0xffff00ff;
    auto* large=renderer.CreateTexture(w,h,source.data(),w*4);
    source.clear();source.shrink_to_fit();
    SubmitImage(renderer,Quad(190,80,1,1,1,1,1,1,.5f/w,.5f/h,.5f/w,.5f/h),large,false,false,VulkanBlend::Opaque);
    const float u=(w-.5f)/w,v=(h-.5f)/h;
    SubmitImage(renderer,Quad(192,80,1,1,1,1,1,1,u,v,u,v),large,false,false,VulkanBlend::Opaque);
    renderer.DestroyTexture(large);
    renderer.EndSceneAndPresent();
    pixels=renderer.ReadScenePixels();
    Pixel(pixels,190,80,0xff345678);Pixel(pixels,192,80,0xffff00ff);
    Require(renderer.GetTextureUploadState().stagingCapacity==uint64_t(w)*h*4,
        "Oversized staging grew beyond the single image requirement");

    const uint32_t cyan=0xff00ffff;
    auto* outside=renderer.CreateTexture(1,1,&cyan,4);
    renderer.DestroyTexture(outside);
    VulkanTest::Window::Minimized(window.hwnd,true);
    Require(!renderer.BeginScene() && renderer.GetTextureUploadState().pending==1,
        "Suspension discarded a pending texture snapshot");
    VulkanTest::Window::Minimized(window.hwnd,false);
    Require(renderer.BeginScene(),"Cannot restore pending upload frame");
    Require(!renderer.GetTextureUploadState().pending && !renderer.GetResourceCounts().retiredTextures,
        "Restore did not complete uploads before retiring images");
    renderer.EndSceneAndPresent();
    Require(renderer.ReadScenePixels()==pixels,"Upload/retirement changed the retained canvas");
    auto* unused=renderer.CreateTexture(1,1,&cyan,4);
    renderer.DestroyTexture(unused); // Leave an unsubmitted host snapshot for renderer teardown.
    Require(renderer.GetTextureUploadState().pending==1,"Unused upload was unexpectedly submitted");
    std::cout<<"PASS upload edges: 32 padded snapshots, released CPU sources, 4 MiB rollover, oversized image, pending retirement/minimize/teardown\n";
}
void BatchedAlphaComposition(Sexy::VulkanRenderer& renderer) {
    using namespace Sexy;
    const unsigned int white=0xffffffffU;
    auto* alpha=renderer.CreateTexture(1,1,&white,4);
    std::vector<VulkanTexture*> outputs;
    constexpr unsigned int count=1100;
    for(unsigned int i=0;i<count;++i) {
        const unsigned int color=0xff000000U|((i*107U)&0x00ffffffU);
        auto* base=renderer.CreateTexture(1,1,&color,4);
        auto* composed=renderer.ComposeAlphaRaw(base,alpha,1,1,0,false);
        outputs.push_back(renderer.AdoptComposedTexture(composed));
        renderer.DestroyTexture(base);
    }
    for(unsigned int i:{0U,1U,31U,1023U,1024U,count-1}) {
        const auto pixels=renderer.ReadTexturePixels(outputs[i]);
        Require(pixels.pixels[0]==(0xff000000U|((i*107U)&0x00ffffffU)),
            "Batched alpha composition did not preserve per-dispatch image bindings");
    }
    for(auto* texture:outputs)renderer.DestroyTexture(texture);
    renderer.DestroyTexture(alpha);
    std::cout<<"PASS: 1100 alpha dispatches retain distinct image bindings across transfer batches\n";
}

void RawFilterAliasEdges(Sexy::VulkanRenderer& renderer) {
    using namespace Sexy;
    // Opaque red beside fully transparent blue exposes straight-RGB leakage.
    // The other two texels cover partial alpha and different HSL hues.
    const std::array<uint32_t,4> pixels{0xffff0000u,0x000000ffu,0x8000ff00u,0x11ff00ffu};
    auto* source=renderer.CreateTexture(4,1,pixels.data(),16);
    for (uint32_t filter=1;filter<=3;++filter) {
        auto* cached=renderer.CreateRenderImage(4,1);
        // This is the old FilterEffect path: filter once into a floating-point
        // premultiplied render image, then sample the cached result normally.
        renderer.SetRenderImage(cached);
        Require(renderer.BeginScene(),"Cannot begin reference filter image");
        auto reference=Quad(0,0,4,1);
        EncodeSource(reference,source,false,false);
        for (auto& vertex:reference) vertex.slot|=filter<<28u;
        renderer.SubmitTriangles(reference,source,false,false,VulkanBlend::Opaque);
        renderer.SetRenderImage(nullptr); // Completes the image-only batch.

        for (bool linear:{false,true}) {
            Require(renderer.BeginScene(),"Cannot compare raw filter alias edges");
            SubmitImage(renderer,Quad(0,0,160,24,0,0,0),renderer.whiteTexture,
                false,false,VulkanBlend::Opaque);
            auto alias=Quad(0,0,64,16);
            EncodeSource(alias,source,linear,false);
            for (auto& vertex:alias) vertex.slot|=filter<<28u;
            renderer.SubmitTriangles(alias,source,linear,false,VulkanBlend::Normal);
            SubmitImage(renderer,Quad(80,0,64,16),cached,linear,false,VulkanBlend::Normal);
            renderer.EndSceneAndPresent();
            const auto actual=renderer.ReadScenePixels();
            for (int y=0;y<16;++y) for (int x=0;x<64;++x) {
                const auto expected=actual.at(size_t(y)*800+x+80);
                // The two routes use separate pipeline specializations; allow
                // at most one encoded byte of floating-point rounding.
                Pixel(actual,x,y,expected,1);
            }
        }
        renderer.DestroyTexture(cached);
    }
    renderer.DestroyTexture(source);
    std::cout<<"PASS raw filter aliases: WHITE/WASHED/LESS nearest+linear match premultiplied cache edges\n";
}

void Run() {
    using namespace Sexy;
    for(const auto& rect:std::array<VulkanClip,7>{{
        {0,0,17,13},{2,0,13,13},{0,3,17,7},{2,3,13,7},
        {-3,-2,23,17},{-3,3,23,7},{2,-3,13,19}}}) {
        const auto borders=PresentBorderRects(rect,17,13);
        for(int y=0;y<13;++y)for(int x=0;x<17;++x) {
            int count=0;
            for(const auto& border:borders) {
                Require(border.x>=0 && border.y>=0 && border.width>=0 && border.height>=0 &&
                    border.x+border.width<=17 && border.y+border.height<=13,"Invalid presentation border");
                if(x>=border.x && x<border.x+border.width &&
                    y>=border.y && y<border.y+border.height)++count;
            }
            const bool inside=x>=rect.x && x<rect.x+rect.width && y>=rect.y && y<rect.y+rect.height;
            Require(count==(inside?0:1),"Presentation border overlaps game pixels or leaves undefined pixels");
        }
    }
    std::cout<<"PASS: odd, cropped and letterboxed presentation defines every border pixel exactly once\n";
    VkSurfaceCapabilitiesKHR caps{};
    caps.currentExtent={UINT32_MAX,UINT32_MAX};
    caps.minImageExtent={1,1};caps.maxImageExtent={4096,4096};
    auto extent=ChooseVulkanSurfaceExtent(caps,1600,1200);
    Require(extent && extent->width==1600 && extent->height==1200,"Variable extent did not use framebuffer pixels");
    caps.minImageExtent={64,64};caps.maxImageExtent={1024,1024};
    extent=ChooseVulkanSurfaceExtent(caps,2000,10);
    Require(extent && extent->width==1024 && extent->height==64,"Variable extent did not respect limits");
    Require(!ChooseVulkanSurfaceExtent(caps,0,600),"Zero framebuffer width was replaced by a fallback");
    Require(!ChooseVulkanSurfaceExtent(caps,800,0),"Zero framebuffer height was replaced by a fallback");
    caps.currentExtent={801,601};
    extent=ChooseVulkanSurfaceExtent(caps,800,600);
    Require(extent && extent->width==801 && extent->height==601,"Fixed surface extent was overridden");
    caps.minImageExtent={0,0};caps.currentExtent={0,0};
    Require(!ChooseVulkanSurfaceExtent(caps,800,600),"Zero current extent was replaced by window configuration");
    caps.currentExtent={UINT32_MAX,UINT32_MAX};caps.maxImageExtent={0,0};
    Require(!ChooseVulkanSurfaceExtent(caps,800,600),"Zero maximum extent attempted swapchain creation");
    caps.maxImageExtent={1024,1024};caps.currentExtent={0,600};
    Require(!ChooseVulkanSurfaceExtent(caps,800,600),"Partially zero current extent was accepted");
    caps.currentExtent={UINT32_MAX,600};
    bool malformed=false;
    try{(void)ChooseVulkanSurfaceExtent(caps,800,600);}catch(const std::invalid_argument&){malformed=true;}
    Require(malformed,"Malformed surface capabilities were hidden as deferral");
    std::cout<<"PASS surface extent policy: fixed/variable pixels, zero deferral, explicit malformed rejection\n";
    for(const auto& size:std::array<std::array<int,2>,7>{{{800,600},{1600,1200},{2560,1440},
        {641,361},{801,601},{601,801},{320,240}}}) {
        const auto rect=FitSceneToSurface(800,600,size[0],size[1]);
        // Test system-DPI and normal window-coordinate sizes separately.
        for(int divisor:{1,2}) for(int lx:{0,37,400,799}) for(int ly:{0,19,300,599}) {
            const int ww=size[0]/divisor, wh=size[1]/divisor;
            const double wx=(rect.x+(lx+0.5)*rect.width/800.0)*ww/size[0];
            const double wy=(rect.y+(ly+0.5)*rect.height/600.0)*wh/size[1];
            const auto p=WindowPointToScene(wx,wy,ww,wh,size[0],size[1],rect,800,600);
            Require(p.x==lx && p.y==ly,"Display/input viewport mismatch");
        }
        const auto outside=WindowPointToScene(rect.x-1.0,rect.y-1.0,size[0],size[1],size[0],size[1],rect,800,600);
        Require(outside.x<0 && outside.y<0,"Letterbox input was clamped into the game");
    }
    std::cout << "PASS: shared viewport/input mapping, DPI, portrait/landscape, odd dimensions\n";
    VulkanInitConfig init;
    init.features.shaderFloat64=VK_TRUE;
    init.enableValidation = true;
    init.debugCallback = Validation;
    VulkanTest::Window native(320,240);
    VulkanContext window(init, native.hwnd, VulkanTest::SwapchainConfig());
    VulkanRenderer renderer(window, 800, 600,
        std::string(PVZ_NATIVE_SHADER_DIR)+"/game_vs.spv",
        std::string(PVZ_NATIVE_SHADER_DIR)+"/game_ps.spv");
    renderer.PrepareLoadingPipelines();
    Require(!renderer.PresentRetainedScene(), "An uninitialized scene was falsely presented");
    Require(!renderer.PresentRetainedScene(), "Repeated startup deferral changed scene state");
    // A mode transaction can update more than one geometry/format property.
    // Setters must not do intermediate device-idle/WSI rebuilds.
    const auto generation=window.swapchainGeneration;
    native.Resize(640,360);native.Resize(641,361);
    Require(window.swapchainGeneration==generation,"Setters rebuilt intermediate swapchains");
    renderer.ResizePresent();
    Require(window.swapchainGeneration==generation+1,"Mode transaction did not commit exactly once");
    Require(window.swapchainExtent.width==641 && window.swapchainExtent.height==361,"Final mode dimensions lost");
    Require(renderer.BeginScene(),"Deferred resize acquire");
    renderer.EndSceneAndPresent();
    Require(window.swapchainGeneration==generation+1,"First frame rebuilt the committed swapchain twice");
    native.Resize(320,240);
    Require(renderer.BeginScene(),"Implicit deferred resize acquire");
    renderer.EndSceneAndPresent();
    Require(window.swapchainGeneration==generation+2,"BeginCommands did not commit pending geometry once");
    std::cout<<"PASS deferred WSI mode transaction: setters coalesced, explicit/implicit single commit\n";
    auto* white = renderer.whiteTexture;
    Require(renderer.BeginScene(), "Hidden window did not acquire a frame");
    SubmitImage(renderer,Quad(0,0,800,600,0,0,1), white, false, false, VulkanBlend::Opaque);
    SubmitImage(renderer,Quad(10,10,40,40,1,0,0,0.5f), white, false, false, VulkanBlend::Normal);
    SubmitImage(renderer,Quad(60,10,40,40,1,0,0,0.5f), white, false, false, VulkanBlend::Additive);
    VulkanClip clip{110,20,10,10};
    SubmitImage(renderer,Quad(100,10,40,40,0,1,0), white, false, false, VulkanBlend::Opaque, &clip);
    // 2x2 visible pixels in rows with a third, padding pixel. The ignored-alpha
    // texture must stay fully visible even though the source alpha is zero.
    const uint32_t source[] = {0x00ff0000,0x0000ff00,0x00ffffff,0x000000ff,0x00ffffff,0x00ffffff};
    auto* opaque = renderer.CreateTexture(2,2,source,12,true); // Upload while a frame is recording.
    SubmitImage(renderer,Quad(200,10,2,2), opaque, false, false, VulkanBlend::Normal);
    SubmitImage(renderer,Quad(210,10,2,2,1,1,1,1,1,0,2,1), opaque, false, true, VulkanBlend::Normal);
    SubmitImage(renderer,Quad(220,10,2,2,1,1,1,1,1,0,2,1), opaque, false, false, VulkanBlend::Normal);
    auto* transparent = renderer.CreateTexture(2,2,source,12,false);
    SubmitImage(renderer,Quad(230,10,2,2), transparent, false, false, VulkanBlend::Normal);
    // Bilinear sample at image center averages all four texels (128 per RGB).
    SubmitImage(renderer,Quad(240,10,2,2,1,1,1,1,0.5f,0.5f,0.5f,0.5f), opaque, true, false, VulkanBlend::Opaque);
    renderer.DestroyTexture(opaque); // Recorded descriptors must survive until frame completion.
    renderer.DestroyTexture(transparent);
    renderer.EndSceneAndPresent();
    auto pixels = renderer.ReadScenePixels();
    Pixel(pixels,0,0,0xff0000ff);
    Pixel(pixels,799,599,0xff0000ff);
    Pixel(pixels,20,20,0xff800080,1);
    Pixel(pixels,70,20,0xff8000ff,1);
    Pixel(pixels,110,20,0xff00ff00);
    Pixel(pixels,109,20,0xff0000ff);
    Pixel(pixels,120,20,0xff0000ff);
    Pixel(pixels,200,10,0xffff0000);
    Pixel(pixels,201,10,0xff00ff00);
    Pixel(pixels,200,11,0xff0000ff);
    Pixel(pixels,201,11,0xffffffff);
    Pixel(pixels,210,10,0xffff0000);
    Pixel(pixels,220,10,0xff00ff00);
    Pixel(pixels,230,10,0xff0000ff);
    Pixel(pixels,240,10,0xff808080,1);
    std::cout << "PASS: BGRA, pitch, opacity, alpha/additive, nearest/linear, wrap/clamp, scissor, pixel edges\n";
    CanvasHash(pixels,"mixed-state");

    // Exercise vertex-stream overflow without overwriting earlier recorded data.
    Require(renderer.BeginScene(), "Cannot start retained scene");
    SubmitImage(renderer,Quad(402,400,1,1,1,0,0),white,false,false,VulkanBlend::Opaque);
    const auto tinyQuad = Quad(400,400,1,1,1,1,0);
    for (int i=0;i<46000;++i) SubmitImage(renderer,tinyQuad,white,false,false,VulkanBlend::Opaque);
    SubmitImage(renderer,Quad(403,400,1,1,0,1,0),white,false,false,VulkanBlend::Opaque);
    renderer.EndSceneAndPresent();
    pixels = renderer.ReadScenePixels();
    Pixel(pixels,400,400,0xffffff00);
    Pixel(pixels,402,400,0xffff0000);
    Pixel(pixels,403,400,0xff00ff00);
    Pixel(pixels,200,10,0xffff0000);
    Require(renderer.GetResourceCounts().vertexBuffers>=2,"Vertex overflow did not retain multiple stream buffers");
    std::cout << "PASS: retained logical scene and multi-buffer vertex stream\n";
    CanvasHash(pixels,"stream-overflow");

    native.Resize(640,360);
    renderer.ResizePresent();
    Require(renderer.PresentRetainedScene(), "Cannot present retained scene after resize");
    pixels = renderer.ReadScenePixels();
    Pixel(pixels,200,10,0xffff0000);
    Pixel(pixels,400,400,0xffffff00);
    Pixel(pixels,799,599,0xff0000ff);
    std::cout << "PASS: swapchain resize preserves scene and texture content\n";

    // Exercise native minimized state without exposing the hidden fixture.
    const auto retained=pixels;
    const auto oldSwapchain=window.swapchain;
    const auto oldViews=window.swapchainViews;
    const auto oldGeneration=window.swapchainGeneration;
    const auto resources=renderer.GetResourceCounts();
    native.Resize(777,555);
    native.Minimized(true);
    for(int i=0;i<3;++i) {
        Require(!renderer.ResizePresent(),"Suspended resize did not defer");
        Require(!renderer.BeginScene(),"Suspended window acquired a swapchain image");
        Require(!renderer.PresentRetainedScene(),"Suspended retained present did not defer");
        Require(window.swapchain==oldSwapchain && window.swapchainViews==oldViews &&
            window.swapchainGeneration==oldGeneration,"Deferred resize destroyed/rebuilt WSI resources");
    }
    native.Minimized(false);
    Require(renderer.ResizePresent(),"Restored native resize did not commit");
    Require(window.swapchainGeneration==oldGeneration+1,"Restored native resize did not commit exactly once");
    Require(renderer.PresentRetainedScene(),"Restored native window did not present");
    Require(renderer.ReadScenePixels()==retained,"Suspension changed retained scene pixels");
    Require(renderer.whiteTexture==white && renderer.GetResourceCounts().textures==resources.textures,
        "Suspension rebuilt the renderer textures");
    Require(!IsWindowVisible(native.hwnd),"Native suspension test showed the window");
    std::cout<<"PASS native WSI suspension: resources retained, single restore commit, exact retained pixels\n";

    // Allocate across pool boundaries, then reclaim descriptors after the
    // submitted frame. Repeat to catch mismatched object/descriptor lifetimes.
    for (int cycle=0;cycle<3;++cycle) {
        Require(renderer.BeginScene(), "Cannot start texture lifetime cycle");
        const auto uploadsBefore=renderer.GetTextureUploadState();
        Require(renderer.GetResourceCounts().retiredTextures == 0, "Retired textures were not reclaimed");
        for (int i=0;i<1100;++i) {
            const uint32_t color=0xff000000u|uint32_t((cycle+1)*0x100000+i);
            auto* texture = renderer.CreateTexture(1,1,&color,4);
            SubmitImage(renderer,Quad(float(500+i%200),float(500+i/200),1,1),texture,false,false,VulkanBlend::Opaque);
            renderer.DestroyTexture(texture);
        }
        Require(renderer.GetTextureUploadState().pending==1100,
            "Texture lifetime cycle lost queued uploads before submission");
        renderer.EndSceneAndPresent();
        pixels=renderer.ReadScenePixels();
        for (int i=0;i<1100;++i)
            Pixel(pixels,500+i%200,500+i/200,0xff000000u|uint32_t((cycle+1)*0x100000+i));
        Require(renderer.GetResourceCounts().descriptorPools <= 2, "Descriptor pools grow across allocation cycles");
        Require(renderer.GetResourceCounts().textures == 1, "Destroyed user texture is still registered");
        const auto uploadsAfter=renderer.GetTextureUploadState();
        Require(!uploadsAfter.pending && uploadsAfter.stagingCapacity==uploadsBefore.stagingCapacity,
            "Texture lifetime cycle left uploads queued or grew the staging buffer");
    }
    std::cout << "PASS: repeated texture/descriptor allocation and deferred destruction\n";
    CoveragePixels(renderer);
    RawFilterAliasEdges(renderer);
    DynamicUpdates(renderer,window);
    UploadEdges(renderer,window);
    BatchedAlphaComposition(renderer);
    const uint32_t resizeColor = 0xff2468ac;
    auto* resident = renderer.CreateTexture(1, 1, &resizeColor, 4);
    const auto residentSlot = VulkanRenderer::SlotOf(resident);
    for (const int width : {801, 960, 999, 1065, 1066, 1399, 1400, 800}) {
        renderer.ResizeScene(width, 600);
        Require(renderer.sceneWidth == width && renderer.sceneHeight == 600,
            "Canvas resize did not update dimensions");
        Require(!renderer.PresentRetainedScene(), "Old-size canvas survived resize");
        Require(VulkanRenderer::SlotOf(resident) == residentSlot &&
            renderer.ReadTexturePixels(resident).pixels[0] == resizeColor,
            "Canvas resize changed a resident texture");
        Require(renderer.BeginScene(), "Cannot begin resized scene");
        SubmitImage(renderer, Quad(0, 0, float(width), 600), resident,
            false, false, VulkanBlend::Opaque);
        renderer.EndSceneAndPresent();
        pixels = renderer.ReadScenePixels();
        Require(pixels.size() == size_t(width) * 600 &&
            std::all_of(pixels.begin(), pixels.end(),
                [=](auto pixel) { return pixel == resizeColor; }),
            "Canvas resize left incorrect pixels or uncovered edges");
    }
    renderer.DestroyTexture(resident);
    std::cout << "PASS canvas-resize-800-through-1400-resident-textures\n";
}
}

int main() {
    try {
        Run();
        // Last-window destruction must reset shared instance/device state.
        Run();
        Require(validationErrors.load()==0,"Vulkan validation reported an error");
        std::cout << "PASS: native renderer resource teardown/reinitialization; zero validation errors\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "FAIL: " << error.what() << '\n';
        return 1;
    }
}
