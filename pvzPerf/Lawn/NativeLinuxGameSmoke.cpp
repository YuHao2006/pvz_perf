#include "NativeLinuxGameSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Coin.h"
#include "GridItem.h"
#include "LawnCommon.h"
#include "LawnMower.h"
#include "Plant.h"
#include "Projectile.h"
#include "SeedPacket.h"
#include "Zombie.h"
#include "System/LevelSaveFormat.h"
#include "System/Music.h"
#include "System/PlayerInfo.h"
#include "System/ProfileMgr.h"
#include "System/ReanimationLawn.h"
#include "Widget/GameSelector.h"
#include "Widget/GameButton.h"
#include "Widget/ImitaterDialog.h"
#include "Widget/ContinueDialog.h"
#include "Widget/NewOptionsDialog.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/TitleScreen.h"
#include "graphics/DDInterface.h"
#include "graphics/MemoryImage.h"
#include "graphics/RenderInterface.h"
#include "imagelib/ImageLib.h"
#include "misc/KeyCodes.h"
#include "platform/NativeWindow.h"
#include "platform/Audio.h"
#include "sound/BassMusicInterface.h"
#include "Resources.h"
#include "widget/WidgetManager.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <set>
#include <stdexcept>
#include <string>
#include <string_view>
#include <utility>
#include <vector>

namespace {
static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);
using Clock = std::chrono::steady_clock;
using Path = std::filesystem::path;

enum class RunMode { Ui, RoundTrip };
enum class Stage {
    Loading, Menu, Chooser, Imitater, ChooserReturn, FillSeeds, Playing,
    Options, ConfirmSave, SavedMenu, Continue, Resumed, CloseQueued
};

struct BoardCheckpoint {
    long long gameId = 0;
    int level = 0, background = 0, sun = 0, wave = 0, waves = 0, randomSeed = 0;
    unsigned int mainCounter = 0;
    std::array<int, 6> seeds{}, imitaterTypes{};
    std::vector<unsigned int> plants, zombies, projectiles, coins, mowers, gridItems;
    bool operator==(const BoardCheckpoint&) const = default;
};

struct Inventory {
    std::vector<const void*> cache;
    std::vector<const void*> filters;
    int variations = 0;
    unsigned long long hostUploads = 0, textureCreates = 0, pendingUploads = 0;
};

struct Probe {
    bool initialized = false, sawScene = false, baselineReady = false;
    Stage stage = Stage::Loading;
    RunMode mode = RunMode::RoundTrip;
    unsigned int drawFence = 0;
    unsigned int simulationFence = 0, updateFence = 0;
    unsigned long long savedBoardRevision = 0, savedBytes = 0;
    bool simulationObserved = false;
    Sexy::SoundInstance* audioSample = nullptr;
    unsigned int audioStarted = 0;
    bool audioVerified = false;
    Clock::time_point stageStarted{};
    Path output;
    NativeWindowHandle window = nullptr;
    PlayerInfo* player = nullptr;
    Board* board = nullptr;
    SeedChooserScreen* chooser = nullptr;
    Inventory baseline;
    BoardCheckpoint saved;
    Path savePath;
    std::array<int, 6> selectedSeeds{}, selectedImitaterTypes{};
    std::vector<unsigned int> previousPixels;
};

void Require(bool condition, const std::string& message)
{
    if (!condition) throw std::runtime_error("NativeLinuxGameSmoke: " + message);
}

bool Enabled()
{
    const char* value = std::getenv("PVZ_NATIVE_GAME_SMOKE");
    return value && std::string_view(value) == "1";
}

bool Within(const Path& path, const Path& directory)
{
    auto part = path.begin();
    for (const auto& expected : directory) {
        if (part == path.end() || *part != expected) return false;
        ++part;
    }
    return true;
}

void RejectLiveRoot(const Path& data, const LawnApp& app)
{
    Require(data != data.root_path(), "filesystem root is not a fixture directory");
    const auto reject = [&](const Path& live) {
        Require(!Within(data, std::filesystem::weakly_canonical(live)),
                "fixture directory is inside a regular application data root: " + live.string());
    };
    if (const char* home = std::getenv("HOME"); home && *home && Path(home).is_absolute()) {
        const auto root = std::filesystem::weakly_canonical(Path(home));
        Require(data != root, "HOME itself is not a fixture directory");
        reject(root / ".local/share/PlantsVsZombiesModern");
    }
    if (const char* xdg = std::getenv("XDG_DATA_HOME"); xdg && *xdg && Path(xdg).is_absolute()) {
        reject(Path(xdg) / "PlantsVsZombiesModern");
    }
    if (!app.mChangeDirTo.empty())
        reject(std::filesystem::absolute(Path(app.mChangeDirTo)) / "data");
}

const char* StageName(Stage stage)
{
    switch (stage) {
    case Stage::Loading: return "loading";
    case Stage::Menu: return "menu";
    case Stage::Chooser: return "adventure-chooser";
    case Stage::Imitater: return "imitater";
    case Stage::ChooserReturn: return "chooser-return";
    case Stage::FillSeeds: return "fill-six-seeds";
    case Stage::Playing: return "playing";
    case Stage::Options: return "playing-options";
    case Stage::ConfirmSave: return "confirm-save";
    case Stage::SavedMenu: return "saved-menu";
    case Stage::Continue: return "continue";
    case Stage::Resumed: return "resumed";
    case Stage::CloseQueued: return "close-queued";
    }
    throw std::logic_error("Invalid Linux game smoke stage");
}

void Log(const Probe& probe, const LawnApp& app, const std::string& message)
{
    std::ofstream log(probe.output / "result.log", std::ios::app);
    log << message << " stage=" << StageName(probe.stage)
        << " update=" << app.mUpdateCount << " draw=" << app.mDrawCount
        << " depth=" << app.mUpdateAppDepth
        << " pendingDelete=" << app.mSafeDeleteList.size() << '\n';
    Require(bool(log), "cannot write result.log");
}

