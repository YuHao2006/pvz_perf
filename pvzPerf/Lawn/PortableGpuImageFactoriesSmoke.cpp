#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <limits>
#include <memory>
#include <stdexcept>
#include <vector>

namespace {
using namespace Sexy;
void Require(bool condition,const char* message)
{
    if(!condition) throw std::runtime_error(message);
}
uint32_t Pixel(unsigned index)
{
    return (index%7?((index*97)%256)<<24:0u) |
        (((index*53+37)%256)<<16) | (((index*31+19)%256)<<8) | ((index*17+83)%256);
}
uint32_t Colorized(uint32_t pixel,const Color& tint)
{
    if(tint.mRed<=255&&tint.mGreen<=255&&tint.mBlue<=255&&tint.mAlpha<=255)
        return ((((pixel&0xff000000u)>>8)*uint32_t(tint.mAlpha))&0xff000000u) |
            ((((pixel&0x00ff0000u)*uint32_t(tint.mRed))>>8)&0x00ff0000u) |
            ((((pixel&0x0000ff00u)*uint32_t(tint.mGreen))>>8)&0x0000ff00u) |
            ((((pixel&0x000000ffu)*uint32_t(tint.mBlue))>>8)&0x000000ffu);
    const auto channel=[](uint32_t value,int tint){return std::min(value*uint32_t(tint)/255u,255u);};
    return channel(pixel>>24,tint.mAlpha)<<24 |
        channel((pixel>>16)&255u,tint.mRed)<<16 |
        channel((pixel>>8)&255u,tint.mGreen)<<8 |
        channel(pixel&255u,tint.mBlue);
}
void GpuOnly(MemoryImage& image)
{
    Require(image.mD3DData&&!image.mBits&&!image.mColorTable&&!image.mColorIndices&&
        !image.mPendingDecoded&&!image.mNativeAlphaData&&!image.mRLAlphaData&&!image.mRLAdditiveData,
        "GPU image factory retained CPU pixels or software caches");
    bool rejected=false;
    try{image.GetBits();}catch(const GpuImageCpuAccess&){rejected=true;}
    Require(rejected&&!image.mBits,"GPU image factory allowed CPU pixel materialization");
}
void EqualPixels(RenderInterface& render,MemoryImage& image,const std::vector<uint32_t>& expected)
{
    render.Flush();
    Require(render.ReadImagePixels(image).pixels==expected,"GPU image factory changed raw RGBA");
    GpuOnly(image);
}
const std::array tints{
    Color(0,0,0,0),Color(255,255,255,255),Color(127,129,253,192),
    Color(256,255,128,64),Color(64,128,256,255),Color(1024,1024,1024,1024),
    Color(-1,-17,255,-255),Color(-1,256,-257,128),
    Color(std::numeric_limits<int>::max(),255,std::numeric_limits<int>::min(),256)};
}

