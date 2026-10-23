#include "SexyAppFramework/SexyAppBase.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/misc/ResourceManager.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/DefinitionImageRegion.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include "Sexy.TodLib/generated/SceneAtlasData.h"
#include "Sexy.TodLib/generated/SceneAtlasBindings.h"
#include "SexyAppFramework/graphics/Image.h"
#include "SexyAppFramework/graphics/AtlasDraw.h"
#include "SexyAppFramework/imagelib/ImageLib.h"
#include "LawnApp.h"
#include "Lawn/Widget/ZombatarResources.h"
#include "Resources.h"
#include <algorithm>
#include <array>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <exception>
#include <iostream>
#include <memory>
#include <set>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

// Replace only the real game's entry point; all application/rendering objects
// and generated definition objects come from the existing production build.
bool FixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = FixtureCloseRequest;

namespace
{
using namespace Sexy;
namespace Definitions = GeneratedDefinitions;

void Require(bool value, const std::string& message)
{
    if (!value) throw std::runtime_error(message);
}

LONG CALLBACK SuppressCrashDialogs(EXCEPTION_POINTERS* exception)
{
    const DWORD code = exception->ExceptionRecord->ExceptionCode;
    if (code == EXCEPTION_ACCESS_VIOLATION || code == EXCEPTION_IN_PAGE_ERROR ||
        code == EXCEPTION_ILLEGAL_INSTRUCTION || code == EXCEPTION_STACK_OVERFLOW ||
        code == EXCEPTION_INT_DIVIDE_BY_ZERO)
    {
        std::fprintf(stderr, "FAIL static definitions: hardware exception %08lX\n", code);
        std::fflush(stderr);
        TerminateProcess(GetCurrentProcess(), code);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}

class TestApp final : public LawnApp
{
public:
    void ButtonPress(int) override {}
    void ButtonDepress(int) override {}
    void ButtonDownTick(int) override {}
    void ButtonMouseEnter(int) override {}
    void ButtonMouseLeave(int) override {}
    void ButtonMouseMove(int, int, int) override {}
};

class HiddenWindow
{
public:
    HWND handle = nullptr;
    HiddenWindow()
    {
        WNDCLASSW type{};
        type.style = CS_OWNDC;
        type.lpfnWndProc = DefWindowProcW;
        type.hInstance = GetModuleHandleW(nullptr);
        type.lpszClassName = L"PvzStaticDefinitionTests";
        Require(RegisterClassW(&type) != 0, "Cannot register hidden test window");
        handle = CreateWindowExW(0, type.lpszClassName, L"Static definition tests",
            WS_POPUP, 0, 0, 64, 64, nullptr, nullptr, type.hInstance, nullptr);
        Require(handle != nullptr, "Cannot create hidden test window");
    }
    ~HiddenWindow()
    {
        if (handle) DestroyWindow(handle);
        UnregisterClassW(L"PvzStaticDefinitionTests", GetModuleHandleW(nullptr));
    }
};

using TrackMember = FloatParameterTrack TodEmitterDefinition::*;
constexpr TrackMember Tracks[]{
    &TodEmitterDefinition::mSystemDuration, &TodEmitterDefinition::mCrossFadeDuration,
    &TodEmitterDefinition::mSpawnRate, &TodEmitterDefinition::mSpawnMinActive,
    &TodEmitterDefinition::mSpawnMaxActive, &TodEmitterDefinition::mSpawnMaxLaunched,
    &TodEmitterDefinition::mEmitterRadius, &TodEmitterDefinition::mEmitterOffsetX,
    &TodEmitterDefinition::mEmitterOffsetY, &TodEmitterDefinition::mEmitterBoxX,
    &TodEmitterDefinition::mEmitterBoxY, &TodEmitterDefinition::mEmitterSkewX,
    &TodEmitterDefinition::mEmitterSkewY, &TodEmitterDefinition::mEmitterPath,
    &TodEmitterDefinition::mParticleDuration, &TodEmitterDefinition::mLaunchSpeed,
    &TodEmitterDefinition::mLaunchAngle, &TodEmitterDefinition::mSystemRed,
    &TodEmitterDefinition::mSystemGreen, &TodEmitterDefinition::mSystemBlue,
    &TodEmitterDefinition::mSystemAlpha, &TodEmitterDefinition::mSystemBrightness,
    &TodEmitterDefinition::mParticleRed, &TodEmitterDefinition::mParticleGreen,
    &TodEmitterDefinition::mParticleBlue, &TodEmitterDefinition::mParticleAlpha,
    &TodEmitterDefinition::mParticleBrightness, &TodEmitterDefinition::mParticleSpinAngle,
    &TodEmitterDefinition::mParticleSpinSpeed, &TodEmitterDefinition::mParticleScale,
    &TodEmitterDefinition::mParticleStretch, &TodEmitterDefinition::mCollisionReflect,
    &TodEmitterDefinition::mCollisionSpin, &TodEmitterDefinition::mClipTop,
    &TodEmitterDefinition::mClipBottom, &TodEmitterDefinition::mClipLeft,
    &TodEmitterDefinition::mClipRight, &TodEmitterDefinition::mAnimationRate};

// Capture every static root and nested array. Font bindings and GPU slots are
// the only mutable borrowed fields; strip font pointers from transform copies.
struct StaticSnapshot
{
    struct Block
    {
        const unsigned char* address;
        std::vector<unsigned char> bytes;
        std::string label;
        bool transforms;
        std::vector<unsigned char> Read() const
        {
            std::vector<unsigned char> result(address, address + bytes.size());
            if (transforms)
                for (std::size_t offset = 0; offset < result.size();
                    offset += sizeof(ReanimatorTransform))
                    std::memset(result.data() + offset + offsetof(ReanimatorTransform, mFont),
                        0, sizeof(ReanimatorTransform::mFont));
            return result;
        }
    };
    std::vector<Block> blocks;
    std::size_t nodeCount = 0, frameCount = 0, fieldCount = 0;

    template<class T>
    void Add(const T* pointer, std::size_t count, const std::string& label, bool transforms = false)
    {
        if (!count) return;
        Require(pointer != nullptr, "Null static backing: " + label);
        Block block{reinterpret_cast<const unsigned char*>(pointer),
            std::vector<unsigned char>(count * sizeof(T)), label, transforms};
        block.bytes = block.Read();
        blocks.push_back(std::move(block));
    }
    void Track(const FloatParameterTrack& track)
    {
        Require(track.mCountNodes >= 0, "Negative static track length");
        Add(track.mNodes, track.mCountNodes, "particle track nodes");
        nodeCount += track.mCountNodes;
    }
    StaticSnapshot()
    {
        static_assert(sizeof(FloatParameterTrackNode) == 28);
        Add(Definitions::Reanimations, Definitions::ReanimationCount, "reanimation roots");
        Add(Definitions::Particles, Definitions::ParticleCount, "particle roots and name lookup");
        Add(Definitions::Projectiles.mProjectiles.data(), 14, "projectile visuals");
        Add(Definitions::Projectiles.mShadows.data(), 2, "projectile shadows");
        Add(MagnetAtlas::Images,MagnetAtlas::Count,"magnet scene rectangles");
        Add(MagnetAtlas::Scales,MagnetAtlas::Count,"magnet scene scales");
        Add(AlmanacAtlas::Images,AlmanacAtlas::Count,"almanac scene rectangles");
        Add(AchievementsAtlas::Images,AchievementsAtlas::Count,"achievement scene rectangles");
        Add(FixedUIAtlas::Images,FixedUIAtlas::Count,"fixed UI scene rectangles");
        for (const auto& definition : Definitions::Reanimations)
        {
            Add(definition.mTracks.tracks, definition.mTracks.count, "reanimation tracks");
            Add(definition.mImageRects, definition.mVariantCount * definition.mImageSlotCount,
                "reanimation rectangles");
            Add(definition.mTextureWidths, definition.mVariantCount, "reanimation widths");
            Add(definition.mTextureHeights, definition.mVariantCount, "reanimation heights");
            Add(definition.mVariantTransitions, definition.mVariantCount * definition.mVariantActionCount,
                "variant transitions");
            Add(definition.mVariantActionStarts, definition.mTracks.count,
                "variant action starts");
            Add(definition.mVariantActionCounts, definition.mTracks.count,
                "variant action counts");
            Add(definition.mVariantOptions, definition.mVariantCount * definition.mTracks.count,
                "variant options");
            for (int track = 0; track < definition.mTracks.count; ++track)
            {
                const auto& transforms = definition.mTracks.tracks[track].mTransforms;
                Add(transforms.mTransforms, transforms.count, "reanimation transforms", true);
                frameCount += transforms.count;
            }
        }
        for (const auto segments : Definitions::AttacherSegments)
            Add(segments.data(), segments.size(), "prelinked attacher segments");
        for (const auto& definition : Definitions::Particles)
        {
            Add(definition.mEmitterDefs, definition.mEmitterDefCount, "particle emitter aggregates");
            Add(definition.mImageRects, definition.mVariantCount * definition.mImageRectCount,
                "particle rectangles");
            Add(definition.mTextureWidths, definition.mVariantCount, "particle widths");
            Add(definition.mTextureHeights, definition.mVariantCount, "particle heights");
            for (int index = 0; index < definition.mEmitterDefCount; ++index)
            {
                const auto& emitter = definition.mEmitterDefs[index];
                for (const auto member : Tracks) Track(emitter.*member);
                for (const auto& fields : {emitter.mParticleFields, emitter.mSystemFields})
                {
                    Add(fields.Fields, fields.count, "particle field aggregates");
                    fieldCount += fields.count;
                    for (int f = 0; f < fields.count; ++f)
                    {
                        Track(fields.Fields[f].mX);
                        Track(fields.Fields[f].mY);
                    }
                }
            }
        }
        Require(nodeCount == 5158 && fieldCount == 260 && frameCount > 10000,
            "Snapshot did not cover the full production catalogs");
    }
    void Check() const
    {
        for (const auto& block : blocks)
            Require(block.Read() == block.bytes, "Static backing changed: " + block.label);
    }
};

template<class Definition>
void CheckTextures(const Definition& definition, bool loaded)
{
    for (unsigned variant = 0; variant < definition.mVariantCount; ++variant)
        Require((definition.mTextures[variant] != nullptr) ==
            (loaded && definition.mTextureWidths[variant] > 0),
            "Definition GPU slots disagree with their loading state");
}

void CheckParticleTextures(bool loaded)
{
    for (const auto& definition : Definitions::Particles) CheckTextures(definition, loaded);
}

void CheckReanimationTextures(bool loaded)
{
    for (const auto& definition : Definitions::Reanimations) CheckTextures(definition, loaded);
}

void CheckSceneTextures(TestApp& app,bool loaded)
{
    struct Scene {
        GpuTexture* texture;
        int width,height;
        const Rect* rectangles;
        std::size_t count;
    };
    const Scene scenes[]{
        {MagnetAtlas::Texture,MagnetAtlas::Width,MagnetAtlas::Height,MagnetAtlas::Images,MagnetAtlas::Count},
        {AlmanacAtlas::Texture,AlmanacAtlas::Width,AlmanacAtlas::Height,AlmanacAtlas::Images,AlmanacAtlas::Count},
        {AchievementsAtlas::Texture,AchievementsAtlas::Width,AchievementsAtlas::Height,
            AchievementsAtlas::Images,AchievementsAtlas::Count},
        {FixedUIAtlas::Texture,FixedUIAtlas::Width,FixedUIAtlas::Height,FixedUIAtlas::Images,FixedUIAtlas::Count}};
    std::set<GpuTexture*> textures;
    std::size_t rectangles=0;
    for (const auto& scene:scenes)
    {
        Require((scene.texture!=nullptr)==loaded,"Scene GPU slot disagrees with loading state");
        for (std::size_t index=0;index<scene.count;++index)
        {
            const auto& rectangle=scene.rectangles[index];
            Require(rectangle.mX>=0 && rectangle.mY>=0 && rectangle.mWidth>0 && rectangle.mHeight>0 &&
                rectangle.mX+rectangle.mWidth<=scene.width &&
                rectangle.mY+rectangle.mHeight<=scene.height,"Scene view exceeds its packed sheet atlas");
            ++rectangles;
        }
        if (!loaded) continue;
        Require(textures.insert(scene.texture).second,"Independent scene atlases aliased one GPU allocation");
        for (const auto& [key,entry]:app.mSharedImageMap)
        {
            const auto* image=entry.mImage;
            Require(!image || image->mTexture!=scene.texture,
                "Scene atlas retained an ordinary image wrapper instead of a direct GPU pointer");
        }
    }
    Require(rectangles==99,"Scene fixture must cover all 99 authored/fixed UI views");
    Require(!loaded || textures.size()==4,"Scene fixture omitted one of the four GPU atlases");
}

std::size_t FontBindingCount()
{
    std::size_t count = 0;
    for (const auto& definition : Definitions::Reanimations)
        for (int t = 0; t < definition.mTracks.count; ++t)
            for (int f = 0; f < definition.mTracks.tracks[t].mTransforms.count; ++f)
                count += definition.mTracks.tracks[t].mTransforms.mTransforms[f].mFont != nullptr;
    return count;
}

void ReleaseAll(TestApp& app)
{
    FreeSceneAtlases();
    ZombatarFreeResources();
    TodParticleFreeDefinitions();
    ReanimatorFreeDefinitions();
    DefinitionFreeAtlasImages();
    FreeSceneAtlases();
    TodParticleFreeDefinitions();
    ReanimatorFreeDefinitions();
    DefinitionFreeAtlasImages();
    Require(!gParticleDefArray && !gParticleDefCount &&
        !gParticleAllDefinitionDataLoaded.load() && !gReanimatorDefArray,
        "Repeated release left published catalogs");
    CheckParticleTextures(false);
    CheckReanimationTextures(false);
    CheckSceneTextures(app,false);
    Require(!Definitions::Projectiles.mTexture && FontBindingCount() == 0,
        "Full release retained projectile/font bindings");
}

void LoadAll(TestApp& app)
{
    LoadSceneAtlases();
    // Exercise the consuming upload boundary with every real scene PNG.
    // Definition loading uses this same Image*& contract; it must clear the
    // decode owner immediately, even while the GPU atlas remains drawable.
    auto& render=*app.mDDInterface->mRenderInterface;
    for (const auto& extent:SceneAtlasBindings::Extents)
    {
        ImageLib::Image* decoded=ImageLib::GetImage(extent.image,false);
        Require(decoded && decoded->mBits && decoded->mWidth==int(extent.width) &&
            decoded->mHeight==int(extent.height),"Cannot decode the complete scene PNG upload fixture");
        auto* texture=render.UploadAtlasTexture(decoded);
        Require(texture && !decoded,"Scene PNG upload retained its CPU decode owner");
    }
    ZombatarLoadResources();
    ReanimatorLoadDefinitions(gLawnReanimationArray, static_cast<int>(ReanimationType::NUM_REANIMS));
    TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
    ReanimatorLoadAllDefinitionData();
    const auto tasks = app.mCompletedLoadingThreadTasks.load();
    const auto projectile = Definitions::Projectiles.mTexture;
    const std::array<GpuTexture*,4> scenes{
        MagnetAtlas::Texture,AlmanacAtlas::Texture,AchievementsAtlas::Texture,FixedUIAtlas::Texture};
    CheckSceneTextures(app,true);
    std::vector<GpuTexture*> textures;
    for (const auto& definition : Definitions::Reanimations)
        textures.insert(textures.end(), definition.mTextures,
            definition.mTextures + definition.mVariantCount);
    for (const auto& definition : Definitions::Particles)
        textures.insert(textures.end(), definition.mTextures,
            definition.mTextures + definition.mVariantCount);
    ReanimatorLoadDefinitions(gLawnReanimationArray, static_cast<int>(ReanimationType::NUM_REANIMS));
    TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
    ReanimatorLoadAllDefinitionData();
    Definitions::LoadAllImages();
    LoadSceneAtlases();
    std::vector<GpuTexture*> repeated;
    for (const auto& definition : Definitions::Reanimations)
        repeated.insert(repeated.end(), definition.mTextures,
            definition.mTextures + definition.mVariantCount);
    for (const auto& definition : Definitions::Particles)
        repeated.insert(repeated.end(), definition.mTextures,
            definition.mTextures + definition.mVariantCount);
    Require(repeated == textures && Definitions::Projectiles.mTexture == projectile &&
        app.mCompletedLoadingThreadTasks == tasks, "Repeated bulk load changed live handles or progress");
    Require(scenes==std::array<GpuTexture*,4>{MagnetAtlas::Texture,AlmanacAtlas::Texture,
        AchievementsAtlas::Texture,FixedUIAtlas::Texture},"Repeated scene load replaced live GPU pointers");
    CheckSceneTextures(app,true);
    Require(gReanimatorDefArray == Definitions::Reanimations &&
        gParticleDefArray == Definitions::Particles && gParticleDefCount == 106 &&
        gParticleAllDefinitionDataLoaded.load(), "Public loaders did not publish the static catalogs");
    CheckParticleTextures(true);
    CheckReanimationTextures(true);
    Require(projectile && FontBindingCount() > 0, "Bulk load omitted projectile/font bindings");
    Require(DefinitionUploadAtlasImages() == 0 && ReanimatorUploadAllTexturesToGPU() == 0,
        "Primary-thread repeated bulk load queued duplicate uploads");
    std::set<GpuTexture*> unique(textures.begin(), textures.end());
    unique.insert(projectile);
    unique.insert(gZombatarAtlas.mTexture);
    unique.erase(nullptr);
    Require(unique.size() == 193, "Definitions did not share the 193 physical atlas textures");
    std::unique_ptr<Image> sceneTarget(render.CreateRenderImage(120,120));
    std::size_t drawn=0;
    {
        GpuImageDrawScope destination(render,sceneTarget.get());
        Graphics graphics(sceneTarget.get());
        graphics.mColor=Color::Black;
        graphics.FillRect(Rect(0,0,120,120));
        const auto draw=[&](GpuTexture* texture,int width,int height,const Rect* regions,std::size_t count) {
            TextureSource source{texture,width,height,0};
            for (std::size_t index=0;index<count;++index,++drawn)
                DrawAtlasImage(&graphics,source,regions[index],
                    Rect(int(drawn%10)*12,int(drawn/10)*12,10,10),
                    Rect(0,0,regions[index].mWidth,regions[index].mHeight));
        };
        draw(MagnetAtlas::Texture,MagnetAtlas::Width,MagnetAtlas::Height,MagnetAtlas::Images,MagnetAtlas::Count);
        draw(AlmanacAtlas::Texture,AlmanacAtlas::Width,AlmanacAtlas::Height,AlmanacAtlas::Images,AlmanacAtlas::Count);
        draw(AchievementsAtlas::Texture,AchievementsAtlas::Width,AchievementsAtlas::Height,
            AchievementsAtlas::Images,AchievementsAtlas::Count);
        draw(FixedUIAtlas::Texture,FixedUIAtlas::Width,FixedUIAtlas::Height,FixedUIAtlas::Images,FixedUIAtlas::Count);
    }
    render.Flush();
    const auto scenePixels=render.ReadImagePixels(*sceneTarget);
    Require(drawn==99 && std::any_of(scenePixels.pixels.begin(),scenePixels.pixels.end(),
        [](unsigned pixel) { return pixel!=0xff000000u; }),
        "Real scene consumers failed to draw the complete 99-view catalog");
}

std::vector<unsigned> Sample(TestApp& app, GpuTexture* texture, const TodParticleDefinition& definition)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    Require(texture && definition.mImageRectCount > 0, "Missing shared atlas sample");
    const auto& rectangle = definition.mImageRects[0];
    std::unique_ptr<Image> target(render.CreateRenderImage(64, 64));
    {
        GpuImageDrawScope destination(render, target.get());
        Graphics graphics(target.get());
        graphics.mColor = Color::Black;
        graphics.FillRect(Rect(0, 0, 64, 64));
        TextureSource source{texture, definition.mTextureWidths[0], definition.mTextureHeights[0], 0};
        SexyMatrix3 transform;
        const float scale = 48.0f / std::max(rectangle.mWidth, rectangle.mHeight);
        TodScaleRotateTransformMatrix(transform, 32, 32, 0, scale, scale);
        source.BltTransformed(transform, rectangle, Color::White, &graphics.mClipRect, 0, 0, true);
    }
    render.Flush();
    auto pixels = render.ReadImagePixels(*target).pixels;
    Require(std::any_of(pixels.begin(), pixels.end(),
        [](auto pixel) { return (pixel & 0xFFFFFFu) != 0; }), "Shared atlas GPU draw was empty");
    return pixels;
}

void RealConsumers(int reanimationIndex, int particleIndex)
{
    Reanimation animation;
    animation.ReanimationInitializeType(0, 0, static_cast<ReanimationType>(reanimationIndex));
    Require(animation.mDefinition == &Definitions::Reanimations[reanimationIndex] &&
        animation.mTrackInstances, "Real reanimation did not borrow the static definition");
    TodParticleData data;
    data.Initialize();
    struct PoolCleanup { TodParticleData& data; ~PoolCleanup() { data.Dispose(); } } cleanup{data};
    TodParticleHolder holder(&data);
    auto* system = holder.AllocParticleSystem(0, 0, 0, static_cast<ParticleEffect>(particleIndex), 0);
    Require(system && system->mParticleDef == &Definitions::Particles[particleIndex] &&
        system->EmitterRosterCount() > 0 && system->EmitterRosterEmitterAt(0)->mEmitterDef ==
        Definitions::Particles[particleIndex].mEmitterDefs,
        "Real particle system did not borrow the static emitter backing");
}

void PrepareResources(TestApp& app)
{
    Require(app.mResourceManager->ParseResourcesFile("compiled/resources.compiled"),
        "Cannot parse real resource plans for the generated font bindings");
}

void Lifecycle(TestApp& app, const StaticSnapshot& snapshot, int reanimationIndex, int particleIndex)
{
    PrepareResources(app);
    for (int repeat = 0; repeat < 2; ++repeat)
    {
        LoadAll(app);
        RealConsumers(reanimationIndex, particleIndex);
        snapshot.Check();
        auto& reanimation = Definitions::Reanimations[reanimationIndex];
        auto& particle = Definitions::Particles[particleIndex];
        Require(reanimation.mTextures[0] == particle.mTextures[0],
            "Configured cross-kind atlas was not shared");
        const auto pixels = Sample(app, particle.mTextures[0], particle);
        const auto projectile = Definitions::Projectiles.mTexture;
        TodParticleFreeDefinitions();
        CheckParticleTextures(false);
        CheckReanimationTextures(true);
        Require(Definitions::Projectiles.mTexture == projectile &&
            Sample(app, reanimation.mTextures[0], particle) == pixels,
            "Particle-only release invalidated another definition kind");
        TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
        Require(particle.mTextures[0] == reanimation.mTextures[0],
            "Particle reload did not reuse its still-live shared atlas");
        ReanimatorFreeDefinitions();
        CheckReanimationTextures(false);
        CheckParticleTextures(true);
        Require(!gReanimatorDefArray && FontBindingCount() == 0 &&
            Definitions::Projectiles.mTexture == projectile &&
            Sample(app, particle.mTextures[0], particle) == pixels,
            "Reanimation-only release invalidated particle/projectile data");
        ReanimatorLoadDefinitions(gLawnReanimationArray, static_cast<int>(ReanimationType::NUM_REANIMS));
        ReanimatorLoadAllDefinitionData();
        Definitions::ReleaseProjectileImages();
        Require(!Definitions::Projectiles.mTexture, "Projectile-only release retained its slot");
        CheckParticleTextures(true);
        CheckReanimationTextures(true);
        Require(Sample(app, particle.mTextures[0], particle) == pixels,
            "Projectile-only release damaged a shared definition atlas");
        Definitions::LoadProjectileImages();
        Require(Definitions::Projectiles.mTexture == projectile,
            "Projectile reload replaced a still-cached atlas");
        snapshot.Check();
        ReleaseAll(app);
        snapshot.Check();
    }
    // Worker loads create pending GPU assignments. Releasing one kind must
    // cancel its assignments without suppressing a surviving kind's upload.
    ReanimatorLoadDefinitions(gLawnReanimationArray, static_cast<int>(ReanimationType::NUM_REANIMS));
    std::exception_ptr workerError;
    std::thread worker([&] {
        try
        {
            Definitions::LoadReanimationImages(reanimationIndex);
            TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
            Definitions::LoadProjectileImages();
        }
        catch (...) { workerError = std::current_exception(); }
    });
    worker.join();
    if (workerError) std::rethrow_exception(workerError);
    CheckParticleTextures(false);
    CheckReanimationTextures(false);
    Require(!Definitions::Projectiles.mTexture, "Worker thread directly uploaded a GPU atlas");
    TodParticleFreeDefinitions();
    Definitions::ReleaseProjectileImages();
    Require(DefinitionUploadAtlasImages() > 0, "Worker atlas decode queued no primary uploads");
    CheckParticleTextures(false);
    Require(!Definitions::Projectiles.mTexture, "Cancelled projectile assignment was republished");
    auto& reanimation = Definitions::Reanimations[reanimationIndex];
    CheckTextures(reanimation, true);
    Sample(app, reanimation.mTextures[0], Definitions::Particles[particleIndex]);
    TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
    CheckParticleTextures(true);
    Require(Definitions::Particles[particleIndex].mTextures[0] == reanimation.mTextures[0],
        "Reload after cancelling a pending assignment lost the shared atlas");
    snapshot.Check();
    ReleaseAll(app);
    snapshot.Check();
    std::cout << "PASS full 144/106 catalogs: stable roots/tracks/fields/nodes/rectangles/actions, "
        "two release/reload cycles, repeated bulk loads, 193 shared GPU atlases, real consumers, "
        "independent kind release and pixels, pending worker assignment cancellation\n";
}

void PngFailure(TestApp& app, const StaticSnapshot& snapshot, const std::string& caseName,
    const char* goodPak, const std::string& badPath, int reanimationIndex, int particleIndex)
{
    auto expectFailure = [&](auto&& load) {
        bool rejected = false;
        try { load(); }
        catch (const std::runtime_error& error)
        {
            rejected = true;
            Require(std::string(error.what()).find(badPath) != std::string::npos,
                "PNG failure did not identify the failing direct asset path");
            std::cout << "Expected " << caseName << " rejection: " << error.what() << '\n';
        }
        Require(rejected, "Invalid PNG was accepted");
        snapshot.Check();
    };
    for (int repeat = 0; repeat < 2; ++repeat)
    {
        expectFailure([] { TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES); });
        Require(!gParticleDefArray && !gParticleDefCount && !gParticleAllDefinitionDataLoaded.load(),
            "Failed particle PNG load left the catalog published");
        CheckParticleTextures(false);
    }
    ReanimatorLoadDefinitions(gLawnReanimationArray, static_cast<int>(ReanimationType::NUM_REANIMS));
    expectFailure([&] {
        ReanimatorEnsureDefinitionLoaded(static_cast<ReanimationType>(reanimationIndex), true);
    });
    ReleaseAll(app);
    snapshot.Check();
    // The fixture owns this in-process mount table. Drop its records only after
    // every definition binding has been released; neither archive is modified.
    gPakInterface->mPakRecordMap.clear();
    Require(gPakInterface->AddPakFile(goodPak), "Cannot mount the intact package for recovery");
    PrepareResources(app);
    LoadAll(app);
    RealConsumers(reanimationIndex, particleIndex);
    Sample(app, Definitions::Particles[particleIndex].mTextures[0],
        Definitions::Particles[particleIndex]);
    snapshot.Check();
    ReleaseAll(app);
    snapshot.Check();
    std::cout << "PASS " << caseName
        << ": repeated particle rollback, lazy reanimation rejection, clean release, "
        "same-process intact-PNG recovery and full catalog reload\n";
}
}