Path EnvironmentPath(const char* name)
{
    const char* value = std::getenv(name);
    Require(value && *value, std::string("missing isolation setting ") + name);
    Path path(value);
    Require(path.is_absolute(), std::string(name) + " must be absolute");
    return std::filesystem::weakly_canonical(path);
}

void Initialize(Probe& probe, LawnApp& app)
{
    const auto data = EnvironmentPath("PVZ_APPDATA_DIR");
    const auto logs = EnvironmentPath("PVZ_LOG_DIR");
    const auto settings = EnvironmentPath("PVZ_SETTINGS_FILE");
    if (const char* mode = std::getenv("PVZ_NATIVE_GAME_SMOKE_MODE")) {
        Require(std::string_view(mode) == "ui" || std::string_view(mode) == "roundtrip",
                "PVZ_NATIVE_GAME_SMOKE_MODE must be ui or roundtrip");
        probe.mode = std::string_view(mode) == "ui" ? RunMode::Ui : RunMode::RoundTrip;
    }
    Require(std::filesystem::equivalent(Path(Sexy::GetAppDataFolder()), data),
            "effective application data directory differs from isolated override");
    Require(std::filesystem::equivalent(
                Path(Sexy::GetLogFilePath("native-game-smoke-check")).parent_path(), logs),
            "effective log directory differs from isolated override");
    probe.output = logs / "native-linux-game-smoke";
    std::filesystem::create_directories(probe.output);
    {
        std::ofstream log(probe.output / "result.log", std::ios::trunc);
        log << "BEGIN native-linux-game-smoke mode="
            << (probe.mode == RunMode::Ui ? "ui" : "roundtrip") << '\n'
            << "appdata=" << data.string() << "\nsettings=" << settings.string()
            << "\nlog=" << logs.string() << '\n';
        Require(bool(log), "cannot initialize result.log");
    }
    probe.window = app.mHWnd;
    probe.drawFence = app.mDrawCount;
    probe.stageStarted = Clock::now();
    probe.initialized = true;
}

void Advance(Probe& probe, LawnApp& app, Stage stage)
{
    probe.stage = stage;
    probe.sawScene = false;
    probe.simulationObserved = false;
    probe.drawFence = app.mDrawCount;
    probe.stageStarted = Clock::now();
}

bool FreshSceneDraw(Probe& probe, const LawnApp& app)
{
    // The update that changes scene state can still expose the preceding frame.
    if (!probe.sawScene) {
        probe.sawScene = true;
        probe.drawFence = app.mDrawCount;
        return false;
    }
    return app.mDrawCount != probe.drawFence && !app.mLastDrawWasEmpty &&
        app.mDDInterface->mRenderInterface->mRenderer->drawCommandCounts.draws != 0;
}

struct CallbackBoundary {
    int& depth;
    explicit CallbackBoundary(LawnApp& app) : depth(app.mUpdateAppDepth)
    {
        Require(depth == 0, "business callback must start at the outer update tail");
        ++depth;
    }
    ~CallbackBoundary() { --depth; }
    CallbackBoundary(const CallbackBoundary&) = delete;
    CallbackBoundary& operator=(const CallbackBoundary&) = delete;
};

void DeletionBoundary(const Probe& probe, LawnApp& app)
{
    Log(probe, app, "CHECK deletion-boundary");
    Require(app.mSafeDeleteList.empty(), "retired widgets remain at completed scene boundary");
}

Inventory Observe(LawnApp& app)
{
    Inventory result;
    const auto& cache = *app.mReanimatorCache;
    for (auto* image : cache.mPlantImages) result.cache.push_back(image);
    for (const auto& row : cache.mImageVariations.mImages)
        for (auto* image : row) result.cache.push_back(image);
    for (auto* image : cache.mLawnMowers) result.cache.push_back(image);
    for (auto* image : cache.mZombieImages) result.cache.push_back(image);
    result.variations = cache.mImageVariations.mCount;
    for (auto* source : app.mMemoryImageSet) {
        if (source->mFilterOwner) continue;
        const bool filtered = std::any_of(source->mFilterImages.begin(), source->mFilterImages.end(),
                                         [](const auto& image) { return image != nullptr; });
        if (!filtered) continue;
        result.filters.push_back(source);
        for (const auto& image : source->mFilterImages) result.filters.push_back(image.get());
    }
    const auto uploads = app.mDDInterface->mRenderInterface->mRenderer->GetTextureUploadCounts();
    result.hostUploads = static_cast<unsigned long long>(uploads.textures);
    result.textureCreates = static_cast<unsigned long long>(uploads.createdTextures);
    result.pendingUploads = static_cast<unsigned long long>(uploads.pending);
    return result;
}

void BeginResidencyWindow(Probe& probe, LawnApp& app)
{
    Require(app.mLoaded && app.mCacheFramesPrebuilt,
            "resident baseline requires the completed loading/cache barrier");
    probe.baseline = Observe(app);
    Require(probe.baseline.pendingUploads == 0 && probe.baseline.variations > 0 &&
        !probe.baseline.filters.empty() &&
        std::any_of(probe.baseline.cache.begin(), probe.baseline.cache.end(),
                    [](const void* image) { return image != nullptr; }),
        "loading barrier has not supplied resident caches/filters/upload completion");
    probe.baselineReady = true;
    Log(probe, app, "BASELINE resident-cache-filter-source-uploads hostUploads=" +
        std::to_string(probe.baseline.hostUploads) +
        " textureCreates=" + std::to_string(probe.baseline.textureCreates) +
        " cacheSlots=" + std::to_string(probe.baseline.cache.size()) +
        " filterSlots=" + std::to_string(probe.baseline.filters.size()));
}

