#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "System/ReanimationLawn.h"
#include "System/PoolEffect.h"
#include "Resources.h"
#include "graphics/Graphics.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/ImageFont.h"
#include "graphics/SharedImage.h"
#include "graphics/RenderInterface.h"
#include "misc/ResourceManager.h"
#include "misc/Buffer.h"
#include "misc/DescParserOwnership.h"
#include "paklib/PakInterface.h"
#include "misc/AutoCrit.h"
#include "imagelib/ImageLib.h"
#include <array>
#include <algorithm>
#include <atomic>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <latch>
#include <memory>
#include <semaphore>
#include <stdexcept>
#include <thread>
#include <type_traits>
#include <vector>
#include <zlib.h>

namespace {
void Require(bool condition,const char* message){if(!condition)throw std::runtime_error(message);}
void ColorizedImageFactoryCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    const auto count=[&]{AutoCrit lock(app.mCritSect);return app.mMemoryImageSet.size();};
    const auto pixel=[](int n){return uint32_t(n*97%256)<<24|uint32_t(n*53%256)<<16|
        uint32_t(n*31%256)<<8|uint32_t(n*19%256);};
    const auto tintPixel=[](uint32_t value,const Color& tint){
        const bool fast=tint.mRed<=255&&tint.mGreen<=255&&tint.mBlue<=255&&tint.mAlpha<=255;
        const std::array channels{tint.mBlue,tint.mGreen,tint.mRed,tint.mAlpha};uint32_t result=0;
        for(int c=0;c<4;++c){const auto v=((value>>(8*c))&255u)*uint32_t(channels[c])/(fast?256u:255u);
            result|=std::min(v,255u)<<(8*c);}
        return result;
    };
    auto& renderer=*app.mDDInterface->mRenderInterface;auto* screen=app.mDDInterface->mScreenImage;
    const auto* screenBits=screen->mBits;const auto screenVersion=screen->mBitsChangedCount;
    const auto draw=[&](Image* image){
        screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
        Graphics g(screen);g.DrawImage(image,80,80);renderer.Flush();return renderer.mRenderer->ReadScenePixels();
    };
    unsigned cases=0;
    const auto baseline=count();
    for(bool palette:{false,true})for(const auto tint:std::array{Color(0,0,0,0),Color(255,255,255,255),
        Color(127,127,127,127),Color(256,255,128,64),Color(64,128,256,255),Color(1024,1024,1024,1024)}){
        {
            MemoryImage source;source.Create(8,8);source.mNumCols=2;source.mNumRows=4;
            if(palette){source.mColorTable=new unsigned int[256];source.mColorIndices=new uchar[64];
                for(int n=0;n<256;++n)source.mColorTable[n]=pixel(n);
                for(int n=0;n<64;++n)source.mColorIndices[n]=uchar(n*3);
            }else{auto* bits=source.GetBits();for(int n=0;n<64;++n)bits[n]=pixel(n);}
            source.BitsChanged();const auto sourceVersion=source.mBitsChangedCount;
            std::unique_ptr<DDImage> tinted(app.CreateColorizedImage(&source,tint));
            Require(tinted&&count()==baseline+2&&tinted->mNumCols==1&&tinted->mNumRows==1,
                "Colorized factory image ownership or existing sheet metadata changed");
            Require(source.mBitsChangedCount==sourceVersion&&!source.mBits&&!source.mColorTable&&
                !source.mColorIndices&&source.mD3DData&&!tinted->mBits&&!tinted->mColorTable&&
                static_cast<TextureData*>(tinted->mD3DData)->mGPUOwned,
                "Colorized factory retained CPU storage");
            renderer.Flush();
            const auto sourcePixels=renderer.ReadImagePixels(source);
            for(int n=0;n<64;++n)Require(sourcePixels.pixels[n]==pixel(palette?n*3:n),
                "Colorized factory changed GPU source bytes");
            MemoryImage reference;reference.Create(8,8);auto* expected=reference.GetBits();
            for(int n=0;n<64;++n)expected[n]=tintPixel(pixel(palette?n*3:n),tint);
            reference.BitsChanged();
            const auto actual=draw(tinted.get()),wanted=draw(&reference);
            Require(actual.size()==480000&&actual==wanted,"Colorized factory GPU output differs from channel model");
            if(tint.mAlpha){
                MemoryImage blank;blank.Create(8,8);
                std::fill_n(blank.GetBits(),64,0u);blank.BitsChanged();
                Require(wanted!=draw(&blank),"Colorized GPU fixture produced only background");
            }
            tinted.reset();Require(count()==baseline+2,"Colorized image destruction retained registration");
            log<<"color-factory palette="<<palette<<" tint="<<tint.mRed<<','<<tint.mGreen<<','<<tint.mBlue<<','<<tint.mAlpha
                <<" gpu-exact=1 source-unchanged=1 destroyed=1"<<std::endl;
        }
        Require(count()==baseline,"Colorized factory fixture leaked registered images");++cases;
    }
    Require(cases==12&&screen->mBits==screenBits&&screen->mBitsChangedCount==screenVersion,
        "Colorized factory test changed CPU screen storage");
    ModernSmoke::Report("portable-colorized-factory-twelve-gpu-and-image-lifetime-cases",app);
}
void PoolEffectLifetimeCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    auto& renderer=*app.mDDInterface->mRenderInterface;auto* screen=app.mDDInterface->mScreenImage;
    auto* source=static_cast<MemoryImage*>(IMAGE_POOL_CAUSTIC_EFFECT);
    Require(source&&source->mD3DData,"Actual pool source must be resident on the GPU");
    struct RestorePool {
        PoolEffect* pool; RenderInterface& render; MemoryImage* source;
        ~RestorePool() {
            render.Flush();
            if(pool) {
                render.UseCausticsImages(pool->mCausticImage,source);
                render.SetCausticsFrame(pool->mPoolCounter);
            }
        }
    } restorePool{app.mPoolEffect,renderer,source};
    Require(restorePool.pool || renderer.GetCausticsTexture()==nullptr,
        "Title-page pool probe started with an unowned active target");
    const auto imageCount=[&]{AutoCrit lock(app.mCritSect);return app.mMemoryImageSet.size();};
    const auto validate=[&](PoolEffect& p){
        Require(p.mApp==&app&&p.mPoolCounter==0&&p.mCausticImage&&p.mCausticGPU,"Pool init state changed");
        // 灰度 LUT 与源图逐字节对账已随"加载时构建派生数据+源位图即弃"
        //（2026-10-07）退役：源 mBits 按设计为空；LUT 正确性由跨实例 GPU
        // 帧哈希一致性（draw() 六帧对账）承担
        Require(p.mCausticImage->mWidth==128&&p.mCausticImage->mHeight==64,"Caustic dimensions changed");
        Require(p.mCausticImage->mBits==nullptr&&p.mCausticImage->mColorTable==nullptr&&
            static_cast<TextureData*>(p.mCausticImage->mD3DData)->mGPUOwned,
            "Pool retained a CPU output bitmap");
    };
    const auto draw=[&](PoolEffect& p){std::array<uint64_t,6> hashes{};size_t frame=0;
        for(bool night:{false,true})for(uint32_t tick:{0u,73u,65535u}){
            p.mPoolCounter=tick;renderer.SetCausticsFrame(tick);
            screen->FillRect(Rect(0,0,800,600),Color(17,23,31),0);
            Graphics g(screen);p.PoolEffectDraw(&g,night);renderer.Flush();const auto pixels=renderer.mRenderer->ReadScenePixels();
            Require(pixels.size()==480000,"Pool scene readback missing");uint64_t hash=14695981039346656037ull;size_t visible=0;
            for(auto pixel:pixels){hash=(hash^pixel)*1099511628211ull;visible+=pixel!=pixels.front();}
            Require(visible>1000,"Private pool rendered an empty scene");hashes[frame++]=hash;
        }return hashes;
    };
    std::array<uint64_t,6> reference;
    {PoolEffect warm;warm.PoolEffectInitialize();validate(warm);reference=draw(warm);}
    const auto before=imageCount();
    for(int mode=0;mode<3;++mode){
        {PoolEffect pool;pool.PoolEffectInitialize();validate(pool);
            Require(imageCount()==before+1&&draw(pool)==reference,"Private pool changed its image count or GPU frames");
            if(mode==1){pool.PoolEffectInitialize();validate(pool);Require(imageCount()==before+1&&draw(pool)==reference,"Pool reinit lost pixels or leaked its old image");}
            if(mode==2){pool.PoolEffectDispose();pool.PoolEffectDispose();Require(!pool.mCausticImage&&imageCount()==before,"Pool explicit disposal failed");}
        }
        Require(imageCount()==before,"Pool destructor retained an image");
        log<<"pool-lifetime mode="<<mode<<" images-before="<<before<<" images-after="<<imageCount()<<" six-frames-match=1"<<std::endl;
    }
    if(!restorePool.pool)Require(renderer.GetCausticsTexture()==nullptr,"Private pool retained an active target");
    ModernSmoke::Report("pool-effect-real-pixels-six-gpu-frames-three-lifetimes",app);
}
void ReanimCacheLifetimeCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    auto& renderer=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    constexpr std::array<SeedType,9> plants{{SEED_POTATOMINE,SEED_INSTANT_COFFEE,SEED_EXPLODE_O_NUT,
        SEED_PEASHOOTER,SEED_SPLITPEA,SEED_THREEPEATER,SEED_TALLNUT,SEED_MELONPULT,SEED_COBCANNON}};
    constexpr std::array<ZombieType,8> zombies{{ZOMBIE_NORMAL,ZOMBIE_FLAG,ZOMBIE_DOOR,ZOMBIE_BOSS,
        ZOMBIE_POGO,ZOMBIE_POLEVAULTER,ZOMBIE_CACHED_POLEVAULTER_WITH_POLE,ZOMBIE_GARGANTUAR}};
    struct Fingerprint {uint64_t hash;size_t visible;bool operator==(const Fingerprint&)const=default;};
    const auto imageCount=[&]{AutoCrit lock(app.mCritSect);return app.mMemoryImageSet.size();};
    const auto empty=[](const ReanimatorCache& c){
        for(auto* p:c.mPlantImages)if(p)return false;
        for(auto* p:c.mLawnMowers)if(p)return false;
        for(auto* p:c.mZombieImages)if(p)return false;
        return c.mImageVariations.mCount==0;
    };
    const auto drawPass=[&](ReanimatorCache& cache){
        std::vector<Fingerprint> frames;frames.reserve(23);
        const auto capture=[&](auto draw){
            screen->FillRect(Rect(0,0,800,600),Color(17,23,31),Graphics::DRAWMODE_NORMAL);
            Graphics g(screen);draw(g);renderer.Flush();
            const auto pixels=renderer.mRenderer->ReadScenePixels();
            Require(pixels.size()==480000,"Cache probe scene readback size changed");
            const uint32_t background=pixels.front(); // Sprites are confined to the center, independent of readback channel order.
            Require(background==pixels.back(),"Cache probe drew outside its center fixture");
            uint64_t hash=14695981039346656037ull;size_t visible=0;
            for(uint32_t pixel:pixels){hash=(hash^pixel)*1099511628211ull;visible+=pixel!=background;}
            Require(visible>20,"Cache probe rendered an empty frame");frames.push_back({hash,visible});
        };
        for(auto type:plants)capture([&](Graphics& g){cache.DrawCachedPlant(&g,260,180,type,VARIATION_NORMAL);});
        for(int i=0;i<NUM_MOWER_TYPES;++i)capture([&](Graphics& g){cache.DrawCachedMower(&g,260,180,static_cast<LawnMowerType>(i));});
        for(auto type:zombies)capture([&](Graphics& g){cache.DrawCachedZombie(&g,240,160,type);});
        capture([&](Graphics& g){cache.DrawCachedPlant(&g,260,180,SEED_PEASHOOTER,VARIATION_IMITATER);});
        capture([&](Graphics& g){cache.DrawCachedPlant(&g,260,180,SEED_MARIGOLD,VARIATION_MARIGOLD_WHITE);});
        Require(frames.size()==23&&cache.mImageVariations.mCount==56,"Cache probe did not cover every category");
        return frames;
    };
    // Prepare the same loading contract before measuring private image lifetime.
    // Reference frames check stability across recreation, not 1073 pixel identity.
    std::vector<Fingerprint> reference;
    {ReanimatorCache warm;warm.ReanimatorCacheInitialize();warm.PrebuildCacheFrames();reference=drawPass(warm);}
    const auto before=imageCount();
    for(int mode=0;mode<3;++mode){
        {ReanimatorCache cache;Require(empty(cache),"Cache default constructor left indeterminate slots");
            cache.ReanimatorCacheInitialize();cache.PrebuildCacheFrames();
            Require(drawPass(cache)==reference,"Recreated cache changed its actual GPU frames");
            const auto populated=imageCount();Require(populated==before+148,"Cache published unexpected image count");
            Require(drawPass(cache)==reference&&imageCount()==populated,"Cache hits rebuilt images or changed frames");
            if(mode==1){cache.ReanimatorCacheDispose();cache.ReanimatorCacheDispose();Require(empty(cache)&&imageCount()==before,"Explicit cache cleanup left images");}
            if(mode==2){cache.ReanimatorCacheInitialize();Require(empty(cache)&&imageCount()==before,"Cache reinitialization leaked images");
                cache.PrebuildCacheFrames();
                Require(drawPass(cache)==reference,"Reinitialized cache changed frames");}
        }
        Require(imageCount()==before,"Cache destructor left images registered");
        log<<"reanim-cache mode="<<mode<<" images-before="<<before<<" images-after="<<imageCount()<<" frames-match=1"<<std::endl;
    }
    ModernSmoke::Report("reanim-cache-23-frames-three-lifetime-paths",app);
}
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
void FontDescriptorFileCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    struct ParseFailure{};struct ReadFailure{};
    struct SilentFontData final:FontData {
        bool throwError=false;
        bool Error(const std::string& error)override{if(throwError)throw ParseFailure{};return DescParser::Error(error);}
    };
    // Observe only the private descriptor; every ordinary pak operation forwards
    // to the real interface. The pointer mapping belongs to this isolated PID.
    struct Observer final:PakInterfaceBase {
        PakInterfaceBase& real;std::string target;PFILE* pending=nullptr;
        unsigned opened=0,closed=0;bool throwRead=false;
        Observer(PakInterfaceBase& r,std::string p):real(r),target(std::move(p)){}
        ~Observer(){if(pending)real.FClose(pending);} // Negative-test cleanup, after recording failure.
        PFILE* FOpen(const char* n,const char* a)override{auto* f=real.FOpen(n,a);if(f&&target==n){Require(!pending,"Overlapping private descriptor");pending=f;++opened;}return f;}
        int FClose(PFILE* f)override{if(f==pending){pending=nullptr;++closed;}return real.FClose(f);}
        int FGetC(PFILE* f)override{if(f==pending&&throwRead)throw ReadFailure{};return real.FGetC(f);}
        int FSeek(PFILE* f,long n,int o)override{return real.FSeek(f,n,o);}
        int FTell(PFILE* f)override{return real.FTell(f);}
        size_t FRead(void* p,int s,int n,PFILE* f)override{return real.FRead(p,s,n,f);}
        int UnGetC(int c,PFILE* f)override{return real.UnGetC(c,f);}
        char* FGetS(char* p,int n,PFILE* f)override{return real.FGetS(p,n,f);}
        int FEof(PFILE* f)override{return real.FEof(f);}
        HANDLE FindFirstFile(LPCTSTR p,LPWIN32_FIND_DATA d)override{return real.FindFirstFile(p,d);}
        BOOL FindNextFile(HANDLE h,LPWIN32_FIND_DATA d)override{return real.FindNextFile(h,d);}
        BOOL FindClose(HANDLE h)override{return real.FindClose(h);}
    };
    auto* original=GetPakPtr();Require(original,"Actual pak interface missing");
    unsigned wrong=0;
    for(unsigned mode=0;mode<6;++mode) {
        const auto path=ModernSmoke::ProbePath("private-font-descriptor.txt");
        {std::ofstream out(path);out<<(mode==1||mode==3?"UnknownPrivateFontCommand;":"Define Private (1 2);");out.close();Require(bool(out),"Private font descriptor write failed");}
        Observer observer(*original,path);observer.throwRead=mode==4;
        struct Restore {PakInterfaceBase* old;~Restore(){*gPakInterfaceP=old;}} restore{original};
        *gPakInterfaceP=&observer;
        SilentFontData data;data.throwError=mode==3;bool loaded=false,caught=false;
        try{loaded=data.LoadTextForTest(&app,mode==2?ModernSmoke::ProbePath("absent-private-font.txt"):path);
            if(mode==5)loaded=!data.LoadTextForTest(&app,path)&&data.mInitialized;}
        catch(const ParseFailure&){caught=mode==3;}
        catch(const ReadFailure&){caught=mode==4;}
        const bool expected=mode==0||mode==5;
        bool ok=observer.pending==nullptr&&observer.opened==observer.closed&&data.mInitialized==expected;
        ok=ok&&((mode==3||mode==4)?caught:(!caught&&loaded==expected));
        if(expected)ok=ok&&data.DataElementToString(data.mDefineMap.at("PRIVATE"))=="(1, 2)";
        if(mode==1)ok=ok&&!data.mError.empty();
        log<<"font-file mode="<<mode<<" loaded="<<loaded<<" initialized="<<data.mInitialized<<" exception="<<caught
            <<" opened="<<observer.opened<<" closed="<<observer.closed<<" pass="<<ok<<std::endl;
        wrong+=!ok;
    }
    Require(!wrong,"Font descriptor failed to preserve status, exceptions or actual file lifetime");
    ModernSmoke::Report("font-load-six-real-files-status-error-close",app);
}
void FontDefinitionCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    FontData definitions; // No app popup, user configuration or resource publication.
    Require(definitions.ParseDescriptorLine("Define Base (7 ('eight' 9))"),"Real Define list rejected");
    Require(definitions.ParseDescriptorLine("Define Alias Base"),"Real Define alias rejected");
    Require(definitions.mDefineMap.at("ALIAS")!=definitions.mDefineMap.at("BASE")&&
        definitions.DataElementToString(definitions.mDefineMap.at("ALIAS"))=="(7, (eight, 9))","Define alias not a deep value copy");
    Require(definitions.ParseDescriptorLine("Define Base (10 11)")&&
        definitions.DataElementToString(definitions.mDefineMap.at("ALIAS"))=="(7, (eight, 9))","Redefining source changed its copied alias");
    Require(definitions.ParseDescriptorLine("CreateHorzSpanRectList Rects (1 2 40 4) (5 6 7)")&&
        definitions.DataElementToString(definitions.mDefineMap.at("RECTS"))=="((1, 2, 5, 4), (6, 2, 6, 4), (12, 2, 7, 4))","Real font span rectangles changed");
    struct CountedWord final:SingleDataElement {
        unsigned& destroyed;
        explicit CountedWord(unsigned& n):SingleDataElement("old"),destroyed(n){}
        ~CountedWord()override{++destroyed;}
    };
    unsigned destroyed=0;
    for(unsigned i=0;i<32;++i) {
        ListDataElement source,output;
        AppendOwnedDataElement(output.mElementVector,std::make_unique<CountedWord>(destroyed));
        auto child=std::make_unique<ListDataElement>();
        AppendOwnedDataElement(child->mElementVector,std::make_unique<CountedWord>(destroyed));
        AppendOwnedDataElement(output.mElementVector,std::move(child));
        Require(definitions.ParseToList("'hello' Base Alias",&source,false,nullptr)&&
            definitions.GetValues(&source,&output),"Real output list expansion failed");
        Require(destroyed==(i+1)*2&&definitions.DataElementToString(&output)=="(hello, (10, 11), (7, (eight, 9)))",
            "Output reuse leaked old children or changed expansion");
    }
    unsigned fonts=0,values=0;
    const auto& resourceSlots=app.mResourceManager->mResourceSlots;
    for(auto* resource:resourceSlots) {
        if(!resource||resource->mType!=ResourceManager::ResType_Font)continue;
        auto* font=dynamic_cast<ImageFont*>(static_cast<ResourceManager::FontRes*>(resource)->mFont);
        if(!font||!font->mFontData->mInitialized)continue;
        ++fonts;
        for(const auto& [name,value]:font->mFontData->mDefineMap) {
            std::unique_ptr<DataElement> copy(value->Duplicate());
            Require(copy.get()!=value&&definitions.DataElementToString(copy.get())==definitions.DataElementToString(value),
                "Loaded font definition changed during deep copy");
            ++values;
        }
    }
    Require(fonts>0&&values>0,"No real loaded font definitions were checked");
    log<<"font-definition loadedFonts="<<fonts<<" copiedValues="<<values<<" reusedLists=32 destroyedOldWords="<<destroyed<<std::endl;
    ModernSmoke::Report("font-definitions-real-commands-loaded-copies-32-reused-lists",app);
}
void FontLayerRegistrationCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    struct CallbackFailure{};
    struct QuietFont final:FontData {
        bool throwError=false;unsigned errors=0;
        bool Error(const std::string& text)override{++errors;if(throwError)throw CallbackFailure{};return DescParser::Error(text);}
    };
    auto coherent=[](const FontData& data){
        if(data.mFontLayerList.size()!=data.mFontLayerMap.size())return false;
        for(const auto& layer:data.mFontLayerList){unsigned found=0;for(const auto& [name,p]:data.mFontLayerMap)found+=p==&layer;if(found!=1)return false;}
        return true;
    };
    unsigned fonts=0,layers=0,copies=0,rejections=0;
    const auto& resourceSlots=app.mResourceManager->mResourceSlots;
    for(auto* res:resourceSlots){
        if(!res||res->mType!=ResourceManager::ResType_Font)continue;
        auto* font=dynamic_cast<ImageFont*>(static_cast<ResourceManager::FontRes*>(res)->mFont);
        if(!font||!font->mFontData->mInitialized)continue;
        Require(coherent(*font->mFontData),"Loaded font layer indexes disagree");++fonts;
        for(const auto& original:font->mFontData->mFontLayerList){
            ++layers;QuietFont data;
            // Copy a loaded real glyph layer privately; never mutate the shared font.
            data.mFontLayerList.emplace_back(original);auto* source=&data.mFontLayerList.back();source->mFontData=&data;
            data.mFontLayerMap.emplace("SOURCE",source);
            source->mExtendedInfo["PrivateCopyKey"]="PrivateCopyValue";
            const int sourceOrder=source->mBaseOrder;
            Require(data.ParseDescriptorLine("CreateLayer Fresh")&&data.mFontLayerMap.at("FRESH")->mUseAlphaCorrection,
                "Default font layer alpha flag differs from 1073");
            Require(data.mFontLayerMap.at("FRESH")->mBaseOrder==1&&data.mFontLayerMap.at("FRESH")->mLayerName=="FRESH",
                "New font layer lost its creation order/name");
            Require(data.ParseDescriptorLine("CreateLayerFrom Clone Source"),"Real font layer clone rejected");
            auto* clone=data.mFontLayerMap.at("CLONE");
            Require(clone->mBaseOrder==2&&clone->mLayerName=="CLONE"&&clone->mExtendedInfo==source->mExtendedInfo,
                "Cloned layer lost new order/name or copied extension metadata");
            clone->mExtendedInfo["PrivateCopyKey"]="ChangedCloneOnly";
            Require(source->mExtendedInfo.at("PrivateCopyKey")=="PrivateCopyValue","Extension metadata aliases its source");
            Require(data.ParseDescriptorLine("LayerSetBaseOrder Clone -37")&&clone->mBaseOrder==-37,
                "Explicit font order override was lost");
            Require(clone!=source&&static_cast<Image*>(clone->mImage)==static_cast<Image*>(source->mImage)&&
                clone->mRequiredTags==source->mRequiredTags&&clone->mExcludedTags==source->mExcludedTags&&
                clone->mUseAlphaCorrection==source->mUseAlphaCorrection,"Real layer copy changed glyph/image/tag metadata");
            for(int ch=0;ch<source->kCharSlots;++ch){const auto& glyph=source->mCharData[ch];const auto& copied=clone->mCharData[ch];
                Require(copied.mWidth==glyph.mWidth&&copied.mKerningPairs==glyph.mKerningPairs,"Cloned glyph/kerning changed");}
            {   // 阵列版深浅拷贝探针：清 clone 槽，源槽必须仍在（非别名）。
                int key=-1; for(int ch=0;ch<clone->kCharSlots;++ch) if(clone->mCharData[ch].mWidth!=0){key=ch;break;}
                if(key>=0){clone->mCharData[key]=CharData();
                    Require(source->mCharData[key].mWidth!=0,"Font layer clone aliases the source glyph map");}}
            ++copies;
            for(const char* command:{"CreateLayer Source","CreateLayerFrom Clone Source","CreateLayerFrom Source Source"}){
                Require(!data.ParseDescriptorLine(command)&&data.mFontLayerList.size()==3&&coherent(data)&&data.mFontLayerMap.at("SOURCE")==source,
                    "Duplicate font layer was accepted or left an orphan");++rejections;
            }
            data.throwError=true;bool caught=false;
            try{data.ParseDescriptorLine("CreateLayerFrom Clone Source");}catch(const CallbackFailure&){caught=true;}
            Require(caught&&coherent(data)&&data.mFontLayerList.size()==3,"Throwing font error callback corrupted layer registration");
            data.throwError=false;
            Require(data.ParseDescriptorLine("CreateLayerFrom Next Clone")&&data.mFontLayerMap.at("NEXT")->mBaseOrder==3&&
                data.mFontLayerMap.at("NEXT")->mLayerName=="NEXT"&&clone->mBaseOrder==-37&&source->mBaseOrder==sourceOrder,
                "Cloning an explicitly ordered font did not assign a fresh creation order");
        }
    }
    Require(fonts&&layers&&copies==layers,"No loaded font layers were exercised");
    log<<"font-layer-registration fonts="<<fonts<<" layers="<<layers<<" deepCopies="<<copies<<" duplicateRejections="<<rejections<<std::endl;
    ModernSmoke::Report("font-layer-registration-real-loaded-copies-duplicates",app);
}
#endif

void CompiledFontCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    const auto source=ResolveCompiledFontPath("data/BrianneTod16.txt");
    std::unique_ptr<PFILE,decltype(&p_fclose)> file(p_fopen(source.c_str(),"rb"),&p_fclose);
    Require(file&&p_fseek(file.get(),0,SEEK_END)==0,"Compiled font fixture missing");
    const int size=p_ftell(file.get());Require(size>32&&p_fseek(file.get(),0,SEEK_SET)==0,"Compiled font fixture size invalid");
    std::vector<unsigned char> valid(size);
    Require(p_fread(valid.data(),1,size,file.get())==size_t(size),"Compiled font fixture read failed");
    const auto path=ModernSmoke::ProbePath("private-numeric.compiled");
    auto write=[&](const std::vector<unsigned char>& data){std::ofstream out(path,std::ios::binary|std::ios::trunc);
        out.write(reinterpret_cast<const char*>(data.data()),data.size());out.close();Require(bool(out),"Compiled font fixture write failed");};
    unsigned rejected=0;
    for(unsigned mode=0;mode<5;++mode){
        auto bytes=valid;
        if(mode==0)bytes.clear();
        if(mode==1)bytes.resize(31);
        if(mode==2)bytes[0]^=1;
        if(mode==3)bytes[4]^=1;
        if(mode==4)bytes.back()^=1;
        write(bytes);FontData data;
        Require(!data.Load(&app,path)&&!data.mInitialized&&data.mFontLayerList.empty()&&data.mCharMap.empty(),
            "Malformed compiled font published partial state");
        write(valid);Require(data.Load(&app,path)&&data.mInitialized&&!data.Load(&app,path),"Compiled font retry/reload failed");
        Require(std::filesystem::remove(path),"Compiled font retained its private file");++rejected;
    }
    FontData absent;Require(!absent.Load(&app,path)&&absent.mFontLayerList.empty(),"Missing compiled font was accepted");
    unsigned fonts=0,layers=0;
    const auto& resourceSlots=app.mResourceManager->mResourceSlots;
    for(auto* res:resourceSlots){
        if(!res||res->mType!=ResourceManager::ResType_Font)continue;
        auto* font=dynamic_cast<ImageFont*>(static_cast<ResourceManager::FontRes*>(res)->mFont);
        if(!font||!font->mFontData->mInitialized)continue;
        ++fonts;
        for(const auto& original:font->mFontData->mFontLayerList){
            FontLayer copy(original);++layers;
            Require(copy.mLayerId==original.mLayerId&&copy.mBaseOrder==original.mBaseOrder&&
                copy.mRequiredTags==original.mRequiredTags&&copy.mExcludedTags==original.mExcludedTags&&
                copy.mColorMult==original.mColorMult&&copy.mColorAdd==original.mColorAdd&&
                copy.mDrawMode==original.mDrawMode&&copy.mUseAlphaCorrection==original.mUseAlphaCorrection,
                "Numeric layer copy changed rendering metadata");
            for(int ch=0;ch<FontLayer::kCharSlots;++ch){const auto& a=original.mCharData[ch];const auto& b=copy.mCharData[ch];
                Require(a.mImageRect==b.mImageRect&&a.mOffset.mX==b.mOffset.mX&&a.mOffset.mY==b.mOffset.mY&&a.mWidth==b.mWidth&&a.mOrder==b.mOrder&&
                    a.mKerningPairs==b.mKerningPairs,"Numeric layer glyph copy changed metrics");}
            copy.mCharData['A'].mWidth+=1;
            Require(copy.mCharData['A'].mWidth!=original.mCharData['A'].mWidth,"Numeric glyph copy aliases source");
        }
        std::unique_ptr<ImageFont> duplicate(static_cast<ImageFont*>(font->Duplicate()));
        Require(duplicate->AddTagNumeric(7)&&duplicate->HasTagNumeric(7)&&!duplicate->AddTagNumeric(7)&&
            duplicate->RemoveTagNumeric(7)&&!duplicate->HasTagNumeric(7)&&!duplicate->RemoveTagNumeric(7),"Numeric font tag set contract changed");
        Require(duplicate->mTagIds==font->mTagIds,"Numeric tags changed the shared font");
    }
    Require(fonts&&layers,"No loaded numeric fonts checked");
    log<<"compiled-font malformed="<<rejected<<" retry="<<rejected<<" fonts="<<fonts<<" copiedLayers="<<layers<<std::endl;
    ModernSmoke::Report("font-numeric-five-malformed-retries-loaded-layer-copies-tags",app);
}