int main(int argc, char** argv)
{
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    AddVectoredExceptionHandler(1, SuppressCrashDialogs);
    try
    {
        Require(argc == 7, "Pass fixture ZIP, case, intact PAK, shared reanimation/particle IDs, PNG path");
        HiddenWindow window;
        TestApp app;
        gLawnApp = &app;
        app.mPrimaryThreadId = CurrentNativeThreadIdentity();
        app.mScaleHDREnabled = false;
        app.mReadFromRegistry = false;
        app.mWidth = 800;
        app.mHeight = 600;
#if defined(PVZ_GPU_OPENGL) || defined(PVZ_GPU_D3D9)
        app.mGpuContext = std::make_unique<GpuContext>(window.handle, false, false);
#else
        VulkanInitConfig init{};
        init.appInfo.pApplicationName = "Static definition runtime tests";
        init.features.shaderFloat64 = VK_TRUE;
        VkSwapchainCreateInfoKHR swapchain{
            .sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
            .imageFormat = VK_FORMAT_B8G8R8A8_UNORM,
            .imageColorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR,
            .imageUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,
            .compositeAlpha = VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
            .presentMode = VK_PRESENT_MODE_FIFO_KHR,
            .clipped = VK_TRUE};
        app.mGpuContext = std::make_unique<GpuContext>(init, window.handle, swapchain);
#endif
        app.mDDInterface = new DDInterface(&app);
        Require(app.mDDInterface->Init(window.handle, true) == DDInterface::RESULT_OK,
            "Cannot initialize the real hidden GPU renderer");
        struct Cleanup
        {
            TestApp& app;
            ~Cleanup()
            {
                ReleaseAll(app);
                app.mResourceManager->DeleteResources();
                app.CleanSharedImages();
                FreeGlobalAllocators();
            }
        } cleanup{app};
        Require(gPakInterface && gPakInterface->AddPakFile(argv[1]), "Cannot mount isolated test package");
        const int reanimationIndex = std::stoi(argv[4]), particleIndex = std::stoi(argv[5]);
        Require(reanimationIndex >= 0 && reanimationIndex < Definitions::ReanimationCount &&
            particleIndex >= 0 && particleIndex < Definitions::ParticleCount,
            "Shared atlas fixture indices are out of range");
        StaticSnapshot snapshot;
        if (std::string(argv[2]) == "lifecycle")
            Lifecycle(app, snapshot, reanimationIndex, particleIndex);
        else
            PngFailure(app, snapshot, argv[2], argv[3], argv[6], reanimationIndex, particleIndex);
    }
    catch (const ResourceManagerException& error)
    {
        std::cerr << "FAIL static definition resource: reason=" << int(error.error.reason)
            << " record=" << error.error.record << " value=" << error.error.value
            << " offset=" << error.error.offset << '\n';
        return 1;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL static definition runtime: " << error.what() << '\n';
        return 1;
    }
}
