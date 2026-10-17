#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include "graphics/TriVertex.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
void Require(bool condition,const char* message){if(!condition)throw std::runtime_error(message);}

void SingleBatchCases(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;
    auto& gpu=*render.mRenderer;
    auto* screen=app.mDDInterface->mScreenImage;
    render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size();
    const auto texturesBefore=gpu.GetResourceCounts().textures;
    const auto* cpuBits=screen->mBits;
    const auto cpuVersion=screen->mBitsChangedCount;
    std::ofstream log(ModernSmoke::ProbePath("triangle-bulk-cases.txt"));
    Require(bool(log),"Cannot write triangle bulk evidence");
    unsigned cases=0;
    {
        MemoryImage source;source.Create(4,4);
        auto* bits=source.GetBits();
        for(unsigned i=0;i<16;++i)bits[i]=0x80402010u+i*0x00010101u;
        source.BitsChanged();
        const auto begin=[&]{screen->FillRect(Rect(0,0,800,600),Color(17,29,43),0);};
        const auto finish=[&]{render.Flush();return gpu.ReadScenePixels();};
        for(int count:{1,100,101,256,257,1025}) {
            std::vector<TriVertex> strip(size_t(count)+2);
            for(size_t i=0;i<strip.size();++i) {
                const float x=40+float(i%53)*11,y=45+float((i/53)%18)*20;
                strip[i]=TriVertex(x,y+float(i%2)*13,float(i%4)/4,float((i/4)%4)/4,
                    i%3?0xff80c040u:0u);
            }
            for(int mode:{0,1,2}) for(bool linear:{false,true}) {
                begin();
                for(int i=0;i<count;++i)
                    render.DrawTriangleTex(strip[i],strip[i+1],strip[i+2],
                        Color(191,223,127,180),mode,&source,linear);
                const auto expected=finish();
                begin();
                render.DrawTrianglesTexStrip(strip.data(),count,Color(191,223,127,180),
                    mode,&source,0,0,linear);
                Require(finish()==expected,"Bulk triangle strip changed exact pixels/order");
                std::vector<std::array<TriVertex,3>> triangles;
                for(int i=0;i<count;++i)triangles.push_back({strip[i],strip[i+1],strip[i+2]});
                begin();
                render.DrawTrianglesTex(triangles,Color(191,223,127,180),mode,&source,0,0,linear);
                Require(finish()==expected,"Bulk triangle list changed exact pixels/order");
                std::unique_ptr<TriVertex[][3]> array(new TriVertex[count][3]);
                for(int i=0;i<count;++i)for(int vertex=0;vertex<3;++vertex)
                    array[i][vertex]=triangles[i][vertex];
                begin();
                render.DrawTrianglesTex(array.get(),count,Color(191,223,127,180),mode,&source,0,0,linear);
                Require(finish()==expected,"Bulk triangle array changed exact pixels/order");
                log<<"triangles="<<count<<" mode="<<mode<<" linear="<<linear
                    <<" different=0\n";
                ++cases;
            }
        }
        for(bool clipped:{false,true}) {
            Graphics graphics(screen);
            const Rect clip=clipped?Rect(45,45,90,75):Rect(0,0,800,600);
            begin();
            for(int i=0;i<300;++i) {
                TodTriangleGroup reference;
                SexyMatrix3 matrix;
                matrix.LoadIdentity();
                matrix.m02=42+float(i%23)*4;matrix.m12=42+float((i/23)%17)*4;
                reference.AddTriangle(&graphics,&source,matrix,clip,Color(191,223,127,180),0,Rect(0,0,4,4));
                reference.DrawGroup(&graphics);
            }
            const auto expected=finish();
            begin();
            TodTriangleGroup group;
            for(int i=0;i<300;++i) {
                SexyMatrix3 matrix;
                matrix.LoadIdentity();
                matrix.m02=42+float(i%23)*4;matrix.m12=42+float((i/23)%17)*4;
                group.AddTriangle(&graphics,&source,matrix,clip,Color(191,223,127,180),0,Rect(0,0,4,4));
            }
            Require(group.mVertArray.size()>256,
                "Particle group still flushes at its old capacity");
            group.DrawGroup(&graphics);
            Require(group.mVertArray.empty(), "Particle group did not drain its geometry");
            Require(finish()==expected,"Whole particle group changed exact clipped pixels/order");
            log<<"particle-quads=300 clipped="<<clipped<<" different=0\n";
            ++cases;
        }
    }
    render.Flush();
    Require(cases==38 && app.mMemoryImageSet.size()==imagesBefore &&
        gpu.GetResourceCounts().textures==texturesBefore &&
        screen->mBits==cpuBits && screen->mBitsChangedCount==cpuVersion,
        "Bulk triangle fixture leaked ownership or wrote CPU pixels");
    log<<"PASS cases=38 exact=1\n";
    ModernSmoke::Report("gpu-triangle-38-whole-batch-exact-pixels",app);
}

