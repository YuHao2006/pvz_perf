#include "ModernVulkanSmoke.h"
#include "PortableMessageFocusSmoke.h"
#include "PortableCreditsPauseSmoke.h"
#include "PortableZombatarDeleteSmoke.h"
#include "PortableChooserLifetimeSmoke.h"
#include "PortableStorePurchaseSmoke.h"
#include "PortableSelectorLifetimeSmoke.h"
#include "PortableDaveUpgradeSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Cutscene.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "Widget/TitleScreen.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/NewOptionsDialog.h"
#include "Widget/LawnDialog.h"
#include "Widget/Almanac.h"
#include "Widget/GameButton.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include "graphics/GpuBackend.h"
#include <array>
#include <fstream>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok, const char* why) { if (!ok) throw std::runtime_error(why); }
struct AppAccess : LawnApp { static constexpr auto Cleanup = &AppAccess::ProcessSafeDeleteList; };
void StartBoard(LawnApp& app) {
    app.KillBoard(); app.KillGameSelector(); app.KillChallengeScreen();
    if (!app.mUpdateAppDepth) (app.*AppAccess::Cleanup)();
    app.mPlayerInfo->mFinishedAdventure = 1; app.mPlayerInfo->mLevel = 23;
    app.PreNewGame(GAMEMODE_MINIGAME_WAR_AND_PEAS, false);
    if (app.mSeedChooserScreen) {
        auto& chooser = *app.mSeedChooserScreen;
        const auto wanted = app.mBoard->mSeedBank->mNumPackets;
        for (int s = 0; s < NUM_SEEDS_IN_CHOOSER && chooser.mSeedsInBank < wanted; ++s) {
            const auto seed = static_cast<SeedType>(s);
            if (!app.SeedTypeAvailable(seed) || chooser.mChosenSeeds[s].mSeedState != SEED_IN_CHOOSER) continue;
            chooser.ClickedSeedInChooser(chooser.mChosenSeeds[s]); chooser.LandFlyingSeed(chooser.mChosenSeeds[s]);
        }
        Require(chooser.mSeedsInBank == wanted, "Cannot fill modal fixture seed bank");
        chooser.CloseSeedChooser();
    }
    app.mBoard->mCutScene->CancelIntro(); app.StartPlaying();
    app.mBoard->mSunMoney = 555; app.mBoard->mKilledYeti = true;
    Require(app.mGameScene == SCENE_PLAYING && !app.mSeedChooserScreen, "Modal fixture did not start a real board");
}
class ObservedOptions final : public NewOptionsDialog {
    bool& dead;
public:
    ObservedOptions(LawnApp& app, bool& flag) : NewOptionsDialog(&app, false), dead(flag) {}
    ~ObservedOptions() override { dead = true; }
};
ObservedOptions* OpenOptions(LawnApp& app, bool& destroyed) {
    auto* options = new ObservedOptions(app, destroyed);
    app.CenterDialog(options, IMAGE_OPTIONS_MENUBACK->mWidth, IMAGE_OPTIONS_MENUBACK->mHeight);
    app.AddDialog(DIALOG_NEWOPTIONS, options); app.mWidgetManager->SetFocus(options);
    return options;
}
enum class Action { No, Yes, Kill, AcceptedReplace, AcceptedKill, AcceptedCloseParent };
class Answer final : public Widget {
    LawnApp& app;
    int dialogId;
    Action action;
    bool& optionsDestroyed;
    unsigned updates = 0;
public:
    bool answered = false, parentAlive = true;
    Board* replacement = nullptr;
    Answer(LawnApp& a, int id, Action response, bool& dead) : app(a), dialogId(id), action(response), optionsDestroyed(dead) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE; app.mWidgetManager->AddWidget(this);
    }
    ~Answer() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        if (answered) return;
        Require(++updates < 500, "Nested modal responder never became ready");
        auto* dialog = app.GetDialog(dialogId);
        if (!dialog) return;
        if (auto* lawn = dynamic_cast<LawnDialog*>(dialog); lawn && lawn->mButtonDelay >= 0 &&
            lawn->mUpdateCnt <= static_cast<unsigned>(lawn->mButtonDelay)) return;
        answered = true;
        Require(app.mUpdateAppDepth > 0, "Modal reply bypassed the real nested message pump");
        if (action == Action::Kill) app.KillBoard();
        else if (dialogId == DIALOG_ALMANAC) app.KillAlmanacDialog();
        else {
            dialog->ButtonDepress(action == Action::No ? Dialog::ID_NO : Dialog::ID_YES);
            if (action == Action::AcceptedReplace) {
                StartBoard(app); replacement = app.mBoard;
                replacement->mSunMoney = 777; replacement->mKilledYeti = false;
            } else if (action == Action::AcceptedKill) app.KillBoard();
            else if (action == Action::AcceptedCloseParent) app.KillNewOptionsDialog();
        }
        parentAlive &= !optionsDestroyed;
    }
};

