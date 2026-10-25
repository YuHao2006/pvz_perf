#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/ParticleDefinitionCompiled.h"
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
int bindings = 0;
bool fixtureMode = true;
void Require(bool condition) { if (!condition) throw std::runtime_error("compiled particle assertion"); }
template<class T> void Append(std::vector<unsigned char>& bytes, T value)
{
    const auto* begin = reinterpret_cast<const unsigned char*>(&value);
    bytes.insert(bytes.end(), begin, begin + sizeof(value));
}
void Word(std::vector<unsigned char>& bytes, unsigned value) { Append(bytes, value); }
}
void TodParticleFreeGpuDefinition(TodParticleDefinition&) {}
bool PakPathRequiresArchive(const char*) { return false; }
void DefinitionBindAtlasPath(Sexy::GpuTexture*& texture, int width, int height, const char* path)
{
    Require(width > 0 && height > 0 && path[0]);
    if (fixtureMode) Require(width == 16 && height == 16 && std::strcmp(path, "test.atlas.png") == 0);
    texture = reinterpret_cast<Sexy::GpuTexture*>(1);
    ++bindings;
}
void DefinitionUnbindAtlas(Sexy::GpuTexture*& texture)
{
    if (texture) --bindings;
    texture = nullptr;
}

int main(int argc, char** argv)
{
    const auto path = std::filesystem::temp_directory_path() / "pvz-particle-compiled-test.bin";
    try
    {
        if (argc > 1)
        {
            fixtureMode = false;
            for (int i = 1; i < argc; ++i)
            {
                TodParticleDefinition definition;
                TodParticleLoadCompiledDefinition(definition, argv[i]);
                TodParticleFreeCompiledDefinition(definition);
                Require(bindings == 0);
            }
            std::cout << "Loaded and freed " << argc - 1 << " production particle definitions\n";
            return 0;
        }
        std::vector<unsigned char> valid;
        for (unsigned word : {0x31435450u, unsigned(ParticleEmitterName::top),
             kParticleEmitterNameTableHash, 1u, 1u, 1u,
             0u, 1u, 1u, 0u, 0u, 0u, 1u, 0xffffffffu, 0u}) Word(valid, word);
        // One exact double node; other tracks deliberately empty.
        Word(valid, 1);
        Append(valid, 1.0 / 3); Append(valid, 2.f); Append(valid, 3.f);
        Word(valid, 1); Word(valid, 6);
        for (int i = 0; i < 21 + 2 + 16; ++i) Word(valid, 0);
        Word(valid, 16); Word(valid, 16); Word(valid, 14);
        for (char ch : std::string("test.atlas.png")) valid.push_back(ch);
        for (float value : {.125f, .125f, .625f, .625f}) Append(valid, value);
        Word(valid, 8); Word(valid, 8);

        const auto run = [&](const std::vector<unsigned char>& bytes, bool succeeds)
        {
            { std::ofstream file(path, std::ios::binary);
              file.write(reinterpret_cast<const char*>(bytes.data()), bytes.size()); }
            TodParticleDefinition definition;
            bool loaded = false;
            try { TodParticleLoadCompiledDefinition(definition, path.string().c_str()); loaded = true; }
            catch (const std::runtime_error&) {}
            Require(loaded == succeeds);
            if (loaded)
            {
                Require(definition.mEmitterDefCount == 1 && definition.mVariantCount == 1 &&
                    definition.mEmitterIndexByName[1] == 0 &&
                    definition.mEmitterDefs[0].mSystemDuration.mNodes[0].mTime == 1.0 / 3 &&
                    definition.mImageRects[0].mWidth == 8 && bindings == 1);
                TodParticleFreeCompiledDefinition(definition);
            }
            Require(bindings == 0 && !definition.mTextures && !definition.mEmitterDefs &&
                !definition.mImageRects && definition.mEmitterDefCount == 0);
        };
        run(valid, true);
        for (std::size_t size = 0; size < valid.size(); ++size)
            run({valid.begin(), valid.begin() + size}, false);
        auto invalid = valid;
        invalid.push_back(0);
        run(invalid, false); // Includes rollback after an atlas has already bound.
        for (std::size_t offset : {0u, 4u, 8u, 12u, 16u, 20u, 24u, 28u, 32u,
             44u, 48u, 56u, 60u, 80u, 84u, 172u, 244u, 248u, 252u, 270u, 286u})
        {
            invalid = valid;
            std::memset(invalid.data() + offset, 0xff, 4);
            run(invalid, false);
        }
        invalid = valid;
        invalid[256] = 0; // Embedded NUL in the atlas path.
        run(invalid, false);
        std::filesystem::remove(path);
        std::cout << "Compiled particle validation and rollback passed\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::filesystem::remove(path);
        std::cerr << error.what() << '\n';
        return 1;
    }
}