void TextureSamplerTransitions(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;auto& gpu=*render.mRenderer;
    auto* screen=app.mDDInterface->mScreenImage;render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),texturesBefore=gpu.GetResourceCounts().textures;
    auto* screenBits=screen->mBits;const auto screenVersion=screen->mBitsChangedCount;
    std::ofstream log(ModernSmoke::ProbePath("texture-sampler-transitions.txt"));
    Require(bool(log),"Cannot write texture sampler evidence");
    unsigned samples=0,wrong=0,solidWrong=0;
    {
        Graphics defaults(screen);
        Require(!defaults.mLinearBlend,"Graphics no longer has the 1073 point-filter default");
        std::array<MemoryImage,2> images;
        constexpr std::array<std::array<uint32_t,2>,2> colors{{
            {0xff202020u,0xffe0e0e0u},{0xffc04020u,0xff2080d0u}}};
        for(unsigned i=0;i<images.size();++i){
            images[i].Create(16,16);auto* bits=images[i].GetBits();
            for(int y=0;y<16;++y)for(int x=0;x<16;++x)bits[y*16+x]=colors[i][x>=8];
            images[i].BitsChanged();
            Require(render.CreateImageTexture(&images[i]),"Cannot upload sampler fixture");
        }
        // One frame, including consecutive changes of texture-only, filter-only,
        // both, and neither. A cropped sprite precedes every full-UV triangle
        // draw; solid output follows it. There is no artificial state reset.
        constexpr std::array<unsigned,16> order{0,1,3,2,0,2,3,1,1,0,2,3,0,3,2,1};
        render.sSamplerAddressWrap = false;
        screen->FillRect(Rect(0,0,800,600),Color(17,29,43),0);
        for(unsigned n=0;n<order.size();++n){
            const unsigned image=order[n]&1u;const bool linear=(order[n]&2u)!=0;
            const float x=float(30+int(n%4)*100),y=float(30+int(n/4)*120);
            render.Blt(&images[1-image],680,450,Rect(2,2,6,6),Color::White,0,!linear);
            const TriVertex quad[2][3]={
                {{x,y,0,0},{x+80,y,1,0},{x,y+80,0,1}},
                {{x+80,y,1,0},{x+80,y+80,1,1},{x,y+80,0,1}}};
            render.DrawTrianglesTex(quad,2,Color::White,0,&images[image],0,0,linear);
            screen->FillRect(Rect(int(x)+84,int(y),6,6),Color(201,79,23),0);
        }
        render.Flush();const auto pixels=gpu.ReadScenePixels();
        Require(pixels.size()==480000,"Sampler transition readback size changed");
        // Independent texture-coordinate model. With 16 texels over 80 pixels,
        // pixel center x=39.5 maps to texel 7.4: point uses the left color,
        // linear mixes 60% left / 40% right. Probe either side and flat regions.
        for(unsigned n=0;n<order.size();++n){
            const unsigned image=order[n]&1u;const bool linear=(order[n]&2u)!=0;
            const int x=30+int(n%4)*100,y=30+int(n/4)*120;
            unsigned localWrong=0;
            for(int localX:{15,38,39,40,41,65}){
                const double source=(localX+0.5)/5.0-0.5;
                const double right=linear?std::clamp(source-7.0,0.0,1.0):(localX>=40?1.0:0.0);
                const uint32_t actual=pixels[size_t(y+15)*800+x+localX];
                bool valid=(actual>>24)==255;
                for(unsigned shift:{0u,8u,16u}){
                    const double leftColor=(colors[image][0]>>shift)&255u;
                    const double rightColor=(colors[image][1]>>shift)&255u;
                    const int expected=int(leftColor*(1-right)+rightColor*right+0.5);
                    const int channel=int((actual>>shift)&255u);
                    valid=valid&&channel>=expected-1&&channel<=expected+1;
                }
                localWrong+=!valid;++samples;
            }
            wrong+=localWrong;
            solidWrong+=pixels[size_t(y+2)*800+x+86]!=0xffc94f17u;
            log<<"draw="<<n<<" texture="<<image<<" linear="<<linear
                <<" samples=6 wrong="<<localWrong<<std::endl;
        }
    }
    Require(samples==96&&!wrong&&!solidWrong,"Texture/filter/UV/solid state leaked across one frame");
    Require(app.mMemoryImageSet.size()==imagesBefore&&gpu.GetResourceCounts().textures==texturesBefore&&
        screen->mBits==screenBits&&screen->mBitsChangedCount==screenVersion,"Sampler fixture retained resources or CPU screen data");
    log<<"PASS transitions=16 samples="<<samples<<" wrong="<<wrong<<" solidWrong="<<solidWrong<<std::endl;
    ModernSmoke::Report("gpu-texture-16-interleaved-sampler-crop-solid-transitions",app);
}

