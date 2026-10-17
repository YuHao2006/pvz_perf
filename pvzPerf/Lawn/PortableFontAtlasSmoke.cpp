#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "graphics/ImageFont.h"
#include "graphics/Graphics.h"
#include "graphics/MemoryImage.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <cstring>
#include <fstream>
#include <filesystem>
#include <memory>
#include <new>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
template<class A, class B> bool StdArrayEqual(const A& a, const B& b)
{ return std::equal(std::begin(a), std::end(a), std::begin(b)); }
struct Config { int layerSize, pointSize; double scale; };
constexpr std::array<Config,6> configs{{{0,0,1}, {0,0,0.5}, {0,0,2},
    {10,15,1}, {10,10,1}, {10,20,0.75}}};
const std::array<Rect,4> glyphs{{{2,1,8,10},{17,3,6,14},{2,18,10,8},{22,22,12,8}}};
const std::array<unsigned int,4> colors{{0xffe04020u,0xc020d040u,0x804060e0u,0xffe0c040u}};
bool Borrowed(Config c) { return c.scale==1 && (c.layerSize==0 || c.pointSize==c.layerSize); }

void StretchCpuOracle(MemoryImage& destination, MemoryImage& source,
    const Rect& destinationRect, const Rect& sourceRect) {
    source.mDrawn=true;
    Rect clippedDestination;
    FRect clippedSource;
    if (!destination.StretchBltClipHelper(sourceRect,
        Rect(0,0,destination.mWidth,destination.mHeight),destinationRect,
        clippedSource,clippedDestination)) return;
    // The retail oracle uses slow resampling: fastStretch=false, no tint, normal mode.
    destination.SlowStretchBlt(&source,clippedDestination,clippedSource,
        Color::White,Graphics::DRAWMODE_NORMAL);
}

