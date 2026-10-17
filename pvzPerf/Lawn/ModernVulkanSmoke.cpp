#include "ModernVulkanSmoke.h"
#include "PortableFixesSmoke.h"
#include "LoadingCloseSmoke.h"
#include "PortableTextProfileSmoke.h"
#include "PortableZombatarSmoke.h"
#include "PortableSellDialogSmoke.h"
#include "ModernVulkanInputSmoke.h"
#include "LawnApp.h"
#include "Widget/TitleScreen.h"
#include "Widget/GameSelector.h"
#include "System/PlayerInfo.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/GpuBackend.h"
#include "graphics/RenderInterface.h"
#include "graphics/TriVertex.h"
#include "misc/SexyMatrix.h"
#include "imagelib/ImageLib.h"
#include "misc/KeyCodes.h"
#include "widget/WidgetManager.h"
#include <algorithm>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include <memory>
#include <set>
#include <array>
#include <fstream>
#include <filesystem>
#include <stdexcept>
#include <vector>
#include <utility>
#include <type_traits>

namespace ModernSmoke {
std::string ProbePath(const std::string& file) {
    const char* directory=getenv("PVZ_MODERN_SMOKE_OUTPUT");
    if(!directory || !getenv("PVZ_APPDATA_DIR"))
        throw std::runtime_error("Smoke test requires isolated data/output directories; use test-modern-game.ps1");
    return Sexy::AddTrailingSlash(directory,true)+file;
}
void Report(const char* stage, LawnApp& app) {
    const auto counts=app.mDDInterface->mRenderInterface->mRenderer->GetResourceCounts();
    const auto commands=app.mDDInterface->mRenderInterface->mRenderer->drawCommandCounts;
#if defined(PVZ_GPU_D3D12)
    const auto uploads=app.mDDInterface->mRenderInterface->mRenderer->textureUploadCounts;
#else
    const auto uploads=app.mDDInterface->mRenderInterface->mRenderer->GetTextureUploadCounts();
#endif
    const auto path=ProbePath("result.log");
    std::unique_ptr<FILE,decltype(&fclose)> log(fopen(path.c_str(),"a"),&fclose);
    if(!log) throw std::runtime_error("Cannot write Modern smoke log");
    fprintf(log.get(),"%s update=%u draws=%u textures=%zu retired=%zu pools=%zu frameDraws=%llu frameStateCommands=%llu uploaded=%llu uploadBatches=%llu uploadBuffers=%llu uploadPending=%zu uploadCapacity=%llu textureCreates=%llu textureUpdates=%llu frameBindBreakdown pipelines=%llu descriptors=%llu viewports=%llu scissors=%llu extents=%llu vertexBuffers=%llu\n",
            stage,app.mUpdateCount,app.mDrawCount,counts.textures,counts.retiredTextures,counts.descriptorPools,
            static_cast<unsigned long long>(commands.draws),
            static_cast<unsigned long long>(commands.pipelines+commands.descriptors+commands.viewports+commands.scissors+commands.extents),
            static_cast<unsigned long long>(uploads.textures),static_cast<unsigned long long>(uploads.batches),
            static_cast<unsigned long long>(uploads.stagingAllocations),uploads.pending,
            static_cast<unsigned long long>(uploads.stagingCapacity),
            static_cast<unsigned long long>(uploads.createdTextures),static_cast<unsigned long long>(uploads.reusedUpdates),
            static_cast<unsigned long long>(commands.pipelines),static_cast<unsigned long long>(commands.descriptors),
            static_cast<unsigned long long>(commands.viewports),static_cast<unsigned long long>(commands.scissors),
            static_cast<unsigned long long>(commands.extents),static_cast<unsigned long long>(commands.vertexBuffers));
}
class ScreenTargetProbeError final : public std::exception {
public:
    const Sexy::DrawOperation operation;

