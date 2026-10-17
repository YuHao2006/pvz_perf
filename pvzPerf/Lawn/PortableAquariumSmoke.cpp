#include "Sexy.TodLib/generated/EntityStrings.h"
#include "ModernVulkanSmoke.h"
#include "PortablePortalSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "Zombie.h"
#include "GridItem.h"
#include "ToolTipWidget.h"
#include "SeedPacket.h"
#include "Cutscene.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "graphics/DDImage.h"
#include "widget/WidgetManager.h"
#include "graphics/GpuBackend.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <fstream>
#include <limits>
#include <stdexcept>
#include <vector>

namespace
{
using namespace ModernSmoke;
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
bool Near(float a, float b) { return std::abs(a - b) < 0.0002f; }

bool ArrowAlive(LawnApp& app)
{
    const auto* arrow = app.ParticleTryToGet(app.mBoard->mTutorialParticleID);
    return arrow && !arrow->mDead;
}

void ResetSwimmer(Zombie& zombie, float x, float heading)
{
    zombie.mPosX = x;
    zombie.mPosY = 250.0f;
    zombie.mX = static_cast<int>(x);
    zombie.mY = 250;
    zombie.mVelX = 0.3f;
    zombie.mVelZ = heading;
    zombie.mZombiePhase = PHASE_ZOMBIQUARIUM_BACK_AND_FORTH;
    zombie.mPhaseCounter = 10000;
    zombie.mSummonCounter = 10000;
    zombie.mZombieAge = 1; // No starvation/sun/random phase changes during this focused probe.
}

bool MovementCases(LawnApp& app, Zombie& zombie, std::ostream& log)
{
    bool passed = true;
    unsigned cases = 0;
    for (float x : {150.0f, 199.0f, 200.0f, 201.0f, 300.0f, 549.0f, 550.0f, 551.0f, 600.0f})
    {
        for (float heading : {0.0f, static_cast<float>(PI)})
        {
            ResetSwimmer(zombie, x, heading);
            const float direction = std::cos(heading);
            float expected = heading;
            if (x < 200.0f && direction < 0.0f) expected = 0.0f;
            if (x > 550.0f && direction > 0.0f) expected = PI;
            zombie.UpdateZombiquarium();
            // 1073 computes this tick's displacement before changing heading.
            const bool correct = Near(zombie.mVelZ, expected) &&
                Near(zombie.mPosX, x + direction * 0.3f) && Near(zombie.mVelX, 0.3f) &&
                zombie.mZombiePhase == PHASE_ZOMBIQUARIUM_BACK_AND_FORTH;
            passed &= correct;
            ++cases;
            log << "turn x=" << x << " heading=" << heading << " result=" << zombie.mVelZ
                << " expected=" << expected << " pass=" << correct << '\n';
        }
    }

    ResetSwimmer(zombie, 250.0f, 0.0f);
    unsigned leftTurns = 0, rightTurns = 0;
    float minimum = zombie.mPosX, maximum = zombie.mPosX;
    for (int tick = 0; tick < 3000; ++tick)
    {
        const float x = zombie.mPosX, heading = zombie.mVelZ;
        const float direction = std::cos(heading);
        float expected = heading;
        if (x < 200.0f && direction < 0.0f) { expected = 0.0f; ++rightTurns; }
        if (x > 550.0f && direction > 0.0f) { expected = PI; ++leftTurns; }
        zombie.UpdateZombiquarium();
        passed &= Near(zombie.mVelZ, expected) && Near(zombie.mPosX, x + direction * 0.3f);
        minimum = std::min(minimum, zombie.mPosX);
        maximum = std::max(maximum, zombie.mPosX);
    }
    passed &= cases == 18 && leftTurns >= 1 && rightTurns >= 1 && minimum >= 199.3f && maximum <= 550.7f;
    log << "continuous ticks=3000 left=" << leftTurns << " right=" << rightTurns
        << " min=" << minimum << " max=" << maximum << " pass=" << passed << std::endl;
    if (passed) Report("portable-aquarium-18-turn-cases-and-3000-swim-updates", app);
    return passed;
}

bool TutorialCases(LawnApp& app, std::ostream& log)
{
    auto& board = *app.mBoard;
    bool passed = true;
    unsigned cases = 0;
    const std::array<int, 12> scores = {-1, 0, 99, 100, 109, 110, 899, 900, 999, 1000, 1001,
        (std::numeric_limits<int>::max)()};
    for (auto initial : {TUTORIAL_OFF, TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL,
        TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL, TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY})
    {
        for (int score : scores)
        {
            board.TutorialArrowRemove();
            app.mEffectSystem->ProcessDeleteQueue();
            board.mTutorialState = initial;
            board.mSunMoney = score;
            if (initial == TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL || initial == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY)
                board.TutorialArrowShow(100, 80);
            auto expected = initial;
            const int clamped = std::clamp(score, 0, 1000);
            if (clamped >= 110 && expected == TUTORIAL_OFF) expected = TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL;
            else if (clamped < 100 && expected == TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL) expected = TUTORIAL_OFF;
            if (clamped >= 1000 && expected == TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL)
                expected = TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY;
            else if (clamped < 1000 && expected == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY)
                expected = TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL;
            board.mChallenge->ZombiquariumUpdate();
            const bool wantsArrow = expected == TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL ||
                expected == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY;
            const bool correct = board.mTutorialState == expected && ArrowAlive(app) == wantsArrow &&
                board.mSunMoney == score && !board.HasLevelAwardDropped();
            passed &= correct;
            ++cases;
            log << "tutorial state=" << int(initial) << " sun=" << score << " result=" << int(board.mTutorialState)
                << " expected=" << int(expected) << " arrow=" << ArrowAlive(app) << " pass=" << correct << '\n';
        }
    }
    board.TutorialArrowRemove();
    app.mEffectSystem->ProcessDeleteQueue();
    board.mSunMoney = 1000;
    board.mTutorialState = TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL;
    board.mChallenge->ZombiquariumUpdate();
    const auto arrow = board.mTutorialParticleID;
    bool stable = ArrowAlive(app);
    for (int tick = 0; tick < 240; ++tick)
    {
        board.mChallenge->ZombiquariumUpdate();
        stable &= board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY &&
            board.mTutorialParticleID == arrow && ArrowAlive(app);
    }
    passed &= cases == 48 && stable;
    log << "tutorial cases=" << cases << " threshold-stable-ticks=240 stable=" << stable
        << " pass=" << passed << std::endl;
    if (passed) Report("portable-aquarium-48-tutorial-cases-and-stable-threshold", app);
    return passed;
}

bool PresentationCases(LawnApp& app, Zombie& swimmer, std::ostream& log)
{
    auto& board = *app.mBoard;
    const int oldWave = swimmer.mFromWave;
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    screen->FillRect(Rect(0, 0, 800, 600), Color(180, 190, 200), 0);
    render.Flush();
    const auto baseline = render.mRenderer->ReadScenePixels();
    Graphics graphics(screen);
    graphics.Translate(300, 150);
    const bool hidden = !swimmer.HasShadow();
    if (swimmer.HasShadow()) swimmer.DrawShadow(&graphics);
    render.Flush();
    const bool unchanged = baseline == render.mRenderer->ReadScenePixels();
    // 1073 excludes only on-board aquarium actors: UI previews retain shadows.
    swimmer.mFromWave = Zombie::ZOMBIE_WAVE_UI;
    const bool previewShadow = swimmer.HasShadow();
    screen->FillRect(Rect(0, 0, 800, 600), Color(180, 190, 200), 0);
    if (previewShadow) swimmer.DrawShadow(&graphics);
    render.Flush();
    const bool previewChanged = baseline != render.mRenderer->ReadScenePixels();
    swimmer.mFromWave = oldWave;
    const bool shadowPassed = hidden && unchanged && previewShadow && previewChanged;

    auto& manager = *app.mWidgetManager;
    struct RestoreMouse
    {
        LawnApp& app; WidgetManager& manager; Board& board;
        bool active, inside, paused; int x, y;
        ~RestoreMouse() { app.mActive = active; manager.mMouseIn = inside; board.mPaused = paused;
            manager.mLastMouseX = x; manager.mLastMouseY = y; }
    } restore{app, manager, board, app.mActive, manager.mMouseIn, board.mPaused, manager.mLastMouseX, manager.mLastMouseY};
    app.mActive = true; manager.mMouseIn = true;
    board.mPaused = false; // Tooltip eligibility excludes paused boards. No game tick runs in this scope.
    auto& packet = board.mSeedBank->mSeedPackets[0];
    manager.mLastMouseX = board.mX + board.mSeedBank->mX + packet.mX + 10;
    manager.mLastMouseY = board.mY + board.mSeedBank->mY + packet.mY + 10;
    board.UpdateToolTip(); // Game-local logical mouse only; no OS input or focus change.
    const SexyString expected = EntityTranslate(gStr.ZOMBIQUARIUM_SNORKEL_TOOLTIP);
    const bool tooltipPassed = !expected.empty() && expected.find("Missing") == SexyString::npos &&
        board.mToolTip->mVisible && board.mToolTip->mLabel == expected;
    log << "shadow hidden=" << hidden << " gpu-unchanged=" << unchanged << " ui-preview=" << previewShadow
        << " preview-pixels=" << previewChanged << " pass=" << shadowPassed << '\n';
    log << "snorkel-tooltip actual='" << board.mToolTip->mLabel << "' expected='" << expected
        << "' visible=" << board.mToolTip->mVisible << " pass=" << tooltipPassed << std::endl;
    if (shadowPassed && tooltipPassed) Report("portable-aquarium-shadow-gpu-and-real-tooltip", app);
    return shadowPassed && tooltipPassed;
}

void PurchaseFeedCases(LawnApp& app, Zombie& swimmer)
{
    auto& board = *app.mBoard;
    auto& challenge = *board.mChallenge;
    board.TutorialArrowRemove();
    board.mSunMoney = 110;
    board.mTutorialState = TUTORIAL_OFF;
    challenge.ZombiquariumUpdate();
    Require(board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL && ArrowAlive(app), "Buy-snorkel tutorial did not appear");
    const auto zombiesBefore = board.mZombies.mSize;
    challenge.ZombiquariumPacketClicked(&board.mSeedBank->mSeedPackets[0]);
    Require(board.mZombies.mSize == zombiesBefore + 1 && board.mSunMoney == 10 &&
        board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL && !ArrowAlive(app), "Actual snorkel purchase did not advance tutorial");

    board.mSunMoney = 1000;
    challenge.ZombiquariumUpdate();
    Require(board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY && ArrowAlive(app), "Trophy tutorial not shown at 1000");
    const auto itemsBefore = board.mGridItems.mSize;
    challenge.ZombiquariumMouseDown(400, 250); // Real game handler, not OS input.
    Require(board.mSunMoney == 995 && board.mGridItems.mSize == itemsBefore + 1, "Feeding did not spend 5 sun and create a brain");
    challenge.ZombiquariumUpdate();
    Require(board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL && !ArrowAlive(app), "Falling below goal lost the purchased-snorkel state");
    board.mSunMoney += 5;
    challenge.ZombiquariumUpdate();
    Require(board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY && ArrowAlive(app), "Trophy hint failed to return without another purchase");
    GridItem* brain = nullptr;
    GridItem* item = nullptr;
    while (board.IterateGridItems(item)) if (item->mGridItemType == GRIDITEM_BRAIN && !item->mDead) brain = item;
    Require(brain != nullptr, "Feed brain not found");
    brain->mGridItemCounter = 15;
    ResetSwimmer(swimmer, brain->mPosX + 15.0f - 50.0f, 0.0f);
    swimmer.mPosY = brain->mPosY + 15.0f - 40.0f;
    swimmer.mBodyHealth = swimmer.mBodyMaxHealth - 200;
    swimmer.UpdateZombiquarium();
    Require(brain->mDead && swimmer.mBodyHealth == swimmer.mBodyMaxHealth &&
        swimmer.mZombiePhase == PHASE_ZOMBIQUARIUM_BITE, "Actual brain consumption did not restore health and start bite");
    board.ProcessDeleteQueue();
    Report("portable-aquarium-buy-feed-fall-and-recover-trophy", app);
}

struct SwimmerState
{
    unsigned id;
    float x, y, velocity, heading;
    int phase, health;
    bool operator==(const SwimmerState&) const = default;
};
std::vector<SwimmerState> Snapshot(Board& board)
{
    std::vector<SwimmerState> result;
    Zombie* zombie = nullptr;
    while (board.IterateZombies(zombie)) result.push_back({board.mZombies.DataArrayGetID(zombie),
        zombie->mPosX, zombie->mPosY, zombie->mVelX, zombie->mVelZ, int(zombie->mZombiePhase), zombie->mBodyHealth});
    return result;
}
}