struct Fixture {
    // Fresh FontData and non-owning image references: no changes to game fonts.
    // Fonts die before either of the images they reference.
    MemoryImage source;
    std::unique_ptr<MemoryImage,ImageDeleter> expectedImage;
    std::unique_ptr<ImageFont> actual, reference;
    // ASCII 直取阵列改造（2026-10-01）：Rect[128] + present 标志数组等价旧 map。
    std::array<Rect,128> expectedRects{}; std::array<bool,128> expectedPresent{};
    SexyString text;
    Fixture(LawnApp& app, Config c, bool sparse, bool white) : source(&app) {
        source.Create(40,32);
        auto* bits=source.GetBits();
        const std::array<SexyChar,4> keys = sparse
            ? std::array<SexyChar,4>{static_cast<SexyChar>(0x7f),'7','A','m'}
            : std::array<SexyChar,4>{1,2,3,4};
        for (size_t i=0;i<glyphs.size();++i) {
            const auto& rect=glyphs[i];
            for (int y=0;y<rect.mHeight;++y) for (int x=0;x<rect.mWidth;++x)
                bits[(rect.mY+y)*40+rect.mX+x] = (x+y)%5==0 ? 0 : colors[i];
            text.push_back(keys[i]);
        }
        source.BitsChanged();
        auto makeFont = [&] {
            auto font=std::make_unique<ImageFont>(&source);
            font->mFontData->mApp=&app;
            auto& layer=font->mFontData->mFontLayerList.front();
            layer.mPointSize=c.layerSize; layer.mAscent=16; layer.mSpacing=1;
            layer.mUseAlphaCorrection=false;
            for (size_t i=0;i<keys.size();++i) {
                auto& data=*layer.GetCharData(keys[i]);
                data.mImageRect=glyphs[i]; data.mWidth=glyphs[i].mWidth+1;
            }
            font->mForceScaledImagesWhite=white;
            font->SetPointSize(c.pointSize); font->SetScale(c.scale);
            return font;
        };
        actual=makeFont(); reference=makeFont();
        const auto& chars=reference->mFontData->mFontLayerList.front();
        Image* expected=&source;
        if (Borrowed(c)) {
            for (int c2=0;c2<chars.kCharSlots;++c2) if (chars.mCharData[c2].mWidth!=0) { expectedRects[c2]=chars.mCharData[c2].mImageRect; expectedPresent[c2]=true; }
        } else {
            // This oracle preserves the current resampling/quantization policy.
            // It checks character keys/copy destinations, not all 1073 padding.
            int width=0,height=0;
            const double pointSize=c.layerSize==0 ? c.scale : c.pointSize*c.scale;
            const int divisor=c.layerSize==0 ? 1 : c.layerSize;
            for (int c2=0;c2<chars.kCharSlots;++c2) {
                const auto& data=chars.mCharData[c2];
                if (data.mWidth==0) continue;
                Rect rect(width,0,int(data.mImageRect.mWidth*pointSize/divisor),
                    int(data.mImageRect.mHeight*pointSize/divisor));
                expectedRects[c2]=rect; expectedPresent[c2]=true;
                width+=rect.mWidth; height=std::max(height,rect.mHeight);
            }
            expectedImage.reset(new MemoryImage(&app));
            expectedImage->Create(width,height);
            for (int c2=0;c2<chars.kCharSlots;++c2) {
                const auto& data=chars.mCharData[c2];
                if (data.mWidth==0) continue;
                StretchCpuOracle(*expectedImage,source,expectedRects[c2],data.mImageRect);
            }
            if (white) {
                auto* pixels=expectedImage->GetBits();
                for (int i=0;i<width*height;++i) pixels[i]|=0x00ffffffu;
            }
            expectedImage->Palletize(); expected=expectedImage.get();
        }
        reference->mActiveLayerList.emplace_back();
        auto& layer=reference->mActiveLayerList.back();
        layer.mBaseFontLayer=&reference->mFontData->mFontLayerList.front();
        layer.mScaledImage=expected; layer.mOwnsImage=false;
        std::copy(expectedRects.begin(),expectedRects.end(),std::begin(layer.mScaledCharImageRects));
        reference->mActiveListValid=true;
        actual->Prepare();
    }
    ActiveFontLayer& Layer() { Require(actual->mActiveLayerList.size()==1,"Font atlas layer count"); return actual->mActiveLayerList.front(); }
    unsigned PixelDifferences() {
        auto* image=AsMemoryImage(Layer().mScaledImage);
        auto* expected=expectedImage ? expectedImage.get() : &source;
        Require(image && image->mWidth==expected->mWidth && image->mHeight==expected->mHeight,
            "Font atlas dimensions changed");
        auto& render=*source.mApp->mDDInterface->mRenderInterface;
        render.Flush();
        const auto a=render.ReadImagePixels(*image),b=render.ReadImagePixels(*expected);
        if (!expectedImage) Require(image==&source,"Borrowed atlas lost its source");
        else Require(!image->mBits && !image->mColorTable && image->mD3DData &&
            static_cast<TextureData*>(image->mD3DData)->mGPUOwned,
            "Generated font atlas retained CPU pixels");
        unsigned different=0;
        for (size_t i=0;i<a.pixels.size();++i) {
            // Premultiplied GPU targets have no RGB at alpha zero.
            const auto wanted=(b.pixels[i]>>24)?b.pixels[i]:0u;
            const auto actual=(a.pixels[i]>>24)?a.pixels[i]:0u;
            different+=actual!=wanted;
        }
        return different;
    }
};
std::unique_ptr<ImageFont> Clone(LawnApp& app, ImageFont& source, std::ofstream& log) {
    const int refs=source.mFontData->mRefCount;
    const size_t images=app.mMemoryImageSet.size();
    std::unique_ptr<ImageFont> copy;
    try { copy=std::make_unique<ImageFont>(source); }
    catch (const std::exception& error) {
        log << "copy-failed refs-before=" << refs << " refs-after=" << source.mFontData->mRefCount
            << " images-before=" << images << " images-after=" << app.mMemoryImageSet.size()
            << " error=" << error.what() << std::endl;
        throw; // Evidence only: never swallow the failed construction.
    }
    Require(copy->mFontData==source.mFontData && copy->mFontData->mRefCount==refs+1,
        "Font copy did not retain shared FontData exactly once");
    Require(copy->mActiveLayerList.size()==source.mActiveLayerList.size(),"Font copy lost layers");
    auto a=source.mActiveLayerList.begin();
    for (auto& b : copy->mActiveLayerList) {
        Require(b.mBaseFontLayer==a->mBaseFontLayer && b.mOwnsImage==a->mOwnsImage
            && std::equal(std::begin(b.mScaledCharImageRects),std::end(b.mScaledCharImageRects),std::begin(a->mScaledCharImageRects)),"Font copy lost glyph metadata");
        if (!a->mOwnsImage) Require(b.mScaledImage==a->mScaledImage,"Borrowed font image was copied");
        else {
            auto* original=AsMemoryImage(a->mScaledImage);
            auto* duplicate=AsMemoryImage(b.mScaledImage);
            Require(original && duplicate && original!=duplicate,"Owned font image aliases its source");
            Require(original->mWidth==duplicate->mWidth && original->mHeight==duplicate->mHeight,
                "Copied font image dimensions changed");
            Require((original->mColorTable!=nullptr)==(duplicate->mColorTable!=nullptr),
                "Copy unexpectedly expanded the font palette");
            auto& render=*app.mDDInterface->mRenderInterface;
            render.Flush();
            Require(!original->mBits && !duplicate->mBits && original->mD3DData &&
                duplicate->mD3DData && original->mD3DData!=duplicate->mD3DData,
                "Owned font copy has shared or CPU storage");
            const auto left=render.ReadImagePixels(*original),right=render.ReadImagePixels(*duplicate);
            Require(left.pixels==right.pixels,"Owned font copy changed GPU pixels");
            bool rejected=false;
            try { duplicate->GetBits(); }
            catch (const GpuImageCpuAccess&) { rejected=true; }
            Require(rejected && !duplicate->mBits,"GPU font copy silently materialized CPU pixels");
        }
        ++a;
    }
    return copy;
}
std::vector<std::uint32_t> Render(LawnApp& app, ImageFont& font, const SexyString& text) {
    auto* screen=app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
    Graphics g(screen);
    font.DrawString(&g,210,270,text,Color(231,187,139,213),Rect(80,80,600,440));
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush(); return render.mRenderer->ReadScenePixels();
}