bool RestartAndAlmanac(LawnApp& app, std::ostream& log) {
    bool passed = true;
    for (bool almanac : {false, true}) for (Action action : {Action::No, Action::Yes, Action::Kill,
        Action::AcceptedReplace, Action::AcceptedKill, Action::AcceptedCloseParent}) {
        if (almanac && action != Action::No && action != Action::Kill) continue;
        StartBoard(app); auto* original = app.mBoard;
        bool destroyed = false;
        auto* options = OpenOptions(app, destroyed);
        const int control = almanac ? options->mAlmanacButton->mId : options->mRestartButton->mId;
        Require((almanac ? options->mAlmanacButton : options->mRestartButton)->mVisible,
            "Requested modal control is not available on the fixture level");
        Answer reply(app, almanac ? DIALOG_ALMANAC : DIALOG_CONFIRM_RESTART, action, destroyed);
        options->ButtonDepress(control);
        bool ok = reply.answered && reply.parentAlive && !destroyed &&
            !app.GetDialog(almanac ? DIALOG_ALMANAC : DIALOG_CONFIRM_RESTART);
        if (action == Action::No) ok &= app.mBoard == original && original->mSunMoney == 555 &&
            app.GetDialog(DIALOG_NEWOPTIONS) == options && original->mPaused;
        if (action == Action::Yes) ok &= app.mBoard && app.mBoard != original &&
            !app.GetDialog(DIALOG_NEWOPTIONS) && !app.mSawYeti;
        if (action == Action::Kill || action == Action::AcceptedKill) ok &= !app.mBoard && !app.GetDialog(DIALOG_NEWOPTIONS);
        if (action == Action::AcceptedReplace) ok &= app.mBoard == reply.replacement &&
            app.mBoard->mSunMoney == 777 && !app.mBoard->mKilledYeti;
        if (action == Action::AcceptedCloseParent) ok &= app.mBoard == original && original->mSunMoney == 555 &&
            !app.GetDialog(DIALOG_NEWOPTIONS) && !original->mPaused;
        log << "nested almanac=" << almanac << " action=" << int(action) << " parent-alive=" << reply.parentAlive
            << " caller-returned-alive=" << !destroyed << " sun=" << (app.mBoard ? app.mBoard->mSunMoney : -1)
            << " same-replacement=" << (app.mBoard == reply.replacement) << " pass=" << ok << std::endl;
        app.KillBoard(); (app.*AppAccess::Cleanup)();
        Require(destroyed && !app.GetDialog(DIALOG_NEWOPTIONS) && app.mDialogMap.empty(), "Options did not retire after its caller unwound");
        passed &= ok;
    }
    return passed;
}
void NonblockingDialogs(LawnApp& app, std::ostream& log) {
    for (bool pause : {false, true}) for (Action action : {Action::No, Action::Yes, Action::Kill}) {
        if (pause && action == Action::No) continue;
        StartBoard(app); auto* original = app.mBoard;
        if (pause) app.DoPauseDialog(); else app.DoConfirmBackToMain();
        const auto id = pause ? DIALOG_PAUSED : DIALOG_CONFIRM_BACK_TO_MAIN;
        auto* dialog = app.GetDialog(id); Require(dialog && original->mPaused, "Expected a board-bound modal");
        if (action == Action::Kill) app.KillBoard();
        else dialog->Dialog::ButtonDepress(action == Action::No ? Dialog::ID_NO : Dialog::ID_YES);
        bool ok = !app.GetDialog(id);
        if (action == Action::Kill) ok &= !app.mBoard;
        else if (pause || action == Action::No) ok &= app.mBoard == original && !original->mPaused;
        else ok &= !app.mBoard && app.mGameSelector;
        log << "nonblocking pause=" << pause << " action=" << int(action) << " pass=" << ok << std::endl;
        Require(ok, "Pause/return-to-menu dialog did not preserve its normal result or teardown policy");
        app.KillBoard(); app.KillGameSelector(); (app.*AppAccess::Cleanup)();
    }
}
class QueueWitness final : public Widget {
    bool& destroyed;
public:
    explicit QueueWitness(bool& value) : destroyed(value) {}
    ~QueueWitness() override { destroyed = true; }
};
class WaitWitness final : public Dialog {
    bool& destroyed;
public:
    explicit WaitWitness(bool& value) : Dialog(nullptr, nullptr, 8117, true, (""), (""), (""), BUTTONS_NONE), destroyed(value) {}
    ~WaitWitness() override { destroyed = true; }
};
class CloseAndCollect final : public Widget {
    LawnApp& app; bool& destroyed;
public:
    bool responded = false, aliveAfterCollection = false;
    CloseAndCollect(LawnApp& a, bool& value) : app(a), destroyed(value) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE; app.mWidgetManager->AddWidget(this);
    }
    ~CloseAndCollect() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        if (responded || !app.GetDialog(8117)) return;
        responded = true; app.KillDialog(8117);
        // Exercise actual collection before UpdateAppStep returns to the
        // waiting dialog. No dereference of its storage if this test fails.
        (app.*AppAccess::Cleanup)(); aliveAfterCollection = !destroyed;
        Require(aliveAfterCollection, "The real waiting dialog was destroyed before its wait returned");
    }
};
void HoldsAndQueue(LawnApp& app, std::ostream& log) {
    Require(app.mUpdateAppDepth == 0, "Queue ownership probe must run outside a nested update");
    struct RestoreDepth { LawnApp& app; ~RestoreDepth() { app.mUpdateAppDepth = 0; } } restore{app};
    for (int depth : {0, 1, 2, 3}) {
        bool firstDead = false, secondDead = false;
        auto* first = new QueueWitness(firstDead); auto* second = new QueueWitness(secondDead);
        app.mUpdateAppDepth = depth; app.SafeDeleteWidget(first); app.SafeDeleteWidget(second);
        {
            WidgetLifetimeHold outer(*first);
            {
                WidgetLifetimeHold inner(*first);
                app.mUpdateAppDepth = depth+1; (app.*AppAccess::Cleanup)();
                Require(!firstDead && !secondDead, "Nested update deleted an outer-depth widget");
                app.mUpdateAppDepth = depth; (app.*AppAccess::Cleanup)();
                Require(!firstDead && secondDead && first->mDeferredDeleteHolds == 2,
                    "Hold failed to keep its object alive or blocked unrelated cleanup");
            }
            (app.*AppAccess::Cleanup)();
            Require(!firstDead && first->mDeferredDeleteHolds == 1, "Inner hold release erased the outer lifetime");
        }
        (app.*AppAccess::Cleanup)(); Require(firstDead, "Released widget remained in the deletion queue");
        log << "queue depth=" << depth << " nested-two-holds=1 unrelated-deleted=1 released-deleted=1" << std::endl;
    }
    app.mUpdateAppDepth = 0;
    struct ProbeUnwind {};
    bool destroyed = false; auto* widget = new QueueWitness(destroyed);
    try { WidgetLifetimeHold hold(*widget); app.SafeDeleteWidget(widget); throw ProbeUnwind{}; }
    catch (const ProbeUnwind&) {}
    (app.*AppAccess::Cleanup)(); Require(destroyed, "Exception unwinding leaked the lifetime hold");
    log << "queue-exception-unwind-released=1" << std::endl;
    bool waitDestroyed = false;
    auto* waiting = new WaitWitness(waitDestroyed); waiting->SetVisible(false);
    app.AddDialog(8117, waiting);
    {
        CloseAndCollect responder(app, waitDestroyed);
        Require(waiting->WaitForResult(true) == 0 && responder.responded && responder.aliveAfterCollection && !waitDestroyed,
            "Actual Dialog::WaitForResult did not retain its result/object through nested collection");
    }
    (app.*AppAccess::Cleanup)(); Require(waitDestroyed, "Completed modal wait retained its object");
    log << "actual-dialog-wait-collected-inside-step=1 retained-until-return=1 then-deleted=1" << std::endl;
    Report("portable-modal-real-wait-retained-through-nested-collection", app);
    Report("portable-modal-four-depths-nested-holds-independent-cleanup-unwind", app);
}
}