void ModernVulkanAquariumSmokeTick(LawnApp& app)
{
    using namespace ModernSmoke;
    static int stage = 0;
    static std::uint32_t started = 0, deadline = 0;
    static bool playingObserved = false;
    static std::vector<SwimmerState> saved;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded,
        "Aquarium probe is not isolated and silent");
    Require(app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Aquarium probe became visible");
    if (stage == 0)
    {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted();
        started = app.mUpdateCount; deadline = started + 100; stage = 1; return;
    }
    if (stage == 5) return;
    Require(app.mUpdateCount - started < 3500, "Aquarium smoke timed out");
    if (app.mUpdateCount < deadline) return;
    if (stage == 7)
    {
        Require(!app.mBoard && app.mGameSelector, "Aquarium trophy board did not return to menu");
        RequireDeletionBoundary(app, "aquarium-loaded-board-deleted");
        Report("portable-aquarium-five-deferred-deletion-boundaries", app);
        Report("PASS aquarium; original boundaries, tutorial recovery, purchase, feeding and dat64", app);
        app.CloseRequestAsync(); stage = 5; return;
    }
    if (stage == 1)
    {
        RequireDeletionBoundary(app, "aquarium-title-to-menu");
        app.KillGameSelector();
        app.mPlayerInfo->mFinishedAdventure = 1;
        app.mPlayerInfo->mLevel = 50;
        app.PreNewGame(GAMEMODE_MINIGAME_ZOMBIQUARIUM, false);
        app.mBoard->mCutScene->CancelIntro(); stage = 2; return;
    }
    if (stage == 2)
    {
        if (app.mGameScene != SCENE_PLAYING) return;
        if (!playingObserved)
        {
            playingObserved = true;
            deadline = app.mUpdateCount + 2; // Let the normal board tick retire intro zombies.
            return;
        }
        RequireDeletionBoundary(app, "aquarium-selector-deleted");
        auto& board = *app.mBoard;
        std::ofstream log(ProbePath("aquarium-cases.txt"));
        Require(bool(log), "Cannot write aquarium case evidence");
        log << "startup background=" << int(board.mBackground) << " zombies=" << board.mZombies.mSize
            << " packets=" << board.mSeedBank->mNumPackets << " seed0=" << int(board.mSeedBank->mSeedPackets[0].mPacketType)
            << " seed1=" << int(board.mSeedBank->mSeedPackets[1].mPacketType) << std::endl;
        const bool startup = board.mBackground == BACKGROUND_ZOMBIQUARIUM && board.mZombies.mSize == 2 &&
            board.mSeedBank->mNumPackets == 2 && board.mSeedBank->mSeedPackets[0].mPacketType == SEED_ZOMBIQUARIUM_SNORKLE &&
            board.mSeedBank->mSeedPackets[1].mPacketType == SEED_ZOMBIQUARIUM_TROPHY;
        board.Pause(true);
        ProbeSpriteScaling(app);
        PortablePortalClosingSmoke(app);
        Zombie* swimmer = nullptr;
        while (board.IterateZombies(swimmer))
            if (!swimmer->IsDeadOrDying() && swimmer->mZombieHeight == HEIGHT_ZOMBIQUARIUM) break;
        Require(swimmer && swimmer->mZombieHeight == HEIGHT_ZOMBIQUARIUM, "Aquarium swimmer not initialized");
        const bool movement = MovementCases(app, *swimmer, log);
        const bool tutorial = TutorialCases(app, log);
        const bool presentation = PresentationCases(app, *swimmer, log);
        log << "startup-pass=" << startup << " movement-pass=" << movement << " tutorial-pass=" << tutorial
            << " presentation-pass=" << presentation << std::endl;
        Require(startup && movement && tutorial && presentation, "Aquarium differs from 1073; see aquarium-cases.txt");
        PurchaseFeedCases(app, *swimmer);
        saved = Snapshot(board);
        // The shadow pixel probe temporarily drew a synthetic flat canvas.
        // Capture only after the actual widget renderer has replaced it.
        deadline = app.mUpdateCount + 2; stage = 6; return;
    }
    if (stage == 6)
    {
        app.mBoard->MarkAllDirty();
        if (!app.mWidgetManager->DrawScreen()) return; // Real acquire/draw, not a tick-count guess.
        Capture("aquarium-threshold", app); ProbeScreenshot(app);
        Require(LawnSaveGame(app.mBoard, ProbePath("aquarium.dat64")), "Cannot save aquarium fixture");
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 3; return;
    }
    if (stage == 3)
    {
        Require(!app.mBoard && app.mGameSelector, "Aquarium did not return to menu");
        RequireDeletionBoundary(app, "aquarium-board-deleted");
        app.KillGameSelector(); app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("aquarium.dat64")), "Cannot reload aquarium dat64");
        app.mBoard->Pause(true);
        Require(Snapshot(*app.mBoard) == saved, "Aquarium swimmer state changed during load");
        deadline = app.mUpdateCount + 50; stage = 4; return;
    }
    RequireDeletionBoundary(app, "aquarium-loaded-selector-deleted");
    auto& board = *app.mBoard;
    Require(app.mGameMode == GAMEMODE_MINIGAME_ZOMBIQUARIUM && Snapshot(board) == saved &&
        board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY && board.mSunMoney == 1000,
        "Aquarium save changed after deferred cleanup");
    const auto arrow = board.mTutorialParticleID;
    board.mChallenge->ZombiquariumUpdate();
    Require(ArrowAlive(app) && board.mTutorialParticleID == arrow &&
        board.mTutorialState == TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY, "Reloaded trophy arrow did not remain stable");
    Report("portable-aquarium-dat64-menu-reload", app);
    board.mChallenge->ZombiquariumPacketClicked(&board.mSeedBank->mSeedPackets[1]);
    Require(board.mLevelAwardSpawned && app.mBoardResult == BOARDRESULT_WON && board.mSunMoney == 0,
        "Actual trophy purchase did not consume 1000 sun and spawn the level award");
    Report("portable-aquarium-buy-trophy", app);
    app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 7;
}
