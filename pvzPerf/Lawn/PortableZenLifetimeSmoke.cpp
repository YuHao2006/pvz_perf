#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Plant.h"
#include "CursorObject.h"
#include "Cutscene.h"
#include "ZenGarden.h"
#include "System/PlayerInfo.h"
#include "Widget/TitleScreen.h"
#include "Widget/LawnDialog.h"
#include "Widget/GameButton.h"
#include "widget/WidgetManager.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "graphics/GpuBackend.h"
#include <array>
#include <fstream>
#include <limits>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok, const char* why) { if (!ok) throw std::runtime_error(why); }
struct AppAccess : LawnApp { static constexpr auto Cleanup = &AppAccess::ProcessSafeDeleteList; };
Plant* Pot(LawnApp& app, int index) {
    Plant* result = nullptr;
    Plant* p = nullptr;
    while (app.mBoard->IteratePlants(p)) if (!p->mDead && p->mPottedPlantIndex == index) {
        Require(!result, "Duplicate live plant for one potted index"); result = p;
    }
    Require(result, "Missing fixture potted plant"); return result;
}
void StartGarden(LawnApp& app, bool resetProfile = true) {
    app.KillBoard(); app.KillGameSelector();
    // No forced safe deletion inside an active modal stack.
    if (!app.mUpdateAppDepth) (app.*AppAccess::Cleanup)();
    auto& player = *app.mPlayerInfo;
    if (resetProfile) {
        player.mFinishedAdventure = 1; player.mLevel = 50; player.mCoins = 1000;
        player.mNumPottedPlants = 3; player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL] = 0;
        player.mPurchases[STORE_ITEM_MUSHROOM_GARDEN] = 1;
        player.mPurchases[STORE_ITEM_AQUARIUM_GARDEN] = 0;
        player.mPurchases[STORE_ITEM_TREE_OF_WISDOM] = 0;
        for (int i = 0; i < 3; ++i) {
            auto& pot = player.mPottedPlant[i]; pot.InitializePottedPlant(SEED_MARIGOLD);
            pot.mX = 1+i; pot.mY = 1; pot.mFeedingsPerGrow = 5;
            pot.mPlantAge = PLANTAGE_FULL;
        }
    }
    app.mZenGarden->mGardenType = GARDEN_MAIN;
    app.PreNewGame(GAMEMODE_LIMBO_ZEN_GARDEN, false);
    app.mBoard->mCutScene->CancelIntro(); app.mBoard->mTutorialState = TUTORIAL_OFF;
    Require(app.mZenGarden->mBoard == app.mBoard, "Garden owner was not initialized");
}
enum class Action { Yes, No, Replace, Remove, Room, DestroyBoard, AcceptedRebuild,
    AcceptedDestroyBoard, AcceptedRoomRoundTrip, AcceptedDifferentMode };
constexpr std::array actions{Action::Yes, Action::No, Action::Replace, Action::Remove,
    Action::Room, Action::DestroyBoard, Action::AcceptedRebuild, Action::AcceptedDestroyBoard,
    Action::AcceptedRoomRoundTrip, Action::AcceptedDifferentMode};

class SaleReply final : public Widget {
    LawnApp& app;
    Action action;
    unsigned oldID;
    std::ostream& log;
    unsigned updates = 0;
public:
    bool answered = false, ownerCancelled = true, idReused = false;
    SaleReply(LawnApp& a, Action which, unsigned id, std::ostream& out)
        : app(a), action(which), oldID(id), log(out) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~SaleReply() override { if (mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        if (answered) return;
        Require(++updates < 500, "Sale modal responder never became ready");
        auto* dialog = dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_ZEN_SELL));
        if (!dialog || (dialog->mButtonDelay >= 0 && dialog->mUpdateCnt <= unsigned(dialog->mButtonDelay))) return;
        Require(app.mUpdateAppDepth > 0, "Sale response did not run in the real nested wait");
        answered = true;
        if (action == Action::Room || action == Action::DestroyBoard) {
            if (action == Action::Room) app.mZenGarden->GotoNextGarden(); else app.KillBoard();
            ownerCancelled = !app.GetDialog(DIALOG_ZEN_SELL);
            log << "owner-transition action=" << int(action) << " cancelled=" << ownerCancelled << std::endl;
            // Failure-only fixture cleanup: never wait forever or confirm a sale
            // against a destroyed board. This cannot turn a failed case into PASS.
            if (!ownerCancelled) dialog->ButtonDepress(Dialog::ID_NO);
            return;
        }
        if (action >= Action::AcceptedRebuild) {
            // The Yes callback closes/unregisters its dialog before the nested
            // message step returns. A later event in that same step can replace
            // the board; a new DataArray may reuse the old full PlantID.
            dialog->ButtonDepress(Dialog::ID_YES);
            if (action == Action::AcceptedRebuild) {
                StartGarden(app, false);
                idReused = app.mBoard->mPlants.DataArrayGetID(Pot(app, 0)) == oldID;
                log << "accepted-before-rebuild full-plant-id-reused=" << idReused << std::endl;
            } else if (action == Action::AcceptedDestroyBoard) app.KillBoard();
            else if (action == Action::AcceptedRoomRoundTrip) {
                app.mZenGarden->GotoNextGarden(); app.mZenGarden->GotoNextGarden();
            } else app.PreNewGame(GAMEMODE_MINIGAME_WAR_AND_PEAS, false);
            return;
        }
        if (action == Action::Replace || action == Action::Remove) {
            auto* old = app.mBoard->mPlants.DataArrayTryToGet(oldID);
            Require(old, "Sale target vanished before the injected replacement");
            app.mZenGarden->RemovePottedPlant(old); app.mBoard->ProcessDeleteQueue();
            app.mEffectSystem->ProcessDeleteQueue();
            if (action == Action::Replace) {
                auto* replacement = app.mZenGarden->PlacePottedPlant(0);
                Require(app.mBoard->mPlants.DataArrayGetID(replacement) != oldID, "Same-board replacement reused a live generation");
            }
        }
        dialog->ButtonDepress(action == Action::No ? Dialog::ID_NO : Dialog::ID_YES);
    }
};