// Mutate bounded records in the complete production manifest. A small private
// manifest cannot satisfy the runtime's fixed slot and image-symbol registry.
struct NumericResourceFixture {
    using Bytes=Sexy::ByteVector;
    std::array<unsigned,9> header{};
    std::vector<Bytes> records;
    static unsigned U32(const Bytes& bytes,size_t offset) {
        Require(offset<=bytes.size()&&bytes.size()-offset>=4,"Numeric fixture field is out of bounds");
        return unsigned(bytes[offset])|(unsigned(bytes[offset+1])<<8)|
            (unsigned(bytes[offset+2])<<16)|(unsigned(bytes[offset+3])<<24);
    }
    static void Put(Bytes& bytes,size_t offset,unsigned value) {
        Require(offset<=bytes.size()&&bytes.size()-offset>=4,"Numeric fixture write is out of bounds");
        for(unsigned n=0;n<4;++n)bytes[offset+n]=static_cast<unsigned char>(value>>(n*8));
    }
    static void Append(Bytes& bytes,unsigned value) {
        const auto offset=bytes.size();bytes.resize(offset+4);Put(bytes,offset,value);
    }
    static void Path(Bytes& bytes,const std::string& path) {
        Require(path.size()<=4096&&path.find('\0')==std::string::npos,"Numeric fixture path is not bounded");
        Append(bytes,unsigned(path.size()));bytes.insert(bytes.end(),path.begin(),path.end());
    }
    explicit NumericResourceFixture(LawnApp& app) {
        Sexy::Buffer buffer;
        Require(app.ReadBufferFromFile("compiled/resources.compiled",&buffer,true),
            "Cannot read the production numeric resource manifest");
        const auto& bytes=buffer.mData;
        Require(bytes.size()>=36&&bytes.size()<=16*1024*1024,"Production numeric manifest size changed");
        for(unsigned n=0;n<9;++n)header[n]=U32(bytes,n*4);
        Require(header[0]==0x4353524eu&&header[1]==1&&header[2]==unsigned(Sexy::ResourceId::RESOURCE_ID_MAX)&&
            header[3]==std::size(gImageSymbolResourceSlots)&&header[4]==NUMERIC_RESOURCE_SLOT_COUNT&&header[5]==header[4]&&
            header[6]==IMAGE_SYMBOL_REGISTRY_CRC&&header[8]==bytes.size()-36&&
            header[7]==crc32(0,bytes.data()+36,header[8]),"Production numeric manifest contract changed");
        size_t offset=36;records.reserve(header[5]);
        for(unsigned n=0;n<header[5];++n){
            const auto length=U32(bytes,offset);offset+=4;
            Require(length>=44&&length<=65536&&length<=bytes.size()-offset,"Production numeric record is not bounded");
            records.emplace_back(bytes.begin()+offset,bytes.begin()+offset+length);offset+=length;
        }
        Require(offset==bytes.size(),"Production numeric manifest has trailing records");
    }
    Bytes& Record(unsigned slot) {
        for(auto& record:records)if(U32(record,0)==slot)return record;
        throw std::runtime_error("Numeric fixture slot missing from production manifest");
    }
    void Image(unsigned slot,const std::string& path,unsigned variant,const std::string& alpha={},
        unsigned rows=2,unsigned cols=2,unsigned anim=unsigned(Sexy::AnimType_Loop)) {
        auto& record=Record(slot);Require(U32(record,12)==Sexy::ResourceManager::ResType_Image,"Fixture slot is not an image");
        Bytes replacement(record.begin(),record.begin()+16);
        Append(replacement,8u|1024u); // Keep private pixels; enable the real automatic-alpha decoder.
        Append(replacement,Sexy::RESOURCE_SLOT_NONE);Append(replacement,variant);
        Path(replacement,path);Path(replacement,alpha);Path(replacement,{});Path(replacement,{});
        Append(replacement,rows);Append(replacement,cols);Append(replacement,0xffffffu);
        Append(replacement,anim);Append(replacement,7);Append(replacement,0);Append(replacement,0);
        Append(replacement,0);Append(replacement,0);record=std::move(replacement);
    }
    Bytes Encode() const {
        Bytes payload;
        for(const auto& record:records){Append(payload,unsigned(record.size()));payload.insert(payload.end(),record.begin(),record.end());}
        Bytes bytes;for(auto value:header)Append(bytes,value);
        Put(bytes,28,unsigned(crc32(0,payload.data(),unsigned(payload.size()))));Put(bytes,32,unsigned(payload.size()));
        bytes.insert(bytes.end(),payload.begin(),payload.end());return bytes;
    }
    static void Write(const std::string& path,const Bytes& bytes) {
        std::ofstream out(path,std::ios::binary|std::ios::trunc);
        out.write(reinterpret_cast<const char*>(bytes.data()),std::streamsize(bytes.size()));out.close();
        Require(bool(out),"Cannot write private numeric resource manifest");
    }
    void Write(const std::string& path) const {Write(path,Encode());}
};
void BufferInputCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    unsigned cases=0;
    for(size_t size : {size_t(0),size_t(1),size_t(7),size_t(256),size_t(65537)}) {
        ByteVector expected(size);
        for(size_t i=0;i<size;++i) expected[i]=static_cast<uchar>(i*37+19);
        auto owned=expected;
        auto* allocation=owned.data();
        Buffer moved;moved.WriteByte(0x71);moved.mReadBitPos = 0;
        const int read=moved.mReadBitPos,write=moved.mWriteBitPos;
        moved.SetData(std::move(owned));
        Require(moved.mData==expected && (!size || moved.mData.data()==allocation) &&
            moved.mDataBitSize==int(size*8) && moved.mReadBitPos==read && moved.mWriteBitPos==write,
            "Moved Buffer changed ownership, bytes or existing cursor semantics");
        const auto path=ModernSmoke::ProbePath("buffer-input-"+std::to_string(size)+".bin");
        {
            std::ofstream file(path,std::ios::binary|std::ios::trunc);
            if(size) file.write(reinterpret_cast<const char*>(expected.data()),std::streamsize(size));
            file.close();Require(bool(file),"Cannot write isolated Buffer input");
        }
        Buffer input;input.WriteByte(0xa7);input.ReadByte();
        Require(app.ReadBufferFromFile(path,&input,true) && input.mData==expected &&
            input.mDataBitSize==int(size*8) && input.mReadBitPos==0 && input.mWriteBitPos==0,
            "Real Buffer file read changed bytes or input cursors");
        Require(std::filesystem::remove(path),"Buffer fixture retained its file");++cases;
    }
    Buffer packed;
    Require(app.ReadBufferFromFile("compiled/resources.compiled",&packed,true) &&
        packed.GetDataLen()>36 && packed.mReadBitPos==0 && packed.mWriteBitPos==0,
        "Pack-backed numeric Buffer read did not use the input contract");
    Buffer missing;missing.WriteByte(0xa8);
    const auto bytes=missing.mData;const auto size=missing.mDataBitSize;
    Require(!app.ReadBufferFromFile(ModernSmoke::ProbePath("buffer-definitely-absent.bin"),&missing,true) &&
        missing.mData==bytes && missing.mDataBitSize==size,
        "Missing Buffer file changed existing output");
    log<<"buffer-input-move cases="<<cases<<" pointerIdentity=1 looseExact=1 packedExact=1 missingPreserved=1\n";
    ModernSmoke::Report("buffer-input-five-owned-moves-loose-and-packed-files",app);
}

void ManifestLifetimeCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    const auto file=ModernSmoke::ProbePath("private-resource-manifest.numeric.resources");
    const NumericResourceFixture valid(app);valid.Write(file);
    constexpr auto imageId=static_cast<unsigned>(ResourceId::IMAGE_BLANK_ID);
    constexpr auto soundId=static_cast<unsigned>(ResourceId::SOUND_BUTTONCLICK_ID);
    constexpr auto fontId=static_cast<unsigned>(ResourceId::FONT_BRIANNETOD16_ID);
    {
        ResourceManager resources(&app);
        Require(resources.mResourceSlots.size()==NUMERIC_RESOURCE_SLOT_COUNT&&
            resources.mImageSlots.size()==std::size(gImageSymbolResourceSlots)&&resources.GetNumResources()==0&&
            std::all_of(resources.mResourceSlots.begin(),resources.mResourceSlots.end(),[](auto* res){return res==nullptr;})&&
            std::all_of(resources.mImageSlots.begin(),resources.mImageSlots.end(),[](auto* res){return res==nullptr;}),
            "Fresh resource and image-symbol tables are not fixed and empty");
        Require(resources.mResGroupMap.size()==RESOURCE_GROUP_COUNT+1&&resources.mResGroupPresent.none()&&
            resources.mLoadedGroups.none(),"Fresh resource group tables are not bounded and empty");
        Require(!resources.LoadResources(ResourceGroupId::Invalid)&&resources.HadError()&&
            resources.mCurResGroupList==nullptr&&resources.mResGroupPresent.none()&&resources.mLoadedGroups.none(),
            "Invalid resource group 0 was loaded or published");
        for(unsigned groupId=1;groupId<=RESOURCE_GROUP_COUNT;++groupId){
            const auto group=static_cast<ResourceGroupId>(groupId);
            Require(resources.GetResGroupList(group)==nullptr&&!resources.IsGroupLoaded(group),
                "Missing canonical group was already present or loaded");
            Require(resources.LoadResources(group)&&resources.IsGroupLoaded(group)&&
                resources.mCurResGroupList==&resources.mResGroupMap[groupId]&&resources.mResGroupMap[groupId].empty()&&
                resources.mResGroupPresent.test(groupId),"Empty canonical group did not load in its direct slot");
            resources.DeleteResources(group);
            Require(!resources.IsGroupLoaded(group)&&resources.GetResGroupList(group)==&resources.mResGroupMap[groupId]&&
                resources.mResGroupPresent.test(groupId),"Group deletion lost its empty descriptor list");
        }
        resources.SetGroupLoaded(ResourceGroupId::Init);resources.SetGroupLoaded(ResourceGroupId::LoadingSounds);
        resources.DeleteResources();
        Require(resources.mLoadedGroups.none()&&resources.mResGroupPresent.count()==RESOURCE_GROUP_COUNT,
            "Global deletion failed to clear loaded bits or erased group presence");
        const auto fixedGroups=resources.mResGroupMap;const auto fixedPresence=resources.mResGroupPresent;
        constexpr auto fixtureGroup=static_cast<ResourceGroupId>(0xffffffffu);
        Require(!resources.LoadResources(fixtureGroup)&&resources.HadError()&&!resources.IsGroupLoaded(fixtureGroup)&&
            resources.mCurResGroupList==nullptr&&resources.GetResGroupList(fixtureGroup)==nullptr,
            "Production accepted an out-of-range resource group");
        Require(resources.mResGroupMap==fixedGroups&&resources.mResGroupPresent==fixedPresence&&resources.mLoadedGroups.none(),
            "Out-of-range resource group changed canonical storage");
        Require(resources.ParseResourcesFile(file)&&resources.GetNumResources()==int(NUMERIC_RESOURCE_SLOT_COUNT),
            "Normal numeric manifest publication failed");
        const auto* image=resources.mResourceSlots[imageId];
        const auto* sound=resources.mResourceSlots[soundId];
        const auto* font=resources.mResourceSlots[fontId];
        Require(image->mType==ResourceManager::ResType_Image&&sound->mType==ResourceManager::ResType_Sound&&
            font->mType==ResourceManager::ResType_Font,"Numeric manifest lost one of its three resource types");
        std::array<int,3> typeCounts{};
        for(const auto& record:valid.records){
            const unsigned slot=NumericResourceFixture::U32(record,0),type=NumericResourceFixture::U32(record,12);
            const auto* resource=resources.mResourceSlots[slot];
            Require(resource&&resource->mId==slot&&resource->mType==type&&resources.GetResourceBySlot(slot)==resource,
                "Numeric descriptor is not owned by its canonical slot");
            ++typeCounts[type];
        }
        Require(resources.GetNumImages()==typeCounts[ResourceManager::ResType_Image]&&
            resources.GetNumSounds()==typeCounts[ResourceManager::ResType_Sound]&&
            resources.GetNumFonts()==typeCounts[ResourceManager::ResType_Font]&&
            resources.GetResourceBySlot(NUMERIC_RESOURCE_SLOT_COUNT)==nullptr&&
            resources.GetResourceBySlot(RESOURCE_SLOT_NONE)==nullptr,
            "Direct resource type counts or bounded slot lookup changed");
        const auto slotsBefore=resources.mResourceSlots;
        Require(!resources.ReplaceImage(soundId,nullptr)&&!resources.ReplaceSound(fontId,-1)&&
            !resources.ReplaceFont(imageId,nullptr)&&resources.mResourceSlots==slotsBefore,
            "Wrong-type resource replacement was accepted or changed owning slots");
        size_t members=0;
        Require(resources.mResGroupMap.size()==RESOURCE_GROUP_COUNT+1&&resources.mResGroupMap[0].empty()&&
            !resources.mResGroupPresent.test(0),"Numeric manifest published the reserved invalid group");
        for(unsigned groupId=1;groupId<=RESOURCE_GROUP_COUNT;++groupId){
            const auto group=static_cast<ResourceGroupId>(groupId);
            const auto& list=resources.mResGroupMap[groupId];
            Require(resources.mResGroupPresent.test(groupId)||list.empty(),"Numeric manifest lost group presence");
            auto next=list.begin();
            std::array<int,3> groupCounts{};
            for(const auto& record:valid.records)if(NumericResourceFixture::U32(record,8)==groupId){
                Require(next!=list.end()&&(*next)->mId==NumericResourceFixture::U32(record,0),
                    "Numeric group resource order differs from manifest order");++next;
                if((NumericResourceFixture::U32(record,16)&1u)==0)++groupCounts[NumericResourceFixture::U32(record,12)];
            }
            Require(next==list.end(),"Numeric group contains extra manifest entries");
            Require(resources.GetNumImages(group)==groupCounts[ResourceManager::ResType_Image]&&
                resources.GetNumSounds(group)==groupCounts[ResourceManager::ResType_Sound]&&
                resources.GetNumFonts(group)==groupCounts[ResourceManager::ResType_Font]&&
                resources.GetNumResources(group)==groupCounts[0]+groupCounts[1]+groupCounts[2],
                "Direct group type counts changed program-resource exclusion");
            for(const auto* resource:list){Require(resource->mResGroup==group&&resources.GetResourceBySlot(resource->mId)==resource,
                "Numeric group member disagrees with its slot");++members;}
        }
        Require(members==unsigned(ResourceId::RESOURCE_ID_MAX),"Numeric group publication duplicated or lost members");
        for(unsigned symbol=1;symbol<std::size(gImageSymbolResourceSlots);++symbol){const auto* resource=resources.GetImageResBySlot(symbol);
            Require(resource&&resource->mImageSymbol==symbol&&resource->mId==ResourceSlotForImageSymbol(symbol)&&
                resources.GetResourceBySlot(resource->mId)==resource,"Numeric image-symbol index is incoherent");}
        const auto imageSlots=resources.mImageSlots;
        bool badSymbolCount=false;
        try{resources.AttachImageSlots(unsigned(imageSlots.size()));}
        catch(const ResourceManagerException& error){
            badSymbolCount=error.error==ResourceError{ResourceFailure::ImageSymbolCount,
                RESOURCE_SLOT_NONE,unsigned(std::size(gImageSymbolResourceSlots))};
        }
        Require(badSymbolCount&&resources.mImageSlots==imageSlots&&resources.mResourceSlots==slotsBefore,
            "Wrong image-symbol count resized or cleared the generated tables");
        resources.AttachImageSlots(unsigned(imageSlots.size()-1));
        Require(resources.mImageSlots==imageSlots&&resources.mResourceSlots==slotsBefore,
            "Image-symbol reattachment changed its non-owning descriptor bindings");
        const auto groups=resources.mResGroupPresent;
        resources.SetGroupLoaded(image->mResGroup);
        Require(resources.ReparseResourcesFile(file)&&!resources.mAllowAlreadyDefinedResources&&resources.mLoadedGroups.none()&&
            resources.mResourceSlots[imageId]!=image&&resources.mResourceSlots[soundId]!=sound&&resources.mResourceSlots[fontId]!=font&&
            resources.mResGroupPresent==groups&&resources.GetNumResources()==int(NUMERIC_RESOURCE_SLOT_COUNT),
            "Successful numeric reparse did not replace all indexes or clear loaded groups");
    }
    unsigned rejected=0;
    for(unsigned mode=0;mode<12;++mode)for(bool replace:{false,true})for(bool previous:{false,true}){
        ResourceManager resources(&app);
        if(replace){Require(resources.ParseResourcesFile(file),"Cannot establish numeric replacement baseline");
            resources.SetGroupLoaded(resources.mResourceSlots[imageId]->mResGroup);}
        const auto groups=resources.mResGroupMap;const auto slots=resources.mResourceSlots;
        const auto groupPresent=resources.mResGroupPresent;
        const auto imageSlots=resources.mImageSlots;
        const auto loaded=resources.mLoadedGroups;
        resources.mAllowAlreadyDefinedResources=previous;
        auto malformed=valid;
        auto& record=malformed.Record(static_cast<unsigned>(ResourceId::IMAGE_PVZ_LOGO_ID));
        if(mode==3)NumericResourceFixture::Put(record,0,imageId); // Duplicate numeric identity.
        if(mode==4)NumericResourceFixture::Put(record,0,NUMERIC_RESOURCE_SLOT_COUNT);
        if(mode==5)NumericResourceFixture::Put(record,12,3); // Invalid type.
        if(mode==6)NumericResourceFixture::Put(record,12,ResourceManager::ResType_Sound); // Image symbol with wrong type.
        if(mode==7)NumericResourceFixture::Put(record,4,NumericResourceFixture::U32(malformed.Record(imageId),4));
        if(mode==8)NumericResourceFixture::Put(record,8,0); // Base slot cannot use the dynamic image group.
        if(mode==9)NumericResourceFixture::Put(record,16,0x4000u);
        if(mode==10)NumericResourceFixture::Put(record,28,4097); // Bounded path length.
        if(mode==11)record.pop_back(); // Bounded descriptor truncation, with a valid outer checksum.
        auto bytes=malformed.Encode();
        if(mode==0)bytes[0]^=1;
        if(mode==1)bytes.back()^=1; // Checksum rejection before any publication.
        if(mode==2)bytes.resize(35);
        NumericResourceFixture::Write(file,bytes);
        Require(!(replace?resources.ReparseResourcesFile(file):resources.ParseResourcesFile(file))&&resources.HadError()&&
            resources.mError.reason!=ResourceFailure::None&&resources.mAllowAlreadyDefinedResources==previous,
            "Malformed numeric manifest was accepted or changed reparse policy");
        constexpr std::array reasons{
            ResourceFailure::ManifestHeader,ResourceFailure::ManifestChecksum,ResourceFailure::ManifestHeader,
            ResourceFailure::DescriptorIdentity,ResourceFailure::DescriptorIdentity,ResourceFailure::DescriptorIdentity,
            ResourceFailure::DescriptorIdentity,ResourceFailure::DescriptorIdentity,ResourceFailure::DescriptorIdentity,
            ResourceFailure::DescriptorIdentity,ResourceFailure::DescriptorPath,ResourceFailure::DescriptorLength
        };
        const unsigned expectedSlot=mode<3?RESOURCE_SLOT_NONE:
            mode==3?imageId:mode==4?NUMERIC_RESOURCE_SLOT_COUNT:static_cast<unsigned>(ResourceId::IMAGE_PVZ_LOGO_ID);
        Require(resources.mError.reason==reasons[mode]&&resources.mError.slot==expectedSlot&&
            resources.mError.offset<=bytes.size(),
            "Malformed numeric manifest was accepted or changed reparse policy");
        Require(resources.mResGroupMap==groups&&resources.mResGroupPresent==groupPresent&&
            resources.mResourceSlots==slots&&resources.mImageSlots==imageSlots&&
            resources.mLoadedGroups==loaded,"Rejected numeric manifest published partial indexes or replaced existing resources");
        valid.Write(file);
        Require(resources.ReparseResourcesFile(file)&&!resources.HadError()&&resources.mAllowAlreadyDefinedResources==previous&&
            resources.mError==ResourceError{}&&
            resources.GetNumResources()==int(NUMERIC_RESOURCE_SLOT_COUNT),"Numeric manifest could not recover after rejection");
        log<<"numeric-manifest mode="<<mode<<" replacement="<<replace<<" previous="<<previous
            <<" atomic-rejection=1 corrected=1"<<std::endl;++rejected;
    }
    Require(rejected==48&&std::filesystem::remove(file),"Numeric manifest rejection coverage or file lifetime changed");
    ModernSmoke::Report("resource-numeric-manifest-three-types-48-atomic-rejections-retries",app);
}
template<class F> void Parallel(F&& fn) {
    std::latch start(1);
    std::vector<std::jthread> workers;
    try {
        for(int i=0;i<4;++i)workers.emplace_back([&,i]{start.wait();fn(i);});
    } catch (...) { start.count_down();throw; }
    start.count_down();
    // jthread joins before returning to the observation/reset phase.
}
struct CountedFont : Sexy::FontData {
    unsigned& destroyed;
    explicit CountedFont(unsigned& count):destroyed(count){}
    ~CountedFont() override {++destroyed;}
};
struct CountedImage : Sexy::MemoryImage {
    unsigned& destroyed;
    explicit CountedImage(unsigned& count):destroyed(count){SetDestroyType<CountedImage>();}
    ~CountedImage() {++destroyed;}
};
struct MemberImage : CountedImage {
    Sexy::SharedImageRef child;
    MemberImage(unsigned& count,Sexy::SharedImage& slot):CountedImage(count),child(&slot){SetDestroyType<MemberImage>();}
};
struct ReleasingImage : CountedImage {
    Sexy::SharedImageRef* target;
    ReleasingImage(unsigned& count,Sexy::SharedImageRef& ref):CountedImage(count),target(&ref){SetDestroyType<ReleasingImage>();}
    ~ReleasingImage() {if(target){auto* ref=target;target=nullptr;ref->Release();}}
};
void AssignmentCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size();
    const auto texturesBefore=render.mRenderer->GetResourceCounts().textures;
    auto* screenBits=screen->mBits;const auto screenVersion=screen->mBitsChangedCount;
    unsigned checks=0,gpu=0;
    const auto check=[&](bool ok,const char* why){++checks;Require(ok,why);};
    const auto fill=[](MemoryImage& image,uint32_t color){
        image.Create(4,4);std::fill_n(image.GetBits(),16,color);image.BitsChanged();
    };
    const auto draw=[&](SharedImageRef& ref,uint32_t color){
        screen->FillRect(Rect(0,0,800,600),Color(0,0,0),0);
        render.Blt(static_cast<MemoryImage*>(ref),120,140,Rect(0,0,4,4),Color::White,0,false);
        render.Flush();const auto pixels=render.mRenderer->ReadScenePixels();
        for(int y=0;y<4;++y)for(int x=0;x<4;++x)
            Require(pixels.at(size_t(140+y)*800+120+x)==color,"Assigned image GPU pixels changed");
        ++gpu;
    };
    {
        MemoryImage borrowed;fill(borrowed,0xff23a6d1u);
        SharedImageRef source;source=&borrowed;SharedImageRef assigned;assigned=source;
        check(assigned.mUnsharedImage==&borrowed && !assigned.mOwnsUnshared,"Borrowed image copy assignment failed");
        draw(assigned,0xff23a6d1u);
        unsigned destroyed=0;
        SharedImageRef owner;auto* image=new CountedImage(destroyed);fill(*image,0xffe57b31u);
        owner=image;owner.mOwnsUnshared=true;owner=owner;owner=image;
        SharedImageRef alias(owner);owner=alias;
        check(!destroyed && owner.mOwnsUnshared && !alias.mOwnsUnshared,"Owned self/alias assignment changed lifetime");
        draw(owner,0xffe57b31u);
        owner.Release();
        check(destroyed==1 && !owner.mOwnsUnshared && !owner.mUnsharedImage,"Release did not detach ownership");
        owner=&borrowed;owner.Release();
        check(!owner.mOwnsUnshared,"Borrowed pointer inherited old ownership");
        // Aliases are borrowed views, not independent owners. Discard this
        // view without using it after the owning image has been released.
        alias.Release();
    }
    {
        DDImage target(app.mDDInterface);fill(target,0xff73c425u);SharedImage slot;slot.mImage=&target;
        SharedImageRef ref(&slot);ref=ref;ref=&slot;ref=static_cast<MemoryImage*>(&target);
        check(ref.mSharedImage==&slot && slot.mRefCount==1,"Shared self-rebind dropped lifetime");
        draw(ref,0xff73c425u);
        ref=static_cast<SharedImage*>(nullptr);
        check(!ref.mSharedImage && slot.mRefCount==0 && !ref.mOwnsUnshared,"Null shared reset failed");
        unsigned destroyed=0;auto* holder=new MemberImage(destroyed,slot);
        ref=holder;ref.mOwnsUnshared=true;ref=holder->child;
        check(destroyed==1 && ref.mSharedImage==&slot && slot.mRefCount==1,"Member source was released before copy");
        draw(ref,0xff73c425u);
        ref.Release();
        ref=new ReleasingImage(destroyed,ref);ref.mOwnsUnshared=true;ref.Release();
        check(destroyed==2 && !ref.mOwnsUnshared && !ref.mUnsharedImage,"Reentrant actual image release failed");
    }
    unsigned oldDestroyed=0,newDestroyed=0;
    {
        ResourceManager manager(&app);
        auto resource=std::make_unique<ResourceManager::ImageRes>();
        auto* res=resource.get();res->mFromProgram=true;res->mId=static_cast<unsigned>(ResourceId::IMAGE_BLANK_ID);
        Require(manager.mResourceSlots[res->mId]==nullptr,"Private image fixture resource slot is occupied");
        manager.mResourceSlots[res->mId]=resource.release();
        auto* image=new CountedImage(oldDestroyed);fill(*image,0xff4267b9u);
        res->mImage=image;
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,image) && res->mImage.mOwnsUnshared && !oldDestroyed,
            "Actual ReplaceImage no longer adopts identical borrowed raw images");
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,image) && !oldDestroyed && res->mImage.mOwnsUnshared,
            "Actual ReplaceImage deleted same image");
        draw(res->mImage,0xff4267b9u);
        auto next=std::make_unique<CountedImage>(newDestroyed);fill(*next,0xffc745a2u);
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,next.get()),"Actual ReplaceImage rejected a new image");next.release();
        check(oldDestroyed==1 && !newDestroyed && res->mImage.mOwnsUnshared,"Actual replacement ownership changed");
        draw(res->mImage,0xffc745a2u);
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,nullptr) && newDestroyed==1 && !res->mImage.mOwnsUnshared,
            "Actual image unload did not clear ownership");
        SharedImage emptySlot;res->mImage=&emptySlot;
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,nullptr) && emptySlot.mRefCount==0 && !res->mImage.mSharedImage,
            "Null unload kept a failed/empty shared slot alive");
        DDImage cached(app.mDDInterface);SharedImage cachedSlot;cachedSlot.mImage=&cached;res->mImage=&cachedSlot;
        check(manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,&cached) && res->mImage.mSharedImage==&cachedSlot &&
            cachedSlot.mRefCount==1 && !res->mImage.mOwnsUnshared,"Actual ReplaceImage adopted a shared cache alias");
        manager.ReplaceImage(ResourceId::IMAGE_BLANK_ID,nullptr);
        MemoryImage unused;
        check(!manager.ReplaceImage(RESOURCE_SLOT_NONE,&unused),"Missing image replacement accepted a borrowed pointer");
    }
    check(oldDestroyed==1 && newDestroyed==1,"ResourceManager destroyed an image twice");
    check(app.mMemoryImageSet.size()==imagesBefore && render.mRenderer->GetResourceCounts().textures==texturesBefore,
        "Assignment integration retained image registrations/textures");
    check(screen->mBits==screenBits && screen->mBitsChangedCount==screenVersion,"Assignment probe wrote CPU screen backing");
    Require(checks==19 && gpu==6,"Assignment integration coverage changed");
    log << "shared-assignment-real-images-checks=" << checks << " gpu=" << gpu << " passed=1" << std::endl;
    ModernSmoke::Report("portable-shared-assignment-19-lifetime-six-gpu-cases",app);
}
void PreparedPublicationCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    using namespace std::chrono_literals;
    app.CleanSharedImages();
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto beforeImages=app.mMemoryImageSet.size(),beforeCache=app.mSharedImageMap.size();
    const auto beforeTextures=render.mRenderer->GetResourceCounts().textures;
    auto* screen=app.mDDInterface->mScreenImage;
    auto* oldBits=screen->mBits;const auto oldVersion=screen->mBitsChangedCount;
    unsigned gpu=0;
    const auto path=[](const char* name){
        auto value=ModernSmoke::ProbePath(name);std::replace(value.begin(),value.end(),'\\','/');return value;
    };
    const auto png=[&](const char* name,unsigned int color){
        ImageLib::Image image;image.mWidth=4;image.mHeight=4;image.mBits=new unsigned int[16];
        std::fill_n(image.mBits,16,color);
        Require(ImageLib::WritePNGImage(path(name),&image),"Cannot write isolated cache PNG fixture");
    };
    png("_shared-prepared-a.png",0xff0000ffu);
    png("_shared-prepared-b.png",0xff0000ffu);
    png("shared-prepared-base.png",0xff4689b1u);
    png("shared-prepared-mask.png",0xff0000ffu);
    png("shared-publication-hook.png",0xff4689b1u);
    const auto draw=[&](SharedImageRef& image,uint32_t color){
        screen->FillRect(Rect(0,0,800,600),Color::Black,0);
        render.Blt(static_cast<MemoryImage*>(image),160,180,Rect(0,0,4,4),Color::White,0,false);
        render.Flush();auto pixels=render.mRenderer->ReadScenePixels();
        for(int y=0;y<4;++y)for(int x=0;x<4;++x)
            Require(pixels.at(size_t(180+y)*800+160+x)==color,"Prepared image GPU color differs");
        ++gpu;
    };
    {
        const auto firstPath=path("shared-prepared-a.png");
        SharedImageRef first,hit;
        std::binary_semaphore entered(0),resume(0);
        std::atomic<bool> earlyReturn=false;
        bool firstNew=false,hitNew=true;
        std::exception_ptr firstError,hitError;
        std::jthread loader([&]{try{
            ImageLib::ScopedAlphaComposeColor color(0x123456);
            first=app.GetPreparedSharedImage(firstPath,0u,&firstNew,[&](DDImage* image){
                // 2026-10-11 解码期 CPU 合成恢复：装载线程出口即合成位图
                // （0x123456 着色的 mask），pending 契约随 GPU 逐图合成退役。
                Require(image->mWidth==4 && image->mHeight==4 && !image->mPendingDecoded &&
                    image->mBits && image->mBits[0]==0xff123456u,
                    "Actual decoder lost its composed output or thread-local alpha tint");
                entered.release();
                if(!resume.try_acquire_for(10s))throw std::runtime_error("Prepared GPU fixture release timed out");
                image->mNumRows=2;image->mNumCols=2;
            });
        }catch(...){firstError=std::current_exception();}});
        const bool started=entered.try_acquire_for(10s);
        std::jthread waiter([&]{try{
            hit=app.GetSharedImage(firstPath,0u,&hitNew);
        }catch(...){hitError=std::current_exception();}earlyReturn=true;});
        bool attached=false;
        const auto deadline=std::chrono::steady_clock::now()+5s;
        while(std::chrono::steady_clock::now()<deadline){
            {AutoCrit lock(app.mDDInterface->mCritSect);
                auto i=app.mSharedImageMap.find({StringToUpper(firstPath),0u});
                if(i!=app.mSharedImageMap.end() && i->second.mRefCount>=2){attached=true;break;}}
            std::this_thread::yield();
        }
        const bool premature=earlyReturn;
        SharedImageRef independent;
        {ImageLib::ScopedAlphaComposeColor color(0xabcdef);
            independent=app.GetSharedImage(path("shared-prepared-b.png"));}
        resume.release();loader.join();waiter.join();
        if(firstError)std::rethrow_exception(firstError);
        if(hitError)std::rethrow_exception(hitError);
        Require(started && attached && !premature && firstNew && !hitNew,"Actual decoder's pending hit escaped");
        Require(first.mSharedImage==hit.mSharedImage && hit->mNumRows==2 && hit->mNumCols==2,
            "Actual prepared metadata was published too early");
        Require(ImageLib::gAlphaComposeColor==0xFFFFFF,"Alpha scope polluted the game thread");
        draw(hit,0xff123456u);draw(independent,0xffabcdefu);
    }
    {
        const auto manifestPath=path("shared-prepared-resources.compiled");
        NumericResourceFixture fixture(app);
        constexpr auto goodId=static_cast<unsigned>(ResourceId::IMAGE_PVZ_LOGO_ID);
        constexpr auto failedId=static_cast<unsigned>(ResourceId::IMAGE_LOADBAR_DIRT_ID);
        fixture.Image(goodId,path("shared-prepared-base.png"),1u,path("shared-prepared-mask.png"));
        fixture.Image(failedId,path("shared-prepared-base.png"),2u,path("shared-prepared-absent.png"),1,1,0);
        fixture.Write(manifestPath);
        ResourceManager manager(&app);
        Require(manager.ParseResourcesFile(manifestPath),"Cannot parse numeric cache fixture manifest");
        auto image=manager.LoadImage(goodId);
        Require(static_cast<DDImage*>(image) && image->mNumRows==2 && image->mNumCols==2 &&
            image->mAnimInfo && image->mAnimInfo->mAnimType==AnimType_Loop && image->mAnimInfo->mFrameDelay==7,
            "ResourceManager did not publish complete metadata");
        auto hit=app.GetSharedImage(path("shared-prepared-base.png"),1u);
        Require(hit.mSharedImage==image.mSharedImage,"Prepared ResourceManager image lost cache identity");
        draw(hit,0xff4689b1u);
        const auto imagesBeforeFailure=app.mMemoryImageSet.size();
        auto failed=manager.LoadImage(failedId);
        const ResourceError expectedError{ResourceFailure::AlphaMissing,failedId};
        Require(!static_cast<MemoryImage*>(failed) && manager.HadError() &&
            manager.mError==expectedError,
            "Explicit alpha failure was hidden");
        bool failedHit=false;
        try{app.GetSharedImage(path("shared-prepared-base.png"),2u);}
        catch(const ResourceManagerException& e){failedHit=e.error==expectedError;}
        Require(failedHit && app.mMemoryImageSet.size()==imagesBeforeFailure,
            "Failed prepared image escaped or retained its private pixels");
        Require(std::filesystem::remove(manifestPath),"Numeric cache fixture retained its manifest file");
    }
    {
        struct PublicationFailure{};
        struct ObservingManager final:ResourceManager {
            unsigned callbacks=0;bool throws=true;
            explicit ObservingManager(LawnApp& app):ResourceManager(&app){}
            void ResourceLoadedHook(BaseRes* resource) override {
                ++callbacks;auto* image=static_cast<ImageRes*>(resource);
                Require(GetResourceBySlot(resource->mId)==resource&&GetImageResBySlot(resource->mImageSymbol)==image&&
                    static_cast<DDImage*>(image->mImage)&&image->mImage->mNumRows==2&&image->mImage->mNumCols==2&&
                    image->mImage->mAnimInfo&&image->mImage->mAnimInfo->mFrameDelay==7,
                    "Publication callback ran before numeric indexes or prepared metadata were ready");
                if(throws)throw PublicationFailure{};
            }
        };
        const auto manifestPath=path("shared-publication-exception.numeric.resources");
        constexpr auto id=static_cast<unsigned>(ResourceId::IMAGE_PVZ_LOGO_ID);
        NumericResourceFixture fixture(app);fixture.Image(id,path("shared-publication-hook.png"),0u);fixture.Write(manifestPath);
        ObservingManager manager(app);Require(manager.ParseResourcesFile(manifestPath),"Cannot parse numeric publication fixture");
        bool caught=false;try{manager.LoadImage(id);}catch(const PublicationFailure&){caught=true;}
        auto* resource=static_cast<ResourceManager::ImageRes*>(manager.mResourceSlots[id]);
        Require(caught&&manager.callbacks==1&&!manager.HadError()&&static_cast<DDImage*>(resource->mImage),
            "Publication callback exception was suppressed or revoked the published image");
        auto hit=app.GetSharedImage(path("shared-publication-hook.png"),0u);
        Require(hit.mSharedImage==resource->mImage.mSharedImage&&!hit.mSharedImage->mLoadReady.valid(),
            "Publication callback exception poisoned the prepared shared cache");
        Require(manager.LoadImage(id).mSharedImage==hit.mSharedImage&&manager.callbacks==1,
            "Published numeric image was reloaded after its callback threw");
        manager.DeleteImage(id);manager.throws=false;
        Require(manager.LoadImage(id).mSharedImage==hit.mSharedImage&&manager.callbacks==2,
            "Numeric image reload lost cache identity or publication callback");
        Require(std::filesystem::remove(manifestPath),"Publication fixture retained its manifest file");
    }
    app.CleanSharedImages();render.Flush();
    Require(gpu==3 && app.mMemoryImageSet.size()==beforeImages && app.mSharedImageMap.size()==beforeCache &&
        render.mRenderer->GetResourceCounts().textures==beforeTextures,"Prepared cache fixtures retained resources");
    Require(screen->mBits==oldBits && screen->mBitsChangedCount==oldVersion,"Prepared cache probe changed CPU screen");
    log<<"shared-publication-real-decoder=1 resource-metadata=1 failed-alpha=1 gpu="<<gpu<<std::endl;
    ModernSmoke::Report("portable-shared-publication-real-decode-metadata-failure-three-gpu",app);
}
void ResourceGridCases(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    app.CleanSharedImages();auto& renderer=*app.mDDInterface->mRenderInterface;renderer.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),cacheBefore=app.mSharedImageMap.size();
    const auto texturesBefore=renderer.mRenderer->GetResourceCounts().textures;
    auto* screen=app.mDDInterface->mScreenImage;auto* bits=screen->mBits;const auto version=screen->mBitsChangedCount;
    const auto path=[](const char* name){auto p=ModernSmoke::ProbePath(name);std::replace(p.begin(),p.end(),'\\','/');return p;};
    const auto pngPath=path("resource-grid-good.png"),manifestPath=path("resource-grid.numeric.resources");
    {
        ImageLib::Image image;image.mWidth=4;image.mHeight=4;image.mBits=new unsigned int[16];
        std::fill_n(image.mBits,16,0xff376bc1u);
        Require(ImageLib::WritePNGImage(pngPath,&image),"Cannot write isolated grid PNG");
    }
    constexpr auto id=static_cast<unsigned>(ResourceId::IMAGE_PVZ_LOGO_ID);
    NumericResourceFixture valid(app);valid.Image(id,pngPath,1u);
    unsigned rejected=0,gpu=0;
    // Text spelling validation belongs to the offline compiler. Runtime records
    // carry signed dimensions and a bounded animation/vector encoding.
    for(unsigned mode=0;mode<8;++mode)for(bool replace:{false,true}){
        {
            ResourceManager manager(&app);SharedImageRef loaded;
            ResourceManager::ImageRes* existing=nullptr;
            if(replace){
                valid.Write(manifestPath);Require(manager.ParseResourcesFile(manifestPath),"Valid numeric grid manifest rejected");
                loaded=manager.LoadImage(id);existing=static_cast<ResourceManager::ImageRes*>(manager.mResourceSlots[id]);
                Require(static_cast<DDImage*>(loaded)&&loaded->GetCelWidth()==2&&loaded->GetCelHeight()==2&&
                    loaded->mAnimInfo&&loaded->mAnimInfo->mFrameDelay==7,"Actual grid image/animation metadata changed");
                manager.SetGroupLoaded(existing->mResGroup);
            }
            const auto groups=manager.mResGroupMap;const auto slots=manager.mResourceSlots;
            const auto groupPresent=manager.mResGroupPresent;
            const auto symbols=manager.mImageSlots;const auto loadedGroups=manager.mLoadedGroups;
            auto malformed=valid;
            const unsigned rows=mode==0?0u:mode==1?0xffffffffu:mode==2?0x80000000u:mode==6?16385u:2u;
            const unsigned cols=mode==3?0u:mode==4?0xffffffffu:mode==5?0x80000000u:2u;
            const unsigned anim=mode==7?4u:unsigned(AnimType_Loop);
            malformed.Image(id,path("resource-grid-missing.png"),2u,{},rows,cols,anim);
            malformed.Write(manifestPath);
            const bool accepted=replace?manager.ReparseResourcesFile(manifestPath):manager.ParseResourcesFile(manifestPath);
            Require(!accepted&&manager.HadError()&&manager.mError.reason==ResourceFailure::ImageGrid&&
                manager.mError.slot==id&&manager.mError.value==anim&&
                !manager.mAllowAlreadyDefinedResources,"Invalid numeric grid was accepted or changed reparse policy");
            Require(manager.mResGroupMap==groups&&manager.mResGroupPresent==groupPresent&&
                manager.mResourceSlots==slots&&manager.mImageSlots==symbols&&
                manager.mLoadedGroups==loadedGroups,"Invalid numeric grid published descriptors or changed existing indexes");
            if(replace){
                Require(manager.mResourceSlots[id]==existing&&existing->mRows==2&&existing->mCols==2&&
                    existing->mPath==pngPath&&existing->mVariant==1u&&existing->mImage.mSharedImage==loaded.mSharedImage&&
                    existing->mAnimInfo.mFrameDelay==7,"Invalid numeric replacement changed a loaded resource");
                Graphics g(screen);g.mColor = Color::Black;g.FillRect(0,0,800,600);
                g.DrawImage(loaded,160,180,loaded->GetCelRect(3));renderer.Flush();
                const auto pixels=renderer.mRenderer->ReadScenePixels();
                for(int y=180;y<182;++y)for(int x=160;x<162;++x)
                    Require(pixels.at(size_t(y)*800+x)==0xff376bc1u,"Rejected grid changed the existing sprite's GPU pixels");
                ++gpu;
            }
            valid.Write(manifestPath);
            Require(manager.ReparseResourcesFile(manifestPath)&&!manager.HadError()&&!manager.mAllowAlreadyDefinedResources&&
                manager.GetNumResources()==int(NUMERIC_RESOURCE_SLOT_COUNT),"Corrected numeric replacement could not publish");
            if(replace){
                auto corrected=manager.LoadImage(id);
                Require(manager.mResourceSlots[id]!=existing&&corrected.mSharedImage==loaded.mSharedImage,
                    "Corrected numeric replacement lost the retained cache image");
                auto* descriptor=static_cast<ResourceManager::ImageRes*>(manager.mResourceSlots[id]);
                const auto owningSlots=manager.mResourceSlots;const auto symbolSlots=manager.mImageSlots;
                const auto group=descriptor->mResGroup;const auto counts=manager.GetNumResources();
                manager.SetGroupLoaded(group);manager.DeleteResources(group);
                Require(manager.mResourceSlots==owningSlots&&manager.mImageSlots==symbolSlots&&
                    !manager.IsGroupLoaded(group)&&!static_cast<MemoryImage*>(manager.GetImage(id))&&
                    manager.LoadImageBySlot(descriptor->mImageSymbol).mSharedImage==loaded.mSharedImage,
                    "Group unload deleted descriptors, symbol bindings or a retained shared image");
                manager.DeleteResources();
                Require(manager.mResourceSlots==owningSlots&&manager.mImageSlots==symbolSlots&&manager.mLoadedGroups.none()&&
                    manager.GetNumResources()==counts&&!static_cast<MemoryImage*>(manager.GetImage(id))&&
                    manager.LoadImage(id).mSharedImage==loaded.mSharedImage,
                    "Global unload deleted descriptor slots or changed shared-image reload identity");
            }
            log<<"resource-grid-rejected mode="<<mode<<" replacement="<<replace
                <<" old-image-intact=1 atomic-indexes=1 corrected=1"<<std::endl;++rejected;
        }
        app.CleanSharedImages();renderer.Flush();
        Require(app.mMemoryImageSet.size()==imagesBefore&&app.mSharedImageMap.size()==cacheBefore&&
            renderer.mRenderer->GetResourceCounts().textures==texturesBefore,"Numeric grid manifest fixture retained resources");
    }
    Require(rejected==16&&gpu==8&&screen->mBits==bits&&screen->mBitsChangedCount==version&&
        std::filesystem::remove(manifestPath),"Numeric grid coverage, file lifetime or CPU screen backing changed");
    log<<"resource-grid-numeric-rejections="<<rejected<<" preserved-image-gpu="<<gpu<<" live-resource-delta=0"<<std::endl;
    ModernSmoke::Report("resource-grid-16-numeric-errors-eight-preserved-gpu-images",app);
}