    explicit ScreenTargetProbeError(Sexy::DrawOperation theOperation) noexcept
        : operation(theOperation) {}
};
class NativeDisplayProbeError final : public std::exception {};
void ProbeScreenTargets(LawnApp& app) {
    using namespace Sexy;
    unsigned rejected=0;
    auto expectRejection=[&](DrawOperation operation,auto&& invoke) {
        try { invoke(); }
        catch(const NonScreenDrawError& error) {
            if(error.operation!=operation)
                throw ScreenTargetProbeError(operation);
            ++rejected;return;
        }
        throw ScreenTargetProbeError(operation);
    };
    {
        // A CPU MemoryImage remains a legitimate offscreen composition target.
        MemoryImage source;
        source.Create(2,2);
        const Rect rect(0,0,2,2);
        const Color color(17,34,51,255);
        source.FillRect(rect,color,0);
        if(source.GetBits()[0]!=0xff112233u) throw std::runtime_error("CPU offscreen composition changed");
        // Has the real interface, but is deliberately NOT its screen image.
        DDImage invalid(app.mDDInterface);
        Point points[]={{0,0},{1,0},{0,1}};
        TriVertex triangles[1][3]{};
        SexyMatrix3 matrix;matrix.LoadIdentity();
        Span span{0,0,1};const BYTE coverage[]={255};
        expectRejection(DrawOperation::FillRect,[&]{invalid.FillRect(rect,color,0);});
        expectRejection(DrawOperation::DrawLine,[&]{invalid.DrawLine(0,0,1,1,color,0);});
        expectRejection(DrawOperation::DrawLineAA,[&]{invalid.DrawLineAA(0,0,1,1,color,0);});
        expectRejection(DrawOperation::PolyFill3D,[&]{invalid.PolyFill3D(points,3,&rect,color,0,0,0);});
        expectRejection(DrawOperation::Blt,[&]{invalid.Blt(&source,0,0,rect,color,0);});
        expectRejection(DrawOperation::BltF,[&]{invalid.BltF(&source,0,0,rect,rect,color,0);});
        expectRejection(DrawOperation::BltRotated,[&]{invalid.BltRotated(&source,0,0,rect,rect,color,0,0,0,0);});
        expectRejection(DrawOperation::StretchBlt,[&]{invalid.StretchBlt(&source,rect,rect,rect,color,0,false);});
        expectRejection(DrawOperation::BltMatrix,[&]{invalid.BltMatrix(&source,0,0,matrix,rect,color,0,rect,true);});
        expectRejection(DrawOperation::BltTrianglesTex,[&]{invalid.BltTrianglesTex(&source,triangles,1,rect,color,0,0,0,true);});
        expectRejection(DrawOperation::BltMirror,[&]{invalid.BltMirror(&source,0,0,rect,color,0);});
        expectRejection(DrawOperation::StretchBltMirror,[&]{invalid.StretchBltMirror(&source,rect,rect,rect,color,0,false);});
        expectRejection(DrawOperation::FillScanLinesWithCoverage,[&]{invalid.FillScanLinesWithCoverage(&span,1,color,0,coverage,0,0,1,1);});
        if(source.GetBits()[0]!=0xff112233u || rejected!=13)
            throw std::runtime_error("Rejected screen drawing modified CPU source");
    }
    Report("screen-target-rejection-13-cpu-offscreen-retained",app);
}
void ProbeCoverage(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    render.Flush();
    auto* cpuBits=screen->mBits;
    const auto cpuVersion=screen->mBitsChangedCount;
    screen->FillRect(Rect(10,100,4,2),Color(0,0,0,255),0);
    Span spans[]={{100,10,4},{101,10,4}};
    BYTE mask[]={0,1,127,255,201,202,255,127,1,0,203,204};
    screen->FillScanLinesWithCoverage(spans,2,Color(255,0,0,255),0,mask,10,100,6,2);
    std::fill(std::begin(mask),std::end(mask),0); // The upload must already own a snapshot.
    render.Flush();
    auto pixels=render.mRenderer->ReadScenePixels();
    const uint32_t red[]={0,1,127,255,255,127,1,0};
    for(int y=0;y<2;++y) for(int x=0;x<4;++x)
        if(pixels[size_t(100+y)*800+10+x]!=(0xff000000u|(red[y*4+x]<<16)))
            throw std::runtime_error("Screen coverage did not reach the GPU canvas with the expected alpha/position: got "+
                std::to_string(pixels[size_t(100+y)*800+10+x]&0xffffffu)+" wanted "+std::to_string(0xff000000u|(red[y*4+x]<<16))+
                " at "+std::to_string(10+x)+","+std::to_string(100+y));
    const auto expect=[&](int x,int y,uint32_t wanted) {
        if(pixels.at(size_t(y)*800+x)!=wanted)
            throw std::runtime_error("GPU coverage pixel mismatch at "+std::to_string(x)+","+std::to_string(y));
    };
    screen->FillRect(Rect(10,104,4,1),Color(0,0,0,255),0);
    Span alphaSpan{104,10,4};const BYTE alphaMask[]={0,1,127,255};
    screen->FillScanLinesWithCoverage(&alphaSpan,1,Color(255,255,255,128),0,alphaMask,10,104,4,1);
    // Framebuffer clipping must not become a CPU framebuffer access.
    screen->FillRect(Rect(0,599,2,1),Color(0,0,0,255),0);
    Span edge{599,-1,3};const BYTE edgeMask[]={0,255,128};
    screen->FillScanLinesWithCoverage(&edge,1,Color(255,0,0,255),0,edgeMask,-1,599,3,1);
    screen->FillRect(Rect(20,130,1,1),Color(0,0,0,255),0);
    screen->FillRect(Rect(60,180,1,1),Color(0,0,0,255),0);
    SexyMatrix3 matrix;matrix.LoadIdentity();matrix.m02=40;matrix.m12=50;
    render.PushTransform(matrix);
    Span transformed{130,20,1};const BYTE full[]={255};
    screen->FillScanLinesWithCoverage(&transformed,1,Color(0,255,0,255),0,full,20,130,1,1);
    render.PopTransform();
    render.Flush();pixels=render.mRenderer->ReadScenePixels();
    expect(10,104,0xff000000);expect(11,104,0xff010101);expect(12,104,0xff404040);expect(13,104,0xff808080);
    expect(0,599,0xffff0000);expect(1,599,0xff800000);
    expect(20,130,0xff000000);expect(60,180,0xff00ff00);

    // Exceed the former 128-span batch boundary.
    std::array<Span,300> many{};
    std::vector<BYTE> manyMask(64*many.size());
    for(size_t y=0;y<many.size();++y) {
        many[y]={int(20+y),700,64};
        for(int x=0;x<64;++x) manyMask[y*64+x]=BYTE((y*7+x*3)%256);
    }
    screen->FillRect(Rect(700,20,64,300),Color(0,0,0,255),0);
    const auto drawsBefore=render.mRenderer->drawCommandCounts.draws;
    screen->FillScanLinesWithCoverage(many.data(),int(many.size()),Color(255,255,255,255),0,
        manyMask.data(),700,20,64,int(many.size()));
    // P5 游程合并（2026-10-05）：同状态连续批可合为更少 vkCmdDraw（1~3 皆合法，
    // >3=逐 span/逐像素退化，0=截断）
    {
        const auto aDelta=int(render.mRenderer->drawCommandCounts.draws)-int(drawsBefore);
        if(aDelta<1||aDelta>3)
            throw std::runtime_error("Coverage span batches were truncated or drawn per pixel");
    }
    std::fill(manyMask.begin(),manyMask.end(),0);
    render.Flush();pixels=render.mRenderer->ReadScenePixels();
    for(unsigned y=0;y<many.size();++y) for(unsigned x=0;x<64;++x)
        expect(700+int(x),20+int(y),0xff000000u|((y*7+x*3)%256)*0x010101u);

#if defined(PVZ_GPU_D3D12)
    const auto counts=render.mRenderer->textureUploadCounts;
#else
    const auto counts=render.mRenderer->GetTextureUploadCounts();
#endif
    screen->FillScanLinesWithCoverage(nullptr,0,Color::White,0,nullptr,0,0,0,0);
    Span zeroWidth{INT_MIN,INT_MAX,0};
    screen->FillScanLinesWithCoverage(&zeroWidth,1,Color::White,0,full,0,0,1,1);
    Span invalid[]={{100,10,1},{100,12,1}};
    bool rejected=false;
    try {screen->FillScanLinesWithCoverage(invalid,2,Color::White,0,alphaMask,10,100,2,1);}
    catch(const std::invalid_argument&) {rejected=true;}
#if defined(PVZ_GPU_D3D12)
    const auto countsAfter=render.mRenderer->textureUploadCounts;
#else
    const auto countsAfter=render.mRenderer->GetTextureUploadCounts();
#endif
    if(!rejected || render.mSceneBegun || countsAfter.createdTextures!=counts.createdTextures)
        throw std::runtime_error("Empty/invalid coverage input allocated or partially drew");

    screen->FillRect(Rect(399,359,52,20),Color(0,0,0,255),0);
    Graphics polygon(screen);polygon.mColor=Color(0,255,0,255);polygon.SetClipRect(404,362,38,13);
    const Point points[]={{400,360},{448,360},{400,376}};
    polygon.PolyFillAA(points,3,false);
    render.Flush();pixels=render.mRenderer->ReadScenePixels();
    expect(405,364,0xff00ff00);expect(403,364,0xff000000);expect(440,374,0xff000000);
    const auto untranslated=pixels;
    screen->FillRect(Rect(399,359,52,20),Color(0,0,0,255),0);
    polygon.Translate(-50,-50);
    const Point shifted[]={{450,410},{498,410},{450,426}};
    polygon.PolyFillAA(shifted,3,false);
    polygon.PolyFillAA(nullptr,0,false);
    render.Flush();pixels=render.mRenderer->ReadScenePixels();
    if(pixels!=untranslated) throw std::runtime_error("Translated PolyFillAA changed coverage pixels");

    // Real destination calls: both scratch sizes, both algorithms, clipping,
    // and coordinate-equivalent translations must produce identical pixels.
    static_assert(!std::is_copy_constructible_v<GraphicsAutoState>);
    static_assert(!std::is_copy_assignable_v<GraphicsAutoState>);
    unsigned scratchCases=0;
    for(bool big:{false,true})for(bool aa:{false,true})for(bool clipped:{false,true}) {
        const std::array<Point,3> original={Point(100,100),Point(big?600:180,100),Point(100,big?500:180)};
        const Rect clip=clipped?Rect(115,112,big?300:50,big?250:50):Rect(0,0,800,600);
        auto draw=[&](int dx,int dy) {
            screen->FillRect(Rect(0,0,800,600),Color(0,0,0,255),0);
            Graphics g(screen);g.mColor=Color(0,255,0,255);g.SetClipRect(clip);
            std::array<Point,3> moved;
            for(size_t i=0;i<moved.size();++i)moved[i]=Point(original[i].mX-dx,original[i].mY-dy);
            {
                GraphicsAutoState state(&g);g.Translate(dx,dy);
                if(aa)g.PolyFillAA(moved.data(),int(moved.size()),false);
                else g.PolyFill(moved.data(),int(moved.size()),false);
            }
            if(g.mTransX!=0||g.mTransY!=0||!g.mStateStack.empty()||
                g.mPFActiveEdgeList||g.mPFNumActiveEdges||g.mPFNumVertices)
                throw std::runtime_error("Polygon draw left scratch or a changed Graphics state");
            render.Flush();return render.mRenderer->ReadScenePixels();
        };
        const auto reference=draw(0,0);
        if(reference.size()!=800*600||std::none_of(reference.begin(),reference.end(),[](auto p){return p!=0xff000000u;}))
            throw std::runtime_error("Polygon translation reference is empty");
        for(const Point shift:{Point(-50,-50),Point(37,19),Point(-71,23)}) {
            if(draw(shift.mX,shift.mY)!=reference)
                throw std::runtime_error("Polygon translation changed real GPU pixels");
            ++scratchCases;
        }
    }
    if(scratchCases!=24)throw std::runtime_error("Incomplete polygon scratch regression");
    Report("graphics-scratch-24-gpu-translations-state-restored",app);

    // Exercise the production VertexList through FillPoly, including heap
    // growth and clipping assignment. The independent reference is FillRect;
    // adding collinear boundary vertices must not change the filled pixels.
    // The separate ASan witness tests the copy constructor itself (>100
    // vertices); this renderer probe is not evidence of that callsite.
    unsigned polygonCases=0;
    const Rect polygonBounds(100,100,512,256), polygonClip(140,120,360,200);
    const Color polygonColor(59,173,113,255), background(0,0,0,255);
    for(int subdivisions:{1,25,26,64,256}) {
        std::vector<Point> boundary;
        boundary.reserve(size_t(subdivisions)*4);
        for(int i=0;i<subdivisions;++i) boundary.emplace_back(100+512*i/subdivisions,100);
        for(int i=0;i<subdivisions;++i) boundary.emplace_back(612,100+256*i/subdivisions);
        for(int i=0;i<subdivisions;++i) boundary.emplace_back(612-512*i/subdivisions,356);
        for(int i=0;i<subdivisions;++i) boundary.emplace_back(100,356-256*i/subdivisions);
        for(bool clipped:{false,true}) {
            const Rect& expectedBounds=clipped?polygonClip:polygonBounds;
            screen->FillRect(Rect(0,0,800,600),background,0);
            screen->FillRect(expectedBounds,polygonColor,0);
            render.Flush();
            const auto reference=render.mRenderer->ReadScenePixels();
            if(reference.size()!=800*600 ||
                std::count_if(reference.begin(),reference.end(),[](auto pixel){return pixel!=0xff000000u;})!=
                    expectedBounds.mWidth*expectedBounds.mHeight)
                throw std::runtime_error("Large polygon reference is empty or has the wrong area");
            screen->FillRect(Rect(0,0,800,600),background,0);
            render.FillPoly(boundary.data(),int(boundary.size()),clipped?&polygonClip:nullptr,polygonColor,0,0,0);
            render.Flush();pixels=render.mRenderer->ReadScenePixels();
            if(pixels!=reference)
                throw std::runtime_error("Large polygon GPU mismatch: vertices="+std::to_string(boundary.size())+
                    " clipped="+std::to_string(clipped));
            ++polygonCases;
        }
    }
    if(polygonCases!=10) throw std::runtime_error("Large polygon regression coverage incomplete");
    if(screen->mBits!=cpuBits || screen->mBitsChangedCount!=cpuVersion)
        throw std::runtime_error("Screen coverage still writes a CPU screen backing");
    Report("gpu-vertex-list-10-large-polygons-4-to-1024-clipped-reference",app);
    Report("gpu-screen-coverage-300-spans-clipping-transform-polyaa",app);
}
void ProbeHdrNotifications(LawnApp& app) {
    auto require=[](bool ok,const char* why){if(!ok) throw std::runtime_error(why);};
    if (!app.mScaleHDREnabled) {
        require(!app.mHdrDisplayObserver,"SDR game unexpectedly started an HDR observer");
        Report("hdr-disabled-no-observer",app);
        return;
    }
    require(bool(app.mHdrDisplayObserver),"HDR game has no display observer");
    auto& render=*app.mDDInterface->mRenderInterface;
    auto& renderer=*render.mRenderer;
    render.Flush();
    const auto pixels=renderer.ReadScenePixels();
    const auto window=app.mHWnd;
    const auto generation=app.mGpuContext->swapchainGeneration;
    const auto* white=renderer.whiteTexture;
    const auto windowScale=Sexy::GpuScaleIdentity(renderer.ScaleOutput(false));
    const auto fullScale=Sexy::GpuScaleIdentity(renderer.ScaleOutput(true));
    auto expected=app.mHdrDisplayObserver->Snapshot();
    auto old=expected.display.Params(app.mScaleHDRStrength);
    old.paperWhiteNits*=0.5f;
    renderer.SetHdrParams(old); // Simulate old GPU constants, not an OS HDR change.
    app.mHdrDisplayRevision=0;
    app.UpdateHdrDisplay();
    expected=app.mHdrDisplayObserver->Snapshot();
    require(renderer.HdrParams()==expected.display.Params(app.mScaleHDRStrength) &&
        app.mHdrDisplayRevision==expected.revision,"Framework did not apply current HDR snapshot");
    RECT placement{};require(GetWindowRect(window,&placement)!=FALSE,"Cannot query HDR test window");
    for (int i=0;i<100;++i)
        SendMessageW(window,WM_MOVE,0,MAKELPARAM(placement.left,placement.top));
    app.DrainWindowMessages();
    app.UpdateHdrDisplay();
    require(!app.mHdrTargetPending,"Monitor movement notifications were not consumed");
    {
        struct Restore {bool& value;bool old;~Restore(){value=old;}} restore{app.mPhysMinimized,app.mPhysMinimized};
        app.mPhysMinimized=true;app.mHdrTargetPending=true;app.mHdrDisplayRevision=0;
        app.UpdateHdrDisplay();
        require(app.mHdrTargetPending && app.mHdrDisplayRevision==0,"Minimized geometry selected an off-screen HDR target");
    }
    app.UpdateHdrDisplay();
    require(app.mHdrDisplayRevision!=0 && !app.mHdrTargetPending,"Restore did not apply pending HDR metadata");
    require(renderer.ReadScenePixels()==pixels && renderer.whiteTexture==white &&
        Sexy::GpuScaleIdentity(renderer.ScaleOutput(false))==windowScale &&
        Sexy::GpuScaleIdentity(renderer.ScaleOutput(true))==fullScale &&
        app.mHWnd==window && app.mGpuContext->swapchainGeneration==generation,
        "HDR notification changed canvas/window/WSI/resident scale assets");
    require(!IsWindowVisible(window),"HDR notification test exposed the window");
    Report("hdr-notification-state-retained",app);
}
void ProbeScreenshot(LawnApp& app) {
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto expected=render.mRenderer->ReadScenePixels();
    const auto directory=std::filesystem::path(Sexy::GetAppDataFolder())/"screenshots";
    if(!getenv("PVZ_APPDATA_DIR") || !getenv("PVZ_MODERN_SMOKE"))
        throw std::logic_error("Screenshot probe requires isolated data");
    static unsigned next=1;
    struct DebugScope {bool& value;bool saved;~DebugScope(){value=saved;}}
        debugScope{app.mDebugKeysEnabled,app.mDebugKeysEnabled};
    app.mDebugKeysEnabled=true; // Exercise the inherited debug F11 route without changing its gate.
    const bool shift=app.mWidgetManager->mKeyDown[Sexy::KEYCODE_SHIFT];
    struct Restore {bool& key;bool saved;~Restore(){key=saved;}} restore{
        app.mWidgetManager->mKeyDown[Sexy::KEYCODE_SHIFT],shift};
    app.mWidgetManager->mKeyDown[Sexy::KEYCODE_SHIFT]=false;
    const auto first=directory/("screenshot-"+std::to_string(next)+".png");
    for(unsigned repeat=0;repeat<2;++repeat,++next) {
        const auto path=directory/("screenshot-"+std::to_string(next)+".png");
        if(std::filesystem::exists(path)) throw std::runtime_error("Screenshot fixture already exists");
        // Real Win32 key/deferred-message path, without desktop key injection.
        SendMessageW(app.mHWnd,WM_KEYDOWN,VK_F11,1);
        app.DrainWindowMessages();
        SendMessageW(app.mHWnd,WM_KEYUP,VK_F11,LPARAM(1)|(LPARAM(3)<<30));
        app.DrainWindowMessages();
        std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage(path.string(),false));
        if(!decoded || decoded->mWidth!=app.mWidth || decoded->mHeight!=app.mHeight ||
            !std::equal(expected.begin(),expected.end(),decoded->mBits))
            throw std::runtime_error("F11 screenshot differs from the native logical canvas");
    }
    std::unique_ptr<ImageLib::Image> preserved(ImageLib::GetImage(first.string(),false));
    if(!preserved || preserved->mWidth!=app.mWidth || preserved->mHeight!=app.mHeight ||
        !std::equal(expected.begin(),expected.end(),preserved->mBits) ||
        expected!=render.mRenderer->ReadScenePixels())
        throw std::runtime_error("Repeated screenshot overwrote a file or changed the scene");
    Report("f11-screenshot-png",app);
}
void ProbePresentationDeferral(LawnApp& app) {
    auto require=[](bool ok,const char* why) { if(!ok) throw std::runtime_error(why); };
    auto& display=*app.mDDInterface;
    auto& render=*display.mRenderInterface;
    render.Flush();
    const auto pixels=render.mRenderer->ReadScenePixels();
    const auto initCount=display.mInitCount;
    const auto generation=app.mGpuContext->swapchainGeneration;
    const auto window=app.mHWnd;
    require(!app.mPhysMinimized && app.mGameSelector,"Presentation fixture requires an active menu");
    unsigned rejected=0;
    const auto expectOwnershipError=[&] {
        try {render.PresentRetainedFrame();}
        catch(const Sexy::NativeDisplayError& error) {
            if(error.operation!=Sexy::NativeDisplayOperation::PresentRetainedFrame||
                error.result!=Sexy::DDInterface::RESULT_FAIL)
                throw NativeDisplayProbeError{};
            ++rejected;return;
        }
        throw NativeDisplayProbeError{};
    };
    {
        auto* saved=std::exchange(render.mRenderer,nullptr);
        struct Restore {decltype(saved)& renderer;decltype(saved) saved;~Restore(){renderer=saved;}}
            restore{render.mRenderer,saved};
        expectOwnershipError();
    }
    {
        struct Restore {bool& value;bool saved;~Restore(){value=saved;}} restore{render.mSceneBegun,render.mSceneBegun};
        render.mSceneBegun=true;
        expectOwnershipError();
    }
    std::ofstream errors(ProbePath("native-display-errors.txt"));
    if(!errors)throw NativeDisplayProbeError{};
    errors<<rejected<<'\n';
    errors.close();
    if(!errors)throw NativeDisplayProbeError{};
    // Inject the framework iconified state, not a real desktop operation.
    // This covers dirty retention and error policy, not OS minimize/Alt-Tab.
    for(unsigned repeat=0;repeat<3;++repeat) {
        struct Restore { bool& value; bool old; ~Restore(){value=old;} } restore{app.mPhysMinimized,app.mPhysMinimized};
        app.mPhysMinimized=true;
        app.mGameSelector->MarkDirty();
        require(!app.mWidgetManager->DrawScreen(),"Minimized framework attempted to draw widgets");
        require(app.mGameSelector->mDirty,"Deferred draw discarded a widget's dirty flag");
        require(!render.PresentRetainedFrame(),"Iconified retained present was not deferred");
        app.Redraw(nullptr);
        require(!render.mSceneBegun,"Deferred present opened a scene");
    }
    {
        struct Visibility {
            std::vector<std::pair<Sexy::Widget*,bool>> saved;
            ~Visibility(){for(auto [widget,visible]:saved) widget->mVisible=visible;}
        } visibility;
        for(auto* widget:app.mWidgetManager->mWidgets) {
            visibility.saved.emplace_back(widget,widget->mVisible);
            widget->mVisible=false;
        }
        require(!app.mWidgetManager->DrawScreen(),"Invisible widgets unexpectedly drew");
        require(!render.mSceneBegun,"Invisible dirty widgets acquired a frame with nothing to submit");
    }
    // Force a frame-ownership error before any GPU submission. It must escape,
    // and both re-entrancy flags must unwind without rebuilding the display.
    render.mSceneBegun=true;
    bool reported=false;
    try {app.Redraw(nullptr);}
    catch(const std::logic_error& e) {reported=std::string(e.what())=="No open scene";}
    require(reported,"Native ownership error was hidden or changed");
    require(!app.mRedrawInProgress && !display.mInRedraw && !render.mSceneBegun,
        "Presentation exception left frame ownership latched");
    require(render.PreDraw(),"Normal frame did not resume after deferral");
    app.Redraw(nullptr);
    require(pixels==render.mRenderer->ReadScenePixels(),"Deferral/recovery changed retained scene pixels");
    require(display.mInitCount==initCount && app.mGpuContext->swapchainGeneration==generation &&
        app.mHWnd==window,"Deferral/error recreated display resources");
    require(!IsWindowVisible(window),"Presentation test showed the window");
    Report("present-deferred-recovered",app);
}
void ProbeNativeResizeDeferral(LawnApp& app) {
    auto require=[](bool ok,const char* why){if(!ok) throw std::runtime_error(why);};
    auto& display=*app.mDDInterface;
    auto& render=*display.mRenderInterface;
    auto& window=*app.mGpuContext;
    render.Flush();
    const auto pixels=render.mRenderer->ReadScenePixels();
    const auto init=display.mInitCount;
    const auto generation=window.swapchainGeneration;
#if !defined(PVZ_GPU_D3D12)
    const auto swapchain=window.swapchain;
    const auto allocatedWidth=window.swapchainExtent.width;
    const auto allocatedHeight=window.swapchainExtent.height;
#else
    const auto allocatedWidth=window.width;
    const auto allocatedHeight=window.height;
#endif
    const auto oldRect=display.mVisibleGameRect;
    const int oldDisplayW=display.mDisplayWidth,oldDisplayH=display.mDisplayHeight;
    RECT client{};require(GetClientRect(app.mHWnd,&client)!=FALSE,"Cannot query resize fixture");
    const int oldW=client.right-client.left,oldH=client.bottom-client.top;
    // Leave the app's minimized flag false: native HWND suspension must still
    // propagate through DDInterface without committing unusable geometry.
    app.ResizeWindowClient(oldW+17,oldH+11);
    const auto style=GetWindowLongPtrW(app.mHWnd,GWL_STYLE);
    SetWindowLongPtrW(app.mHWnd,GWL_STYLE,style|WS_MINIMIZE);
    for(int i=0;i<3;++i) {
        app.UpdateWindowGeometry();
        const auto rect=display.mVisibleGameRect;
        require(app.mNativeResizePending && display.mInitCount==init &&
            window.swapchainGeneration==generation,
            "Deferred native resize was committed/recreated by the framework");
#if !defined(PVZ_GPU_D3D12)
        require(window.swapchain==swapchain &&
            window.swapchainExtent.width==allocatedWidth && window.swapchainExtent.height==allocatedHeight,
            "Deferred native resize replaced the swapchain or allocated extent");
#else
        // D3D12 exposes generation and allocated extent, but no swapchain handle.
        require(window.width==allocatedWidth && window.height==allocatedHeight,
            "Deferred native resize changed the allocated swapchain extent");
#endif
        require(display.mDisplayWidth==oldDisplayW && display.mDisplayHeight==oldDisplayH &&
            rect.mX==oldRect.mX && rect.mY==oldRect.mY && rect.mWidth==oldRect.mWidth && rect.mHeight==oldRect.mHeight,
            "Deferred native resize overwrote the last usable presentation geometry");
    }
    SetWindowLongPtrW(app.mHWnd,GWL_STYLE,style);
    app.UpdateWindowGeometry();
    require(!app.mNativeResizePending && display.mInitCount==init+1 &&
        window.swapchainGeneration==generation+1,"Restored geometry did not commit exactly once");
    require(render.PresentRetainedFrame(),"Restored frame did not present");
    require(pixels==render.mRenderer->ReadScenePixels(),"Native resize deferral altered the logical canvas");
    app.ResizeWindowClient(oldW,oldH);
    app.UpdateWindowGeometry();
    require(render.PresentRetainedFrame(),"Return geometry did not present");
    require(pixels==render.mRenderer->ReadScenePixels(),"Return resize altered the logical canvas");
    require(!IsWindowVisible(app.mHWnd),"Native resize probe showed the window");
#if defined(PVZ_GPU_D3D12)
    Report("native-resize-d3d12-generation-extent-verified-raw-swapchain-handle-unavailable",app);
#endif
    Report("native-resize-deferred-recovered",app);
}
void ProbeMonitorNotifications(LawnApp& app) {
    auto require=[](bool ok,const char* why){if(!ok) throw std::runtime_error(why);};
    auto& native=*app.mGpuContext;
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    require(app.mIsWindowed && !IsWindowVisible(app.mHWnd),
        "Monitor simulation requires a hidden window, not an actual fullscreen transition");
    const auto identity=app.mHWnd;
    const auto pixels=render.mRenderer->ReadScenePixels();
    RECT client{};require(GetClientRect(identity,&client)!=FALSE,"Cannot query monitor fixture");
    // Real HWND notification; no physical display topology changes.
    SendMessageW(identity,WM_DISPLAYCHANGE,32,MAKELPARAM(client.right,client.bottom));
    app.DrainWindowMessages();
    app.PumpWindowEvents();
    require(app.mIsWindowed && identity==app.mHWnd && !app.mSwitchingScreenMode,
        "Monitor notification changed framework/window ownership");
    require(render.PresentRetainedFrame(),"Notified window failed to present");
    require(pixels==render.mRenderer->ReadScenePixels(),"Monitor notification changed retained game pixels");
    const auto generation=native.swapchainGeneration;
    app.PumpWindowEvents();
    require(native.swapchainGeneration==generation,"Unchanged monitor state rebuilt the swapchain again");
    require(!IsWindowVisible(app.mHWnd),"Monitor simulation exposed the hidden game");
    ModernVulkanInputSmoke(app);
    Report("monitor-notification-state-input-retained",app);
}
void CheckScaleState(LawnApp& app,bool checkWindowSize) {
    auto& renderer=*app.mDDInterface->mRenderInterface->mRenderer;
    static std::array<std::uint64_t,2> images{};
    static const Sexy::ScaleEffectRuntimeDesc* compiled=nullptr;
    const auto counts=renderer.GetScaleCounts();
    if(!app.mModernScalePrepared || counts.programs!=2 || counts.writableImages==0 ||
        !Sexy::GpuScaleIdentity(renderer.ScaleOutput(false)) || !Sexy::GpuScaleIdentity(renderer.ScaleOutput(true)))
        throw std::runtime_error("Both scale pipelines were not resident at startup");
    if(!compiled) {
        compiled=app.mScaleEffects.data();
        images={Sexy::GpuScaleIdentity(renderer.ScaleOutput(false)),Sexy::GpuScaleIdentity(renderer.ScaleOutput(true))};
    } else if(compiled!=app.mScaleEffects.data() || images[0]!=Sexy::GpuScaleIdentity(renderer.ScaleOutput(false)) ||
        images[1]!=Sexy::GpuScaleIdentity(renderer.ScaleOutput(true)))
        throw std::runtime_error("Scale toggle recompiled/replaced resident resources");
    RECT client{};
    if(!GetClientRect(app.mHWnd,&client)) throw std::runtime_error("Cannot query scale fixture");
    const int ww=client.right-client.left,wh=client.bottom-client.top,fw=ww,fh=wh;
    const auto rect=renderer.PresentRect(fw,fh);
    const auto visible=app.mDDInterface->mVisibleGameRect;
    if(rect.x!=visible.mX || rect.y!=visible.mY || rect.width!=visible.mWidth || rect.height!=visible.mHeight)
        throw std::runtime_error("DDInterface and GPU presentation geometry differ");
    for(int lx:{0,37,400,799}) for(int ly:{0,29,300,599}) {
        const double wx=(rect.x+(lx+0.5)*rect.width/app.mWidth)*ww/fw;
        const double wy=(rect.y+(ly+0.5)*rect.height/app.mHeight)*wh/fh;
        int actualX=0,actualY=0;
        app.MapWindowMouse(wx,wy,actualX,actualY);
        if(actualX!=lx || actualY!=ly) throw std::runtime_error("Game native mouse mapping differs from presentation");
    }
    if(checkWindowSize && app.mIsWindowed) {
        const auto scaled=renderer.ScaleOutput(false);
        if(ww!=(app.mUseCustomScale?int(scaled.width):app.mWidth) ||
           wh!=(app.mUseCustomScale?int(scaled.height):app.mHeight))
            throw std::runtime_error("Custom Scale window size does not match checkbox");
    }
    if(IsWindowVisible(app.mHWnd) || !(GetWindowLongPtrW(app.mHWnd,GWL_STYLE)&WS_OVERLAPPEDWINDOW))
        throw std::runtime_error("Hidden smoke unexpectedly showed/attached a fullscreen window");
}
void ToggleScale(LawnApp& app,bool enabled) {
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto before=render.mRenderer->ReadScenePixels();
    app.RequestScreenMode(true,enabled);
    const auto after=render.mRenderer->ReadScenePixels();
    if(before!=after) throw std::runtime_error("Scale toggle changed/cleared the retained game canvas");
}
void CaptureScaled(const char* name,LawnApp& app,bool fullscreen) {
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto dimensions=render.mRenderer->ScaleOutput(fullscreen);
    const auto pixels=render.mRenderer->ReadScalePixels(fullscreen);
    std::set<uint32_t> colors;
    for(auto pixel:pixels) colors.insert(pixel&0xffffff);
    if(colors.size()<128) throw std::runtime_error("Blank scaled game image");
    ImageLib::Image image;
    image.mWidth=int(dimensions.width);image.mHeight=int(dimensions.height);
    image.mBits=new unsigned int[pixels.size()];
    std::copy(pixels.begin(),pixels.end(),image.mBits);
    const auto path=ProbePath(std::string(name)+".png");
    if(!ImageLib::WritePNGImage(path,&image)) throw std::runtime_error("Cannot export scaled game diagnostic");
    std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage(path,false));
    if(!decoded || decoded->mWidth!=image.mWidth || decoded->mHeight!=image.mHeight ||
        !std::equal(pixels.begin(),pixels.end(),decoded->mBits))
        throw std::runtime_error("Scaled GPU diagnostic PNG round-trip mismatch");
    Report(name,app);
}
// Exercise the fullScreen chain and input geometry without attaching a monitor.
// This does NOT claim to verify the actual visible Win32 fullscreen transition.
void ProbeFullscreenChain(LawnApp& app) {
    auto& renderer=*app.mDDInterface->mRenderInterface->mRenderer;
    app.mDDInterface->mRenderInterface->Flush();
    const bool oldMode=app.mIsWindowed;
    app.mIsWindowed=false;
    renderer.SetScaleMode(true,true);
    app.UpdateWindowGeometry();
    app.mDDInterface->mRenderInterface->PresentRetainedFrame();
    CheckScaleState(app,false);
    ModernVulkanInputSmoke(app);Report("win32-input-cursor-fullscreen-chain",app);
    CaptureScaled("fullscreen-chain",app,true);
    app.mIsWindowed=oldMode;
    renderer.SetScaleMode(app.IsScalePresentActive(),!oldMode);
    app.UpdateWindowGeometry();
    app.mDDInterface->mRenderInterface->PresentRetainedFrame();
}
void Capture(const char* name,LawnApp& app,unsigned minimumColors) {
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto pixels=render.mRenderer->ReadScenePixels();
    std::set<std::uint32_t> colors;
    for(auto p:pixels) colors.insert(p&0x00ffffffu);
    if(colors.size()<minimumColors) throw std::runtime_error(std::string("Empty/flat GPU game scene: ")+name);
    ImageLib::Image image;
    image.mWidth=app.mWidth; image.mHeight=app.mHeight;
    image.mBits=new unsigned int[pixels.size()];
    std::copy(pixels.begin(),pixels.end(),image.mBits);
    const auto path=ProbePath(std::string(name)+".png");
    if(!ImageLib::WritePNGImage(path,&image))
        throw std::runtime_error("Cannot save GPU diagnostic frame");
    std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage(path,false));
    if(!decoded || decoded->mWidth!=image.mWidth || decoded->mHeight!=image.mHeight ||
       !std::equal(pixels.begin(),pixels.end(),decoded->mBits))
        throw std::runtime_error("GPU diagnostic PNG round-trip changed pixels");
    Report(name,app);
}
}

