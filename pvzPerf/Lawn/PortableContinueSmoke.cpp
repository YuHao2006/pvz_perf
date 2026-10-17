#include "ModernVulkanSmoke.h"
#include "LawnCommon.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "Cutscene.h"
#include "Plant.h"
#include "Zombie.h"
#include "GridItem.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/ContinueDialog.h"
#include "Widget/ChallengeScreen.h"
#include "Widget/GameButton.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "graphics/GpuBackend.h"
#include <array>
#include <fstream>
#include <optional>
#include <stdexcept>
#include <tuple>
#include <utility>
#include <vector>

namespace {
using namespace ModernSmoke;
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
struct AppAccess : LawnApp { static constexpr auto Cleanup = &AppAccess::ProcessSafeDeleteList; };
void ClearMenus(LawnApp& app) {
    app.KillGameSelector(); app.KillChallengeScreen(); (app.*AppAccess::Cleanup)();
}
std::vector<unsigned char> Bytes(LawnApp& app, const std::string& file) {
    Buffer buffer;
    Require(app.ReadBufferFromFile(file, &buffer, false) && buffer.GetDataLen() > 1024,
        "Continue fixture save is missing, empty or not a complete level");
    return {buffer.GetDataPtr(), buffer.GetDataPtr() + buffer.GetDataLen()};
}
template<class T> std::vector<unsigned> LiveIDs(DataArray<T>& pool) {
    std::vector<unsigned> ids;
    T* object = nullptr;
    while (pool.IterateNext(object)) if (!object->mDead) ids.push_back(pool.DataArrayGetID(object));
    return ids;
}
auto Snapshot(Board& b, unsigned plantId, unsigned zombieId) {
    auto* p = b.mPlants.DataArrayTryToGet(plantId);
    auto* z = b.mZombies.DataArrayTryToGet(zombieId);
    Require(p && z && p->mApp == b.mApp && p->mBoard == &b && z->mApp == b.mApp && z->mBoard == &b,
        "Reload lost fixture objects or their app/board pointers");
    return std::tuple{b.mLevel, b.mBackground, b.mSunMoney, b.mMainCounter, b.mCurrentWave,
        b.mNextSurvivalStageCounter, b.mChallenge->mSurvivalStage,
        LiveIDs(b.mPlants), LiveIDs(b.mZombies), LiveIDs(b.mGridItems),
        p->mSeedType, p->mPlantHealth, p->mPlantCol, p->mRow, p->mBodyReanimID,
        z->mZombieType, z->mBodyHealth, z->mRow, z->mPosX, z->mBodyReanimID};
}
void DumpSnapshot(std::ostream& log, const char* name, const auto& value) {
    log << name;
    const auto field = [&](const auto& item) {
        log << ' ';
        if constexpr (requires { item.begin(); item.end(); }) {
            log << '['; for (const auto& id : item) log << id << ','; log << ']';
        } else log << item;
    };
    std::apply([&](const auto&... fields) { (field(fields), ...); }, value);
    log << std::endl;
}
struct Case { GameMode mode; ChallengePage page; bool stageBoundary; };
constexpr std::array cases{
    Case{GAMEMODE_ADVENTURE, CHALLENGE_PAGE_CHALLENGE, false},
    Case{GAMEMODE_SURVIVAL_NORMAL_STAGE_3, CHALLENGE_PAGE_SURVIVAL, false},
    Case{GAMEMODE_SURVIVAL_ENDLESS_STAGE_3, CHALLENGE_PAGE_SURVIVAL, false},
    Case{GAMEMODE_SCARY_POTTER_ENDLESS, CHALLENGE_PAGE_PUZZLE, false},
    Case{GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS, CHALLENGE_PAGE_PUZZLE, false},
    Case{GAMEMODE_MINIGAME_WAR_AND_PEAS, CHALLENGE_PAGE_CHALLENGE, false},
    Case{GAMEMODE_SURVIVAL_HARD_STAGE_4, CHALLENGE_PAGE_SURVIVAL, true}};

void CheckMenu(LawnApp& app, const Case& test) {
    Require(!app.mBoard && !app.mSeedChooserScreen && !app.GetDialog(DIALOG_CONTINUE) &&
        !app.GetDialog(DIALOG_RESTARTCONFIRM), "Cancel left a board, chooser or confirmation alive");
    if (test.mode == GAMEMODE_ADVENTURE)
        Require(app.mGameSelector && !app.mChallengeScreen, "Adventure Cancel did not return to selector");
    else
        Require(!app.mGameSelector && app.mChallengeScreen && app.mChallengeScreen->mPageIndex == test.page,
            "Cancel returned to the wrong challenge page");
}
void ChooseForFixture(LawnApp& app) {
    auto& chooser = *app.mSeedChooserScreen;
    const int wanted = app.mBoard->mSeedBank->mNumPackets;
    for (int s = 0; s < NUM_SEEDS_IN_CHOOSER && chooser.mSeedsInBank < wanted; ++s) {
        const auto seed = static_cast<SeedType>(s);
        if (!app.SeedTypeAvailable(seed) || chooser.mChosenSeeds[s].mSeedState != SEED_IN_CHOOSER) continue;
        chooser.ClickedSeedInChooser(chooser.mChosenSeeds[s]);
        chooser.LandFlyingSeed(chooser.mChosenSeeds[s]);
    }
    Require(chooser.mSeedsInBank == wanted && chooser.mSeedsInFlight == 0, "Cannot fill fixture seed bank");
    // Exercise the real close/end-intro path. Repick warnings and flight timing
    // are deliberately outside this save/cancel test and have separate probes.
    chooser.CloseSeedChooser();
    app.mBoard->mCutScene->CancelIntro();
}
}