struct MaintenanceState {
    std::binary_semaphore start{0},cleaned{0};
    std::atomic<bool> cleanerStarted=false;
    unsigned visited=0,destroyed=0;
    bool completedInside=false;
};
struct MaintenanceImage : Sexy::DDImage {
    MaintenanceState& state;
    MaintenanceImage(Sexy::DDInterface* dd,MaintenanceState& s):DDImage(dd),state(s){
        SetDestroyType<MaintenanceImage>();
        Create(4,4);std::fill_n(GetBits(),16,0xff13579bu);BitsChanged();
        SetMaintenanceType<MaintenanceImage>();
    }
    ~MaintenanceImage() {
        mMaintenanceHook=nullptr;
        ++state.destroyed;
    }
    void Handoff() {
        auto& s=state;++s.visited;s.start.release();
        s.completedInside=s.cleaned.try_acquire_for(std::chrono::milliseconds(40));
    }
    void OnImageMaintenance(Sexy::ImageMaintenanceOperation operation) {
        if(operation==Sexy::ImageMaintenanceOperation::DeleteNativeData ||
            operation==Sexy::ImageMaintenanceOperation::DeleteExtraBuffers ||
            operation==Sexy::ImageMaintenanceOperation::ReInit) Handoff();
    }
};
void ImageMaintenanceCases(LawnApp& app,std::ostream& log,const std::function<void(int)>& maintain) {
    using namespace Sexy;
    app.CleanSharedImages();
    auto& render=*app.mDDInterface->mRenderInterface;render.Flush();
    const auto beforeImages=app.mMemoryImageSet.size(),beforeCache=app.mSharedImageMap.size();
    const auto beforeTextures=render.mRenderer->GetResourceCounts().textures;
    // Restrict the destructive maintenance commands to private test images.
    // No game image is recovered/re-palletized/purged just to exercise a loop.
    struct PrivateRegistry {
        LawnApp& app;MemoryImageSet saved;
        explicit PrivateRegistry(LawnApp& a):app(a){AutoCrit lock(a.mDDInterface->mCritSect);saved.swap(a.mMemoryImageSet);}
        ~PrivateRegistry(){
            AutoCrit lock(app.mDDInterface->mCritSect);
            // Preserve any remaining registration on failure; do not hide it.
            saved.merge(app.mMemoryImageSet);app.mMemoryImageSet.swap(saved);
        }
    };
    {
        PrivateRegistry registry(app);
        for(int mode=0;mode<3;++mode){
            MaintenanceState state;
            auto image=std::make_unique<MaintenanceImage>(app.mDDInterface,state);
            const auto key=StringToUpper(ModernSmoke::ProbePath("shared-maintenance-"+std::to_string(mode)+".png"));
            Require(!app.mSharedImageMap.contains({key,0u}),"Maintenance fixture key collision");
            auto ref=app.SetSharedImage(key,0u,image.get(),nullptr);image.release();ref.Release();
            std::jthread cleaner([&]{
                if(state.start.try_acquire_for(std::chrono::seconds(5))){
                    state.cleanerStarted=true;app.CleanSharedImages();state.cleaned.release();
                }
            });
            maintain(mode);
            cleaner.join();
            log<<"maintenance="<<mode<<" started="<<state.cleanerStarted.load()<<" visited="<<state.visited
               <<" destroyed="<<state.destroyed<<" deleted-inside="<<state.completedInside<<std::endl;
            Require(state.cleanerStarted && state.visited==1 && state.destroyed==1 && !state.completedInside &&
                app.mMemoryImageSet.empty() && !app.mSharedImageMap.contains({key,0u}),
                "Actual image maintenance raced its concurrent cleaner");
        }
    }
    Require(app.mMemoryImageSet.size()==beforeImages && app.mSharedImageMap.size()==beforeCache &&
        render.mRenderer->GetResourceCounts().textures==beforeTextures,"Maintenance fixture retained/changed game resources");
    log<<"image-maintenance-three-real-cleanup-interleavings=1"<<std::endl;
    ModernSmoke::Report("portable-image-maintenance-three-real-cleanup-interleavings",app);
}
struct ReleaseOnDeleteImage : Sexy::DDImage {
    std::binary_semaphore& start;
    std::binary_semaphore& done;
    bool& timedOut;
    bool armed=false;
    ReleaseOnDeleteImage(Sexy::DDInterface* dd,std::binary_semaphore& a,std::binary_semaphore& b,bool& timeout)
        :DDImage(dd),start(a),done(b),timedOut(timeout){SetDestroyType<ReleaseOnDeleteImage>();}
    ~ReleaseOnDeleteImage() {
        if(armed){start.release();timedOut=!done.try_acquire_for(std::chrono::seconds(10));}
    }
};
}