void ResizeKernelEdges(LawnApp& app,std::ostream& log) {
    auto& render=*app.mDDInterface->mRenderInterface;
    constexpr std::array<GpuFontGlyph,5> glyphs{{
        {62,58,9,11,0,0,15,17},
        {128,84,12,12,16,0,6,6},
        {139,95,1,1,24,0,9,13},
        {14,8,7,9,34,0,7,9},
        {4,18,9,9,44,0,1,1}}};
    const auto imagesBefore=app.mMemoryImageSet.size();
    unsigned cases=0;
    for (bool generated:{false,true}) for (bool white:{false,true}) {
        {
            MemoryImage source(&app),oracleSource(&app),expected(&app);
            source.Create(140,96);oracleSource.Create(140,96);expected.Create(48,20);
            auto* input=source.GetBits();auto* reference=oracleSource.GetBits();
            for(int y=0;y<96;++y) for(int x=0;x<140;++x) {
                const uint32_t alpha=(x+y)%3==0?0u:(x+y)%3==1?128u:255u;
                const auto value=(alpha<<24)|(uint32_t((x*97+y*31)%256)<<16)|
                    (uint32_t((x*19+y*53)%256)<<8)|uint32_t((x*11+y*71)%256);
                input[y*140+x]=value;reference[y*140+x]=generated && alpha==0?0u:value;
            }
            source.BitsChanged();oracleSource.BitsChanged();
            for(const auto& glyph:glyphs)
                StretchCpuOracle(expected,oracleSource,Rect(glyph.targetX,glyph.targetY,glyph.targetWidth,glyph.targetHeight),
                    Rect(glyph.sourceX,glyph.sourceY,glyph.sourceWidth,glyph.sourceHeight));
            if(white) for(int i=0;i<48*20;++i)expected.GetBits()[i]|=0x00ffffffu;
            expected.BitsChanged();
            source.mPurgeBits=true;
            render.CreateImageTexture(&source);
            Require(!source.mBits && !source.mColorTable,"Font kernel source retained CPU pixels");
            std::unique_ptr<DDImage> generatedSource;
            MemoryImage* actualSource=&source;
            if(generated) {
                generatedSource.reset(render.CreateRenderImage(140,96));
                {
                    GpuImageDrawScope draw(render,generatedSource.get());
                    Graphics g(generatedSource.get());g.mDrawMode = Graphics::DRAWMODE_OPAQUE;
                    g.DrawImage(&source,0,0);
                }
                actualSource=generatedSource.get();
            }
            std::unique_ptr<DDImage> output(render.CreateRenderImage(48,20));
            render.RenderFontAtlas(output.get(),actualSource,glyphs,white);
            render.Flush();
            const auto actual=render.ReadImagePixels(*output),wanted=render.ReadImagePixels(expected);
            unsigned different=0;
            for(size_t i=0;i<actual.pixels.size();++i) {
                const auto a=(actual.pixels[i]>>24)?actual.pixels[i]:0u;
                const auto b=(wanted.pixels[i]>>24)?wanted.pixels[i]:0u;
                if(a!=b && different==0)
                    log<<"edge-first pixel="<<i<<" gpu="<<std::hex<<a<<" oracle="<<b<<std::dec<<std::endl;
                different+=a!=b;
            }
            log<<"kernel-edge generated="<<generated<<" white="<<white
                <<" different="<<different<<std::endl;
            Require(different==0,"GPU font edge/generated-source kernel differs from independent CPU oracle");
            ++cases;
        }
        Require(app.mMemoryImageSet.size()==imagesBefore,"Font edge kernel leaked registered images");
    }
    Require(cases==4,"Font kernel edge coverage incomplete");
    ModernSmoke::Report("portable-font-kernel-four-edge-generated-source-cases",app);
}