void CheckResidency(const Probe& probe, LawnApp& app)
{
    const auto now = Observe(app);
    Log(probe, app, "COUNTS cacheSlots=" + std::to_string(now.cache.size()) +
        " variations=" + std::to_string(now.variations) +
        " filterSlots=" + std::to_string(now.filters.size()) +
        " hostUploads=" + std::to_string(now.hostUploads) +
        " pendingUploads=" + std::to_string(now.pendingUploads) +
        " textureCreates=" + std::to_string(now.textureCreates));
    Require(now.cache == probe.baseline.cache && now.variations == probe.baseline.variations,
            "static reanimation cache slots were added or replaced after the baseline");
    Require(now.filters == probe.baseline.filters,
            "filter ownership/slots changed after the baseline");
    Require(now.hostUploads == probe.baseline.hostUploads && now.pendingUploads == 0,
            "a new host texture upload was queued or completed after loading");
}

void Capture(Probe& probe, LawnApp& app, const char* name)
{
    auto& render = *app.mDDInterface->mRenderInterface;
    render.Flush();
    auto pixels = render.mRenderer->ReadScenePixels();
    Require(app.mWidth > 0 && app.mHeight > 0 &&
        pixels.size() == static_cast<unsigned long long>(app.mWidth) * app.mHeight,
        "GPU readback does not match the real logical canvas");
    Require(probe.previousPixels.empty() || probe.previousPixels.size() == pixels.size(),
            "logical canvas changed during scene comparisons");
    const auto path = (probe.output / (std::string(name) + ".png")).string();
    Require(ImageLib::WritePNGImage(path, app.mWidth, app.mHeight, pixels),
            std::string("cannot write GPU readback PNG: ") + name);
    std::set<unsigned int> colors;
    unsigned long long nonblack = 0, changed = 0;
    for (unsigned int index = 0; index < pixels.size(); ++index) {
        const unsigned int rgb = pixels[index] & 0xffffffu;
        colors.insert(rgb);
        nonblack += rgb != 0;
        if (!probe.previousPixels.empty())
            changed += pixels[index] != probe.previousPixels[index];
    }
    Require(colors.size() >= 128 && nonblack > pixels.size() / 3,
            std::string(name) + " is an empty/flat GPU scene");
    if (!probe.previousPixels.empty())
        Require(changed >= 1000, std::string(name) + " did not visibly replace the preceding scene");
    probe.previousPixels = std::move(pixels);
    Log(probe, app, std::string("PASS gpu-frame=") + name +
        " colors=" + std::to_string(colors.size()) +
        " nonblack=" + std::to_string(nonblack) + " changed=" + std::to_string(changed));
    if (probe.baselineReady) CheckResidency(probe, app);
}

template<class T>
std::vector<unsigned int> WorldIds(DataArray<T>& pool, Board& board)
{
    std::vector<unsigned int> ids;
    T* object = nullptr;
    while (pool.IterateNext(object)) {
        Require(object->mApp == board.mApp && object->mBoard == &board,
                "world object lost its app/Board binding");
        ids.push_back(pool.DataArrayGetID(object));
    }
    return ids;
}

BoardCheckpoint ObserveBoard(Board& board)
{
    BoardCheckpoint state;
    state.gameId = static_cast<long long>(board.mGameID);
    state.level = board.mLevel;
    state.background = static_cast<int>(board.mBackground);
    state.sun = board.mSunMoney;
    state.wave = board.mCurrentWave;
    state.waves = board.mNumWaves;
    state.randomSeed = board.mBoardRandSeed;
    state.mainCounter = board.mMainCounter;
    Require(board.mSeedBank->mNumPackets == 6, "round-trip fixture requires six seed packets");
    Require(board.mSeedBank->mApp == board.mApp && board.mSeedBank->mBoard == &board,
            "seed bank lost its app/Board binding");
    for (int index = 0; index < 6; ++index) {
        const auto& packet = board.mSeedBank->mSeedPackets[index];
        Require(packet.mApp == board.mApp && packet.mBoard == &board,
                "loaded seed packet lost its app/Board binding");
        state.seeds[index] = static_cast<int>(packet.mPacketType);
        state.imitaterTypes[index] = static_cast<int>(packet.mImitaterType);
    }
    state.plants = WorldIds(board.mPlants, board);
    state.zombies = WorldIds(board.mZombies, board);
    state.projectiles = WorldIds(board.mProjectiles, board);
    state.coins = WorldIds(board.mCoins, board);
    state.mowers = WorldIds(board.mLawnMowers, board);
    state.gridItems = WorldIds(board.mGridItems, board);
    return state;
}

template<class Range>
std::string Values(const Range& values)
{
    std::string text;
    for (auto value : values) {
        if (!text.empty()) text += ',';
        text += std::to_string(value);
    }
    return "[" + text + "]";
}

void ReportBoard(const Probe& probe, LawnApp& app, const char* label, const BoardCheckpoint& state)
{
    Log(probe, app, std::string(label) + " gameId=" + std::to_string(state.gameId) +
        " level=" + std::to_string(state.level) + " background=" + std::to_string(state.background) +
        " sun=" + std::to_string(state.sun) + " wave=" + std::to_string(state.wave) +
        " waves=" + std::to_string(state.waves) + " main=" + std::to_string(state.mainCounter) +
        " seed=" + std::to_string(state.randomSeed) +
        " plants=" + std::to_string(state.plants.size()) +
        " zombies=" + std::to_string(state.zombies.size()) +
        " projectiles=" + std::to_string(state.projectiles.size()) +
        " coins=" + std::to_string(state.coins.size()) +
        " mowers=" + std::to_string(state.mowers.size()) +
        " grids=" + std::to_string(state.gridItems.size()) +
        " packets=" + Values(state.seeds) + " imitater=" + Values(state.imitaterTypes) +
        " plantIds=" + Values(state.plants) + " zombieIds=" + Values(state.zombies) +
        " projectileIds=" + Values(state.projectiles) + " coinIds=" + Values(state.coins) +
        " mowerIds=" + Values(state.mowers) + " gridIds=" + Values(state.gridItems));
}

void QueueClose(Probe& probe, LawnApp& app, bool roundTrip)
{
    Log(probe, app, "ACTION request-native-close-fifo");
    app.RequestNativeClose();
    Require(!app.mShutdown && !app.mCloseRequest,
            "RequestNativeClose performed shutdown before FIFO consumption");
    Advance(probe, app, Stage::CloseQueued);
    Log(probe, app, std::string("PASS native-linux-game-smoke close=queued dat64=") +
        (roundTrip ? "PASS" : "NOT_RUN"));
}

