#include "ScaleEffectCompiler.h"
#include "ScaleEffectSizing.h"
#include <limits>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <stdexcept>
#include <string>
#include <vector>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("scale-compile-output");
    path = std::string("scale-compile-output/") + name;
    return path.c_str();
}
}
using namespace Sexy;
namespace {
void Require(bool condition, const std::string& error) {
    if (!condition) throw std::runtime_error(error);
}
struct ModuleInfo {
    std::set<uint32_t> storageFormats;
    std::set<std::pair<uint32_t,uint32_t>> bindings;
};
ModuleInfo Inspect(const std::vector<uint32_t>& words) {
    Require(words.size() >= 5 && words[0] == 0x07230203, "not SPIR-V");
    std::map<uint32_t,uint32_t> bindings, sets;
    ModuleInfo info;
    for (size_t pos=5; pos<words.size();) {
        const auto count=words[pos]>>16, op=words[pos]&0xffff;
        Require(count && pos+count<=words.size(), "truncated SPIR-V instruction");
        // OpTypeImage: result, sampled type, dim, depth, array, MS, sampled, format.
        if (op==25 && count>=9 && words[pos+7]==2) info.storageFormats.insert(words[pos+8]);
        if (op==71 && count>=4) {
            if (words[pos+2]==33) bindings[words[pos+1]]=words[pos+3];
            if (words[pos+2]==34) sets[words[pos+1]]=words[pos+3];
        }
        pos+=count;
    }
    for (auto [id,binding]:bindings) {
        Require(sets.contains(id), "binding has no descriptor set");
        Require(info.bindings.emplace(sets.at(id),binding).second, "descriptor binding collision");
    }
    return info;
}
void Save(const std::filesystem::path& path, const std::vector<uint32_t>& words) {
    std::ofstream output(path,std::ios::binary);
    output.write(reinterpret_cast<const char*>(words.data()),words.size()*4);
    Require(bool(output),"cannot write SPIR-V test evidence");
}
}
int main(int argc,char** argv) {
    try {
        std::filesystem::create_directories("scale-compile-output");
        ScaleEffectCompiler compiler;
        // Every Magpie format, not just the RGBA8 final output.
        const std::pair<const char*,uint32_t> formats[] = {
            {"R32G32B32A32_FLOAT",1},{"R16G16B16A16_FLOAT",2},
            {"R16G16B16A16_UNORM",10},{"R16G16B16A16_SNORM",16},
            {"R32G32_FLOAT",6},{"R10G10B10A2_UNORM",11},{"R11G11B10_FLOAT",8},
            {"R8G8B8A8_UNORM",4},{"R8G8B8A8_SNORM",5},{"R16G16_FLOAT",7},
            {"R16G16_UNORM",12},{"R16G16_SNORM",17},{"R32_FLOAT",3},
            {"R8G8_UNORM",13},{"R8G8_SNORM",18},{"R16_FLOAT",9},
            {"R16_UNORM",14},{"R16_SNORM",19},{"R8_UNORM",15},{"R8_SNORM",20}
        };
        for (const auto& [format, expected] : formats) {
            const auto path=std::filesystem::path("scale-compile-output")/(std::string(format)+".hlsl");
            std::ofstream file(path);
            file << "//!MAGPIE EFFECT\n//!VERSION 4\n"
                 << "//!TEXTURE\nTexture2D INPUT;\n//!TEXTURE\n//!FORMAT " << format
                 << "\nTexture2D OUTPUT;\n//!PASS 1\n//!STYLE PS\n//!IN INPUT\n//!OUT OUTPUT\n"
                 << "float4 Pass1(float2 p) { return float4(p, 0.25, 1); }\n";
            file.close();
            ScaleEffectDesc effect;
            Require(compiler.CompileEffect(path.string(),effect),effect.mError);
            const auto info=Inspect(effect.mCompiledSpirv.at(0));
            Require(info.storageFormats == std::set<uint32_t>{expected},std::string(format)+" format lost");
            Require(info.bindings.contains({2,0}),"output descriptor binding lost");
            Save(path.string()+".spv",effect.mCompiledSpirv[0]);
        }
        std::vector<std::filesystem::path> paths;
        const auto root=std::filesystem::path(PVZ_EFFECTS_DIR);
        if (argc>1 && std::string(argv[1])=="--all") {
            for (auto& entry:std::filesystem::recursive_directory_iterator(root))
                if(entry.is_regular_file() && entry.path().extension()==".hlsl") paths.push_back(entry.path());
        } else {
            for (const char* file:{"Nearest.hlsl","Bilinear.hlsl","SSimDownscaler.hlsl","Lanczos.hlsl",
                                  "Anime4K/Anime4K_Denoise_Bilateral_Mean.hlsl",
                                  "Anime4K/Anime4K_Upscale_Denoise_UL.hlsl"})
                paths.push_back(root/file);
        }
        size_t passes=0, failures=0;
        for (const auto& path:paths) {
            ScaleEffectDesc effect;
            const bool ok=compiler.CompileEffect(path.string(),effect);
            if (!ok) {
                ++failures;
                std::cerr << "FAIL " << effect.mError << std::endl;
                continue;
            }
            Require(effect.mCompiled && effect.mInlineParamsEnabled,"effect not finalized");
            Require(effect.mCompiledSpirv.size()==effect.mPasses.size(),"missing passes");
            for(size_t i=0;i<effect.mCompiledSpirv.size();++i) {
                Inspect(effect.mCompiledSpirv[i]);
                Save(std::filesystem::path("scale-compile-output")/(path.stem().string()+"-"+std::to_string(i)+".spv"),
                     effect.mCompiledSpirv[i]);
            }
            passes+=effect.mPasses.size();
            std::cout << "PASS " << path.filename().string() << " passes=" << effect.mPasses.size() << std::endl;
        }
        ScaleEffectDesc defaultEffect, changed, rejected, nearest, up, smaa;
        Require(compiler.CompileEffect((root/"SMAA/SMAA_Ultra.hlsl").string(),smaa),smaa.mError);
        size_t sources=0;
        for(const auto& texture:smaa.mTextures) if(!texture.mSource.empty()) ++sources;
        Require(sources==2,"SMAA DDS sources were discarded by metadata parser");
        Require(compiler.CompileEffect((root/"SSimDownscaler.hlsl").string(),defaultEffect),defaultEffect.mError);
        ScaleEffectRuntimeDesc runtimeDefault;
        std::string metadataError;
        Require(ScaleEffectCompiler::CompileRuntimeMetadata(defaultEffect,runtimeDefault,metadataError),metadataError);
        const auto constants=ScaleEffectSizing::BuildConstants(runtimeDefault,800,600,400,300);
        Require(constants.size()==24 && constants[0]==800 && constants[1]==600
            && constants[2]==400 && constants[3]==300
            && constants[10]==400 && constants[11]==300
            && constants[14]==800 && constants[15]==300,
            "SSim effect constants were incorrectly replaced by pass-local sizes");
        Require(compiler.CompileEffect((root/"SSimDownscaler.hlsl").string(),{{"OVERSHARP",2.0f}},changed),changed.mError);
        Require(changed.mInlineParams.at("oversharp")==2 && changed.mCompiledSpirv!=defaultEffect.mCompiledSpirv,
                "inline parameters did not change generated shader");
        Require(!compiler.CompileEffect((root/"SSimDownscaler.hlsl").string(),{{"oversharp",99.0f}},rejected)
                && !rejected.mCompiled,"invalid parameter accepted");
        Require(!compiler.CompileEffect((root/"Nearest.hlsl").string(),{{"typo",1.0f}},rejected)
                && !rejected.mCompiled,"unknown parameter accepted");
        Require(compiler.CompileEffect((root/"Nearest.hlsl").string(),nearest),nearest.mError);
        ScaleEffectRuntimeDesc runtimeNearest, runtimeUp;
        Require(ScaleEffectCompiler::CompileRuntimeMetadata(nearest,runtimeNearest,metadataError),metadataError);
        runtimeUp.mOutput=static_cast<ScaleResourceId>(0);
        ScaleRuntimeTexture upOutput;
        upOutput.mId=runtimeUp.mOutput;
        upOutput.mWidthExpr={{ScaleSizeOp::InputWidth,0},{ScaleSizeOp::Literal,2},{ScaleSizeOp::Multiply,0}};
        upOutput.mHeightExpr={{ScaleSizeOp::InputHeight,0},{ScaleSizeOp::Literal,2},{ScaleSizeOp::Multiply,0}};
        runtimeUp.mTextures.push_back(std::move(upOutput));
        int w=0,h=0;
        for (auto [mode,x,y,expectedW,expectedH] : std::vector<std::tuple<int,float,float,int,int>>{
            {SCALE_SCALING_NORMAL,2.0f,2.0f,1600,1200},
            {SCALE_SCALING_FIT,1.0f,1.0f,1920,1440},
            {SCALE_SCALING_ABSOLUTE,1234.0f,567.0f,1234,567},
            {SCALE_SCALING_FILL,1.0f,1.0f,2560,1440}}) {
            Require(ScaleEffectSizing::ComputePipelineOutputSize({&runtimeNearest},{{mode,x,y}},
                    800,600,2560,1440,w,h) && w==expectedW && h==expectedH,"size mode mismatch");
        }
        Require(ScaleEffectSizing::ComputePipelineOutputSize({&runtimeUp,&runtimeUp,&runtimeNearest},
                {{},{},{SCALE_SCALING_FIT,1,1}},800,600,2560,1440,w,h)
                && w==1920 && h==1440,"two upscales followed by fit mismatch");
        for (const char* expr:{"0","1-2","2147483647+1","2147483647*2","99999999999999999999999","8/0"}) {
            bool valid=true;
            ScaleSizeExpr bytecode;
            if(ScaleEffectCompiler::CompileSizeExpr(expr,bytecode,metadataError))
                ScaleEffectSizing::EvalSizeExpr(bytecode,800,600,1600,1200,valid);
            else valid=false;
            Require(!valid,"invalid size expression accepted");
        }
        for (float scale:{-1.0f,0.0f,std::numeric_limits<float>::infinity(),std::numeric_limits<float>::quiet_NaN(),1e30f})
            Require(!ScaleEffectSizing::ComputePipelineOutputSize({&runtimeNearest},{{SCALE_SCALING_NORMAL,scale,scale}},
                800,600,2560,1440,w,h),"invalid/overflowing scale accepted");
        Require(!ScaleEffectSizing::ComputePipelineOutputSize({&runtimeNearest},{{99,1,1}},800,600,2560,1440,w,h),
            "unknown scaling mode accepted");
        Require(failures==0,"effect catalog compile failures="+std::to_string(failures));
        std::cout << "PASS 20 storage formats, " << paths.size() << " effects / " << passes
                  << " passes, inline parameters and pipeline sizing\n";
        return 0;
    } catch(const std::exception& error) {
        std::cerr << "FAIL " << error.what() << '\n';
        return 1;
    }
}