bool Sales(LawnApp& app, std::ostream& log) {
    bool passed = true;
    for (unsigned round = 0; round < 2; ++round) for (Action action : actions) {
        StartGarden(app);
        // Exercise unsigned generation rollover without billions of transitions.
        if (round) app.mZenGarden->mSaleRevision = std::numeric_limits<std::uint64_t>::max()-1;
        auto* target = Pot(app, 0); auto& player = *app.mPlayerInfo;
        const int price = app.mZenGarden->GetPlantSellPrice(target);
        const unsigned id = app.mBoard->mPlants.DataArrayGetID(target);
        SaleReply response(app, action, id, log);
        app.mZenGarden->MouseDownWithMoneySign(target);
        const bool sold = action == Action::Yes;
        bool ok = response.answered && response.ownerCancelled && !app.GetDialog(DIALOG_ZEN_SELL) &&
            player.mCoins == 1000 + (sold ? price : 0) && player.mNumPottedPlants == (sold ? 2 : 3);
        if (action == Action::Yes) {
            ok &= app.mBoard->mCoinsCollected == price && Pot(app, 0)->mPlantCol == 2 && Pot(app, 1)->mPlantCol == 3;
        }
        if (action == Action::DestroyBoard || action == Action::AcceptedDestroyBoard) ok &= !app.mBoard && !app.mZenGarden->mBoard;
        if (action == Action::Room) ok &= app.mZenGarden->mGardenType == GARDEN_MUSHROOM;
        if (action == Action::AcceptedRebuild) ok &= response.idReused && app.mBoard->mCoinsCollected == 0;
        if (action == Action::AcceptedRoomRoundTrip) ok &= app.mZenGarden->mGardenType == GARDEN_MAIN;
        if (action == Action::AcceptedDifferentMode) ok &= app.mBoard && !app.mZenGarden->mBoard &&
            app.mGameMode == GAMEMODE_MINIGAME_WAR_AND_PEAS;
        log << "sale round=" << round << " action=" << int(action) << " coins=" << player.mCoins << " count=" << player.mNumPottedPlants
            << " price=" << price << " pass=" << ok << std::endl;
        passed &= ok;
    }
    return passed;
}
void Fertilizer(LawnApp& app, std::ostream& log) {
    for (int hold = 0; hold < 3; ++hold) {
        StartGarden(app);
        auto& garden = *app.mZenGarden; auto& board = *app.mBoard;
        auto* old = Pot(app, 0); garden.RemovePottedPlant(old); board.ProcessDeleteQueue();
        app.mEffectSystem->ProcessDeleteQueue();
        app.mPlayerInfo->mPottedPlant[0].mPlantAge = PLANTAGE_SPROUT;
        old = garden.PlacePottedPlant(0);
        const auto oldID = static_cast<PlantID>(board.mPlants.DataArrayGetID(old));
        const auto otherID = static_cast<PlantID>(board.mPlants.DataArrayGetID(Pot(app, 1)));
        board.mCursorObject->mCursorType = hold ? CURSOR_TYPE_PLANT_FROM_GLOVE : CURSOR_TYPE_NORMAL;
        board.mCursorObject->mGlovePlantID = hold == 1 ? oldID : otherID;
        garden.PlantFertilized(old);
        auto* grown = Pot(app, 0); const auto newID = static_cast<PlantID>(board.mPlants.DataArrayGetID(grown));
        Require(newID != oldID && app.mPlayerInfo->mPottedPlant[0].mPlantAge == PLANTAGE_SMALL &&
            board.mCursorObject->mGlovePlantID == (hold == 1 ? newID : otherID),
            "Fertilization lost its replacement or changed the unrelated glove target");
        board.ProcessDeleteQueue(); app.mEffectSystem->ProcessDeleteQueue();
        Require(!board.mPlants.DataArrayTryToGet(oldID) && board.mPlants.DataArrayTryToGet(newID),
            "Fertilization did not retire the old plant and retain the replacement");
        board.ClearCursor();
        log << "fertilizer hold=" << hold << " old=" << unsigned(oldID) << " replacement=" << unsigned(newID) << " pass=1" << std::endl;
    }
}
}

void PortableZenLifetimeSmokeTick(LawnApp& app) {
    static unsigned stage = 0;
    static std::uint32_t deadline = 0;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Zen lifetime probe must be isolated, silent and hidden");
    if (stage == 0) {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); deadline = app.mUpdateCount + 100; stage = 1; return;
    }
    if (stage != 1 || app.mUpdateCount < deadline) return;
    stage = 2; // Nested message pumping must not recursively run this suite.
    std::ofstream log(ProbePath("zen-lifetime-cases.txt")); Require(bool(log), "Cannot write Zen lifetime evidence");
    const bool sales = Sales(app, log);
    Fertilizer(app, log);
    StartGarden(app);
    app.mBoard->MarkAllDirty(); Require(app.mWidgetManager->DrawScreen(), "Final garden redraw failed");
    ProbeScreenshot(app);
    log << "sale-cases=20 fertilizer-cases=3 sales-pass=" << sales << std::endl;
    Require(sales, "Sale survived its owner transition or committed against a replacement board");
    Report("portable-zen-20-sale-transactions-three-glove-replacements", app);
    Report("PASS zen-lifetime; nested sale cancellation, owner replacement, normal sale and glove generations", app);
    app.CloseRequestAsync();
}