void TextureSamplingAndRevisionCases(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;auto& gpu=*render.mRenderer;
    auto* screen=app.mDDInterface->mScreenImage;render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),texturesBefore=gpu.GetResourceCounts().textures;
    auto* screenBits=screen->mBits;const auto screenVersion=screen->mBitsChangedCount;
    std::ofstream log(ModernSmoke::ProbePath("texture-sampling-revision-cases.txt"));
    Require(bool(log),"Cannot write texture sampling/revision evidence");

    // Sampling metadata changes visible filtering, never the immutable source bytes.
    unsigned realChanges=0,staleRejected=0;
    {
        MemoryImage image;image.Create(3,3);auto* bits=image.GetBits();
        std::fill_n(bits,9,0xff406080u);bits[4]=0;image.BitsChanged();
        image.mPurgeBits=true;
        Require(render.CreateImageTexture(&image),"Cannot upload sanding fixture");
        auto* data=static_cast<TextureData*>(image.mD3DData);
        const auto original=data->ReadPixels().pixels;
        Require(original[4]==0 && !image.mBits,"Sanding source was not uploaded and purged");
        MemoryImage oracle;oracle.Create(3,3);std::fill_n(oracle.GetBits(),9,0xff406080u);
        oracle.mBits[4]=0x00406080u;oracle.BitsChanged();
        const auto draw=[&](MemoryImage& source){
            screen->FillRect(Rect(0,0,800,600),Color(17,29,43),0);
            render.StretchBlt(&source,Rect(200,200,6,6),Rect(0,0,3,3),nullptr,Color::White,0,false);
            render.Flush();return gpu.ReadScenePixels();
        };
        const auto uncorrected=draw(image),expected=draw(oracle);
        const auto version=image.mBitsChangedCount;
#if defined(PVZ_GPU_D3D12)
        const auto before=gpu.textureUploadCounts;
#else
        const auto before=gpu.GetTextureUploadCounts();
#endif
        TodMarkImageForSanding(&image);
        const auto corrected=draw(image);
#if defined(PVZ_GPU_D3D12)
        const auto after=gpu.textureUploadCounts;
#else
        const auto after=gpu.GetTextureUploadCounts();
#endif
        Require(corrected==expected && corrected!=uncorrected &&
            image.mBitsChangedCount==version && !image.mBits &&
            (image.mGpuSamplingFlags&GpuVertex::kAlphaEdgeFilter),
            "GPU sanding differs from the independent neighbor reference");
        Require(after.createdTextures==before.createdTextures && after.reusedUpdates==before.reusedUpdates &&
            data->ReadPixels().pixels==original,"GPU sanding rewrote or reuploaded original source pixels");
        ++realChanges;
    }
    {
        MemoryImage image;image.Create(130,150);auto* bits=image.GetBits();
        std::vector<uint32_t> expected(130*150,0xff6192a3u);std::copy(expected.begin(),expected.end(),bits);
        image.BitsChanged();
        Require(render.CreateImageTexture(&image),"Cannot upload revision fixture");
        auto* data=static_cast<TextureData*>(image.mD3DData);
        Require(data->mTexture && data->mWidth==130 && data->mHeight==150 &&
            !image.mBits && data->ReadPixels().pixels==expected,"Revision fixture lost its native GPU pixels");
        auto* texture=data->mTexture;
        ++image.mBitsChangedCount;
        try{render.ReadImagePixels(image);}catch(const std::logic_error&){++staleRejected;}
        --image.mBitsChangedCount;
        Require(render.ReadImagePixels(image).pixels==expected && !image.mBits &&
            image.mD3DData==data && data->mTexture==texture,
            "Restored valid GPU-only fixture cannot be read without CPU allocation");
    }
    Require(realChanges==1 && staleRejected==1,"Sampling/revision test omitted sanding or stale-data rejection");
    Require(app.mMemoryImageSet.size()==imagesBefore && gpu.GetResourceCounts().textures==texturesBefore &&
        screen->mBits==screenBits && screen->mBitsChangedCount==screenVersion,"Sampling/revision test retained resources/changed CPU screen");
    log<<"PASS gpuSanding=1 staleBitsRejected=1"<<std::endl;
    ModernSmoke::Report("gpu-texture-single-gpu-sanding-and-stale-bits-rejection",app);
}

