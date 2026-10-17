#include "ScaleEffectCompiler.h"
#include <algorithm>
#include <filesystem>
#include <iostream>
#include <string>
#include <vector>

namespace Sexy {
const char* GetLogFilePathC(const char* name) {
    static thread_local std::string path;
    std::filesystem::create_directories("scale-compile-output");
    path=(std::filesystem::path("scale-compile-output")/name).string();
    return path.c_str();
}
}
int main(int argc,char** argv) {
    try {
        if(argc!=3 || std::string_view(argv[1])!="--effects") {
            std::cerr<<"Usage: compile-numeric-scale --effects <effect-directory>\n";
            return 2;
        }
        const std::filesystem::path root=argv[2];
        std::vector<std::filesystem::path> files;
        for(const auto& entry:std::filesystem::recursive_directory_iterator(root))
            if(entry.is_regular_file() && entry.path().extension()==".hlsl") files.push_back(entry.path());
        std::sort(files.begin(),files.end());
        Sexy::ScaleEffectCompiler compiler;
        size_t success=0,failed=0;
        for(const auto& source:files) {
            std::filesystem::path written;
            std::string error;
            if(!compiler.CompileBinary(source.generic_string(),{},written,error)) {
                ++failed; std::cerr<<"FAIL "<<source.generic_string()<<": "<<error<<'\n';
            } else {
                ++success; std::cout<<"OK "<<written.generic_string()<<'\n';
            }
        }
        std::cout<<"Baked "<<success<<" numeric scale effects; failures="<<failed<<'\n';
        return failed?1:0;
    } catch(const std::exception& error) {
        std::cerr<<"FAIL "<<error.what()<<'\n'; return 1;
    }
}