void PortableSharedResourceSmoke(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Shared resource probe requires isolation");
    std::ofstream log(ModernSmoke::ProbePath("shared-resource-cases.txt"));
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
    FontDefinitionCases(app,log);
    FontLayerRegistrationCases(app,log);
    FontDescriptorFileCases(app,log);
#else
    CompiledFontCases(app,log);
#endif
    ColorizedImageFactoryCases(app,log);
    BufferInputCases(app,log);
    ReanimCacheLifetimeCases(app,log);
    PoolEffectLifetimeCases(app,log);
    ManifestLifetimeCases(app,log);
    Require(bool(log),"Cannot write shared resource evidence");
    AssignmentCases(app,log);
    PreparedPublicationCases(app,log);
    ResourceGridCases(app,log);
    ImageMaintenanceCases(app,log,[&](int mode){
        if(mode==0)app.DeleteNativeImageData();
        else if(mode==1)app.ReInitImages();
        else app.DeleteExtraImageData();
    });
    constexpr int perWorker=25000,expected=4*perWorker+1;
    unsigned wrong=0,observations=0,destroyed=0;
    for(int round=0;round<4;++round) {
        SharedImage shared;
        SharedImageRef anchor(&shared);
        std::array<std::vector<SharedImageRef>,4> refs;
        for(auto& list:refs)list.reserve(perWorker);
        Parallel([&](int worker){
            for(int i=0;i<perWorker;++i){refs[worker].emplace_back(anchor);std::atomic_signal_fence(std::memory_order_seq_cst);}
        });
        const int acquired=shared.mRefCount;
        wrong+=acquired!=expected;++observations;
        // Preserve evidence BEFORE repairing only this disposable negative
        // fixture, so a bad old count cannot make its teardown unsafe.
        shared.mRefCount=expected;
        Parallel([&](int worker){refs[worker].clear();});
        const int released=shared.mRefCount;
        wrong+=released!=1;++observations;
        shared.mRefCount=1;anchor.Release();
        Require(shared.mRefCount==0,"Shared anchor release failed");

        auto* font=new CountedFont(destroyed);
        font->Ref();
        Parallel([&](int){for(int i=0;i<perWorker;++i){font->Ref();std::atomic_signal_fence(std::memory_order_seq_cst);}});
        const int fontAcquired=font->mRefCount;
        wrong+=fontAcquired!=expected;++observations;
        font->mRefCount=expected;
        Parallel([&](int){for(int i=0;i<perWorker;++i){font->DeRef();std::atomic_signal_fence(std::memory_order_seq_cst);}});
        const int fontReleased=font->mRefCount;
        wrong+=fontReleased!=1;++observations;
        font->mRefCount=1;font->DeRef();
        log << "round=" << round << " image=" << acquired << '/' << released
            << " font=" << fontAcquired << '/' << fontReleased << " expected=" << expected << "/1" << std::endl;
    }
    Require(observations==16 && destroyed==4,"Concurrent fixture failed to join/delete its private fonts");
    app.CleanSharedImages();
    const auto imagesBefore=app.mMemoryImageSet.size();
    const auto mapBefore=app.mSharedImageMap.size();
    {
        const auto fixturePath=ModernSmoke::ProbePath("shared-refcount-cache.png");
        const SharedImageMap::key_type key(StringToUpper(fixturePath),1u);
        Require(!app.mSharedImageMap.contains(key),"Shared cache fixture key already exists");
        auto image=std::make_unique<DDImage>(app.mDDInterface);image->Create(4,4);
        std::fill_n(image->GetBits(),16,0xff4267b9u);image->BitsChanged();
        bool inserted=false;
        auto first=app.SetSharedImage(fixturePath,key.second,image.get(),&inserted);
        Require(inserted&&first.mSharedImage&&first.mSharedImage->mImage==image.get(),"Shared cache miss failed to adopt its image");
        image.release();
        auto hit=app.GetSharedImage(key.first,key.second,&inserted);
        Require(!inserted && hit.mSharedImage==first.mSharedImage,"Shared cache hit changed identity/case semantics");
        auto spare=std::make_unique<DDImage>(app.mDDInterface);
        auto same=app.SetSharedImage(fixturePath,key.second,spare.get(),&inserted);
        Require(!inserted && same.mSharedImage==first.mSharedImage &&
            same.mSharedImage->mImage!=spare.get() && same.mSharedImage->mRefCount==3,
            "SetSharedImage cache hit replaced/adopted the caller's unused image");
        auto variantImage=std::make_unique<DDImage>(app.mDDInterface);variantImage->Create(2,2);
        auto variant=app.SetSharedImage(fixturePath,2u,variantImage.get(),&inserted);
        Require(inserted&&variant.mSharedImage!=first.mSharedImage&&variant.mSharedImage->mImage==variantImage.get(),
            "Numeric variants did not separate images at the same file path");variantImage.release();
    }
    app.CleanSharedImages();
    Require(app.mMemoryImageSet.size()==imagesBefore && app.mSharedImageMap.size()==mapBefore,
        "Shared cache hit/miss fixture left resources");
    log << "shared-cache-new-casefold-get-set-hit-and-zero-cleanup=1" << std::endl;
    const SharedImageMap::key_type keyA(StringToUpper(ModernSmoke::ProbePath("shared-refcount-a.png")),0u),
        keyB(StringToUpper(ModernSmoke::ProbePath("shared-refcount-b.png")),0u);
    Require(!app.mSharedImageMap.contains(keyA) && !app.mSharedImageMap.contains(keyB),"Shared probe keys already exist");
    std::binary_semaphore start(0),done(0);
    bool timedOut=false;
    auto victimImage=std::make_unique<DDImage>(app.mDDInterface);
    auto notifierImage=std::make_unique<ReleaseOnDeleteImage>(app.mDDInterface,start,done,timedOut);
    auto victim=app.SetSharedImage(keyA.first,keyA.second,victimImage.get(),nullptr);victimImage.release();
    auto notifier=app.SetSharedImage(keyB.first,keyB.second,notifierImage.get(),nullptr);
    auto* trigger=notifierImage.release();
    std::atomic<bool> workerStarted=false;
    std::jthread releaser([&]{
        if(start.try_acquire_for(std::chrono::seconds(10))){workerStarted=true;victim.Release();done.release();}
    });
    trigger->armed=true;
    notifier.Release();
    // A is visited with one reference. Deleting B then instructs the worker
    // to drop A's LAST reference before this very scan returns. No game code
    // hooks, fake counter operations or timing guesses in the cleaner.
    app.CleanSharedImages();
    releaser.join();
    Require(workerStarted && !timedOut,"Cleanup interleaving handshake failed");
    const auto remaining=app.mSharedImageMap.find(keyA);
    Require(remaining!=app.mSharedImageMap.end() && remaining->second.mRefCount==0,
        "Cleaner fixture did not release an already-visited node");
    const bool notified=app.mCleanupSharedImages;
    app.CleanSharedImages();
    const bool cleaned=!app.mSharedImageMap.contains(keyA);
    log << "cleanup-notification-retained=" << notified << " next-scan-removed=" << cleaned
        << " counter-observations=" << observations << " wrong=" << wrong << std::endl;
    // Explicit fixture cleanup on the old negative path, after recording it.
    app.mCleanupSharedImages=true;app.CleanSharedImages();
    Require(app.mMemoryImageSet.size()==imagesBefore && app.mSharedImageMap.size()==mapBefore,
        "Shared resource test left images or cache nodes");
    Require(!wrong && notified && cleaned,"Shared resource counter or cleanup notification failure");
    ModernSmoke::Report("portable-shared-image-font-four-worker-counts-cleanup-handoff",app);
}
