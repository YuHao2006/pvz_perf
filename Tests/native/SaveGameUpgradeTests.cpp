#include "ReanimClock.h"
#include "LawnApp.h"
#include "Lawn/System/SaveGame.h"
#include "Lawn/System/LevelSaveFormat.h"
#include "Lawn/System/Music.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/Board.h"
#include "Lawn/Plant.h"
#include "Lawn/Projectile.h"
#include "Lawn/Zombie.h"
#include "Resources.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodCommon.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/misc/ResourceManager.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "SexyAppFramework/sound/DummyMusicInterface.h"
#include <cstdio>
#include <algorithm>
#include <array>
#include <bit>
#include <iostream>
#include <fstream>
#include <iterator>
#include <memory>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

bool FixtureCloseRequest() { return false; }
bool (*gAppCloseRequest)() = FixtureCloseRequest;
namespace
{
LONG CALLBACK SuppressFixtureCrashDialogs(EXCEPTION_POINTERS* exception)
{
    const DWORD code = exception->ExceptionRecord->ExceptionCode;
    if (code == EXCEPTION_ACCESS_VIOLATION || code == EXCEPTION_IN_PAGE_ERROR ||
        code == EXCEPTION_ILLEGAL_INSTRUCTION || code == EXCEPTION_STACK_OVERFLOW ||
        code == EXCEPTION_INT_DIVIDE_BY_ZERO)
    {
        std::fprintf(stderr, "FAIL save-upgrade fixture: hardware exception %08lX\n", code);
        std::fflush(stderr);
        TerminateProcess(GetCurrentProcess(), code);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
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
        type.lpszClassName = L"PvzSaveRuntimeTests";
        Require(RegisterClassW(&type) != 0, "Cannot register hidden fixture window");
        handle = CreateWindowExW(0, type.lpszClassName, L"Save runtime tests",
            WS_POPUP, 0, 0, 64, 64, nullptr, nullptr, type.hInstance, nullptr);
        Require(handle != nullptr, "Cannot create hidden fixture window");
    }
    ~HiddenWindow()
    {
        if (handle) DestroyWindow(handle);
        UnregisterClassW(L"PvzSaveRuntimeTests", GetModuleHandleW(nullptr));
    }
};
void LoadCurrentWithResources(LawnApp& app, HiddenWindow& window, const char* save, const char* pak,
    bool expectVariantRejection)
{
    std::cout << "Fixture: initialize native renderer" << std::endl;
    app.mPrimaryThreadId = CurrentNativeThreadIdentity();
    app.mScaleHDREnabled = false;
    app.mNoSoundNeeded = true;
    app.mWidth = 800;
    app.mHeight = 600;
    app.mScreenBounds = Sexy::Rect(0, 0, 800, 600);
#if defined(PVZ_GPU_OPENGL) || defined(PVZ_GPU_D3D9)
    app.mGpuContext = std::make_unique<GpuContext>(window.handle, false, false);
#else
    VulkanInitConfig init{};
    init.appInfo.pApplicationName = "Save runtime tests";
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
    app.mDDInterface = new Sexy::DDInterface(&app);
    Require(app.mDDInterface->Init(window.handle, true) == Sexy::DDInterface::RESULT_OK,
        "Cannot initialize hidden native renderer");
    // Match LawnApp::InitHook before any resource image is queued or uploaded.
    std::cout << "Fixture: mount package and parse manifest" << std::endl;
    Require(gPakInterface && gPakInterface->AddPakFile(pak), "Cannot mount resource package");
    if (!app.mResourceManager->ParseResourcesFile("compiled/resources.compiled"))
    {
        const auto& error = app.mResourceManager->mError;
        std::cerr << "Manifest error: reason=" << int(error.reason) << " record=" << error.record
            << " value=" << error.value << " offset=" << error.offset << '\n';
        throw std::runtime_error("Cannot parse the compiled resource manifest");
    }
    std::cout << "Fixture: load resident resources" << std::endl;
    for (auto group : {ResourceGroupId::Init, ResourceGroupId::LoadingFonts, ResourceGroupId::LoadingImages})
    {
        Require(app.mResourceManager->LoadResources(group), "Cannot load fixture resources");
    }
    app.mMusicInterface = new DummyMusicInterface;
    app.mMusic = new Music;
    app.mSoundSystem = new TodFoley;
    app.mEffectSystem = new EffectSystem;
    app.mEffectSystem->EffectSystemInitialize();
    PlayerInfo profile;
    profile.mLevel = 1;
    app.mPlayerInfo = &profile;
    gLawnApp = &app;
    struct Cleanup
    {
        LawnApp& app;
        ~Cleanup()
        {
            app.mBoard = nullptr;
            app.mPlayerInfo = nullptr;
            app.mEffectSystem->EffectSystemFreeAll();
            delete app.mEffectSystem;
            app.mEffectSystem = nullptr;
            TodParticleFreeDefinitions();
            ReanimatorFreeDefinitions();
            DefinitionFreeAtlasImages();
            gLawnApp = nullptr;
        }
    } cleanup{app};
    std::cout << "Fixture: load reanimation and particle definitions" << std::endl;
    ReanimatorLoadDefinitions(gLawnReanimationArray, ReanimationType::NUM_REANIMS);
    ReanimatorLoadAllDefinitionData();
    std::cout << "Fixture: reanimation definitions resident; load particles" << std::endl;
    TodParticleLoadDefinitions(gLawnParticleArray, ParticleEffect::NUM_PARTICLES);
    std::cout << "Fixture: particle definitions resident; drain textures" << std::endl;
    TodWarmDrainAll();
    std::cout << "Fixture: construct Board and load save" << std::endl;
    Board board(&app);
    if (expectVariantRejection)
    {
        Require(!LawnLoadGame(&board, save), "Out-of-range appearance variant was accepted");
        std::cout << "PASS production loader rejects out-of-range variant before drawing\n";
        return;
    }
    Require(LawnLoadGame(&board, save), "Full production v4 save load failed");
    Require(app.mGameScene == GameScenes::SCENE_PLAYING, "Save load did not publish the playing scene");
    auto& systems = app.mEffectSystem->mParticleHolder->mParticleSystems;
    TodParticleSystem* particle = nullptr;
    unsigned variants = 0;
    std::vector<std::pair<int, std::uint32_t>> particleAppearances;
    while (systems.IterateNext(particle))
    {
        Require(particle->mParticleDef == &gParticleDefArray[particle->mEffectType],
            "Loaded particle identity does not bind its definition");
        Require(particle->mVariant < particle->mParticleDef->mVariantCount,
            "Loaded particle appearance index exceeds its root");
        particleAppearances.emplace_back(static_cast<int>(particle->mEffectType), particle->mVariant);
        for (int i = 0; i < particle->EmitterRosterCount(); ++i)
        {
            auto* emitter = particle->EmitterRosterEmitterAt(i);
            Require(emitter->mParticleSystem == particle &&
                emitter->mEmitterDef >= particle->mParticleDef->mEmitterDefs &&
                emitter->mEmitterDef < particle->mParticleDef->mEmitterDefs + particle->mParticleDef->mEmitterDefCount,
                "Loaded emitter definition/owner is inconsistent");
        }
        ++variants;
    }
    const auto appearanceSnapshot = [&] {
        std::vector<std::pair<int, std::uint32_t>> snapshot;
        Reanimation* reanimation = nullptr;
        while (app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(reanimation))
        {
            Require(reanimation->mReanimationType >= 0 &&
                reanimation->mReanimationType < ReanimationType::NUM_REANIMS &&
                reanimation->mDefinition == &gReanimatorDefArray[reanimation->mReanimationType] &&
                reanimation->mVariant < reanimation->mDefinition->mVariantCount,
                "Loaded reanimation root/variant identity is inconsistent");
            snapshot.emplace_back(static_cast<int>(reanimation->mReanimationType), reanimation->mVariant);
        }
        return snapshot;
    };
    // Exercise nonzero exact-state tails rather than only zero-initialized
    // migration state. Definition identity and existing world positions remain.
    auto& holder = app.mEffectSystem->mReanimationHolder;
    holder->mBattleTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs);
    Reanimation* advanced = nullptr;
    while (holder->mReanimations.IterateNext(advanced))
        holder->BindAnimationTime(*advanced, ReanimTimeDomain::Battle, holder->mBattleTimeNs);
    advanced = nullptr;
    while (holder->mReanimations.IterateNext(advanced))
        if (advanced->mLoopType == ReanimLoopType::REANIM_LOOP && !advanced->mDead)
        {
            advanced->ApplyRate(13.3072289f);
            break;
        }
    // Explicit forward, reverse and paused probes exercise real absolute-clock
    // records; the visual probe also crosses a session clock rebase on reload.
    Reanimation* visualProbe = nullptr;
    for (float rate : {13.3072289f, -6.65361445f, 0.0f})
    {
        auto* probe = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_WALLNUT, app.mEffectSystem->mReanimationHolder->mBattleTimeNs, ReanimTimeDomain::Battle);
        holder->BindAnimationTime(*probe, ReanimTimeDomain::Battle, holder->mBattleTimeNs);
        probe->ChangeLoopType(ReanimLoopType::REANIM_LOOP);
        probe->ApplyRate(rate);
        probe->SeekRatio(0.3372819f);
        if (!visualProbe)
        {
            visualProbe = probe;
            holder->BindAnimationTime(*visualProbe, ReanimTimeDomain::Visual, holder->mVisualTimeNs);
        }
        if (rate == 0)
            holder->BindAnimationTime(*probe, ReanimTimeDomain::Visual, holder->mVisualTimeNs);
    }
    board.mLevelTimeNs += 123'456'789;
    holder->mBattleTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs);
    holder->mVisualTimeNs += 123'456'789;
    advanced = nullptr;
    while (holder->mReanimations.IterateNext(advanced))
        advanced->UpdateAt(holder->mTimeDomains[holder->mReanimations.DataArrayIndexOf(advanced)] == ReanimTimeDomain::Battle
            ? holder->mBattleTimeNs : holder->mVisualTimeNs);
    particle = nullptr;
    if (systems.IterateNext(particle))
    {
        particle->mRandomState = 0x173ABC29U;
    }
    Plant* coordinateProbe = nullptr;
    if (board.mPlants.IterateNext(coordinateProbe))
    {
        coordinateProbe->mX = 123.456789f;
        coordinateProbe->mY = -0.000123456789f;
        coordinateProbe->mRootOriginX = 123.456789012345;
        coordinateProbe->mRootScale = 1.3372819f;
        const auto now = static_cast<std::int64_t>(board.mLevelTimeNs);
        coordinateProbe->mNextLaunchTimeNs = now + 217'123'456;
        coordinateProbe->mLaunchWindowStartNs = now - 4'567'888;
        coordinateProbe->mMagnetStartTimeNs = now - 400'123'457;
        coordinateProbe->mWakeUpEndTimeNs = now + 12'345'679;
    }
    // Keep a real pool object with nonzero velocity-segment state so the
    // production writer/reader checks its double origin and integer clock too.
    auto* motionProbe = board.mZombies.DataArrayAlloc();
    motionProbe->mApp = &app;
    motionProbe->mBoard = &board;
    motionProbe->mZombieType = ZombieType::ZOMBIE_NORMAL;
    motionProbe->mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    motionProbe->mRow = 2;
    motionProbe->mX = 432.123456f;
    motionProbe->mY = 251.987654f;
    motionProbe->mScaleZombie = 1.3372819f;
    motionProbe->mRootOriginX = -0.000123456789;
    motionProbe->mBirthTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs)-987'654'321;
    motionProbe->mShotFlashEndTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs)+123'456'789;
    motionProbe->mChilledEndTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs)+456'789'123;
    AdvanceVelocity(motionProbe->mX, -0.123456789f, 123'456'789, static_cast<std::int64_t>(board.mLevelTimeNs), motionProbe->mVelocityX);
    AdvanceVelocity(motionProbe->mY, 0.000123456789f, 987'654'321, static_cast<std::int64_t>(board.mLevelTimeNs), motionProbe->mVelocityY);
    // A separate live root walker exercises nonzero v4 root-cycle state. Keep
    // the existing linear probe above: these are independent persistence paths.
    auto* rootProbe = board.mZombies.DataArrayAlloc();
    rootProbe->mApp = &app;
    rootProbe->mBoard = &board;
    rootProbe->mZombieType = ZombieType::ZOMBIE_NORMAL;
    rootProbe->mZombiePhase = ZombiePhase::PHASE_ZOMBIE_NORMAL;
    rootProbe->mZombieHeight = ZombieHeight::HEIGHT_ZOMBIE_NORMAL;
    rootProbe->mFromWave = 0;
    rootProbe->mRow = 2;
    rootProbe->mX = 712.349243f;
    rootProbe->mY = 251.125f;
    rootProbe->mScaleZombie = 1.3372819f;
    auto* rootAnimation = app.AddReanimation(0, 0, 0, ReanimationType::REANIM_ZOMBIE, app.mEffectSystem->mReanimationHolder->mBattleTimeNs, ReanimTimeDomain::Battle);
    holder->BindAnimationTime(*rootAnimation, ReanimTimeDomain::Battle, holder->mBattleTimeNs);
    rootAnimation->PlayReanim(ReanimTrackId::anim_walk, ReanimLoopType::REANIM_LOOP, 0, 13.3072289f);
    Require(rootAnimation->mPeriodNs > 2'000'003 && rootAnimation->mFramePeriodNs > 5'123'457,
        "Root save probe clip cannot straddle one cycle boundary with a small step");
    rootAnimation->Seek(rootAnimation->mPeriodNs - 2'000'003, rootAnimation->mPeriodNs);
    rootProbe->mBodyReanimID = app.ReanimationGetID(rootAnimation);
    rootProbe->mRootBindingGeneration = 0;
    const float rootSignedScale = -rootProbe->mScaleZombie;
    rootProbe->mX = CheckedPosition(rootProbe->RootPosition(*rootAnimation, rootSignedScale));
    const double initialRootBase = rootProbe->mRootOriginX;
    // Exercise actual frame wrapping before saving: completed displacement is
    // retained by the reanimation, while the actor keeps a fixed world intercept.
    const auto rootClockBefore = holder->mBattleTimeNs;
    const auto rootAdvance = rootAnimation->mPeriodNs * 3;
    for (std::int64_t elapsed = rootAnimation->mFramePeriodNs; elapsed <= rootAdvance;
         elapsed += rootAnimation->mFramePeriodNs)
    {
        holder->mBattleTimeNs = ReanimClock::Add(rootClockBefore, elapsed);
        rootAnimation->UpdateAt(holder->mBattleTimeNs);
        rootProbe->mX = CheckedPosition(rootProbe->RootPosition(*rootAnimation, rootSignedScale));
    }
    rootAnimation->mStartTimeNs = ReanimClock::Subtract(rootAnimation->mStartTimeNs, rootAdvance);
    rootAnimation->mLastUpdateTimeNs = ReanimClock::Subtract(rootAnimation->mLastUpdateTimeNs, rootAdvance);
    holder->mBattleTimeNs = rootClockBefore;
    Require(rootAnimation->mRootDisplacement != 0 &&
        rootProbe->mRootBindingGeneration == rootAnimation->mPlaybackGeneration &&
        rootProbe->mRootOriginX == initialRootBase,
        "Root save probe did not settle nonzero displacement with a fixed actor intercept");
    const auto rootProbeId = board.mZombies.DataArrayGetID(rootProbe);
    // Real live shots exercise both timestamp anchors and the original float
    // trajectory parameters, rather than merely roundtripping an empty pool.
    std::vector<unsigned int> projectileProbeIds;
    for (const auto type : {ProjectileType::PROJECTILE_PEA, ProjectileType::PROJECTILE_KERNEL})
    {
        auto* shot = board.AddProjectile(121, 151, 0, 1, type);
        const auto now = static_cast<std::int64_t>(board.mLevelTimeNs);
        shot->mCreationTimeNs = now - 217'123'456;
        shot->mRotationSpeed = 0.013372819f;
        shot->mVelX = 2.7137289f;
        shot->mVelY = 0.031372819f;
        if (type == ProjectileType::PROJECTILE_KERNEL)
        {
            shot->mMotionType = ProjectileMotion::MOTION_LOBBED;
            shot->mVelZ = -7.13372819f;
            shot->mAccZ = 0.115f;
        }
        shot->mDamageRangeFlags = 1 << int(DamageRangeFlags::DAMAGES_GROUND);
        shot->UpdateMotion();
        Require(!shot->mDead, "Projectile save probe unexpectedly impacted during setup");
        projectileProbeIds.push_back(board.mProjectiles.DataArrayGetID(shot));
    }
    const auto projectileState = [](const Projectile& shot) {
        const auto bits = [](float value) { return std::int64_t(std::bit_cast<std::uint32_t>(value)); };
        return std::vector<std::int64_t>{
            shot.mCreationTimeNs,
            bits(shot.mPosX), bits(shot.mPosY), bits(shot.mPosZ),
            bits(shot.mVelX), bits(shot.mVelY), bits(shot.mVelZ), bits(shot.mAccZ),
            bits(shot.mRotation), bits(shot.mRotationSpeed), bits(shot.mShadowY),
            bits(shot.mX), bits(shot.mY), shot.mRow, shot.mDead};
    };
    // A real rooted definition keeps this probe saveable by the normal loader.
    // The ordinary discrete state must survive save/load and continue identically.
    TodParticle* linearParticle=nullptr;
    for (int effect=0;effect<gParticleDefCount && !linearParticle;++effect)
    {
        auto& definition=gParticleDefArray[effect];
        if (!definition.mEmitterDefCount || definition.mEmitterDefs[0].mParticleFields.count ||
            definition.mEmitterDefs[0].mParticleSpinSpeed.mCountNodes>1)
            continue;
        auto* system=app.mEffectSystem->mParticleHolder->AllocParticleSystemFromDef(
            100,200,0,&definition,static_cast<ParticleEffect>(effect), static_cast<std::int64_t>(board.mLevelTimeNs));
        Require(system && system->EmitterRosterCount(),"Cannot allocate linear particle save probe");
        auto* emitter=system->EmitterRosterEmitterAt(0);
        emitter->mSystemDurationNs=60'000'000'000;
        linearParticle=emitter->SpawnParticle(0,1);
        Require(linearParticle!=nullptr,"Cannot spawn linear particle save probe");
        linearParticle->mParticleDurationNs=60'000'000'000;
        linearParticle->mPosition = {1'048'576.f,-1'048'576.f};
        linearParticle->mVelocity={.125f,-.125f};
        linearParticle->mSpinPosition = 1'048'576.f;
        linearParticle->mSpinVelocity=.125f;
        emitter->mParticleSystem->mLastUpdateTimeNs = ReanimClock::Add(emitter->mParticleSystem->mLastUpdateTimeNs, 16'000'000);
        Require(emitter->UpdateParticle(linearParticle,16'000'000, emitter->mParticleSystem->mLastUpdateTimeNs) &&
            ParticleLifeAgeAt(linearParticle->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, linearParticle->mBirthTimeNs, linearParticle->mParticleDurationNs)==16'000'000,
            "Particle save probe did not advance its lifetime");
    }
    Require(linearParticle!=nullptr,"No field-free production particle definition for save probe");
    TodParticle* accelerationParticle=nullptr;
    for (int effect=0;effect<gParticleDefCount && !accelerationParticle;++effect)
    {
        auto& definition=gParticleDefArray[effect];
        if (!definition.mEmitterDefCount) continue;
        const auto& fields=definition.mEmitterDefs[0].mParticleFields;
        if (!fields.count) continue;
        bool constant=true;
        for (int i=0;i<fields.count;++i)
            constant &= fields.Fields[i].mFieldType==FIELD_ACCELERATION &&
                fields.Fields[i].mX.mCountNodes<=1 && fields.Fields[i].mY.mCountNodes<=1;
        if (!constant) continue;
        auto* system=app.mEffectSystem->mParticleHolder->AllocParticleSystemFromDef(
            100,200,0,&definition,static_cast<ParticleEffect>(effect), static_cast<std::int64_t>(board.mLevelTimeNs));
        Require(system && system->EmitterRosterCount(),"Cannot allocate acceleration save probe");
        auto* emitter=system->EmitterRosterEmitterAt(0);
        emitter->mSystemDurationNs=60'000'000'000;
        accelerationParticle=emitter->SpawnParticle(0,1);
        Require(accelerationParticle!=nullptr,"Cannot spawn acceleration save probe");
        accelerationParticle->mParticleDurationNs=60'000'000'000;
        accelerationParticle->mPosition = {1'048'576.f,-1'048'576.f};
        accelerationParticle->mVelocity={.125f,-.25f};
        emitter->mParticleSystem->mLastUpdateTimeNs = ReanimClock::Add(emitter->mParticleSystem->mLastUpdateTimeNs, 16'000'003);
        Require(emitter->UpdateParticle(accelerationParticle,16'000'003, emitter->mParticleSystem->mLastUpdateTimeNs) &&
            ParticleLifeAgeAt(accelerationParticle->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, accelerationParticle->mBirthTimeNs, accelerationParticle->mParticleDurationNs)==16'000'003,
            "Acceleration save probe did not advance its lifetime");
    }
    Require(accelerationParticle!=nullptr,"No constant acceleration production definition for save probe");
    int positionType=-1;
    for (int effect=0;effect<gParticleDefCount;++effect)
    {
        const auto& definition=gParticleDefArray[effect];
        if (positionType>=0 && definition.mEmitterDefCount>=gParticleDefArray[positionType].mEmitterDefCount)
            continue;
        for (int emitter=0;emitter<definition.mEmitterDefCount;++emitter)
            if (definition.mEmitterDefs[emitter].mSystemFields.count)
            {
                positionType=effect;
                break;
            }
    }
    Require(positionType>=0,"No production system-position definition for save probe");
    auto* positionSystem=app.mEffectSystem->mParticleHolder->AllocParticleSystemFromDef(
        100,200,0,&gParticleDefArray[positionType],static_cast<ParticleEffect>(positionType), static_cast<std::int64_t>(board.mLevelTimeNs));
    Require(positionSystem!=nullptr,"Cannot allocate system-position save probe");
    bool positionBound=false;
    for (int i=0;i<positionSystem->EmitterRosterCount();++i)
    {
        auto* emitter=positionSystem->EmitterRosterEmitterAt(i);
        if (!emitter->mEmitterDef->mSystemFields.count) continue;
        emitter->mSystemDurationNs=60'000'000'000;
        emitter->Update(16'000'000, ReanimClock::Add(emitter->mParticleSystem->mLastUpdateTimeNs, 16'000'000));
        Require(emitter->mSystemPositionBound==1 &&
            std::isfinite(emitter->mSystemPositionOriginX) && std::isfinite(emitter->mSystemPositionOriginY),
            "System-position save probe did not retain its previous curve sample");
        positionBound=true;
        break;
    }
    Require(positionBound,"System-position save probe had no live emitter");
    particleAppearances.clear();
    particle=nullptr;
    while (systems.IterateNext(particle))
        particleAppearances.emplace_back(static_cast<int>(particle->mEffectType),particle->mVariant);
    variants=static_cast<unsigned>(particleAppearances.size());
    const auto exactSnapshot = [&] {
        std::vector<std::int64_t> state;
        const auto append = [&](auto... values) {
            const auto bits = [](auto value) -> std::int64_t {
                using T = decltype(value);
                if constexpr (std::is_same_v<T, float>)
                    return std::bit_cast<std::uint32_t>(value);
                else if constexpr (std::is_same_v<T, double>)
                    return std::bit_cast<std::int64_t>(value);
                else return static_cast<std::int64_t>(value);
            };
            (state.push_back(bits(values)), ...);
        };
        Reanimation* animation = nullptr;
        while (app.mEffectSystem->mReanimationHolder->mReanimations.IterateNext(animation))
        {
            const auto position = animation->SamplePlayback();
            const auto domain = holder->mTimeDomains[holder->mReanimations.DataArrayIndexOf(animation)];
            const auto now = animation->mLastUpdateTimeNs;
            // Absolute timestamps can change between sessions. Preserve the
            // pose relative to its last supplied timestamp, even if its owner's
            // current clock has advanced without updating this animation.
            append(domain,
                animation->mStartTimeNs - now,
                animation->mCurrentFrame, animation->mFramePeriodNs, animation->mPeriodNs,
                animation->mCycleCrossings, std::bit_cast<std::uint32_t>(animation->mAnimRate),
                position.phaseNs, position.cycles,
                animation->mLastFrameNs, std::bit_cast<std::int64_t>(animation->mRootDisplacement), animation->mHasLastFrame,
                animation->mPlaybackGeneration);
        }
        Plant* plant = nullptr;
        while (board.mPlants.IterateNext(plant))
            append(plant->mX, plant->mY, plant->mRootOriginX,
                plant->mRootBindingGeneration, plant->mRootScale, plant->mBowlingRowArrivalTimeNs,
                plant->mNextLaunchTimeNs,
                plant->mLaunchWindowStartNs,
                ReanimClock::Subtract(static_cast<std::int64_t>(board.mLevelTimeNs),plant->mMagnetStartTimeNs),
                plant->mWakeUpEndTimeNs==0?0:std::max<std::int64_t>(0,ReanimClock::Subtract(plant->mWakeUpEndTimeNs,static_cast<std::int64_t>(board.mLevelTimeNs))));
        Projectile* shot = nullptr;
        while (board.mProjectiles.IterateNext(shot))
        {
            const auto fields = projectileState(*shot);
            state.insert(state.end(), fields.begin(), fields.end());
        }
        Zombie* zombie = nullptr;
        while (board.mZombies.IterateNext(zombie))
        {
            append(zombie->mX, zombie->mY, zombie->mRootOriginX,
                zombie->mRootBindingGeneration, zombie->mRootScale,
                ReanimClock::Subtract(static_cast<std::int64_t>(board.mLevelTimeNs),zombie->mBirthTimeNs),
                zombie->mShotFlashEndTimeNs==0?0:std::max<std::int64_t>(0,ReanimClock::Subtract(zombie->mShotFlashEndTimeNs,static_cast<std::int64_t>(board.mLevelTimeNs))),
                zombie->mChilledEndTimeNs==0?0:std::max<std::int64_t>(0,ReanimClock::Subtract(zombie->mChilledEndTimeNs,static_cast<std::int64_t>(board.mLevelTimeNs))));
            for (const auto* motion : {&zombie->mVelocityX, &zombie->mVelocityY, &zombie->mAltitudeMotion})
            {
                // Unbound origins have no local age. Flat-tire X uses the same
                // field as an explicitly persisted absolute speed-ramp anchor.
                const auto temporalState = !motion->bound ? 0 :
                    zombie->mFlatTires && motion == &zombie->mVelocityX ? motion->startTimeNs :
                    ReanimClock::Subtract(static_cast<std::int64_t>(board.mLevelTimeNs), motion->startTimeNs);
                append(motion->origin, temporalState, motion->rate, motion->bound);
            }
        }
        TodParticleSystem* system = nullptr;
        while (systems.IterateNext(system))
        {
            append(system->mRandomState);
            for (int e = 0; e < system->EmitterRosterCount(); ++e)
            {
                auto* emitter = system->EmitterRosterEmitterAt(e);
                append(ParticleLifeAgeAt(system->mLastUpdateTimeNs, emitter->mBirthTimeNs, emitter->mSystemDurationNs),
                    emitter->mCrossFadeEndTimeNs == 0 ? 0 : std::max<std::int64_t>(0,ReanimClock::Subtract(emitter->mCrossFadeEndTimeNs,system->mLastUpdateTimeNs)),
                    emitter->mSpawnRemainder,
                    emitter->mSystemPositionOriginX, emitter->mSystemPositionOriginY,
                    emitter->mSystemPositionBound);
                for (int p = 0; p < emitter->ParticleRosterCount(); ++p)
                {
                    auto* item = emitter->ParticleRosterParticleAt(p);
                    append(ParticleLifeAgeAt(item->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, item->mBirthTimeNs, item->mParticleDurationNs),
                        ReanimClock::Subtract(item->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, item->mAnimationBirthTimeNs), item->mAnimationSampleIntegral, item->mRandomSeed,
                        item->mPosition.x, item->mPosition.y,
                        item->mVelocity.x, item->mVelocity.y,
                        item->mSpinPosition, item->mSpinVelocity);
                }
            }
        }
        return state;
    };
    board.mEffectCounter.mNanoseconds = 9'876'543'210;
    board.mEffectCounter.mPreviousNanoseconds = board.mEffectCounter.mNanoseconds;
    // Saving must preserve the last processed pose, including paused probes,
    // while the manager's visual clock advances without sampling animations.
    holder->mVisualTimeNs = ReanimClock::Add(holder->mVisualTimeNs, 9'123'456'789);
    const auto exactBefore = exactSnapshot();
    const auto beforeSave = appearanceSnapshot();
    const auto nondefault = std::count_if(beforeSave.begin(), beforeSave.end(),
        [](const auto& entry) { return entry.second != 0; });
    const std::string roundtrip = std::string(save) + ".runtime-roundtrip.dat64";
    Require(LawnSaveGame(&board, roundtrip), "Production v4 save writer failed");
    std::ifstream saved(roundtrip, std::ios::binary);
    const std::vector<std::uint8_t> savedBytes{
        std::istreambuf_iterator<char>(saved), std::istreambuf_iterator<char>()};
    Require(LevelSaveFormat::IsCurrentDat64Header(savedBytes), "Production writer did not emit v4");
    saved.close();
    const auto continueParticles = [&] {
        TodParticleSystem* system = nullptr;
        while (systems.IterateNext(system))
            system->Update(17'123'457, ReanimClock::Add(system->mLastUpdateTimeNs, static_cast<std::int64_t>(17'123'457)));
        return exactSnapshot();
    };
    const auto continuedParticleState = continueParticles();
    // Advance only this root walker. The temporary shared time is restored on
    // both success and failure; particle/projectile continuation uses its own
    // unchanged clock setup. Resolve pool IDs anew so reload cannot reuse stale pointers.
    const auto continueRoot = [&] {
        auto* zombie = board.mZombies.DataArrayGet(rootProbeId);
        Require(zombie != nullptr, "Root continuation lost its live pool object");
        auto* animation = app.ReanimationTryToGet(zombie->mBodyReanimID);
        Require(animation != nullptr, "Root continuation lost its body reanimation");
        const auto previousTime = holder->mBattleTimeNs;
        const auto nextTime = ReanimClock::Add(previousTime, 5'123'457);
        const double previousBase = zombie->mRootOriginX;
        const double previousDisplacement = animation->mRootDisplacement;
        holder->mBattleTimeNs = nextTime;
        try
        {
            // Actor updates explicitly prepare their animation timestamp before
            // sampling root motion; advancing the holder alone cannot sample it.
            animation->PrepareTimeAt(nextTime);
            const double beforeConsume = zombie->RootPosition(*animation, -zombie->mScaleZombie);
            Require(zombie->RootPosition(*animation, -zombie->mScaleZombie) == beforeConsume,
                "Repeated root sampling changed position before consuming the frame");
            animation->UpdateAt(nextTime);
            const double afterConsume = zombie->RootPosition(*animation, -zombie->mScaleZombie);
            Require(afterConsume == beforeConsume &&
                zombie->RootPosition(*animation, -zombie->mScaleZombie) == afterConsume,
                "Root position changed across consuming the same timestamp");
            zombie->mX = CheckedPosition(afterConsume);
            const auto frame = animation->SampleFrameAt(nextTime);
            Require(animation->mCycleCrossings == 1 && animation->mCurrentFrame == 0 &&
                animation->mRootDisplacement != previousDisplacement &&
                zombie->mRootOriginX == previousBase,
                "Root continuation did not settle one wrap while retaining the actor intercept");
            const std::array<std::int64_t, 8> result{
                std::int64_t(std::bit_cast<std::uint32_t>(zombie->mX)),
                std::bit_cast<std::int64_t>(zombie->mRootOriginX),
                animation->mCycleCrossings,
                std::bit_cast<std::int64_t>(animation->mRootDisplacement),
                animation->mCurrentFrame, frame.frame, frame.ageNs, frame.cycles};
            holder->mBattleTimeNs = previousTime;
            return result;
        }
        catch (...)
        {
            holder->mBattleTimeNs = previousTime;
            throw;
        }
    };
    const auto continuedRootState = continueRoot();
    // Sample a future point on independent copies. Reloaded live objects must
    // reach the identical float results, including rotation and roof/shadow
    // correction, from the saved absolute time anchors.
    constexpr std::int64_t continuationNs = 23'456'789;
    const auto savedBoardTime = board.mLevelTimeNs;
    const auto savedInterval = Sexy::gUpdateIntervalNs;
    const auto savedTicks = Sexy::gUpdateTicks;
    std::vector<std::vector<std::int64_t>> continuedProjectiles;
    board.mLevelTimeNs += continuationNs;
    Sexy::gUpdateIntervalNs = continuationNs;
    Sexy::gUpdateTicks = double(continuationNs) / 10'000'000;
    for (const auto id : projectileProbeIds)
    {
        Projectile shot = *board.mProjectiles.DataArrayGet(id);
        shot.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
        shot.UpdateMotion();
        Require(!shot.mDead, "Projectile continuation probe unexpectedly impacted");
        continuedProjectiles.push_back(projectileState(shot));
    }
    board.mLevelTimeNs = savedBoardTime;
    Sexy::gUpdateIntervalNs = savedInterval;
    Sexy::gUpdateTicks = savedTicks;
    holder->mVisualTimeNs += 17'123'456'789;
    Require(LawnLoadGame(&board, roundtrip), "Production v4 roundtrip reload failed");
    Require(board.mLevelTimeNs == savedBoardTime &&
        board.mEffectCounter.mNanoseconds == 9'876'543'210,
        "Raw level-clock load overwrote its adjacent effect counter with a removed previous sample");
    Require(exactSnapshot() == exactBefore, "Native v4 reload changed exact time, motion or random state");
    if (coordinateProbe)
    {
        Plant* restoredProbe = nullptr;
        Require(board.mPlants.IterateNext(restoredProbe) && restoredProbe &&
            restoredProbe->mNextLaunchTimeNs -
                static_cast<std::int64_t>(board.mLevelTimeNs) == 217'123'456,
            "Native reload rounded the exact future launch deadline through legacy ticks");
    }
    Require(appearanceSnapshot() == beforeSave, "Reanimation appearance changed through native save/reload");
    std::vector<std::pair<int, std::uint32_t>> particlesAfterReload;
    particle = nullptr;
    while (app.mEffectSystem->mParticleHolder->mParticleSystems.IterateNext(particle))
        particlesAfterReload.emplace_back(static_cast<int>(particle->mEffectType), particle->mVariant);
    Require(particlesAfterReload == particleAppearances,
        "Particle base/appearance changed through native save/reload");
    Require(continueParticles() == continuedParticleState,
        "Native reload changed the continued variable-step particle state");
    Require(continueRoot() == continuedRootState,
        "Native v4 reload changed root position/base/cycle/coefficient or cached-frame continuation");
    board.mLevelTimeNs += continuationNs;
    holder->mBattleTimeNs = static_cast<std::int64_t>(board.mLevelTimeNs);
    Sexy::gUpdateIntervalNs = continuationNs;
    Sexy::gUpdateTicks = double(continuationNs) / 10'000'000;
    for (std::size_t i = 0; i < projectileProbeIds.size(); ++i)
    {
        auto* shot = board.mProjectiles.DataArrayGet(projectileProbeIds[i]);
        shot->UpdateMotion();
        Require(projectileState(*shot) == continuedProjectiles[i],
            "Native reload changed the continued projectile trajectory");
    }
    Sexy::gUpdateIntervalNs = savedInterval;
    Sexy::gUpdateTicks = savedTicks;
    std::cout << "PASS complete production current-save load and write/reload with resident resources: level="
        << board.mLevel << " particleSystems=" << variants << " zombies=" << board.mZombies.mSize
        << " plants=" << board.mPlants.mSize << " reanimations=" << beforeSave.size()
        << " nondefaultAppearances=" << nondefault << " nondefaultParticleAppearances="
        << std::count_if(particleAppearances.begin(), particleAppearances.end(),
            [](const auto& entry) { return entry.second != 0; }) << '\n';
}
}
int main(int argc, char** argv)
{
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    AddVectoredExceptionHandler(1, SuppressFixtureCrashDialogs);
    try
    {
        Require(argc >= 2 && argc <= 5, "Pass a DAT64 test copy and optionally the resource package, game mode and rejection mode");
        std::unique_ptr<HiddenWindow> window;
        LawnApp app;
        app.mReadFromRegistry = false;
        if (argc >= 3)
        {
            if (argc >= 4)
            {
                const int mode = std::stoi(argv[3]);
                Require(mode >= 0 && mode < GameMode::NUM_GAME_MODES, "Invalid fixture game mode");
                app.mGameMode = static_cast<GameMode>(mode);
            }
            window = std::make_unique<HiddenWindow>();
            if (argc == 5) Require(std::string(argv[4]) == "reject-variant", "Unknown fixture mode");
            LoadCurrentWithResources(app, *window, argv[1], argv[2], argc == 5);
            return 0;
        }
        // A supported old header must be classified before any Board or pool
        // is touched. No game resources, window, player profile or sound opens.
        try
        {
            LawnLoadGame(nullptr, argv[1]);
        }
        catch (const SaveGameUpgradeRequired& error)
        {
            const std::string message = error.what();
            Require(message.find("needs a format upgrade") != std::string::npos,
                "Older save did not receive an upgrade explanation");
            Require(message.find("bundled save converter") != std::string::npos &&
                message.find("has not changed the original file") != std::string::npos,
                "Upgrade message omitted converter guidance or preservation");
            Require(message.find("damaged") == std::string::npos,
                "An older supported format was described as damaged");
            std::cout << "PASS production old-save rejection before Board access:\n" << message << '\n';
            return 0;
        }
        throw std::runtime_error("Older DAT64 input did not report SaveGameUpgradeRequired");
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL save-upgrade fixture: " << error.what() << '\n';
        return 1;
    }
}
