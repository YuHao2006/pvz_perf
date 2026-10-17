// Standalone CPU arithmetic fixture: no game headers, Vulkan, GPU, or timing.
// Checks the shader's integer core; runtime dispatch is tested by game smokes.
#include <algorithm>
#include <array>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <vector>

namespace {
using Bytes=std::array<std::uint32_t,4>; // Logical R/G/B/A, independent of endian.
using Tint=std::array<std::int32_t,4>;
struct PushConstants {
    std::int32_t x,y,width,height;
    std::int32_t red,green,blue,alpha;
    std::uint32_t operation;
};
static_assert(sizeof(PushConstants)==36);
static_assert(offsetof(PushConstants,width)==8 && offsetof(PushConstants,height)==12);
static_assert(offsetof(PushConstants,red)==16 && offsetof(PushConstants,green)==20);
static_assert(offsetof(PushConstants,blue)==24 && offsetof(PushConstants,alpha)==28);
static_assert(offsetof(PushConstants,operation)==32);
static_assert(std::numeric_limits<std::uint32_t>::digits==32);

struct Counts {
    std::uint64_t pixels=0,oracle=0,fast=0,wide=0,hiddenRgb=0,quantized=0,guarded=0;
} counts;

void Require(bool condition,const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

bool Fast(const Tint& tint)
{
    return tint[0]<=255 && tint[1]<=255 && tint[2]<=255 && tint[3]<=255;
}

std::uint32_t Pack(const Bytes& rgba)
{
    return (rgba[3]<<24u)|(rgba[0]<<16u)|(rgba[1]<<8u)|rgba[2];
}

// Original packed unsigned expressions shared by ColorizeImage and
// CreateColorizedImage in SexyAppBase.cpp; kept separate from the shader model.
std::uint32_t LegacyPixel(std::uint32_t value,const Tint& tint)
{
    const auto r=static_cast<std::uint32_t>(tint[0]);
    const auto g=static_cast<std::uint32_t>(tint[1]);
    const auto b=static_cast<std::uint32_t>(tint[2]);
    const auto a=static_cast<std::uint32_t>(tint[3]);
    if (tint[3]<=255 && tint[0]<=255 && tint[1]<=255 && tint[2]<=255) {
        return ((((value&0xff000000u)>>8u)*a)&0xff000000u)|
            ((((value&0x00ff0000u)*r)>>8u)&0x00ff0000u)|
            ((((value&0x0000ff00u)*g)>>8u)&0x0000ff00u)|
            ((((value&0x000000ffu)*b)>>8u)&0x000000ffu);
    }
    auto alpha=((value>>24u)*a)/255u;
    auto red=(((value>>16u)&255u)*r)/255u;
    auto green=(((value>>8u)&255u)*g)/255u;
    auto blue=((value&255u)*b)/255u;
    if (alpha>255u) alpha=255u;
    if (red>255u) red=255u;
    if (green>255u) green=255u;
    if (blue>255u) blue=255u;
    return (alpha<<24u)|(red<<16u)|(green<<8u)|blue;
}

// Independent tintPixel oracle from PortableSharedResourceSmoke.cpp.
// Its fast-path min is equivalent to the packed mask for nonnegative tints;
// signed-negative extensions are checked against LegacyPixel, not this oracle.
std::uint32_t SmokeTintPixel(std::uint32_t value,const Tint& tint)
{
    const bool fast=tint[0]<=255 && tint[1]<=255 && tint[2]<=255 && tint[3]<=255;
    const Tint channels{tint[2],tint[1],tint[0],tint[3]};
    std::uint32_t result=0;
    for (unsigned c=0;c<4;++c) {
        const auto v=((value>>(8u*c))&255u)*static_cast<std::uint32_t>(channels[c])/
            (fast?256u:255u);
        result|=std::min(v,255u)<<(8u*c);
    }
    return result;
}

Bytes ShaderIntegerModel(const Bytes& source,const Tint& tint)
{
    Bytes result{};
    const bool fast=Fast(tint);
    for (std::size_t c=0;c<4;++c) {
        const std::uint32_t product=source[c]*static_cast<std::uint32_t>(tint[c]);
        result[c]=fast?((product>>8u)&255u):std::min(product/255u,255u);
    }
    return result;
}

void Check(const Bytes& source,const Tint& tint)
{
    const auto sourceBefore=source;
    const auto actual=ShaderIntegerModel(source,tint);
    const auto expected=LegacyPixel(Pack(source),tint);
    if (Pack(actual)!=expected) {
        std::cerr<<"source="<<std::hex<<Pack(source)<<" actual="<<Pack(actual)
            <<" expected="<<expected<<std::dec<<" tint="
            <<tint[0]<<','<<tint[1]<<','<<tint[2]<<','<<tint[3]<<'\n';
        throw std::runtime_error("Integer model differs from original packed CPU formula");
    }
    if (std::all_of(tint.begin(),tint.end(),[](std::int32_t v){return v>=0;})) {
        Require(Pack(actual)==SmokeTintPixel(Pack(source),tint),
            "Integer model differs from independent tintPixel oracle");
        ++counts.oracle;
    }
    Require(source==sourceBefore,"Integer model changed source");
    Require(std::all_of(actual.begin(),actual.end(),[](std::uint32_t v){return v<=255u;}),
        "Integer model output is not a byte");
    ++counts.pixels;
    if (Fast(tint)) ++counts.fast; else ++counts.wide;
    if (source[3]==0u && (actual[0]!=0u || actual[1]!=0u || actual[2]!=0u))
        ++counts.hiddenRgb;
}

template<class Values>
auto Combination(std::size_t index,const Values& values)
{
    std::array<typename Values::value_type,4> result{};
    for (auto& channel:result) {
        channel=values[index%values.size()];
        index/=values.size();
    }
    return result;
}

void QuantizationCases()
{
    // All raw UNORM input/output bytes, including hidden RGB, round trip under
    // the float32 I/O model. This is not a device image-format execution test.
    for (std::uint32_t byte=0;byte<=255u;++byte) {
        const float sampled=static_cast<float>(byte)/255.0f;
        const auto reconstructed=static_cast<std::uint32_t>(std::round(sampled*255.0f));
        Require(reconstructed==byte,"Raw UNORM byte reconstruction changed a byte");
        const float stored=static_cast<float>(reconstructed)/255.0f;
        const auto output=static_cast<std::uint32_t>(std::round(stored*255.0f));
        Require(output==byte,"RGBA8 output quantization changed a byte");
        ++counts.quantized;
    }
}

void EdgeCases()
{
    constexpr std::array<std::uint32_t,5> bytes{0u,1u,127u,254u,255u};
    constexpr std::array<std::int32_t,7> tints{0,1,127,254,255,256,1024};
    for (std::size_t p=0;p<625;++p)
        for (std::size_t t=0;t<2401;++t)
            Check(Combination(p,bytes),Combination(t,tints));

    Require(ShaderIntegerModel({255u,1u,127u,255u},{255,255,255,255})==
        Bytes{254u,0u,126u,254u},"Fast path was changed to /255");
    Require(ShaderIntegerModel({255u,1u,127u,255u},{256,255,255,255})==
        Bytes{255u,1u,127u,255u},"Wide branch was selected per channel");
    Require(ShaderIntegerModel({127u,254u,255u,0u},{255,255,255,255})==
        Bytes{126u,253u,254u,0u},"Raw alpha-zero hidden RGB was discarded");
    Require(ShaderIntegerModel({255u,1u,127u,254u},{255,255,255,0})==
        Bytes{254u,0u,126u,0u},"Zero output alpha incorrectly cleared RGB");
    Require(ShaderIntegerModel({63u,64u,127u,255u},{1024,1024,1024,1024})==
        Bytes{252u,255u,255u,255u},"Wide division or saturation changed");
}

void IndependentByteCases()
{
    for (std::size_t channel=0;channel<4;++channel) {
        for (std::uint32_t byte=0;byte<=255u;++byte) {
            for (std::int32_t value=0;value<=1024;++value) {
                Bytes source{19u,31u,53u,97u};
                source[channel]=byte;
                Tint tint{255,255,255,255};
                tint[channel]=value;
                Check(source,tint);
                if (value<=255) {
                    tint[(channel+1)%4]=256;
                    Check(source,tint);
                }
            }
        }
    }
}

void SignedAndWrapCases()
{
    constexpr std::array<std::uint32_t,5> bytes{0u,1u,127u,254u,255u};
    constexpr std::array<std::int32_t,8> tints{
        -1,-255,-256,std::numeric_limits<std::int32_t>::min(),
        255,256,16843010,std::numeric_limits<std::int32_t>::max()
    };
    for (std::size_t channel=0;channel<4;++channel) {
        for (auto byte:bytes) for (auto value:tints) {
            Bytes source{255u,127u,254u,1u};
            source[channel]=byte;
            Tint tint{255,255,255,255};
            tint[channel]=value;
            Check(source,tint);
            tint[(channel+1)%4]=1024;
            Check(source,tint);
        }
    }
}

void SeparateOutputAndBoundsCases()
{
    constexpr std::array<std::uint32_t,6> extents{0u,1u,7u,8u,9u,17u};
    constexpr std::array<Tint,4> tints{{
        {255,255,255,255},{256,255,128,64},{64,128,256,255},{1024,1024,1024,1024}
    }};
    for (auto width:extents) for (auto height:extents) for (const auto& tint:tints) {
        std::vector<Bytes> source(static_cast<std::size_t>(width)*height);
        for (std::size_t n=0;n<source.size();++n) {
            const auto v=static_cast<std::uint32_t>(n);
            source[n]={(v*53u)%256u,(v*31u)%256u,(v*19u)%256u,(v*97u)%256u};
        }
        if (!source.empty()) source[0]={127u,254u,255u,0u};
        const auto before=source;
        const Bytes sentinel{0xdeadbeefu,0xdeadbeefu,0xdeadbeefu,0xdeadbeefu};
        std::vector<Bytes> output(source.size()+2,sentinel);
        const auto dispatchWidth=((width+7u)/8u+1u)*8u;
        const auto dispatchHeight=((height+7u)/8u+1u)*8u;
        for (std::uint32_t y=0;y<dispatchHeight;++y) {
            for (std::uint32_t x=0;x<dispatchWidth;++x) {
                if (x>=width || y>=height) {++counts.guarded;continue;}
                const auto n=static_cast<std::size_t>(y)*width+x;
                output[n+1]=ShaderIntegerModel(source[n],tint);
            }
        }
        Require(source==before,"Separate-output model mutated source");
        Require(output.front()==sentinel && output.back()==sentinel,
            "Overdispatch changed an output guard");
        for (std::size_t n=0;n<source.size();++n) {
            Require(Pack(output[n+1])==LegacyPixel(Pack(source[n]),tint),
                "Separate-output dispatch model differs from packed formula");
            Check(source[n],tint);
        }
    }
}
}

int main()
{
    try {
        QuantizationCases();
        EdgeCases();
        IndependentByteCases();
        SignedAndWrapCases();
        SeparateOutputAndBoundsCases();
        Require(counts.fast!=0 && counts.wide!=0 && counts.hiddenRgb!=0,
            "Fixture missed a branch or alpha-zero hidden RGB");
        std::cout<<"PASS CPU-only color arithmetic: pixels="<<counts.pixels
            <<" smoke-oracle="<<counts.oracle<<" fast="<<counts.fast<<" wide="<<counts.wide
            <<" alpha0-hidden-rgb="<<counts.hiddenRgb<<" unorm-bytes="<<counts.quantized
            <<" guarded-invocations="<<counts.guarded<<" push-bytes="<<sizeof(PushConstants)
            <<"; shader binding/device execution NOT tested\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr<<error.what()<<'\n';
        return 1;
    }
}
