#include "LawnApp.h"
#include "Lawn/System/SaveGame.h"
#include "Lawn/System/LevelSaveFormat.h"
#include "Lawn/System/Music.h"
#include "Lawn/System/PlayerInfo.h"
#include "Lawn/Board.h"
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
    Require(LawnLoadGame(&board, save), "Full production v3.2 save load failed");
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
    const auto beforeSave = appearanceSnapshot();
    const auto nondefault = std::count_if(beforeSave.begin(), beforeSave.end(),
        [](const auto& entry) { return entry.second != 0; });
    const std::string roundtrip = std::string(save) + ".runtime-roundtrip.dat64";
    Require(LawnSaveGame(&board, roundtrip), "Production v3.2 save writer failed");
    std::ifstream saved(roundtrip, std::ios::binary);
    const std::vector<std::uint8_t> savedBytes{
        std::istreambuf_iterator<char>(saved), std::istreambuf_iterator<char>()};
    Require(LevelSaveFormat::IsCurrentDat64Header(savedBytes), "Production writer did not emit v3.2");
    saved.close();
    Require(LawnLoadGame(&board, roundtrip), "Production v3.2 roundtrip reload failed");
    Require(appearanceSnapshot() == beforeSave, "Reanimation appearance changed through native save/reload");
    std::vector<std::pair<int, std::uint32_t>> particlesAfterReload;
    particle = nullptr;
    while (app.mEffectSystem->mParticleHolder->mParticleSystems.IterateNext(particle))
        particlesAfterReload.emplace_back(static_cast<int>(particle->mEffectType), particle->mVariant);
    Require(particlesAfterReload == particleAppearances,
        "Particle base/appearance changed through native save/reload");
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