void PortableGpuImageFactoriesSmoke(LawnApp& app)
{
    auto& render=*app.mDDInterface->mRenderInterface;
    render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),texturesBefore=render.mImageSet.size();
    std::ofstream log(ModernSmoke::ProbePath("gpu-image-factories.txt"));
    Require(bool(log),"Cannot write GPU image factory evidence");
    unsigned colors=0,crops=0,clones=0;
    for(bool palette:{false,true})for(bool opaque:{false,true}) {
        auto source=std::make_unique<MemoryImage>(&app);
        source->Create(130,75);
        std::vector<uint32_t> original(130*75);
        if(palette) {
            source->mColorTable=new unsigned int[256];source->mColorIndices=new uchar[original.size()];
            for(unsigned i=0;i<256;++i)source->mColorTable[i]=Pixel(i);
            for(unsigned i=0;i<original.size();++i){
                const auto index=uchar(i*3);source->mColorIndices[i]=index;original[i]=Pixel(index);
            }
        }else {
            for(unsigned i=0;i<original.size();++i)original[i]=Pixel(i);
            std::copy(original.begin(),original.end(),source->GetBits());
        }
        if(opaque){source->mForcedMode=true;source->mHasAlpha=false;source->mHasTrans=false;}
        source->BitsChanged();
        const auto version=source->mBitsChangedCount;
        for(const auto& tint:tints) {
            std::unique_ptr<DDImage> result(app.CreateColorizedImage(source.get(),tint));
            GpuOnly(*source);
            Require(source->mBitsChangedCount==version,"GPU tint factory changed source version");
            std::vector<uint32_t> expected;expected.reserve(original.size());
            for(auto pixel:original)expected.push_back(Colorized(pixel,tint));
            EqualPixels(render,*result,expected);
            {
                MemoryImage clone(*result);
                EqualPixels(render,clone,expected);
                ++clones;
            }
            ++colors;
        }
        for(const auto& rectangle:std::array{
            Rect(0,0,130,75),Rect(61,62,12,11),Rect(-3,-2,8,7),
            Rect(127,72,8,7),Rect(-140,-90,7,5),Rect(200,100,7,5),Rect(129,74,1,1)}) {
            std::unique_ptr<DDImage> result(app.CopyImage(source.get(),rectangle));
            std::vector<uint32_t> expected(size_t(rectangle.mWidth)*rectangle.mHeight);
            for(int y=0;y<rectangle.mHeight;++y)for(int x=0;x<rectangle.mWidth;++x) {
                const int sx=rectangle.mX+x,sy=rectangle.mY+y;
                if(sx>=0&&sy>=0&&sx<130&&sy<75)
                    expected[y*rectangle.mWidth+x]=original[sy*130+sx];
            }
            EqualPixels(render,*result,expected);
            ++crops;
        }
        std::unique_ptr<DDImage> surviving(app.CopyImage(source.get()));
        source.reset();
        EqualPixels(render,*surviving,original);
        log<<"palette="<<palette<<" opaque="<<opaque
            <<" raw-colors=9 raw-crops=7 source-destroyed-copy=1\n";
    }
    {
        std::unique_ptr<DDImage> parent(render.CreateRenderImage(12,8));
        std::unique_ptr<MemoryImage,ImageDeleter> surviving;
        std::vector<uint32_t> expected(6,0x804975c1u);
        {
            GpuImageDrawScope drawing(render,parent.get());
            Graphics graphics(parent.get());
            graphics.mColor = Color::Black;
            graphics.FillRect(0,0,12,8);
            auto source=std::make_unique<MemoryImage>(&app);
            source->Create(3,2);
            std::copy(expected.begin(),expected.end(),source->GetBits());
            source->BitsChanged();
            std::unique_ptr<DDImage> copy(app.CopyImage(source.get()));
            source.reset();
            surviving.reset(new MemoryImage(*copy));
            copy.reset();
            graphics.mColor = Color::White;
            graphics.FillRect(9,6,2,1);
        }
        EqualPixels(render,*surviving,expected);
        log<<"active-parent source-and-intermediate-destroyed-before-submit=1 raw-clone-exact=1\n";
    }
    {
        std::unique_ptr<DDImage> source(render.CreateRenderImage(16,12));
        {
            GpuImageDrawScope drawing(render,source.get());
            Graphics graphics(source.get());
            graphics.mColor = Color(73,119,193,128);
            graphics.FillRect(2,3,9,7);
            // Read the generated source before submitting this parent batch.
            std::unique_ptr<DDImage> copy(app.CopyImage(source.get()));
            render.SelectDrawSurface(nullptr);
            render.Flush();
            const auto original=render.ReadImagePixels(*source).pixels;
            EqualPixels(render,*copy,original);
        }
        render.Flush();
        const auto original=render.ReadImagePixels(*source).pixels;
        for(const auto& tint:tints) {
            std::unique_ptr<DDImage> result(app.CreateColorizedImage(source.get(),tint));
            std::vector<uint32_t> expected;expected.reserve(original.size());
            for(auto pixel:original)expected.push_back(Colorized(pixel,tint));
            EqualPixels(render,*result,expected);
            ++colors;
        }
    }
    render.Flush();
    Require(colors==45&&crops==28&&clones==36&&app.mMemoryImageSet.size()==imagesBefore&&
        render.mImageSet.size()==texturesBefore,"GPU image factories leaked image ownership");
    log<<"color-cases="<<colors<<" crop-cases="<<crops<<" raw-clones="<<clones
        <<" hidden-rgb-exact=1 palette-opaque-generated=1 lifetime-clean=1\n";
    ModernSmoke::Report("gpu-image-factories-45-colors-28-crops-36-raw-clones-no-cpu",app);
}