void PortableModalLifetimeSmokeTick(LawnApp& app) {
    static unsigned stage = 0; static std::uint32_t deadline = 0;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Modal lifetime probe must be hidden and isolated");
    if (!stage) {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); stage = 1; deadline = app.mUpdateCount+100; return;
    }
    if (stage != 1 || app.mUpdateCount < deadline) return;
    stage = 2;
    std::ofstream log(ProbePath("modal-lifetime-cases.txt")); Require(bool(log), "Cannot write modal lifetime evidence");
    HoldsAndQueue(app, log);
    const bool nested = RestartAndAlmanac(app, log);
    NonblockingDialogs(app, log);
    StartBoard(app); PortableMessageFocusSmoke(app);
    PortableCreditsPauseSmoke(app); StartBoard(app);
    PortableZombatarDeleteSmoke(app); StartBoard(app);
    PortableChooserLifetimeSmoke(app); StartBoard(app);
    PortableStorePurchaseSmoke(app); StartBoard(app);
    PortableSelectorLifetimeSmoke(app); StartBoard(app);
    PortableDaveUpgradeSmoke(app); StartBoard(app);
    app.mBoard->MarkAllDirty(); Require(app.mWidgetManager->DrawScreen(), "Final modal fixture did not draw");
    ProbeScreenshot(app);
    Require(nested, "A completed restart request affected a replacement board or its caller died during the wait");
    Report("portable-modal-eight-nested-five-pause-return-lifecycles", app);
    Report("PASS modal-lifetime; nested restart/almanac, pause/back and deferred parent destruction", app);
    app.CloseRequestAsync();
}