bool SimulationAdvanced(Probe& probe, const LawnApp& app)
{
    if (!probe.simulationObserved) {
        probe.simulationObserved = true;
        probe.simulationFence = app.mBoard->mMainCounter;
        probe.updateFence = app.mUpdateCount;
        return false;
    }
    return app.mBoard->mMainCounter - probe.simulationFence >= 120 &&
        app.mUpdateCount - probe.updateFence >= 120;
}

SeedType NextSeed(LawnApp& app, SeedChooserScreen& chooser)
{
    if (!chooser.PickedPlantType(SEED_SUNFLOWER) &&
        !chooser.PickedPlantType(SEED_TWINSUNFLOWER) && !chooser.PickedPlantType(SEED_SUNSHROOM))
        return SEED_SUNSHROOM;
    if (chooser.FlyersAreComming() && !chooser.FlyProtectionCurrentlyPlanted() &&
        !chooser.PickedPlantType(SEED_CATTAIL) && !chooser.PickedPlantType(SEED_CACTUS) &&
        !chooser.PickedPlantType(SEED_BLOVER))
        return SEED_BLOVER;
    constexpr std::array choices{
        SEED_PUFFSHROOM, SEED_FUMESHROOM, SEED_GRAVEBUSTER, SEED_HYPNOSHROOM,
        SEED_SCAREDYSHROOM, SEED_ICESHROOM, SEED_DOOMSHROOM, SEED_WALLNUT,
        SEED_CHERRYBOMB, SEED_REPEATER
    };
    for (auto seed : choices)
        if (app.SeedTypeAvailable(seed) && !chooser.SeedNotAllowedToPick(seed) &&
            chooser.mChosenSeeds[seed].mSeedState == SEED_IN_CHOOSER)
            return seed;
    throw std::runtime_error("NativeLinuxGameSmoke: no legal ordinary seed remains");
}