void PortableContinueSmokeTick(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mGpuContext &&
        !IsWindowVisible(app.mHWnd) && app.mNoSoundNeeded,
        "Continue cancel probe requires a hidden isolated no-audio process");
    static unsigned state = 0, index = 0, round = 0, started = 0, deadline = 0, plantId = 0, zombieId = 0;
    static std::optional<decltype(Snapshot(std::declval<Board&>(), 0, 0))> saved;
    static std::vector<unsigned char> wire;
    static std::string file;
    static std::ofstream log;
    if (state == 99) return;
    if (state == 0) {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); started = app.mUpdateCount; deadline = started + 40; state = 1;
        log.open(ProbePath("continue-cancel-cases.txt")); Require(bool(log), "Cannot write Continue evidence");
        return;
    }
    Require(app.mUpdateCount - started < 14000, "Continue cancel probe timed out");
    if (app.mUpdateCount < deadline) return;
    const auto& test = cases[index];
    if (state == 1) {
        ClearMenus(app);
        app.mPlayerInfo->mFinishedAdventure = 1; app.mPlayerInfo->mLevel = 23;
        app.PreNewGame(test.mode, false);
        Require(app.mBoard, "Fixture failed to initialize a real board");
        app.mBoard->mCutScene->CancelIntro(); state = 2; return;
    }
    if (state == 2) {
        if (app.mGameScene != SCENE_PLAYING) {
            if (app.mSeedChooserScreen && app.mSeedChooserScreen->mMouseVisible &&
                app.mSeedChooserScreen->mChooseState == CHOOSE_NORMAL)
                ChooseForFixture(app);
            return;
        }
        auto& b = *app.mBoard;
        Require(!app.mSeedChooserScreen && b.NeedSaveGame(), "Fixture is not in a saveable live level");
        auto* p = b.NewPlant(8, 0, SEED_PEASHOOTER, SEED_NONE);
        auto* z = b.AddZombieInRow(ZOMBIE_NORMAL, 0, 0);
        Require(p && z, "Cannot allocate fixture objects");
        p->mPlantHealth = 250; z->mBodyHealth = 233; z->mPosX = 670;
        plantId = b.mPlants.DataArrayGetID(p); zombieId = b.ZombieGetID(z); b.mSunMoney = 777;
        file = GetSavedGameName(test.mode, app.mPlayerInfo->mId);
        if (test.stageBoundary) {
            // Use the real 2 -> 1 autosave transition, not a handcrafted file.
            b.mChallenge->mSurvivalStage = 2;
            b.mCurrentWave = b.mNumWaves; b.mNextSurvivalStageCounter = 2;
            b.UpdateLevelEndSequence();
            Require(b.mNextSurvivalStageCounter == 1 && !b.mLevelComplete && app.FileExists(file),
                "Stage-boundary autosave was not created");
            b.Pause(true);
        } else {
            b.Pause(true);
            Require(LawnSaveGame(&b, file), "Cannot write fixture interruption save");
        }
        saved = Snapshot(b, plantId, zombieId); wire = Bytes(app, file);
        app.DoBackToMain();
        Require(!app.mBoard && app.mGameSelector && Bytes(app, file) == wire, "Leaving changed the fixture save");
        round = 0; state = 3; deadline = app.mUpdateCount + 20; return;
    }
    if (state == 3) {
        ClearMenus(app); app.PreNewGame(test.mode, true);
        Require(app.mBoard && app.GetDialog(DIALOG_CONTINUE) && app.mBoard->mPaused &&
            Snapshot(*app.mBoard, plantId, zombieId) == *saved && Bytes(app, file) == wire,
            "Real load changed the level/file before the Continue decision");
        log << "loaded mode=" << int(test.mode) << " round=" << round << " paused=" << app.mBoard->mPaused << std::endl;
        DumpSnapshot(log, "saved", *saved);
        state = 4; deadline = app.mUpdateCount + 20; return;
    }
    if (state == 4) {
        log << "waited mode=" << int(test.mode) << " round=" << round << " board=" << bool(app.mBoard)
            << " paused=" << (app.mBoard && app.mBoard->mPaused) << " file-equal=" << (Bytes(app, file) == wire) << std::endl;
        if (app.mBoard) DumpSnapshot(log, "after-wait", Snapshot(*app.mBoard, plantId, zombieId));
        Require(app.mBoard && app.mBoard->mPaused && Snapshot(*app.mBoard, plantId, zombieId) == *saved &&
            Bytes(app, file) == wire, "Waiting at Continue mutated the paused state/file");
        // A just-started save may contain dead street-preview entries awaiting
        // the original deletion queue. Preserve live IDs, not allocated slots;
        // also require that dead entries are actually reclaimed while paused.
        Require(app.mBoard->mPlants.mSize == LiveIDs(app.mBoard->mPlants).size() &&
            app.mBoard->mZombies.mSize == LiveIDs(app.mBoard->mZombies).size() &&
            app.mBoard->mGridItems.mSize == LiveIDs(app.mBoard->mGridItems).size(),
            "Paused Continue retained dead board entries after the deletion queue");
        auto* dialog = dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
        Require(dialog, "Continue dialog disappeared");
        if (round == 1) {
            dialog->ButtonDepress(ContinueDialog::ContinueDialog_NewGame);
            Require(app.GetDialog(DIALOG_RESTARTCONFIRM) && app.GetDialog(DIALOG_CONTINUE) == dialog,
                "New Game replaced rather than covered Continue");
            state = 5; deadline = app.mUpdateCount + 40; return;
        }
        state = 6;
    }
    if (state == 5) {
        auto* restart = dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_RESTARTCONFIRM));
        Require(restart && (restart->mButtonDelay < 0 || restart->mUpdateCnt > unsigned(restart->mButtonDelay)),
            "Restart cancel button is not ready");
        restart->ButtonDepress(Sexy::Dialog::ID_NO);
        Require(!app.GetDialog(DIALOG_RESTARTCONFIRM) && app.GetDialog(DIALOG_CONTINUE) && app.mBoard &&
            app.mBoard->mPaused && Snapshot(*app.mBoard, plantId, zombieId) == *saved && Bytes(app, file) == wire,
            "Canceling the nested restart dialog changed the loaded game");
        log << "nested-restart-cancel mode=" << int(test.mode) << " unchanged=1" << std::endl;
        state = 6;
    }
    if (state == 6) {
        auto* dialog = dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
        Require(dialog && dialog->mYesButton && !dialog->mYesButton->mDisabled,
            "Continue Cancel footer is missing/disabled");
        // Real footer listener and ID; no OS mouse or keyboard injection.
        dialog->mYesButton->mButtonListener->ButtonDepress(dialog->mYesButton->mId);
        CheckMenu(app, test);
        Require(app.mBoardResult == BOARDRESULT_QUIT && Bytes(app, file) == wire,
            "Cancel did not record quitting or altered/deleted the save");
        log << "cancel mode=" << int(test.mode) << " round=" << round << " page=" << int(test.page)
            << " stage-boundary=" << test.stageBoundary << " bytes=" << wire.size() << " unchanged=1" << std::endl;
        state = 7; deadline = app.mUpdateCount + 30; return;
    }
    if (state == 7) {
        CheckMenu(app, test);
        Require(Bytes(app, file) == wire, "Deferred dialog/board destruction altered the save");
        if (++round < 3) { state = 3; return; }
        ClearMenus(app); app.PreNewGame(test.mode, true);
        Require(app.mBoard && app.mBoard->mPaused && Snapshot(*app.mBoard, plantId, zombieId) == *saved &&
            Bytes(app, file) == wire, "Repeated Cancel did not preserve a loadable level");
        state = 8; deadline = app.mUpdateCount + 20; return;
    }
    if (state == 8) {
        auto* dialog = dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
        Require(dialog && app.mBoard->mPaused && Snapshot(*app.mBoard, plantId, zombieId) == *saved,
            "Final Continue state changed while waiting");
        if (index + 1 == cases.size()) ProbeScreenshot(app);
        dialog->ButtonDepress(ContinueDialog::ContinueDialog_Continue);
        Require(!app.GetDialog(DIALOG_CONTINUE) && app.mBoard && !app.mBoard->mPaused &&
            Snapshot(*app.mBoard, plantId, zombieId) == *saved && app.FileExists(file) == test.stageBoundary,
            "Continue did not preserve the original mid-stage/stage-boundary file policy");
        if (test.stageBoundary) Require(Bytes(app, file) == wire, "Continue rewrote the stage-boundary save");
        log << "resume mode=" << int(test.mode) << " save-retained=" << test.stageBoundary << " pass=1" << std::endl;
        app.DoBackToMain();
        if (++index < cases.size()) { state = 1; deadline = app.mUpdateCount + 20; return; }
        Report("portable-continue-seven-modes-21-cancels-seven-nested-and-resumes", app);
        Report("PASS continue; actual save/load, four menu routes, cancel, nested confirmation and consumption", app);
        state = 99; app.CloseRequestAsync();
    }
}