ModernSmoke::CallbackScope::CallbackScope(LawnApp& app)
    : depth(app.mUpdateAppDepth), entered(depth==0) {
    if(depth<0) throw std::logic_error("Smoke callback entered with a negative update depth");
    if(entered) ++depth;
}
ModernSmoke::CallbackScope::~CallbackScope() { if(entered) --depth; }

void ModernSmoke::RequireDeletionBoundary(LawnApp& app,const char* phase) {
    std::ofstream log(ProbePath("deferred-boundaries.txt"),std::ios::app);
    if(!log) throw std::runtime_error("Cannot write deferred deletion boundary evidence");
    log<<"phase="<<phase<<" update="<<app.mUpdateCount<<" depth="<<app.mUpdateAppDepth
        <<" pending="<<app.mSafeDeleteList.size()<<std::endl;
    for(const auto& entry:app.mSafeDeleteList)
        log<<"  type="<<typeid(*entry.mWidget).name()<<" queued-depth="<<entry.mUpdateAppDepth
            <<" holds="<<entry.mWidget->mDeferredDeleteHolds<<std::endl;
    if(!app.mSafeDeleteList.empty())
        throw std::runtime_error(std::string("Deferred objects survived scene boundary: ")+phase);
}

void ModernVulkanSmokeTick(LawnApp& app) {
    using namespace ModernSmoke;
    static const bool enabled=getenv("PVZ_MODERN_SMOKE")!=nullptr;
    if(!enabled) return;
    if(LoadingCloseSmoke::Tick(app)) return;
    // These suites deliberately probe depth zero and nested modal collection
    // themselves. Their fixed-depth assertions must not be shifted globally.
    if(const char* scenario=getenv("PVZ_MODERN_GAMEPLAY_SMOKE")) {
        if(std::string_view(scenario)=="ModalLifetime" || std::string_view(scenario)=="ZenLifetime") {
            ModernVulkanGameplaySmokeTick(app,scenario);
            return;
        }
    }
    // The driver is called after UpdateApp returned (normally depth zero),
    // whereas ordinary UI callbacks queue deletion inside UpdateAppStep.
    // Raising only this diagnostic callback scope lets the unmodified next
    // framework update perform real deletion; it does not drain/remap queues.
    CallbackScope callback(app);
    if(getenv("PVZ_MODERN_CREDITS_SMOKE")) {
        ModernVulkanCreditsSmokeTick(app);
        return;
    }
    if(const char* scenario=getenv("PVZ_MODERN_GAMEPLAY_SMOKE")) {
        ModernVulkanGameplaySmokeTick(app,scenario);
        return;
    }
    static const bool scaleTest=getenv("PVZ_MODERN_SCALE_SMOKE")!=nullptr;
    static int stage=0;
    static std::uint32_t deadline=0;
    static HWND originalWindow=nullptr;
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        Report("loaded",app);
        PortableSellDialogSmoke(app);
        PortableFixesSmoke(app);
        PortableStoreAchievementSmoke(app);
        PortableFontConfigurationSmoke(app);
        PortableGpuImageFactoriesSmoke(app);
        PortableReanimGroupBoundarySmoke(app);
        ProbeScreenTargets(app);
        ProbeCoverage(app);
        PortableTextureSubmissionSmoke(app);
        PortableAlphaCompositionSmoke(app);
        PortableSharedResourceSmoke(app);
        PortableImageDiagnosticsSmoke(app);
        if(scaleTest) {
            CheckScaleState(app,true);
            Report(app.mUseCustomScale?"scale-startup-on":"scale-startup-off",app);
            const char* file=getenv("PVZ_SCALE_CONFIG_FILE");
            if(!file || ProbePath("scale.json")!=file) throw std::runtime_error("Scale smoke fixture is not isolated");
            // A reread at toggle time would now fail. Only this disposable file
            // is changed; runtime/source effect files are never modified.
            std::ofstream changed(file,std::ios::trunc);
            changed<<"intentionally invalid JSON after successful startup compilation";
            if(!changed) throw std::runtime_error("Cannot change disposable scale fixture");
        }
        originalWindow=app.mHWnd;
        app.LoadingCompleted();
        stage=1;deadline=app.mUpdateCount+200;
        return;
    }
    if(app.mUpdateCount<deadline) return;
    auto* selector=app.mGameSelector;
    if(stage<=8 && !selector) throw std::runtime_error("Modern smoke lost game selector");
    if(originalWindow!=app.mHWnd)
        throw std::runtime_error("Modern replaced its native window");
    switch(stage) {
    case 1: RequireDeletionBoundary(app,"scenes-title-to-menu");ModernVulkanKeyboardSmoke(app);PortablePreviewProfileSmoke(app);ProbePresentationDeferral(app);ProbeNativeResizeDeferral(app);ProbeMonitorNotifications(app);ProbeHdrNotifications(app);ModernVulkanInputSmoke(app);Report("win32-input-cursor",app);Capture("menu",app);ProbeScreenshot(app);selector->ShowAchievementsWidget();break;
    case 2: Capture("achievements",app);selector->SlideTo(-800,0);break;
    case 3: Capture("menu-return",app);selector->ShowZombatarScreen();break;
    case 4:
        PortableZombatarHeadSmoke(app);
        PortableZombatarListSmoke(app);
        PortableZombatarResourceSmoke(app);
        selector->MarkAllDirty();
        if (!app.mWidgetManager->DrawScreen()) throw std::runtime_error("Zombatar scene redraw failed after list probe");
        Capture("zombatar",app);selector->SlideTo(-800,0);break;
    case 5:
        Capture("menu-final",app);
        app.ResizeWindowClient(1281,721);app.mNativeResizePending=true;
        break;
    case 6:
        Capture("menu-resized",app);
        app.ResizeWindowClient(800,600);app.mNativeResizePending=true;
        break;
    case 7:
        Capture("menu-restored",app);
        app.mPlayerInfo->mLevel=2;app.mPlayerInfo->mFinishedAdventure=0;
        selector->SyncProfile(false);selector->ClickedAdventure();
        ++stage;deadline=app.mUpdateCount+160;return;
    case 8:
        Capture("adventure-hand",app);
        ++stage;deadline=app.mUpdateCount+500;return;
    case 9:
        if(!app.mBoard) throw std::runtime_error("Adventure did not create a board");
        RequireDeletionBoundary(app,"scenes-selector-to-adventure");
        Capture("adventure",app);
        app.ResizeWindowClient(1281,721);app.mNativeResizePending=true;
        break;
    case 10:
        Capture("adventure-resized",app);
        app.ResizeWindowClient(800,600);app.mNativeResizePending=true;
        break;
    case 11:
        Capture("adventure-restored",app);
        if(!scaleTest) {
            Report("portable-scenes-deferred-title-selector-destroyed",app);
            Report("PASS scenes; requesting ordinary game shutdown",app);
            app.CloseRequestAsync();
        } else {
            RECT before{};if(!GetClientRect(originalWindow,&before)) throw std::runtime_error("Cannot query scale client");
            ToggleScale(app,app.mUseCustomScale); // A no-op must preserve a user's manual resize.
            RECT after{};if(!GetClientRect(originalWindow,&after)) throw std::runtime_error("Cannot query scale client");
            if(before.right!=after.right || before.bottom!=after.bottom) throw std::runtime_error("No-op scale request resized the user's window");
            if(app.mUseCustomScale) ToggleScale(app,false);
            ToggleScale(app,true);
        }
        break;
    case 12:
        CheckScaleState(app,true);
        CaptureScaled("custom-scale-on",app,false);
        ToggleScale(app,false);
        break;
    case 13:
        CheckScaleState(app,true);
        Capture("custom-scale-off",app);
        ToggleScale(app,true);
        break;
    case 14:
        CheckScaleState(app,true);
        ProbeFullscreenChain(app);
        for(unsigned repeat=0;repeat<4;++repeat) {
            ToggleScale(app,false);CheckScaleState(app,true);
            ToggleScale(app,true);CheckScaleState(app,true);
        }
        ModernVulkanInputSmoke(app);Report("win32-input-cursor-scaled",app);
        CaptureScaled("custom-scale-repeated",app,false);
        ProbeScreenshot(app);
        Report("PASS scenes; resident scale toggles/input/fullscreen-chain verified; requesting ordinary game shutdown",app);
        Report("portable-scenes-deferred-title-selector-destroyed",app);
        app.CloseRequestAsync();
        break;
    }
    ++stage;deadline=app.mUpdateCount+125;
}