struct OrderedGlyph {
    Image* image;Rect source;int x,y,order,mode;Color color;
};

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
void LegacyFontInputSmoke(LawnApp& app) {
    std::ofstream log(ModernSmoke::ProbePath("legacy-font-input.txt"));
    Require(bool(log),"Cannot write legacy font input evidence");
    const auto file=ModernSmoke::ProbePath("legacy-font-input.desc");
    auto write=[&](const std::string& text) {
        std::ofstream out(file,std::ios::binary|std::ios::trunc);
        out.write(text.data(),text.size());out.close();
        Require(bool(out),"Cannot write private legacy font descriptor");
    };
    const size_t images=app.mMemoryImageSet.size();
    unsigned cases=0,wrong=0,retries=0,gpu=0,defaultCases=0,rawWrong=0,scaledWrong=0,explicitWhite=0,ownerWrong=0;
    {
        MemoryImage image(&app);image.Create(16,8);
        auto* bits=image.GetBits();
        for(int y=0;y<8;++y)for(int x=0;x<16;++x)
            bits[y*16+x]=((x+y)%3==0)?0u:(x<4?0xffa53bd2u:0xff38cb79u);
        image.BitsChanged();
        auto matches=[&](FontData& data) {
            if(!data.mInitialized || data.mFontLayerList.size()!=1 || data.mFontLayerMap.size()!=1)return false;
            const auto& layer=data.mFontLayerList.front();
            const auto& A=layer.mCharData['A']; const auto& b=layer.mCharData['b']; const auto& sp=layer.mCharData[' '];
            return data.mFontLayerMap.at("")==&layer && layer.mAscent==7 && layer.mDefaultHeight==8
                && A.mImageRect==Rect(0,0,4,8) && A.mWidth==4
                && b.mImageRect==Rect(4,0,5,8) && b.mWidth==5
                && sp.mWidth==3
                && data.mCharMap.contains('a') && data.mCharMap.at('a')=='A'
                && data.mCharMap.contains('B') && data.mCharMap.at('B')=='b';
        };
        const std::array<std::string,11> invalid{{"", "x", "3", "3 x", "3 7 A", "3 7 A x",
            "3 7 A4b", "3 7 A4b x", "3 7 A4b5?", std::string("3 7 \0 4",7), "missing-file"}};
        for(const auto& text:invalid) {
            const bool missing=text=="missing-file";
            if(!missing)write(text);
            FontData data;
            data.mSourceFile="untouched";
            const bool loaded=data.LoadLegacy(&image,missing?file+".missing":file);
            const bool rejected=!loaded && !data.mInitialized && data.mFontLayerList.empty()
                && data.mFontLayerMap.empty() && data.mCharMap.empty() && data.mSourceFile=="untouched";
            if(!missing)Require(std::filesystem::remove(file),"Failed font input retained its open file");
            write("3 7 A4b5");
            const bool retry=data.LoadLegacy(&image,file) && matches(data);
            Require(std::filesystem::remove(file),"Font retry retained its open file");
            ++cases;++retries;wrong+=!rejected || !retry;
            log<<"invalid="<<cases<<" loaded="<<loaded<<" clean-rejection="<<rejected<<" retry="<<retry<<std::endl;
        }
        const std::array<std::string,4> valid{{"3 7 A4b5", "3 7\nA 4\nb 5\n", " 3\t7\r\nA4 b5 \t\n", "+3+7A+4b+5"}};
        ImageFont reference(&image);
        const bool imageOwner=reference.mFontData->mApp==&app;
        ownerWrong+=!imageOwner;
        reference.mFontData->mApp=&app;
        log<<"image-constructor-owner="<<imageOwner<<std::endl;
        auto& layer=reference.mFontData->mFontLayerList.front();layer.mAscent=7;
        layer.mCharData[' '].mWidth=3;
        layer.mCharData['A'].mWidth=4;layer.mCharData['A'].mImageRect=Rect(0,0,4,8);
        layer.mCharData['b'].mWidth=5;layer.mCharData['b'].mImageRect=Rect(4,0,5,8);
        reference.mFontData->mCharMap['a']='A';reference.mFontData->mCharMap['B']='b';
        for(const auto& text:valid) {
            write(text);ImageFont actual(&image,file);
            // Isolate descriptor parsing from the deprecated constructor's
            // existing uninitialized scaling flag (audited separately).
            actual.mForceScaledImagesWhite=false;
            const bool metadata=matches(*actual.mFontData);
            const auto expected=Render(app,reference,"Aa bB");
            const auto pixels=Render(app,actual,"Aa bB");
            const bool rendered=pixels==expected && std::any_of(pixels.begin(),pixels.end(),[](auto p){return (p&0xffffffu)!=0x131f2fu;});
            const bool repeat=!actual.mFontData->LoadLegacy(&image,file) && matches(*actual.mFontData);
            Require(std::filesystem::remove(file),"Valid font input retained its open file");
            ++cases;++gpu;wrong+=!metadata || !rendered || !repeat;
            log<<"valid="<<cases<<" metadata="<<metadata<<" gpu="<<rendered<<" repeated-load-rejected="<<repeat<<std::endl;
        }
        // Inspect the byte, never evaluate an indeterminate bool. Canonicalize
        // AFTER recording it so the negative baseline can demonstrate white
        // atlases without itself reading an invalid bool representation.
        static_assert(sizeof(bool)==1);
        for(unsigned char fill:{0x00,0x01,0xa5})for(double scale:{0.5,2.0}) {
            alignas(ImageFont) std::array<unsigned char,sizeof(ImageFont)> storage;
            storage.fill(fill);write("3 7 A4b5");
            auto destroy=[](ImageFont* p){p->~ImageFont();};
            std::unique_ptr<ImageFont,decltype(destroy)> actual(::new(storage.data())ImageFont(&image,file),destroy);
            const bool owner=actual->mFontData->mApp==&app;ownerWrong+=!owner;
            // Record the missing owner independently, then provide a valid
            // owner solely in this probe so its second defect can be observed.
            actual->mFontData->mApp=&app;
            unsigned char raw=0;std::memcpy(&raw,&actual->mForceScaledImagesWhite,1);
            rawWrong+=raw!=0;++defaultCases;
            actual->mForceScaledImagesWhite=raw==1;
            actual->SetScale(scale);reference.mForceScaledImagesWhite=false;reference.SetScale(scale);
            const bool match=Render(app,*actual,"Aa bB")==Render(app,reference,"Aa bB");
            scaledWrong+=!match;
            log<<"default-fill="<<unsigned(fill)<<" scale="<<scale<<" owner="<<owner<<" raw-flag="<<unsigned(raw)<<" gpu="<<match<<std::endl;
            if(fill==0) {
                actual->mForceScaledImagesWhite=true;reference.mForceScaledImagesWhite=true;
                actual->mActiveListValid=false;reference.mActiveListValid=false;
                actual->SetScale(scale);reference.SetScale(scale);
                const bool white=Render(app,*actual,"Aa bB")==Render(app,reference,"Aa bB");
                scaledWrong+=!white;++explicitWhite;
                log<<"explicit-white scale="<<scale<<" gpu="<<white<<std::endl;
            }
            Require(std::filesystem::remove(file),"Scaled legacy font retained its open file");
        }
        write("3 7 \n");FontData blank;
        const bool headerOnly=blank.LoadLegacy(&image,file) && blank.mInitialized && blank.mFontLayerList.size()==1;
        Require(std::filesystem::remove(file),"Header-only font retained its open file");
        ++cases;wrong+=!headerOnly;log<<"header-only="<<headerOnly<<std::endl;
    }
    const bool released=app.mMemoryImageSet.size()==images;
    log<<"cases="<<cases<<" wrong="<<wrong<<" retries="<<retries<<" gpu="<<gpu<<" images-released="<<released<<std::endl;
    Require(cases==16 && wrong==0 && retries==11 && gpu==4 && released,"Legacy font input/retry contract failed; see legacy-font-input.txt");
    ModernSmoke::Report("portable-legacy-font-input-16-cases-11-retries-4-gpu",app);
    log<<"default-cases="<<defaultCases<<" raw-wrong="<<rawWrong<<" scaled-wrong="<<scaledWrong<<" explicit-white="<<explicitWhite<<" owner-wrong="<<ownerWrong<<std::endl;
    Require(defaultCases==6 && rawWrong==0 && scaledWrong==0 && explicitWhite==2 && ownerWrong==0,"Legacy font default flag/owner is invalid; see legacy-font-input.txt");
    ModernSmoke::Report("portable-legacy-font-default-six-filled-objects-eight-gpu",app);
}
#endif
std::vector<std::uint32_t> RenderOriginalOrder(LawnApp& app,ImageFont& font,const SexyString& text,bool originalDefaults=false) {
    font.Prepare();
    std::vector<OrderedGlyph> commands;
    int pen=210;
    const Color color(231,187,139,213);
    for(size_t i=0;i<text.size();++i) {
        const auto ch=font.GetMappedChar(text[i]);
        const auto next=i+1<text.size()?font.GetMappedChar(text[i+1]):0;
        int advance=pen;
        for(auto& active:font.mActiveLayerList) {
            const auto& base=*active.mBaseFontLayer;
            int baseOrder=base.mBaseOrder;
            if(originalDefaults) {
                // These shipped descriptors have no LayerSetBaseOrder override.
                // Recover 1073's loader default from the full creation list, not
                // from the (potentially broken) field or the filtered active list.
                const auto& layers=font.mFontData->mFontLayerList;
                const auto it=std::find_if(layers.begin(),layers.end(),[&](const auto& layer){return &layer==&base;});
                Require(it!=layers.end(),"Active layer missing from creation list");
                baseOrder=static_cast<int>(std::distance(layers.begin(),it));
            }
            const auto& data=base.mCharData[(unsigned char)ch];
            Require(data.mWidth!=0,"Order reference needs prepared character metadata");
            double scale=font.mScale;
            if(base.mPointSize)scale*=float(font.mPointSize)/float(base.mPointSize);
            int spacing=0;
            if(next) {
                spacing=base.mSpacing+data.GetKerning(next);
            }
            const Color multiplied(std::min(color.mRed*base.mColorMult.mRed/255+base.mColorAdd.mRed,255),
                std::min(color.mGreen*base.mColorMult.mGreen/255+base.mColorAdd.mGreen,255),
                std::min(color.mBlue*base.mColorMult.mBlue/255+base.mColorAdd.mBlue,255),
                std::min(color.mAlpha*base.mColorMult.mAlpha/255+base.mColorAdd.mAlpha,255));
            commands.push_back({active.mScaledImage,active.mScaledCharImageRects[(unsigned char)ch],
                pen+int((base.mOffset.mX+data.mOffset.mX)*scale),
                270-int((base.mAscent-base.mOffset.mY-data.mOffset.mY)*scale),
                std::clamp(baseOrder+data.mOrder+128,0,255),base.mDrawMode,multiplied});
            advance=std::max(advance,pen+int(data.mWidth*scale)+int(spacing*scale));
        }
        pen=advance;
    }
    // 1073 005A30A0 uses only base+character order. Equal priorities retain
    // insertion order (character first, then layer), not a layer-index bias.
    std::stable_sort(commands.begin(),commands.end(),[](const auto& a,const auto& b){return a.order<b.order;});
    auto* screen=app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
    Graphics g(screen);g.mColorizeImages = true;g.mLinearBlend = false;
    for(const auto& command:commands) {
        const auto oldMode=g.mDrawMode;
        if(command.mode!=-1)g.mDrawMode = command.mode;
        g.mColor = command.color;
        if(command.image)g.DrawImage(command.image,command.x,command.y,command.source);
        g.mDrawMode = oldMode;
    }
    auto& backend=*app.mDDInterface->mRenderInterface;
    backend.Flush();return backend.mRenderer->ReadScenePixels();
}
void LayerOrderSmoke(LawnApp& app) {
    std::ofstream log(ModernSmoke::ProbePath("font-layer-order.txt"));Require(bool(log),"Cannot write font order evidence");
    unsigned cases=0,wrong=0,singleControls=0,real=0,realWrong=0;
    auto compare=[&](const char* name,ImageFont& font,const SexyString& text,bool control,bool runtime) {
        const auto actual=Render(app,font,text),expected=RenderOriginalOrder(app,font,text);
        Require(actual.size()==480000 && expected.size()==actual.size(),"Font order readback size changed");
        unsigned different=0,visible=0;
        for(size_t i=0;i<actual.size();++i){different+=actual[i]!=expected[i];visible+=expected[i]!=0xff131f2fu;}
        Require(visible>10,"Font order reference did not draw glyphs");
        log<<name<<" layers="<<font.mActiveLayerList.size()<<" text="<<text<<" different="<<different
            <<" visible="<<visible<<" control="<<control<<" runtime="<<runtime<<std::endl;
        ++cases;wrong+=different!=0;
        if(control){Require(different==0,"Single-layer order control failed");++singleControls;}
        if(runtime){++real;realWrong+=different!=0;}
    };
    for(int layers:{1,3})for(int profile=0;profile<4;++profile) {
        MemoryImage image(&app);image.Create(30,16);auto* pixels=image.GetBits();
        constexpr unsigned colors[]={0xe0e02020,0xc020e050,0xa03060f0};
        for(int y=0;y<16;++y)for(int x=0;x<30;++x)pixels[y*30+x]=(x+y)%5?colors[x/10]:0;
        image.BitsChanged();
        ImageFont font(&image);font.mFontData->mApp=&app;
        for(int l=0;l<layers;++l) {
            if(l)font.mFontData->mFontLayerList.emplace_back(font.mFontData);
            auto& layer=font.mFontData->mFontLayerList.back();layer.mImage=&image;
            layer.mAscent=16;layer.mSpacing=-2;layer.mUseAlphaCorrection=false;
            layer.mBaseOrder=profile==0?0:profile==1?-l:profile==2?127-l:-129+l;
            for(char ch:{'A','B'}) {
                auto& glyph=layer.mCharData[ch];glyph.mImageRect=Rect(l*10,0,10,16);glyph.mWidth=7;
                glyph.mOrder=profile==3?(ch=='A'?1:-1):0;
            }
        }
        for(const char* text:{"ABA","BABABA"})compare("synthetic",font,text,layers==1,false);
    }
    const std::pair<const char*,_Font*> fonts[]={
        {"brian12",FONT_BRIANNETOD12},{"brian16",FONT_BRIANNETOD16},
        {"continuum14",FONT_CONTINUUMBOLD14},{"continuum-outline",FONT_CONTINUUMBOLD14OUTLINE},
        {"dwarf12",FONT_DWARVENTODCRAFT12},{"dwarf15",FONT_DWARVENTODCRAFT15},
        {"dwarf18",FONT_DWARVENTODCRAFT18},{"dwarf24",FONT_DWARVENTODCRAFT24},
        {"dwarf18-bright",FONT_DWARVENTODCRAFT18BRIGHTGREENINSET},{"dwarf18-green",FONT_DWARVENTODCRAFT18GREENINSET},
        {"dwarf18-yellow",FONT_DWARVENTODCRAFT18YELLOW},{"dwarf36-bright",FONT_DWARVENTODCRAFT36BRIGHTGREENINSET},
        {"dwarf36-green",FONT_DWARVENTODCRAFT36GREENINSET},{"house16",FONT_HOUSEOFTERROR16},
        {"house20",FONT_HOUSEOFTERROR20},{"house28",FONT_HOUSEOFTERROR28},{"pico",FONT_PICO129},{"tiny",FONT_TINYBOLD}};
    for(const auto& [name,base]:fonts) {
        auto* font=dynamic_cast<ImageFont*>(base);Require(font,"Expected a loaded original bitmap font");
        for(const char* text:{"AVA WELCOME 1234567890","Please save my Zombatar!"})compare(name,*font,text,false,true);
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<" single-controls="<<singleControls<<" real="<<real
        <<" real-wrong="<<realWrong<<std::endl;
    Require(cases==52 && singleControls==8 && real==36 && wrong==0,
        "Font layer ordering differs from 1073; see font-layer-order.txt");
    ModernSmoke::Report("portable-font-layer-order-16-synthetic-36-real-gpu",app);
    unsigned defaults=0,defaultWrong=0,defaultPixels=0;
    auto checkDefaults=[&](const char* name,_Font* base){
        auto* font=dynamic_cast<ImageFont*>(base);Require(font,"Default-order font missing");
        for(const char* text:{"AVA WELCOME 1234567890","Please save my Zombatar!"}){
            const auto actual=Render(app,*font,text),expected=RenderOriginalOrder(app,*font,text,true);
            Require(actual.size()==480000&&expected.size()==actual.size(),"Default-order readback size changed");
            unsigned different=0,visible=0;
            for(size_t i=0;i<actual.size();++i){different+=actual[i]!=expected[i];visible+=expected[i]!=0xff131f2fu;}
            Require(visible>10,"Default-order reference did not draw text");
            log<<"loader-default "<<name<<" layers="<<font->mActiveLayerList.size()<<" text="<<text<<" different="<<different<<std::endl;
            ++defaults;defaultWrong+=different!=0;defaultPixels+=different;
        }
    };
    for(const auto& [name,font]:fonts)checkDefaults(name,font);
    {
        // Brianne32 belongs to another resource group and is not loaded by Fog.
        // Exercise its shipped descriptor privately, without changing global fonts.
        ImageFont brian(&app,"data/BrianneTod32.txt");
        Require(brian.mFontData->mInitialized,"Private shipped Brianne32 failed to load");
        checkDefaults("brian32-private",&brian);
    }
    log<<"loader-default cases="<<defaults<<" wrong="<<defaultWrong<<" different-pixels="<<defaultPixels<<std::endl;
    Require(defaults==38&&defaultWrong==0,"Font loader defaults differ from 1073; see font-layer-order.txt");
    ModernSmoke::Report("portable-font-loader-default-order-real-gpu",app);
}

void CopyModeSmoke(LawnApp& app) {
    std::ofstream log(ModernSmoke::ProbePath("memory-image-copy-mode.txt"));
    Require(bool(log),"Cannot write image copy mode evidence");
    static_assert(sizeof(bool)==1);
    struct PlacedCopy {
        alignas(MemoryImage) unsigned char storage[sizeof(MemoryImage)];
        MemoryImage* image=nullptr;
        PlacedCopy(const MemoryImage& source,unsigned char fill) {
            std::memset(storage,fill,sizeof(storage));
            image=::new (static_cast<void*>(storage)) MemoryImage(source);
        }
        ~PlacedCopy(){if(image) std::destroy_at(image);}
    };
    unsigned cases=0,wrong=0,commits=0;
    for(bool palette : {false,true}) for(int mode=0;mode<4;++mode) for(unsigned char fill : {0,1}) {
        const auto before=app.mMemoryImageSet.size();
        {
            MemoryImage source(&app); source.Create(4,4);
            std::fill_n(source.GetBits(),16,0xff478ab3u); source.BitsChanged(); source.CommitBits();
            if(palette) Require(source.Palletize(),"Copy mode fixture could not create indexed pixels");
            source.CommitBits();
            // Auto detection, forced opaque, forced partial alpha, forced transparency.
            if(mode!=0) {
                source.mForcedMode = true;
                source.mHasTrans = mode==3;
                source.mHasAlpha = mode==2;
            }
            const auto originalPixel=palette?source.mColorTable[0]:source.mBits[0];
            PlacedCopy owner(source,fill); auto& copy=*owner.image;
            unsigned char rawMode=0;
            // Inspect representation before using a possibly uninitialized bool
            // in the negative baseline. No bad flag is passed to the renderer.
            std::memcpy(&rawMode,&copy.mForcedMode,1);
            const bool matched=rawMode==static_cast<unsigned char>(mode!=0);
            ++cases; wrong+=!matched;
            Require(copy.mApp==&app && copy.mWidth==4 && copy.mHeight==4 && copy.mD3DData==nullptr,
                "Image clone lost dimensions, app or GPU ownership");
            if(palette) {
                Require(!copy.mBits && copy.mColorTable!=source.mColorTable && copy.mColorIndices!=source.mColorIndices,
                    "Indexed clone aliases the original storage");
                Require(std::equal(source.mColorTable,source.mColorTable+256,copy.mColorTable)
                    && std::equal(source.mColorIndices,source.mColorIndices+16,copy.mColorIndices),
                    "Indexed clone changed pixels");
            } else Require(copy.mBits!=source.mBits && std::equal(source.mBits,source.mBits+16,copy.mBits),
                "RGBA clone lost independent pixel storage");
            if(matched) {
                auto* pixels=palette?copy.mColorTable:copy.mBits;
                pixels[0]=0x00478ab3u; pixels[1]=0x80478ab3u;
                copy.BitsChanged(); copy.CommitBits();
                Require(copy.mHasTrans==(mode==0 || mode==3) && copy.mHasAlpha==(mode==0 || mode==2),
                    "Cloned image ignored its automatic/forced alpha mode");
                Require((palette?source.mColorTable[0]:source.mBits[0])==originalPixel,
                    "Changing clone pixels changed the original");
                ++commits;
            }
            log << "case=" << cases << " indexed=" << palette << " mode=" << mode << " fill=" << int(fill)
                << " raw-forced=" << int(rawMode) << " correct=" << matched << std::endl;
        }
        Require(app.mMemoryImageSet.size()==before,"Image copy fixture retained a registered image");
    }
    log << "cases=" << cases << " wrong=" << wrong << " commit-checks=" << commits << std::endl;
    Require(cases==16 && wrong==0 && commits==16,"MemoryImage copy leaves an undefined mode; see memory-image-copy-mode.txt");
    ModernSmoke::Report("portable-memory-image-copy-16-mode-cases",app);
}
}

void PortableFontAtlasSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Font atlas probe must be hidden and isolated");
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
    LegacyFontInputSmoke(app);
#endif
    LayerOrderSmoke(app);
    CopyModeSmoke(app);
    std::ofstream log(ModernSmoke::ProbePath("font-atlas-cases.txt"));
    Require(bool(log),"Cannot write font atlas evidence");
    unsigned cases=0,keyWrong=0,pixelWrong=0,copies=0;
    // Check metadata and GPU ownership before text rendering.
    for (const auto c : configs) for (bool sparse : {false,true}) for (bool white : {false,true}) {
        const size_t imagesBefore=app.mMemoryImageSet.size();
        {
            Fixture f(app,c,sparse,white);
            const bool keys=StdArrayEqual(f.Layer().mScaledCharImageRects,f.expectedRects);
            for (int pass=0;pass<2;++pass) {
                const int refs=f.actual->mFontData->mRefCount;
                const auto images=app.mMemoryImageSet.size();
                { auto copy=Clone(app,*f.actual,log); ++copies; }
                Require(f.actual->mFontData->mRefCount==refs && app.mMemoryImageSet.size()==images,
                    "Font copy destruction retained references or images");
            }
            const unsigned different=f.PixelDifferences();
            Require(f.Layer().mOwnsImage==!Borrowed(c),"Font atlas ownership changed");
            ++cases; keyWrong+=!keys; pixelWrong+=different!=0;
            log << "contract case=" << cases << " layer=" << c.layerSize << " point=" << c.pointSize
                << " scale=" << c.scale << " sparse=" << sparse << " white=" << white
                << " keys=" << keys << " pixel-differences=" << different << std::endl;
        }
        Require(app.mMemoryImageSet.size()==imagesBefore,"Font atlas fixture leaked CPU images");
    }
    log << "contract-cases=" << cases << " key-wrong=" << keyWrong << " pixel-wrong=" << pixelWrong << std::endl;
    Require(cases==24 && keyWrong==0 && pixelWrong==0,"Font atlas key/copy contract failed; see font-atlas-cases.txt");

    unsigned gpu=0,nonblank=0,rebuilds=0;
    for (const auto c : configs) for (bool sparse : {false,true}) for (bool white : {false,true}) {
        const size_t imagesBefore=app.mMemoryImageSet.size();
        {
            Fixture f(app,c,sparse,white);
            const auto expected=Render(app,*f.reference,f.text);
            const auto actual=Render(app,*f.actual,f.text);
            Require(actual.size()==480000 && expected==actual,"Font atlas GPU pixels differ");
            const auto visible=std::count_if(expected.begin(),expected.end(),[](auto p){return p!=0xff131f2fu;});
            nonblank+=visible>20;
            auto* image=f.Layer().mScaledImage;
            f.actual->Prepare();
            Require(f.Layer().mScaledImage==image && Render(app,*f.actual,f.text)==actual,"Font atlas warm cache changed");
            auto copy=Clone(app,*f.actual,log); ++copies;
            f.actual.reset();
            Require(copy->mFontData->mRefCount==1,"Deleting source font did not leave one copy owner");
            f.actual=std::move(copy);
            Require(Render(app,*f.actual,f.text)==actual,"Copied GPU font changed after original was destroyed");
            // Rebuild back and forth without changing the base image's lifetime.
            const size_t liveImages=app.mMemoryImageSet.size();
            for (int repeat=0;repeat<3;++repeat) {
                f.actual->SetPointSize(c.layerSize); f.actual->SetScale(1); f.actual->Prepare();
                Require(f.Layer().mScaledImage==&f.source && !f.Layer().mOwnsImage,"Font atlas did not release owned image on reset");
                Require(app.mMemoryImageSet.size()==liveImages-(Borrowed(c)?0:1),"Font atlas reset kept an owned CPU image");
                f.actual->SetPointSize(c.pointSize); f.actual->SetScale(c.scale); f.actual->Prepare();
                Require(StdArrayEqual(f.Layer().mScaledCharImageRects,f.expectedRects) && f.PixelDifferences()==0,
                    "Font atlas rebuild changed character pixels");
                Require(app.mMemoryImageSet.size()==liveImages,"Font atlas rebuild image count grew");
                Require(Render(app,*f.actual,f.text)==actual,"Font atlas GPU rebuild changed pixels");
                ++rebuilds;
            }
            ++gpu;
            log << "gpu case=" << gpu << " visible=" << visible << " warm-stable=1 rebuilds=3" << std::endl;
        }
        Require(app.mMemoryImageSet.size()==imagesBefore,"Font atlas GPU fixture leaked CPU images");
    }
    log << "gpu-cases=" << gpu << " nonblank=" << nonblank << " rebuilds=" << rebuilds << std::endl;
    Require(gpu==24 && nonblank==24 && rebuilds==72,"Font atlas GPU coverage incomplete");
    log << "font-copies=" << copies << " original-destruction-cases=" << gpu << std::endl;
    Require(copies==72,"Font copy coverage incomplete");
    ResizeKernelEdges(app,log);
    ModernSmoke::Report("portable-font-atlas-24-gpu-contracts-24-draws-72-rebuilds",app);
    ModernSmoke::Report("portable-font-copy-72-copies-24-source-destructions",app);
}
