#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include "graphics/ImageDiagnostics.h"
#include "misc/ResourceManager.h"
#include "Resources.h"
#include "widget/WidgetManager.h"
#include "imagelib/ImageLib.h"
#include "misc/AutoCrit.h"
#include "Sexy.TodLib/TodDebug.h"
#include "Sexy.TodLib/TodCommon.h"
#include <latch>
#include <fstream>
#include <iterator>
#include <memory>
#include <thread>

namespace {
void Require(bool value,const char* message){if(!value)throw std::runtime_error(message);}
std::string Read(const std::filesystem::path& path) {
    std::ifstream file(path,std::ios::binary);
    Require(bool(file),"Cannot read diagnostic test output");
    return {std::istreambuf_iterator<char>(file),{}};
}
}
void PortableImageDiagnosticsSmoke(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && getenv("PVZ_LOG_DIR"),
        "Image diagnostics require hidden, isolated probes");
    auto& render=*app.mDDInterface->mRenderInterface;render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),texturesBefore=render.mRenderer->GetResourceCounts().textures;
    std::vector<ImageDiagnosticRecord> snapshots;
    std::ofstream log(ModernSmoke::ProbePath("image-diagnostics-cases.txt"));
    Require(bool(log),"Cannot write image diagnostic test evidence");
    {
        // Exercise the linked release formatter (not an extracted test copy).
        // These are private strings, never resource templates or user files.
        const std::string narrow(1310721, 'p');
        const std::wstring wide(1024, L'\x4e2d');
        Require(StrFormat("%s", narrow.c_str()) == narrow && StrFormat(L"%ls", wide.c_str()) == wide,
            "Release printf formatter lost long narrow/wide text");
        char exact[8];
        Require(TodSnprintf(exact, sizeof(exact), "%s", "12345678") == 7 &&
            std::string(exact) == "1234567", "Release bounded printf lost NUL on exact fit");
        TodLog("%s", "");
        TodTrace("%s", "");
        TodTraceAndLog("%s", "");
        log << "printf-real-release-long-narrow-wide-exact-fit-empty-sinks=1\n";
        ModernSmoke::Report("portable-printf-release-wide-long-exact-empty", app);
    }
    {
        // Only private fixture images and the borrowed, stable screen. Construct
        // fixtures after the swap so their destructors remove the private nodes.
        struct Registry {
            LawnApp& app;MemoryImageSet original;
            explicit Registry(LawnApp& a):app(a){original.swap(app.mMemoryImageSet);}
            ~Registry(){original.merge(app.mMemoryImageSet);app.mMemoryImageSet.swap(original);}
        } registry(app);
        MemoryImage cpu,gpu,indexed,empty,unmaterialized;
        cpu.Create(13,7);gpu.Create(130,150);indexed.Create(7,5);unmaterialized.Create(20,30);
        cpu.mFilePath=ModernSmoke::ProbePath("cpu-&-fixture.png");
        gpu.mFilePath=ModernSmoke::ProbePath("gpu-only.png");indexed.mFilePath=ModernSmoke::ProbePath("indexed.png");
        empty.mFilePath=ModernSmoke::ProbePath("empty.png");unmaterialized.mFilePath=ModernSmoke::ProbePath("unmaterialized.png");
        ResourceManager resources(&app);
        constexpr auto fixtureId=static_cast<unsigned>(ResourceId::IMAGE_BLANK_ID);
        auto resource=std::make_unique<ResourceManager::ImageRes>();
        resource->mId=fixtureId;resource->mFromProgram=true;resource->mPath=cpu.mFilePath;resource->mImage=&cpu;
        Require(resources.mResourceSlots[fixtureId]==nullptr,"Diagnostic fixture slot is already occupied");
        resources.mResourceSlots[fixtureId]=resource.release();
        Require(static_cast<MemoryImage*>(resources.GetImage(fixtureId))==&cpu,"Diagnostic fixture lost its numeric image binding");
        log<<"diagnostic-resource id="<<fixtureId<<" path="<<cpu.mFilePath<<'\n';
        for(auto* image:{&cpu,&gpu}) {
            auto* bits=image->GetBits();
            for(int i=0;i<image->mWidth*image->mHeight;++i)bits[i]=0x7f123400u+unsigned(i);
            image->BitsChanged();
        }
        indexed.mColorTable=new unsigned int[256];indexed.mColorIndices=new uchar[35];
        for(int i=0;i<256;++i)indexed.mColorTable[i]=0x80000000u+unsigned(i)*0x010101u;
        for(int i=0;i<35;++i)indexed.mColorIndices[i]=uchar(i*7);
        Require(render.CreateImageTexture(&gpu),"Cannot upload diagnostic fixture");gpu.PurgeBits();
        auto* data=gpu.mD3DData;auto* bits=cpu.mBits;const auto version=gpu.mBitsChangedCount;
        app.mMemoryImageSet.insert(app.mDDInterface->mScreenImage);
        snapshots=app.CaptureImageDiagnostics(true).value();
        Require(snapshots.size()==6,"Diagnostic snapshot omitted registered images");
        const auto stats=app.CaptureImageDiagnostics(false).value();
        Require(CountImageDiagnostics(stats).gpuTexels>800u*600*4 &&
            CountImageDiagnostics(stats).cpu>1024,"Statistics did not measure actual image storage");
        for(const auto& record:stats)Require(!record.pixels,"F8 statistics performed a pixel readback");
        Require(!gpu.mBits && gpu.mD3DData==data && gpu.mBitsChangedCount==version && cpu.mBits==bits &&
            indexed.mColorTable && !indexed.mBits,"Snapshot mutated its source storage");
        bool wrongThreadRejected=false;
        std::jthread worker([&]{try{app.CaptureImageDiagnostics(false);}
            catch(const std::logic_error&){wrongThreadRejected=true;}});
        worker.join();Require(wrongThreadRejected,"Diagnostic snapshot accepted a non-owner thread");
        // Use an explicitly registered private image at a FILE PATH. Exercise
        // the diagnostic readiness gate while its pixel writer is pending.
        const auto pendingPath=ModernSmoke::ProbePath("diagnostic-pending.png");
        const SharedImageMap::key_type pendingKey(StringToUpper(pendingPath),0u);
        Require(!app.mSharedImageMap.contains(pendingKey),"Pending diagnostic fixture key collision");
        auto pendingImage=std::make_unique<DDImage>(app.mDDInterface);pendingImage->Create(3,5);pendingImage->mFilePath=pendingPath;
        auto* pendingBits=pendingImage->GetBits();
        SharedImageRef pending=app.SetSharedImage(pendingPath,pendingKey.second,pendingImage.get(),nullptr);pendingImage.release();
        std::promise<void> publication;
        {
            AutoCrit lock(app.mDDInterface->mCritSect);
            pending.mSharedImage->mLoadReady=publication.get_future().share();
        }
        std::latch initializing(1),finish(1);
        std::jthread loader([&]{
            initializing.count_down();finish.wait();
            std::fill_n(pendingBits,15,0x80123456u);pending->BitsChanged();publication.set_value();
        });
        initializing.wait();
        const bool deferred=!app.CaptureImageDiagnostics(false);
        app.DumpProgramInfo();
        const bool queued=app.mPendingImageDiagnostics==1;
        finish.count_down();loader.join();
        Require(deferred && queued,"Pending image initialization was not deferred");
        const auto completed=app.CaptureImageDiagnostics(true);
        Require(completed.has_value(),"Completed cache readiness kept diagnostics blocked");
        const auto ready=std::find_if(completed->begin(),completed->end(),[&](const auto& record){return record.path==pendingPath;});
        Require(ready!=completed->end()&&ready->width==3&&ready->height==5&&ready->pixels&&
            ready->pixels->pixels.size()==15&&std::all_of(ready->pixels->pixels.begin(),ready->pixels->pixels.end(),
                [](auto pixel){return pixel==0x80123456u;}),"Ready diagnostic image lost its published pixels");
        app.mPendingImageDiagnostics=0;
        pending=static_cast<SharedImage*>(nullptr);
        {
            AutoCrit lock(app.mDDInterface->mCritSect);
            auto found=app.mSharedImageMap.find(pendingKey);
            Require(found!=app.mSharedImageMap.end() && found->second.mRefCount==0,"Pending cache fixture retained an owner");
            Sexy::Image::Destroy(found->second.mImage);app.mSharedImageMap.erase(found);
        }
        Require(app.CaptureImageDiagnostics(false).has_value(),"Completed initializer kept diagnostics blocked");
        log<<"pending-cache-registered-pixels-deferred=1 completed-ready=1\n";
        // Loading-time hotkeys enqueue without touching resources, disk or a modal.
        const bool loaded=app.mLoaded;app.mLoaded=false;
        app.DumpProgramInfo();app.ShowMemoryUsage();
        Require(app.mPendingImageDiagnostics==3 && !app.mImageDiagnosticsActive,
            "Loading diagnostics were not deferred");
        app.mLoaded=loaded;app.mPendingImageDiagnostics=1; // Do not show a native F8 modal in an automated test.
        app.ProcessPendingImageDiagnostics();
        Require(!app.mPendingImageDiagnostics && !app.mImageDiagnosticsActive,
            "Queued diagnostic dump did not finish");
        log<<"real-entry images=6 stats-no-pixels=1 owner-thread=1 loading-deferred=1 source-unchanged=1\n";
    }
    Require(app.mMemoryImageSet.size()==imagesBefore && render.mRenderer->GetResourceCounts().textures==texturesBefore,
        "Image diagnostic fixture retained source objects/textures");
    // Exercise the retained Shift+F11 dispatcher with the real complete game
    // registry too, not only the controlled six-image fixture. No OS input.
    const auto allBefore=CountImageDiagnostics(app.CaptureImageDiagnostics(false).value());
    {
        struct Shift {
            bool& value;bool old;
            explicit Shift(bool& v):value(v),old(v){value=true;}
            ~Shift(){value=old;}
        } shift(app.mWidgetManager->mKeyDown[KEYCODE_SHIFT]);
        Require(app.SexyAppBase::DebugKeyDown(VK_F11),"Shift+F11 dispatcher did not handle the key");
    }
    const auto allAfter=CountImageDiagnostics(app.CaptureImageDiagnostics(false).value());
    const auto complete=Read(std::filesystem::path(GetLogFilePath("image-dumps"))/"dump-2"/"complete.txt");
    Require(complete.starts_with("images="+std::to_string(imagesBefore)+" ") &&
        allAfter.images==allBefore.images && allAfter.cpu==allBefore.cpu && allAfter.gpuTexels==allBefore.gpuTexels,
        "Full-registry diagnostic changed image storage or failed to publish completion");
    log<<"full-registry "<<complete;
    // Source images are gone. The writer must use only owned value snapshots.
    const auto root=std::filesystem::path(ModernSmoke::ProbePath("detached-image-dumps"));
    const auto first=WriteImageDiagnosticDump(root,snapshots),second=WriteImageDiagnosticDump(root,snapshots);
    Require(first!=second && Read(first/"complete.txt")=="images=6 exported=4\n",
        "Diagnostic output overwrote evidence or omitted completion");
    const auto html=Read(first/"imagelist.html");
    Require(html.find("cpu-&amp;-fixture.png")!=std::string::npos &&
        html.find("no CPU/GPU pixels available")!=std::string::npos,
        "Diagnostic HTML lost names or unavailable-image status");
    unsigned roundtrips=0;
    for(size_t n=0;n<snapshots.size();++n)if(snapshots[n].pixels) {
        const auto& source=*snapshots[n].pixels;
        std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage((first/("img"+std::to_string(n)+".png")).string(),false));
        Require(decoded && decoded->mWidth==source.width && decoded->mHeight==source.height &&
            std::equal(source.pixels.begin(),source.pixels.end(),decoded->mBits),"Diagnostic PNG pixel roundtrip failed");
        ++roundtrips;
    }
    const auto blocked=root/"not-a-directory";
    {std::ofstream file(blocked);file<<"keep";}
    bool rejected=false;try{WriteImageDiagnosticDump(blocked,snapshots);}
    catch(const std::filesystem::filesystem_error&){rejected=true;}
    Require(rejected && Read(blocked)=="keep","Diagnostic writer hid an I/O error or destroyed existing data");
    log<<"detached-png-roundtrips="<<roundtrips<<" unique-dirs=2 html-escaped=1 io-failure=1\n";
    log<<"PASS image-diagnostics-six-snapshots-four-png-deferred-entry"<<std::endl;
    ModernSmoke::Report("portable-image-diagnostics-six-snapshots-four-png-deferred-entry",app);
    ModernSmoke::Report("portable-image-diagnostics-full-registry-shift-f11",app);
}
