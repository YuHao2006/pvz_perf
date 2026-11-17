#include "ScaleEffectCompiler.h"
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#ifdef _WIN32
#define NOMINMAX
#include <windows.h>
#endif

namespace fs=std::filesystem;
static std::string utf8(const fs::path& path) {
    const auto value=path.generic_u8string();
    return {value.begin(),value.end()};
}
static void require(bool ok,const std::string& message) {
    if(!ok)throw std::runtime_error(message);
}
static void write(const fs::path& path,const std::string& text) {
    fs::create_directories(path.parent_path());
    std::ofstream out(path,std::ios::binary);out<<text;
    require(bool(out),"Fixture write failed");
}
int main(int argc,char** argv) {
    try {
#ifdef _WIN32
        std::cout<<"Process ACP="<<GetACP()<<'\n';
        if(argc>2)require(GetACP()==std::stoul(argv[2]),"Process code page was not applied");
#endif
        const auto root=fs::current_path()/"scale-unicode-output";
        const auto plain=root/"ascii-install";
        const auto unicode=root/fs::path(u8"中文用户/游戏 目录/特效");
        fs::create_directories(plain);fs::create_directories(unicode);
        if(argc>1) {
            fs::copy(fs::path(argv[1]),plain,fs::copy_options::recursive|fs::copy_options::overwrite_existing);
            fs::copy(fs::path(argv[1]),unicode,fs::copy_options::recursive|fs::copy_options::overwrite_existing);
        }
        const std::string fixture=R"(//!MAGPIE EFFECT
//!VERSION 4
#error RAW_DISK_SOURCE_MUST_NOT_BE_COMPILED
//!TEXTURE
Texture2D INPUT;
//!TEXTURE
Texture2D OUTPUT;
//!COMMON
#include "部件.hlsli"
//!PASS 1
//!STYLE PS
//!IN INPUT
//!OUT OUTPUT
float4 Pass1(float2 pos) { return fixtureColor(); }
)";
        for(const auto& dir:{plain,unicode}) {
            write(dir/fs::path(u8"内存源码.hlsl"),fixture);
            write(dir/fs::path(u8"部件.hlsli"),"#include \"nested/color.hlsli\"\n");
            write(dir/"nested/color.hlsli","float4 fixtureColor() { return float4(0.1,0.2,0.3,1); }\n");
        }
        Sexy::ScaleEffectCompiler compiler;size_t effects=0,passes=0;
        for(const auto& entry:fs::recursive_directory_iterator(plain)) {
            if(entry.path().extension()!=".hlsl")continue;
            const auto relative=fs::relative(entry.path(),plain), other=unicode/relative;
            Sexy::ScaleEffectRuntimeDesc a,b;std::string error;
            require(compiler.CompileFile(utf8(entry.path()),{},a,error),error);
            require(compiler.CompileFile(utf8(other),{},b,error),error);
            require(a.mPasses.size()==b.mPasses.size(),"Pass count changed");
            for(size_t i=0;i<a.mPasses.size();++i)
                require(a.mPasses[i].mSpirv==b.mPasses[i].mSpirv,"SPIR-V differs by path");
            passes+=a.mPasses.size();
            require(compiler.CompileD3d12(utf8(entry.path()),{},a,error),error);
            require(compiler.CompileD3d12(utf8(other),{},b,error),error);
            require(a.mPasses.size()==b.mPasses.size(),"DXIL pass count changed");
            for(size_t i=0;i<a.mPasses.size();++i)
                require(a.mPasses[i].mDxil==b.mPasses[i].mDxil,"DXIL differs by path");
            fs::path written;
            require(compiler.CompileBinary(utf8(other),{},written,error),error);
            require(written==Sexy::ScaleEffectBinary::DefaultPath(other),"Output path changed");
            require(Sexy::ScaleEffectBinary::Load(written,b,error),error);
            ++effects;
        }
        std::cout<<"PASS: "<<effects<<" effects, "<<passes<<" passes per backend; ASCII/Unicode byte-identical SPIR-V and DXIL; nested includes; memory-source marker; Unicode binary round trip\n";
        return 0;
    } catch(const std::exception& error) { std::cerr<<error.what()<<'\n';return 1; }
}