void ImageReadbackCases(LawnApp& app) {
    using namespace Sexy;
    auto& render=*app.mDDInterface->mRenderInterface;auto& gpu=*render.mRenderer;
    auto* screen=app.mDDInterface->mScreenImage;render.Flush();
    const auto imagesBefore=app.mMemoryImageSet.size(),texturesBefore=gpu.GetResourceCounts().textures;
    auto* screenBits=screen->mBits;const auto screenVersion=screen->mBitsChangedCount;
    std::ofstream log(ModernSmoke::ProbePath("image-readback-cases.txt"));
    Require(bool(log),"Cannot write readback evidence");
    unsigned images=0,redraws=0,rejections=0;
    bool copyVerified=false;
    for(auto shape:{std::array{13,7},std::array{65,33},std::array{130,150},std::array{370,290}})
    for(bool opaque:{false,true}) {
        const int w=shape[0],h=shape[1];MemoryImage image;image.Create(w,h);
        auto* bits=image.GetBits();std::vector<uint32_t> expected(size_t(w)*h);
        for(int y=0;y<h;++y)for(int x=0;x<w;++x){
            const uint32_t a=std::array{0u,64u,128u,255u}[(x+y)%4];
            const uint32_t value=(a<<24)|(((x*13+y*7)&255)<<16)|(((x*3+y*31)&255)<<8)|((x+y*19)&255);
            bits[y*w+x]=value;expected[size_t(y)*w+x]=opaque?value|0xff000000u:value;
        }
        image.BitsChanged();
        if(opaque){image.mForcedMode=true;image.mHasAlpha=image.mHasTrans=false;}
        image.mPurgeBits=true;
        Require(render.CreateImageTexture(&image),"Cannot upload readback fixture");
        image.PurgeBits();
        Require(!image.mBits && !image.mColorTable && image.mD3DData,"Fixture did not discard CPU pixels");
        auto* data=image.mD3DData;const auto version=image.mBitsChangedCount;
        const auto retained=gpu.ReadScenePixels();
        const auto snapshot=render.ReadImagePixels(image);
        Require(snapshot.width==w && snapshot.height==h && snapshot.pixels==expected,"GPU-only image readback differs");
        Require(gpu.ReadScenePixels()==retained,"Texture readback changed the retained game scene");
        if(images==0){
            MemoryImage copy(image);render.Flush();
            Require(!copy.mBits && !copy.mColorTable && copy.mD3DData && copy.mD3DData!=image.mD3DData,
                "GPU image copy aliases its source or retains CPU pixels");
            const auto copied=render.ReadImagePixels(copy).pixels;
            for(size_t i=0;i<expected.size();++i)
                Require(copied[i]==expected[i],"GPU image copy changed raw RGBA bytes");
            bool rejected=false;
            try{copy.GetBits();}catch(const GpuImageCpuAccess&){rejected=true;}
            Require(rejected && !copy.mBits,"GPU image copy silently restored a CPU bitmap");
            log<<"gpu-copy-independent=1 cpu-pixel-access-rejected=1 pixels="<<expected.size()<<std::endl;
            copyVerified=true;
        }
        const auto draw=[&]{
            screen->FillRect(Rect(0,0,800,600),Color(17,29,43),0);
            render.Blt(&image,100,140,Rect(0,0,w,h),Color::White,0,false);render.Flush();
            return gpu.ReadScenePixels();
        };
        const auto before=draw();
        Require(render.ReadImagePixels(image).pixels==expected,"Readback after sampling changed texels");
        Require(draw()==before,"Image layout/draw state was not restored after readback");++redraws;
        Require(!image.mBits && !image.mColorTable && image.mD3DData==data && image.mBitsChangedCount==version,
            "Diagnostic recreated CPU pixels or modified source version");
        log<<"size="<<w<<'x'<<h<<" opaque="<<opaque<<" different=0 redraw=0 cpu-restored=0\n";
        if(images==0){
            ++image.mBitsChangedCount;
            try{render.ReadImagePixels(image);}catch(const std::logic_error&){++rejections;}
            image.mBitsChangedCount=version; // restore only the intentional stale-version test mutation.
            screen->FillRect(Rect(0,0,800,600),Color::Black,0);
            try{render.ReadImagePixels(image);}catch(const std::logic_error&){++rejections;}
            render.Flush();
        }
        ++images;
    }
    Require(copyVerified,"GPU copy ownership and CPU-access rejection were not checked");
    {
        MemoryImage cpu;cpu.Create(7,5);auto* bits=cpu.GetBits();
        std::vector<uint32_t> expected(35);for(size_t i=0;i<35;++i)bits[i]=expected[i]=0x7f123400u+uint32_t(i);
        cpu.BitsChanged();const int version=cpu.mBitsChangedCount;
        Require(render.ReadImagePixels(cpu).pixels==expected && cpu.mBits==bits && cpu.mBitsChangedCount==version && !cpu.mD3DData,
            "CPU snapshot changed the image or uploaded it");
        MemoryImage indexed;indexed.Create(7,5);
        indexed.mColorTable=new unsigned int[256];indexed.mColorIndices=new uchar[35];
        for(int i=0;i<256;++i)indexed.mColorTable[i]=0x8f000000u+uint32_t(i)*0x010101u;
        for(int i=0;i<35;++i){indexed.mColorIndices[i]=uchar(i*7);expected[i]=indexed.mColorTable[i*7];}
        auto* table=indexed.mColorTable;auto* indices=indexed.mColorIndices;
        Require(render.ReadImagePixels(indexed).pixels==expected && indexed.mColorTable==table &&
            indexed.mColorIndices==indices && !indexed.mBits && !indexed.mD3DData,"Indexed snapshot mutated/unpalettized its source");
    }
    {
        std::array<uint32_t,8*3> padded{};std::vector<uint32_t> expected(15);
        for(int y=0;y<3;++y)for(int x=0;x<5;++x)padded[y*8+x]=expected[y*5+x]=0x90603020u+uint32_t(y*5+x);
        auto* texture=gpu.CreateTexture(5,3,padded.data(),8*4,false);
        Require(gpu.ReadTexturePixels(texture).pixels==expected,"Pending direct texture upload was not read");
        for(int y=0;y<3;++y)for(int x=0;x<5;++x)padded[y*8+x]=expected[y*5+x]=0xd0814210u+uint32_t(y*5+x);
        auto* changed=gpu.ReplaceTexture(texture,5,3,padded.data(),8*4,false);
        Require(changed==texture && gpu.ReadTexturePixels(changed).pixels==expected,"Pending same-handle replacement was not read");
        screen->FillRect(Rect(0,0,800,600),Color::Black,0);
        try{gpu.ReadTexturePixels(texture);}catch(const std::logic_error&){++rejections;}
        render.Flush();gpu.DestroyTexture(texture);
        try{gpu.ReadTexturePixels(texture);}catch(const std::invalid_argument&){++rejections;}
        try{gpu.ReadTexturePixels(nullptr);}catch(const std::invalid_argument&){++rejections;}
        std::array<uint8_t,9> mask{};auto* coverage=gpu.CreateCoverageMask(3,3,mask,3);
        try{gpu.ReadTexturePixels(coverage);}catch(const std::invalid_argument&){++rejections;}
        gpu.DestroyTexture(coverage);
    }
    Require(render.ReadImagePixels(*screen).pixels==gpu.ReadScenePixels(),"Scene snapshot differs from renderer readback");
    Require(images==8 && redraws==8 && rejections==6,"Readback coverage changed");
    Require(app.mMemoryImageSet.size()==imagesBefore && gpu.GetResourceCounts().textures==texturesBefore &&
        screen->mBits==screenBits && screen->mBitsChangedCount==screenVersion,"Readback fixture changed source registrations/CPU screen");
    log<<"PASS gpu-only-images=8 redraws=8 cpu-and-indexed=2 pending-replacements=2 rejections=6"<<std::endl;
    ModernSmoke::Report("gpu-image-readback-eight-native-images-state-and-errors",app);
}
}