void Run(Probe& probe, LawnApp& app)
{
    Require(app.mHWnd == probe.window && app.mNativeWindow.get() == probe.window,
            "game replaced its original native window");
    if (probe.stage != Stage::Loading)
        Require(app.mPlayerInfo == probe.player, "player changed during the isolated run");
    Require(!app.mShutdown && !app.mCloseRequest && !app.mLoadingFailed,
            "game stopped before the probe completed");
    if (probe.baselineReady) {
        const auto uploads = app.mDDInterface->mRenderInterface->mRenderer->GetTextureUploadCounts();
        Require(static_cast<unsigned long long>(uploads.textures) == probe.baseline.hostUploads &&
            uploads.pending == 0, "post-load host upload detected between checkpoints: host=" +
            std::to_string(uploads.textures) + "/" + std::to_string(probe.baseline.hostUploads) +
            " pending=" + std::to_string(uploads.pending));
    }
    switch (probe.stage) {
    case Stage::Loading: {
        if (!app.mLoaded) return;
        Require(app.mPlayerInfo && !app.mPlayerInfo->mDetailsLoadRejected,
                "supply an isolated, valid player profile; the probe does not create/unlock one");
        probe.player = app.mPlayerInfo;
        if (!app.mTitleScreen) {
            if (app.mGameSelector) {
                if (app.mCacheFramesPrebuilt) BeginResidencyWindow(probe, app);
                Advance(probe, app, Stage::Menu);
            }
            return;
        }
        if (!app.mTitleScreen->mLoadingThreadComplete || !app.mTitleScreen->mDrawnYet ||
            !FreshSceneDraw(probe, app)) return;
        if (std::getenv("PVZ_NATIVE_GAME_AUDIO")) {
            auto& music = *static_cast<Sexy::BassMusicInterface*>(app.mMusicInterface);
            const auto& song = music.mMusicSlots[MUSIC_FILE_MAIN_MUSIC];
            Require(song != nullptr, "title music slot is missing");
            Log(probe, app, "AUDIO title tune=" + std::to_string(app.mMusic->mCurMusicTune) +
                " state=" + std::to_string(song->mPlayback.State()) +
                " voiceVolume=" + std::to_string(song->mVolume));
            Require(music.IsPlaying(MUSIC_FILE_MAIN_MUSIC) && song->mVolume > 0,
                    "title music request was lost before loading completed");
        }
        Require(app.GetDialogCount() == 0, "title has an unhandled profile/registration dialog");
        auto* title = app.mTitleScreen;
        DeletionBoundary(probe, app);
        Log(probe, app, "ACTION title-start-callback");
        Advance(probe, app, Stage::Menu);
        {
            CallbackBoundary callback(app);
            title->ButtonDepress(TitleScreen::TitleScreen_Start);
        }
        BeginResidencyWindow(probe, app);
        return; // LoadingCompleted retires title. Never access it again here.
    }
    case Stage::Menu: {
        if (!app.mLoaded || !app.mCacheFramesPrebuilt || !app.mGameSelector ||
            app.mGameScene != SCENE_MENU) return;
        if (!probe.baselineReady) BeginResidencyWindow(probe, app);
        auto* selector = app.mGameSelector;
        if (selector->mLoading || selector->mStartingGame || selector->mSlideCounter != 0 ||
            selector->mSelectorState != SELECTOR_IDLE || app.GetDialogCount() != 0 ||
            !FreshSceneDraw(probe, app)) return;
        if (std::getenv("PVZ_NATIVE_GAME_AUDIO") && !probe.audioVerified) {
            if (!probe.audioSample) {
                auto& music = *static_cast<Sexy::BassMusicInterface*>(app.mMusicInterface);
                Require(music.mSlotsPublished.load(std::memory_order_acquire),
                        "menu audio probe ran before music loading completed");
                const auto& song = music.mMusicSlots[MUSIC_FILE_MAIN_MUSIC];
                Require(song != nullptr, "menu music slot is missing");
                Log(probe, app, "AUDIO music tune=" + std::to_string(app.mMusic->mCurMusicTune) +
                    " state=" + std::to_string(song->mPlayback.State()) +
                    " voiceVolume=" + std::to_string(song->mVolume));
                Require(music.IsPlaying(MUSIC_FILE_MAIN_MUSIC) && song->mVolume > 0,
                        "menu music is not playing");
                Log(probe, app, "AUDIO initial mute=" + std::to_string(app.mMuteCount) +
                    " autoMute=" + std::to_string(app.mAutoMuteCount) +
                    " active=" + std::to_string(app.mActive) +
                    " focus=" + std::to_string(app.mHasFocus));
                Require(app.mMuteCount == 0 && app.mSfxVolume > 0,
                        "audio-output probe requires unmuted sample volume");
                probe.audioSample = app.mSoundManager->GetSoundInstance(Sexy::SOUND_TAPGLASS);
                Require(probe.audioSample && probe.audioSample->Play(true, false),
                        "native sound manager failed to play TAPGLASS");
                probe.audioStarted = app.mUpdateCount;
                Log(probe, app, "BEGIN audio-output TAPGLASS loop");
                return;
            }
            if (app.mUpdateCount - probe.audioStarted < 500) return;
            Require(probe.audioSample->IsPlaying(),
                    "native sound sample stopped while looped");
            const auto position = static_cast<Sexy::NativeSoundInstance*>(
                probe.audioSample)->GetSoundPosition();
            Require(position > 0, "native sound sample playback position did not advance");
            probe.audioSample->Release();
            probe.audioSample = nullptr;
            probe.audioVerified = true;
            Log(probe, app, "PASS native-sound-manager TAPGLASS loop position=" +
                std::to_string(position));
        }
        DeletionBoundary(probe, app);
        const bool previousDebugKeys = app.mDebugKeysEnabled;
        const bool previousFps = app.mShowFPS;
        const auto keyEvent = [&](unsigned int symbol, bool pressed) {
            Sexy::NativeWindowEvent event{};
            event.kind = Sexy::NativeWindowEventKind::Key;
            event.key = symbol;
            event.pressed = pressed;
            app.mDeferredMessages.push_back(event);
            app.DrainWindowMessages();
        };
        keyEvent(0xffe3, true);
        keyEvent(0xffe9, true);
        keyEvent('d', true);
        keyEvent('d', false);
        Require(app.mDebugKeysEnabled != previousDebugKeys,
                "Ctrl+Alt+D did not reach shared debug-key dispatch");
        keyEvent('d', true);
        keyEvent('d', false);
        Require(app.mDebugKeysEnabled == previousDebugKeys,
                "Ctrl+Alt+D did not restore debug-key mode");
        if (!previousDebugKeys) {
            keyEvent('d', true);
            keyEvent('d', false);
        }
        keyEvent(0xffe9, false);
        keyEvent(0xffe3, false);
        keyEvent(0xffc0, true); // F3.
        keyEvent(0xffc0, false);
        Require(app.mShowFPS != previousFps, "F3 did not toggle the FPS display");
        keyEvent(0xffc0, true);
        keyEvent(0xffc0, false);
        Require(app.mShowFPS == previousFps, "F3 did not restore the FPS display");
        if (!previousDebugKeys) {
            keyEvent(0xffe3, true);
            keyEvent(0xffe9, true);
            keyEvent('d', true);
            keyEvent('d', false);
            keyEvent(0xffe9, false);
            keyEvent(0xffe3, false);
        }
        Require(app.mDebugKeysEnabled == previousDebugKeys &&
                !app.mCtrlDown && !app.mAltDown,
                "shortcut probe left modifier/debug state behind");
        Log(probe, app, "PASS shared-shortcuts Ctrl+Alt+D F3 state-restored");
        Log(probe, app, "AUDIO state mute=" + std::to_string(app.mMuteCount) +
            " autoMute=" + std::to_string(app.mAutoMuteCount) +
            " active=" + std::to_string(app.mActive) +
            " focus=" + std::to_string(app.mHasFocus) +
            " sfx=" + std::to_string(app.mSfxVolume) +
            " music=" + std::to_string(app.mMusicVolume));
        Capture(probe, app, "01-menu");
        Require(app.SeedTypeAvailable(SEED_IMITATER),
                "isolated player must already own Imitater");
        Require(!app.SaveFileExists(),
                "remove the isolated player's adventure interruption save before this run");
        Require(!selector->mAdventureButton->mDisabled,
                "adventure button is not enabled");
        const int id = selector->mAdventureButton->mId;
        Log(probe, app, "ACTION adventure-button-callback");
        Advance(probe, app, Stage::Chooser);
        CallbackBoundary callback(app);
        selector->ButtonDepress(id);
        return;
    }
    case Stage::Chooser: {
        if (!app.mBoard) return;
        Require(app.mGameMode == GAMEMODE_ADVENTURE,
                "profile routed to intro/minigame instead of ordinary adventure");
        Require(app.mBoard->ChooseSeedsOnCurrentLevel(),
                "profile's adventure level does not have a seed chooser");
        auto* chooser = app.mSeedChooserScreen;
        if (!chooser || !chooser->mMouseVisible || !chooser->mVisible ||
            app.GetDialogCount() != 0 || !FreshSceneDraw(probe, app)) return;
        Require(chooser->mBoard == app.mBoard && chooser->mApp == &app,
                "real chooser is not bound to the adventure Board");
        Require(app.mGameScene == SCENE_LEVEL_INTRO,
                "chooser did not remain in the ordinary adventure intro scene");
        Require(!chooser->mImitaterButton->mDisabled && !chooser->mImitaterButton->mBtnNoDraw,
                "real Imitater control is unavailable");
        DeletionBoundary(probe, app);
        Capture(probe, app, "02-adventure-chooser");
        probe.board = app.mBoard;
        probe.chooser = chooser;
        const int x = chooser->mImitaterButton->mX + chooser->mImitaterButton->mWidth / 2;
        const int y = chooser->mImitaterButton->mY + chooser->mImitaterButton->mHeight / 2;
        const auto origin = chooser->GetAbsPos();
        Log(probe, app, "ACTION imitater-control-mousedown");
        Advance(probe, app, Stage::Imitater);
        CallbackBoundary callback(app);
        app.mWidgetManager->MouseMove(origin.mX + x, origin.mY + y);
        Require(app.mSeedChooserScreen == chooser, "hover unexpectedly retired chooser");
        chooser->MouseDown(x, y, 1);
        return; // Do not add a second widget callback after the modal transition.
    }
    case Stage::Imitater: {
        auto* dialog = app.GetDialog(DIALOG_IMITATER);
        Require(app.mBoard == probe.board && app.mSeedChooserScreen == probe.chooser,
                "opening Imitater replaced its owning Board/chooser");
        Require(dialog != nullptr, "real Imitater callback did not open its dialog");
        if (!FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Capture(probe, app, "03-imitater");
        if (probe.mode == RunMode::Ui) {
            Log(probe, app, "ACTION imitater-escape-callback");
            Advance(probe, app, Stage::ChooserReturn);
            CallbackBoundary callback(app);
            dialog->KeyDown(Sexy::KEYCODE_ESCAPE);
        } else {
            auto* imitater = static_cast<ImitaterDialog*>(dialog);
            Require(app.SeedTypeAvailable(SEED_SUNSHROOM) &&
                    !app.mSeedChooserScreen->SeedNotAllowedToPick(SEED_SUNSHROOM),
                    "Imitater cannot copy the fixture's sun producer");
            int x = 0, y = 0;
            imitater->GetSeedPosition(static_cast<int>(SEED_SUNSHROOM), x, y);
            x += SEED_PACKET_WIDTH / 2;
            y += SEED_PACKET_HEIGHT / 2;
            Require(imitater->SeedHitTest(x, y) == SEED_SUNSHROOM,
                    "Imitater seed coordinate did not hit Sun-shroom");
            Log(probe, app, "ACTION imitater-select-sunshroom");
            Advance(probe, app, Stage::ChooserReturn);
            CallbackBoundary callback(app);
            imitater->MouseDown(x, y, 1);
        }
        return; // Either real callback may retire dialog; never use it afterward.
    }
    case Stage::ChooserReturn:
        Require(app.mBoard == probe.board && app.mSeedChooserScreen == probe.chooser,
                "closing Imitater replaced its owning Board/chooser");
        Require(app.GetDialog(DIALOG_IMITATER) == nullptr,
                "Imitater callback did not close its dialog");
        if (!FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Capture(probe, app, "04-chooser-return");
        if (probe.mode == RunMode::Ui) {
            Log(probe, app, "NOT_RUN dat64-round-trip: explicitly selected ui mode");
            QueueClose(probe, app, false);
        } else {
            Advance(probe, app, Stage::FillSeeds);
        }
        return;
    case Stage::FillSeeds: {
        auto* chooser = app.mSeedChooserScreen;
        Require(app.mBoard == probe.board && chooser == probe.chooser &&
                app.mGameScene == SCENE_LEVEL_INTRO && app.GetDialogCount() == 0,
                "seed selection lost the original adventure chooser");
        Require(app.mBoard->mSeedBank->mNumPackets == 6 &&
                !app.mBoard->StageHasPool() && !app.mBoard->StageHasRoof(),
                "six-seed fixture requires an ordinary land level");
        if (chooser->mSeedsInFlight != 0) return;
        if (chooser->mSeedsInBank < 6) {
            const auto seed = NextSeed(app, *chooser);
            Require(app.SeedTypeAvailable(seed) && !chooser->SeedNotAllowedToPick(seed) &&
                    chooser->mChosenSeeds[seed].mSeedState == SEED_IN_CHOOSER,
                    "required seed cannot be selected by the normal chooser");
            Log(probe, app, "ACTION choose-seed=" + std::to_string(static_cast<int>(seed)));
            CallbackBoundary callback(app);
            chooser->ClickedSeedInChooser(chooser->mChosenSeeds[seed]);
            return; // Let the ordinary seed flight complete before another pick.
        }
        Require(chooser->mSeedsInBank == 6 && !chooser->mStartButton->mDisabled,
                "Let's Rock did not become available with six landed seeds");
        Require(chooser->mChosenSeeds[SEED_IMITATER].mSeedState == SEED_IN_BANK &&
                chooser->mChosenSeeds[SEED_IMITATER].mImitaterType == SEED_SUNSHROOM,
                "selected Imitater/Sun-shroom did not land in the real seed bank");
        Require(chooser->PickedPlantType(SEED_SUNFLOWER) ||
                chooser->PickedPlantType(SEED_TWINSUNFLOWER) || chooser->PickedPlantType(SEED_SUNSHROOM),
                "seed bank would enter the no-sun warning dialog");
        Require(!chooser->FlyersAreComming() || chooser->FlyProtectionCurrentlyPlanted() ||
                chooser->PickedPlantType(SEED_CATTAIL) || chooser->PickedPlantType(SEED_CACTUS) ||
                chooser->PickedPlantType(SEED_BLOVER), "seed bank lacks required flying protection");
        for (int index = 0; index < 6; ++index) {
            const auto seed = chooser->FindSeedInBank(index);
            Require(seed != SEED_NONE && app.SeedTypeAvailable(seed) &&
                    !chooser->SeedNotAllowedToPick(seed), "seed bank contains an invalid packet");
            probe.selectedSeeds[index] = static_cast<int>(seed);
            probe.selectedImitaterTypes[index] =
                static_cast<int>(chooser->mChosenSeeds[seed].mImitaterType);
        }
        if (!FreshSceneDraw(probe, app)) return;
        Capture(probe, app, "05-six-seeds");
        const int start = chooser->mStartButton->mId;
        Log(probe, app, "ACTION lets-rock-button-callback");
        Advance(probe, app, Stage::Playing);
        CallbackBoundary callback(app);
        chooser->ButtonDepress(start);
        return;
    }
    case Stage::Playing: {
        Require(app.mBoard == probe.board, "starting gameplay replaced the selected Board");
        if (app.mGameScene != SCENE_PLAYING) return;
        Require(app.mSeedChooserScreen == nullptr && app.GetDialogCount() == 0,
                "active gameplay retained chooser or an unexpected dialog");
        if (!SimulationAdvanced(probe, app) || !FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        const auto state = ObserveBoard(*app.mBoard);
        Require(state.seeds == probe.selectedSeeds &&
                state.imitaterTypes == probe.selectedImitaterTypes && !state.mowers.empty(),
                "gameplay lost selected packets or native lawn mowers");
        ReportBoard(probe, app, "PASS actual-gameplay-updates", state);
        Capture(probe, app, "06-playing");
        Log(probe, app, "ACTION board-escape-opens-options");
        Advance(probe, app, Stage::Options);
        CallbackBoundary callback(app);
        app.mBoard->KeyDown(Sexy::KEYCODE_ESCAPE);
        return;
    }
    case Stage::Options: {
        Require(app.mBoard == probe.board && app.mBoard->mPaused,
                "real options dialog did not pause the gameplay Board");
        auto* dialog = app.GetDialog(DIALOG_NEWOPTIONS);
        Require(dialog != nullptr, "Board Escape did not open the real options dialog");
        if (!FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Capture(probe, app, "07-playing-options");
        auto* options = static_cast<NewOptionsDialog*>(dialog);
        Require(!options->mFromGameSelector && !options->mBackToMainButton->mDisabled,
                "gameplay options have no usable Main Menu control");
        const int id = options->mBackToMainButton->mId;
        Log(probe, app, "ACTION options-main-menu-callback");
        Advance(probe, app, Stage::ConfirmSave);
        CallbackBoundary callback(app);
        options->ButtonDepress(id);
        return;
    }
    case Stage::ConfirmSave: {
        Require(app.mBoard == probe.board && app.mBoard->mPaused && app.mBoard->NeedSaveGame(),
                "save confirmation does not own a paused, saveable gameplay Board");
        auto* dialog = app.GetDialog(DIALOG_CONFIRM_BACK_TO_MAIN);
        Require(dialog != nullptr, "Main Menu callback did not open save confirmation");
        if (!FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Capture(probe, app, "08-save-confirmation");
        probe.saved = ObserveBoard(*app.mBoard);
        probe.savedBoardRevision = static_cast<unsigned long long>(app.mBoardRevision);
        probe.savePath = Path(GetSavedGameName(app.mGameMode, app.mPlayerInfo->mId));
        Require(probe.savePath.is_absolute() &&
                std::filesystem::equivalent(probe.savePath.parent_path(), EnvironmentPath("PVZ_APPDATA_DIR")),
                "normal game save path escaped the isolated appdata directory");
        Require(!std::filesystem::exists(probe.savePath),
                "save fixture already has an unexpected interruption file");
        ReportBoard(probe, app, "SAVE expected-core-state", probe.saved);
        Log(probe, app, "ACTION save-and-return-confirmation-enter");
        Advance(probe, app, Stage::SavedMenu);
        CallbackBoundary callback(app);
        dialog->KeyDown(Sexy::KEYCODE_RETURN);
        return; // The normal callback saves, disposes Board and shows the menu.
    }
    case Stage::SavedMenu: {
        if (app.mBoard || !app.mGameSelector || app.mGameScene != SCENE_MENU) return;
        auto* selector = app.mGameSelector;
        if (selector->mLoading || selector->mStartingGame || selector->mSlideCounter != 0 ||
            selector->mSelectorState != SELECTOR_IDLE || app.GetDialogCount() != 0 ||
            !FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Require(static_cast<unsigned long long>(app.mBoardRevision) > probe.savedBoardRevision,
                "save-to-menu path did not retire the old Board session");
        Require(app.mSeedChooserScreen == nullptr && app.SaveFileExists() &&
                std::filesystem::is_regular_file(probe.savePath),
                "normal save callback did not create its isolated interruption file");
        probe.savedBytes = static_cast<unsigned long long>(std::filesystem::file_size(probe.savePath));
        Require(probe.savedBytes > LevelSaveFormat::DAT64_HEADER_SIZE,
                "normal interruption save has no dat64 payload");
        Log(probe, app, "PASS normal-save-file path=" + probe.savePath.string() +
            " bytes=" + std::to_string(probe.savedBytes));
        Capture(probe, app, "09-saved-menu");
        Require(!selector->mAdventureButton->mDisabled, "saved menu has no usable Adventure control");
        const int id = selector->mAdventureButton->mId;
        Log(probe, app, "ACTION adventure-load-continue-callback");
        Advance(probe, app, Stage::Continue);
        CallbackBoundary callback(app);
        selector->ButtonDepress(id);
        return;
    }
    case Stage::Continue: {
        if (!app.mBoard) return;
        Require(app.mGameMode == GAMEMODE_ADVENTURE && app.mGameScene == SCENE_PLAYING &&
                app.mSeedChooserScreen == nullptr,
                "existing save was replaced by new-game/chooser instead of loading");
        auto* dialog = app.GetDialog(DIALOG_CONTINUE);
        Require(dialog != nullptr && app.mBoard->mPaused,
                "successful load did not reach the real paused Continue dialog");
        if (!FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        Require(static_cast<unsigned long long>(app.mBoardRevision) > probe.savedBoardRevision,
                "Continue restored into the retired Board session");
        const auto restored = ObserveBoard(*app.mBoard);
        ReportBoard(probe, app, "LOAD actual-core-state", restored);
        Require(restored == probe.saved, "dat64 load changed checkpoint fields, seed packets or world IDs");
        Require(std::filesystem::is_regular_file(probe.savePath) &&
                std::filesystem::file_size(probe.savePath) == probe.savedBytes,
                "interruption file changed before Continue acceptance");
        Capture(probe, app, "10-continue-loaded");
        Log(probe, app, "PASS dat64-core-state-and-world-bindings loader=ContinueDialog");
        probe.board = app.mBoard;
        auto* continuation = static_cast<ContinueDialog*>(dialog);
        Log(probe, app, "ACTION real-continue-button");
        Advance(probe, app, Stage::Resumed);
        CallbackBoundary callback(app);
        continuation->ButtonDepress(ContinueDialog::ContinueDialog_Continue);
        return;
    }
    case Stage::Resumed: {
        Require(app.mBoard == probe.board && app.mGameScene == SCENE_PLAYING &&
                app.mSeedChooserScreen == nullptr && app.GetDialog(DIALOG_CONTINUE) == nullptr,
                "Continue did not resume the loaded gameplay Board");
        Require(!std::filesystem::exists(probe.savePath),
                "accepted Continue did not consume its interruption save like the original");
        if (app.mBoard->mPaused || !SimulationAdvanced(probe, app) ||
            !FreshSceneDraw(probe, app)) return;
        DeletionBoundary(probe, app);
        const auto resumed = ObserveBoard(*app.mBoard);
        Require(resumed.gameId == probe.saved.gameId && resumed.level == probe.saved.level &&
                resumed.background == probe.saved.background && resumed.seeds == probe.saved.seeds &&
                resumed.imitaterTypes == probe.saved.imitaterTypes &&
                resumed.mainCounter > probe.saved.mainCounter,
                "loaded game identity/seed bank drifted or simulation failed to resume");
        ReportBoard(probe, app, "PASS resumed-gameplay-updates", resumed);
        Capture(probe, app, "11-resumed-playing");
        Log(probe, app, "PASS dat64-round-trip normal-save-menu-Continue-resume");
        QueueClose(probe, app, true);
        return;
    }
    case Stage::CloseQueued:
        return;
    }
}
} // namespace

void PrepareNativeLinuxGameSmoke(LawnApp& app)
{
    if (!Enabled()) return;
    const auto data = EnvironmentPath("PVZ_APPDATA_DIR");
    (void)EnvironmentPath("PVZ_LOG_DIR");
    (void)EnvironmentPath("PVZ_SETTINGS_FILE");
    Require(!app.mInitialized && !app.mLoadingThreadStarted && !app.mNativeWindow &&
            app.mPlayerInfo == nullptr && app.mProfileMgr && app.mProfileMgr->mProfileMap.empty(),
            "fixture preparation must run before Init and before any player is loaded");
    Require(Sexy::gSexyAppBase == &app, "profile writer belongs to another application");
    Path requested = Path(std::getenv("PVZ_APPDATA_DIR")).lexically_normal();
    if (!requested.has_filename()) requested = requested.parent_path();
    Require(!std::filesystem::is_symlink(std::filesystem::symlink_status(requested)),
            "fixture appdata directory must not be a symbolic link");
    RejectLiveRoot(data, app);
    if (std::filesystem::exists(data))
        Require(std::filesystem::is_directory(data) && std::filesystem::is_empty(data),
                "fixture appdata already contains entries; use a new UUID directory");
    std::filesystem::create_directories(data);
    Require(std::filesystem::is_empty(data),
            "fixture appdata is not empty; no existing files will be reused");
    Require(std::filesystem::equivalent(Path(Sexy::GetAppDataFolder()), data),
            "profile writer already resolved a different application data directory");

    ProfileMgr fixture;
    const char* name = "NativeLinuxSmoke";
    auto* player = fixture.AddProfile(name);
    Require(player != nullptr, "production AddProfile did not create the fixture player");
    player->mLevel = 14;
    player->mFinishedAdventure = 1;
    player->mPurchases[STORE_ITEM_PLANT_IMITATER] = 1;
    const unsigned int id = player->mId;
    fixture.Save();
    player->SaveDetails();
    const auto summary = data / "users.dat";
    const auto details = data / ("user" + std::to_string(id) + ".dat64");
    Require(std::filesystem::is_regular_file(summary) && std::filesystem::file_size(summary) > 0 &&
            std::filesystem::is_regular_file(details) && std::filesystem::file_size(details) > 0,
            "production profile writers did not persist both fixture files");

    ProfileMgr verification;
    verification.Load();
    Require(verification.mProfileMap.size() == 1,
            "production summary reader did not restore exactly one fixture player");
    auto* restored = verification.GetProfile(name);
    Require(restored && !restored->mDetailsLoadRejected && restored->mId == id &&
            restored->mLevel == 14 && restored->mFinishedAdventure == 1 &&
            restored->mPurchases[STORE_ITEM_PLANT_IMITATER] == 1,
            "production profile detail round-trip did not preserve fixture fields");
    std::cout << "PREPARED native-linux-game-smoke profile=" << name
              << " id=" << id << " level=14 finishedAdventure=1 imitater=1 profileRoundTrip=PASS appdata="
              << data.string() << '\n';
}

void NativeLinuxGameSmokeTick(LawnApp& app)
{
    static const bool enabled = Enabled();
    if (!enabled) return;
    static Probe probe;
    if (probe.stage == Stage::CloseQueued) return;
    try {
        if (!probe.initialized) Initialize(probe, app);
        const auto timeout = probe.stage == Stage::Loading ?
            std::chrono::seconds(420) : std::chrono::seconds(90);
        Require(Clock::now() - probe.stageStarted <= timeout,
                std::string("timeout waiting for real stage/draw: ") + StageName(probe.stage));
        // A nested modal loop can reach UpdateApp's tail too. It may wait,
        // but must never repeat an action or collect another callback's widget.
        if (app.mUpdateAppDepth != 0) return;
        Run(probe, app);
    } catch (const std::exception& error) {
        std::cerr << "FAIL " << error.what() << '\n';
        if (!probe.output.empty()) {
            std::ofstream log(probe.output / "result.log", std::ios::app);
            log << "FAIL stage=" << StageName(probe.stage)
                << " update=" << app.mUpdateCount << " draw=" << app.mDrawCount
                << " reason=" << error.what() << '\n';
        }
        throw; // Linux main records fatal.log and returns 1.
    }
}