void PortableTextureSubmissionSmoke(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),"Texture submission probe requires isolation");
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    render.Flush();
    auto* cpuBits=screen->mBits;
    const auto cpuVersion=screen->mBitsChangedCount;
    const auto imagesBefore=app.mMemoryImageSet.size();
    const auto texturesBefore=render.mRenderer->GetResourceCounts().textures;
    std::ofstream log(ModernSmoke::ProbePath("texture-submission-cases.txt"));
    Require(bool(log),"Cannot write texture submission evidence");
    unsigned wrappers=0,wrapperWrong=0;
    for (const auto& size : {std::array{154,90},std::array{130,150},std::array{370,290}}) {
        const int w=size[0],h=size[1];
        MemoryImage single;
        {
            single.Create(w,h);
            auto* bits=single.GetBits();
            for(int y=0;y<h;++y)for(int x=0;x<w;++x) {
                const unsigned r=40+((x/8+y/16)%4)*48;
                const unsigned g=30+((x/16+y/8)%4)*52;
                const unsigned b=20+((x/8+y/8)%4)*56;
                const unsigned a=64+((x/32+y/32)%4)*63;
                bits[y*w+x]=(a<<24)|(r<<16)|(g<<8)|b;
            }
            single.BitsChanged();
        }
        Require(render.CreateImageTexture(&single),"Cannot upload texture fixture");
        const auto& one=*static_cast<TextureData*>(single.mD3DData);
        Require(one.mTexture && one.mWidth==w && one.mHeight==h && !single.mBits,
            "Triangle adapter fixture lost its native texture or retained CPU pixels");
        log << "image=" << w << 'x' << h << " native-texture=1" << std::endl;
        auto begin=[&]{ screen->FillRect(Rect(0,0,800,600),Color(17,29,43),0); };
        auto finish=[&]{
            // Returning from a textured batch must restore solid-color output.
            screen->FillRect(Rect(20,20,9,9),Color(201,79,23),0);
            render.Flush();
            auto pixels=render.mRenderer->ReadScenePixels();
            Require(pixels.size()==800*600 && pixels[20*800+20]==0xffc94f17u,"Solid draw state leaked after texture");
            return pixels;
        };
        const TriVertex triangle[1][3]={{{73.25f,81.375f,0,0},
            {73.25f+w*1.25f,81.375f,1,0},{73.25f,81.375f+h*1.25f,0,1}}};
        for(bool linear : {false,true})for(int mode : {0,1}) {
            // The batched reference uses explicit tx=ty=0 and the requested
            // filter. Compare the single-triangle adapter on the same texture.
            begin();render.DrawTrianglesTex(triangle,1,Color::White,mode,&single,0,0,linear);
            const auto reference=finish();
            Require(std::count_if(reference.begin(),reference.end(),[](auto p){return p!=0xff111d2bu;})>size_t(w*h/2),
                "Single texture triangle reference is empty");
            begin();render.DrawTriangleTex(triangle[0][0],triangle[0][1],triangle[0][2],Color::White,mode,&single,linear);
            const auto actual=finish();
            size_t mismatch=0;
            for(size_t i=0;i<actual.size();++i)mismatch+=actual[i]!=reference[i];
            log << "single-adapter linear=" << linear << " mode=" << mode << " different-pixels=" << mismatch << std::endl;
            ++wrappers;wrapperWrong+=mismatch!=0;
        }
    }
    Require(app.mMemoryImageSet.size()==imagesBefore && render.mRenderer->GetResourceCounts().textures==texturesBefore,
        "Texture submission fixture retained registered images/textures");
    Require(screen->mBits==cpuBits && screen->mBitsChangedCount==cpuVersion,"Probe wrote CPU screen backing");
    log << "adapters=" << wrappers
        << " wrong=" << wrapperWrong << std::endl;
    Require(wrappers==12 && !wrapperWrong,"Texture submission mismatch; see texture-submission-cases.txt");
    ModernSmoke::Report("gpu-texture-12-native-single-adapter-cases",app);
    SingleBatchCases(app);
    TextureSamplerTransitions(app);
    TextureSamplingAndRevisionCases(app);
    ImageReadbackCases(app);
}
