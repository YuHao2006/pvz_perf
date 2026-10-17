#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "Plant.h"
#include "SeedPacket.h"
#include "Cutscene.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "widget/WidgetManager.h"
#include "graphics/GpuBackend.h"
#include <algorithm>
#include <array>
#include <cstring>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace
{
using namespace ModernSmoke;
constexpr std::array kinds{SEED_PEASHOOTER, SEED_PUFFSHROOM, SEED_WALLNUT, SEED_STARFRUIT, SEED_SNOWPEA, SEED_MAGNETSHROOM};
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
bool HasMatch(const BeghouledBoardState& state)
{
    for (int x = 0; x < 8; ++x) for (int y = 0; y < 5; ++y)
    {
        const auto seed = state.mSeedType[x][y];
        if (seed == SEED_NONE) continue;
        if (x + 2 < 8 && state.mSeedType[x + 1][y] == seed && state.mSeedType[x + 2][y] == seed) return true;
        if (y + 2 < 5 && state.mSeedType[x][y + 1] == seed && state.mSeedType[x][y + 2] == seed) return true;
    }
    return false;
}
void Rotate(BeghouledBoardState& state, int x, int y)
{
    const auto topLeft = state.mSeedType[x][y];
    state.mSeedType[x][y] = state.mSeedType[x][y + 1];
    state.mSeedType[x][y + 1] = state.mSeedType[x + 1][y + 1];
    state.mSeedType[x + 1][y + 1] = state.mSeedType[x + 1][y];
    state.mSeedType[x + 1][y] = topLeft;
}
BeghouledBoardState Empty()
{
    BeghouledBoardState result;
    for (auto& column : result.mSeedType) for (auto& seed : column) seed = SEED_NONE;
    return result;
}
BeghouledBoardState Pattern()
{
    auto result = Empty();
    for (int x = 0; x < 8; ++x) for (int y = 0; y < 5; ++y) result.mSeedType[x][y] = kinds[(x + y * 2) % kinds.size()];
    return result;
}
Plant* At(Board& board, int x, int y)
{
    auto* plant = board.GetTopPlantAt(x, y, TOPPLANT_ONLY_NORMAL_POSITION);
    Require(plant != nullptr, "Controlled Beghouled grid lost a plant");
    return plant;
}
void SetGrid(Board& board, const BeghouledBoardState& state)
{
    Plant* plant = nullptr;
    while (board.IteratePlants(plant)) plant->Die();
    board.ProcessDeleteQueue();
    for (int x = 0; x < 8; ++x) for (int y = 0; y < 5; ++y)
        if (state.mSeedType[x][y] != SEED_NONE) board.NewPlant(x, y, state.mSeedType[x][y], SEED_NONE);
    auto& challenge = *board.mChallenge;
    for (auto& column : challenge.mBeghouledEated) for (auto& eaten : column) eaten = false;
    challenge.mChallengeState = STATECHALLENGE_NORMAL;
    challenge.mChallengeStateCounter = 1500;
}

bool FallCascade(Board& board, std::ostream& log);

bool DragAndFlash(Board& board, std::ostream& log)
{
    auto& challenge = *board.mChallenge;
    const auto pattern = Pattern(); SetGrid(board, pattern);
    const int originX = board.GridToPixelX(3, 2) + 40, originY = board.GridToPixelY(3, 2) + 40;
    const std::array<std::pair<int, int>, 12> drags = {{{30, 1}, {-30, 1}, {1, 30}, {1, -30},
        {-30, -2}, {-1, -30}, {30, -40}, {-40, 30}, {10, 10}, {-10, -10}, {9, 9}, {0, -10}}};
    bool passed = true;
    for (auto [dx, dy] : drags)
    {
        auto* plant = At(board, 3, 2);
        plant->mX = board.GridToPixelX(3, 2); plant->mY = board.GridToPixelY(3, 2);
        const int oldX = plant->mX, oldY = plant->mY;
        int shiftX = 0, shiftY = 0;
        const bool threshold = std::abs(dx) >= 10 || std::abs(dy) >= 10;
        if (threshold)
        {
            if (std::abs(dx) > std::abs(dy)) shiftX = dx > 0 ? 1 : -1;
            else shiftY = dy > 0 ? 1 : -1;
            auto swapped = pattern;
            std::swap(swapped.mSeedType[3][2], swapped.mSeedType[3 + shiftX][2 + shiftY]);
            Require(!HasMatch(swapped), "Drag-bounce fixture accidentally creates a match");
        }
        challenge.BeghouledDragStart(originX, originY);
        challenge.BeghouledDragUpdate(originX + dx, originY + dy);
        const bool correct = plant->mPlantCol == 3 && plant->mRow == 2 &&
            plant->mX == oldX + 30 * shiftX && plant->mY == oldY + 30 * shiftY &&
            bool(challenge.mBeghouledMouseCapture) == !threshold;
        passed &= correct;
        log << "drag=" << dx << ',' << dy << " displacement=" << plant->mX - oldX << ',' << plant->mY - oldY
            << " pass=" << correct << '\n';
    }
    auto* plant = At(board, 3, 2);
    for (int initial : {0, 24, 25, 80, 300, 400})
    {
        plant->mEatenFlashCountdown = 17; plant->mBeghouledFlashCountdown = initial;
        challenge.BeghouledFlashPlant(3, 2, 0, 0, 1, 0);
        bool correct = plant->mEatenFlashCountdown == 17 && plant->mBeghouledFlashCountdown == std::max(300, initial);
        plant->mEatenFlashCountdown = 41; plant->mBeghouledFlashCountdown = initial;
        challenge.BeghouledCancelMatchFlashing();
        correct &= plant->mEatenFlashCountdown == 41 && plant->mBeghouledFlashCountdown == std::min(25, initial);
        passed &= correct;
        log << "flash-and-cancel initial=" << initial << " pass=" << correct << '\n';
    }
    plant->mBeghouledFlashCountdown = 300; plant->mEatenFlashCountdown = 31;
    challenge.BeghouledStartFalling(STATECHALLENGE_BEGHOULED_MOVING);
    const bool cancelled = plant->mBeghouledFlashCountdown == 25 && plant->mEatenFlashCountdown == 31 &&
        challenge.mChallengeState == STATECHALLENGE_BEGHOULED_MOVING && challenge.mChallengeStateCounter == 100;
    passed &= cancelled;
    log << "start-moving-cancels-hint pass=" << cancelled << std::endl;

    auto match = pattern;
    match.mSeedType[1][2] = SEED_PEASHOOTER;
    match.mSeedType[2][2] = SEED_PUFFSHROOM;
    match.mSeedType[3][2] = SEED_PEASHOOTER;
    match.mSeedType[2][3] = SEED_PEASHOOTER;
    Require(!HasMatch(match), "Successful drag fixture already matches");
    auto swapped = match;
    std::swap(swapped.mSeedType[2][3], swapped.mSeedType[2][2]);
    Require(HasMatch(swapped), "Successful drag fixture has no resulting match");
    SetGrid(board, match);
    auto* from = At(board, 2, 3);
    auto* to = At(board, 2, 2);
    from->mBeghouledFlashCountdown = to->mBeghouledFlashCountdown = 300;
    from->mEatenFlashCountdown = to->mEatenFlashCountdown = 31;
    const int clickX = board.GridToPixelX(2, 3) + 40, clickY = board.GridToPixelY(2, 3) + 40;
    challenge.BeghouledDragStart(clickX, clickY);
    challenge.BeghouledDragUpdate(clickX, clickY - 30);
    const bool moved = from->mPlantCol == 2 && from->mRow == 2 && to->mPlantCol == 2 && to->mRow == 3 &&
        from->mRenderOrder == from->CalcRenderOrder() && to->mRenderOrder == to->CalcRenderOrder() &&
        challenge.mChallengeState == STATECHALLENGE_BEGHOULED_MOVING && challenge.mChallengeStateCounter == 100 &&
        from->mBeghouledFlashCountdown == 25 && to->mBeghouledFlashCountdown == 25 &&
        from->mEatenFlashCountdown == 31 && to->mEatenFlashCountdown == 31;
    passed &= moved;
    log << "upward-drag-valid-match pass=" << moved << std::endl;
    // One vertical swap creates two horizontal triples. 1073 hints only the
    // first row-major triple, although actually making the move can clear both.
    auto doubleMatch=pattern;
    doubleMatch.mSeedType[2][1]=SEED_PEASHOOTER;
    doubleMatch.mSeedType[3][1]=SEED_PUFFSHROOM;
    doubleMatch.mSeedType[4][1]=SEED_PEASHOOTER;
    doubleMatch.mSeedType[2][2]=SEED_PUFFSHROOM;
    doubleMatch.mSeedType[3][2]=SEED_PEASHOOTER;
    doubleMatch.mSeedType[4][2]=SEED_PUFFSHROOM;
    Require(!HasMatch(doubleMatch),"Double-hint fixture already matches");
    auto afterSwap=doubleMatch;
    std::swap(afterSwap.mSeedType[3][1],afterSwap.mSeedType[3][2]);
    Require(challenge.BeghouledHorizontalMatchLength(2,1,&afterSwap)==3&&
        challenge.BeghouledHorizontalMatchLength(2,2,&afterSwap)==3,"Swap did not create two triples");
    SetGrid(board,doubleMatch);
    for(int x=0;x<8;++x)for(int y=0;y<5;++y){At(board,x,y)->mBeghouledFlashCountdown=0;At(board,x,y)->mEatenFlashCountdown=17;}
    const auto beforeHint=doubleMatch;
    const bool found=challenge.BeghouledFlashFromBoardState(&doubleMatch,3,1,3,2)!=0;
    unsigned highlighted=0;bool onlyFirst=found;
    for(int x=0;x<8;++x)for(int y=0;y<5;++y){
        const bool expected=(x==2&&y==1)||(x==3&&y==2)||(x==4&&y==1);
        auto* plant=At(board,x,y);highlighted+=plant->mBeghouledFlashCountdown!=0;
        onlyFirst &= plant->mBeghouledFlashCountdown==(expected?300:0)&&plant->mEatenFlashCountdown==17;
    }
    onlyFirst &= std::memcmp(&doubleMatch,&beforeHint,sizeof(doubleMatch))==0;
    log<<"two-match-first-hint highlighted="<<highlighted<<" expected=3 pass="<<onlyFirst<<std::endl;
    passed &= onlyFirst;
    passed &= FallCascade(board, log);
    SetGrid(board, pattern);
    return passed;
}

bool FallCascade(Board& board, std::ostream& log)
{
    // 回归（2026-10-04 B 树实机抓获）：BeghouledFallIntoSquare 直写 mRow 曾
    // 不过格桶——叠双洞级联时第二次下落按失步桶取到已落植物重复搬移，桶与
    // 池分家后 GetTopPlantAt 全瞎（拖拽异常+卡死）。直驱公共接口复现级联，
    // 断言终局布局与桶读一致；修复前 y=3 的下落会把已落 y=4 的同一株再搬。
    auto& challenge = *board.mChallenge;
    auto grid = Pattern();
    grid.mSeedType[4][3] = SEED_NONE;
    grid.mSeedType[4][4] = SEED_NONE;
    Require(!HasMatch(grid), "Fall cascade fixture already matches");
    SetGrid(board, grid);
    const SeedType seed2 = grid.mSeedType[4][2];
    const SeedType seed1 = grid.mSeedType[4][1];
    const SeedType seed0 = grid.mSeedType[4][0];
    BeghouledBoardState state;
    challenge.LoadBeghouledBoardState(&state);
    challenge.BeghouledMakePlantsFall(&state);
    auto* at4 = board.GetTopPlantAt(4, 4, TOPPLANT_ONLY_NORMAL_POSITION);
    auto* at3 = board.GetTopPlantAt(4, 3, TOPPLANT_ONLY_NORMAL_POSITION);
    auto* at2 = board.GetTopPlantAt(4, 2, TOPPLANT_ONLY_NORMAL_POSITION);
    const bool passed = at4 != nullptr && at4->mSeedType == seed2 &&
        at3 != nullptr && at3->mSeedType == seed1 && at3 != at4 &&
        at2 != nullptr && at2->mSeedType == seed0 && at2 != at4 && at2 != at3 &&
        board.GetTopPlantAt(4, 1, TOPPLANT_ONLY_NORMAL_POSITION) == nullptr &&
        board.GetTopPlantAt(4, 0, TOPPLANT_ONLY_NORMAL_POSITION) == nullptr;
    log << "fall-cascade-stacked-holes bottom=" << (at4 ? int(at4->mSeedType) : -1)
        << " mid=" << (at3 ? int(at3->mSeedType) : -1)
        << " top=" << (at2 ? int(at2->mSeedType) : -1)
        << " pass=" << passed << std::endl;
    return passed;
}

bool ShopAndCrater(Board& board, std::ostream& log)
{
    auto& challenge = *board.mChallenge;
    challenge.BeghouledScore(0, 0, 3, true); // The first score unlocks the actual four shop packets.
    Require(board.mSeedBank->mNumPackets == 4, "First score did not unlock four shop packets");
    bool passed = true;
    const std::array primary{SEED_PEASHOOTER, SEED_PUFFSHROOM, SEED_WALLNUT};
    const std::array upgraded{SEED_REPEATER, SEED_FUMESHROOM, SEED_TALLNUT};
    for (int index = 0; index < 3; ++index)
    {
        board.mSunMoney = 5000;
        auto& packet = board.mSeedBank->mSeedPackets[index];
        Require(packet.mPacketType == upgraded[index] && packet.mActive, "Upgrade packet not initialized");
        const int cost = board.GetCurrentPlantCost(packet.mPacketType, SEED_NONE);
        std::vector<std::pair<int, int>> cells;
        Plant* plant = nullptr;
        while (board.IteratePlants(plant)) if (plant->mSeedType == primary[index]) cells.emplace_back(plant->mPlantCol, plant->mRow);
        challenge.BeghouledPacketClicked(&packet);
        bool correct = !cells.empty() && board.mSunMoney == 5000 - cost && challenge.mBeghouledPurcasedUpgrade[index] && !packet.mActive;
        for (auto [x, y] : cells) correct &= At(board, x, y)->mSeedType == upgraded[index];
        board.ProcessDeleteQueue();
        const int afterFirstPurchase = board.mSunMoney;
        board.mPaused = false;
        packet.MouseDown(0, 0, 1); // Actual input eligibility; no OS input.
        board.mPaused = true;
        correct &= board.mSunMoney == afterFirstPurchase;
        passed &= correct;
        log << "upgrade=" << index << " active=" << packet.mActive << " pass=" << correct << '\n';
    }
    auto* eaten = At(board, 2, 2);
    challenge.ZombieAtePlant(eaten); eaten->Die(); board.ProcessDeleteQueue();
    auto& packet = board.mSeedBank->mSeedPackets[4];
    const bool unlocked = board.mSeedBank->mNumPackets == 5 && packet.mPacketType == SEED_BEGHOULED_BUTTON_CRATER &&
        packet.mActive && challenge.mBeghouledEated[2][2];
    log << "crater-shop-unlock count=" << board.mSeedBank->mNumPackets << " active=" << packet.mActive << " pass=" << unlocked << '\n';
    passed &= unlocked;
    // Continue into the real handler even on old code, but don't synthesize a
    // missing visible slot or activate it to force a pass.
    board.mSunMoney = 5000;
    challenge.mChallengeState = STATECHALLENGE_NORMAL;
    const int cost = board.GetCurrentPlantCost(SEED_BEGHOULED_BUTTON_CRATER, SEED_NONE);
    challenge.BeghouledPacketClicked(&packet);
    const bool cleared = board.mSunMoney == 5000 - cost && !challenge.mBeghouledEated[2][2] &&
        !packet.mActive && challenge.mChallengeState == STATECHALLENGE_BEGHOULED_FALLING;
    passed &= cleared;
    log << "clear-crater pass=" << cleared << std::endl;
    return passed;
}

bool TwistCases(Board& board, std::ostream& log)
{
    auto& challenge = *board.mChallenge;
    std::uint32_t random = 0x1073;
    auto next = [&] { random ^= random << 13; random ^= random >> 17; random ^= random << 5; return random; };
    unsigned boards = 0, checked = 0, mismatches = 0;
    BeghouledBoardState live = Empty(); int liveX = -1, liveY = -1;
    for (unsigned attempt = 0; attempt < 10000 && boards < 128; ++attempt)
    {
        auto state = Empty();
        for (int x = 0; x < 8; ++x) for (int y = 0; y < 5; ++y) state.mSeedType[x][y] = kinds[next() % kinds.size()];
        if (HasMatch(state)) continue;
        ++boards;
        for (int x = 0; x < 7; ++x) for (int y = 0; y < 4; ++y)
        {
            auto rotated = state; Rotate(rotated, x, y);
            const bool expected = HasMatch(rotated);
            const auto before = state;
            const bool actual = challenge.BeghouledTwistMoveCausesMatch(x, y, &state) != 0;
            Require(std::memcmp(&before, &state, sizeof(state)) == 0, "Match prediction mutated its input board");
            if (expected != actual) ++mismatches;
            ++checked;
            if (expected && liveX == -1) { live = state; liveX = x; liveY = y; }
        }
    }
    Require(boards == 128 && liveX >= 0, "Could not construct deterministic twist fixtures");
    bool passed = checked == 3584 && mismatches == 0;
    log << "twist boards=" << boards << " predictions=" << checked << " mismatches=" << mismatches << '\n';
    SetGrid(board, live);
    const std::array positions{std::pair{liveX, liveY}, std::pair{liveX + 1, liveY},
        std::pair{liveX, liveY + 1}, std::pair{liveX + 1, liveY + 1}};
    std::array<Plant*, 4> plants{};
    const std::array initial{0, 80, 300, 400};
    for (unsigned i = 0; i < plants.size(); ++i)
    {
        plants[i] = At(board, positions[i].first, positions[i].second);
        plants[i]->mEatenFlashCountdown = 41; plants[i]->mBeghouledFlashCountdown = initial[i];
    }
    const bool flashed = challenge.BeghouledTwistFlashMatch(&live, liveX, liveY) != 0;
    bool flashCorrect = flashed;
    for (unsigned i = 0; i < plants.size(); ++i)
        flashCorrect &= plants[i]->mEatenFlashCountdown == 41 && plants[i]->mBeghouledFlashCountdown == std::max(300, initial[i]);
    passed &= flashCorrect;
    challenge.BeghouledTwistMouseDown(board.GridToPixelX(liveX, liveY) + 80, board.GridToPixelY(liveX, liveY) + 80);
    const std::array destinations{positions[1], positions[3], positions[0], positions[2]};
    bool moved = challenge.mChallengeState == STATECHALLENGE_BEGHOULED_MOVING;
    for (unsigned i = 0; i < plants.size(); ++i)
        moved &= plants[i]->mPlantCol == destinations[i].first && plants[i]->mRow == destinations[i].second &&
            plants[i]->mBeghouledFlashCountdown == 25 && plants[i]->mEatenFlashCountdown == 41 &&
            plants[i]->mRenderOrder == plants[i]->CalcRenderOrder();
    passed &= moved;
    log << "twist-four-hints=" << flashCorrect << " actual-clockwise-input=" << moved << " pass=" << passed << std::endl;
    return passed;
}

struct Cell
{
    unsigned id; int x, y, seed, flash, eaten;
    bool operator==(const Cell&) const = default;
};
std::vector<Cell> Snapshot(Board& board)
{
    std::vector<Cell> result; Plant* plant = nullptr;
    while (board.IteratePlants(plant)) result.push_back({board.mPlants.DataArrayGetID(plant), plant->mPlantCol,
        plant->mRow, int(plant->mSeedType), plant->mBeghouledFlashCountdown, plant->mEatenFlashCountdown});
    return result;
}
}

void ModernVulkanBeghouledSmokeTick(LawnApp& app)
{
    using namespace ModernSmoke;
    static int stage = 0;
    static bool twist = false, playingObserved = false;
    static std::uint32_t started = 0, deadline = 0;
    static std::vector<Cell> saved;
    static std::array<bool, 3> upgrades{};
    static int packetCount = 0;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded && !app.mEasyPlantingCheat,
        "Beghouled probe needs isolated silent non-cheat settings");
    Require(app.mGpuContext && !IsWindowVisible(app.mHWnd), "Beghouled probe became visible");
    if (stage == 0)
    {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); started = app.mUpdateCount; deadline = started + 100; stage = 1; return;
    }
    if (stage == 6) return;
    Require(app.mUpdateCount - started < 5000, "Beghouled probe timed out");
    if (app.mUpdateCount < deadline) return;
    if (stage == 1)
    {
        RequireDeletionBoundary(app, twist ? "beghouled-twist-menu-start" : "beghouled-normal-menu-start");
        app.KillGameSelector(); app.mPlayerInfo->mFinishedAdventure = 1; app.mPlayerInfo->mLevel = 50;
        app.PreNewGame(twist ? GAMEMODE_MINIGAME_BEGHOULED_TWIST : GAMEMODE_MINIGAME_BEGHOULED, false);
        app.mBoard->mCutScene->CancelIntro(); playingObserved = false; stage = 2; return;
    }
    if (stage == 2)
    {
        if (app.mGameScene != SCENE_PLAYING) return;
        if (!playingObserved) { playingObserved = true; deadline = app.mUpdateCount + 100; return; }
        RequireDeletionBoundary(app, twist ? "beghouled-twist-selector-deleted" : "beghouled-normal-selector-deleted");
        auto& board = *app.mBoard; board.Pause(true);
        Require(!app.mSeedChooserScreen && board.mPlants.mSize == 40, "Beghouled did not create its original 40-plant board");
        std::ofstream log(ProbePath(twist ? "beghouled-twist-cases.txt" : "beghouled-normal-cases.txt"));
        Require(bool(log), "Cannot write Beghouled evidence");
        bool passed;
        if (twist) passed = TwistCases(board, log);
        else
        {
            const bool dragFlash = DragAndFlash(board, log);
            const bool shop = ShopAndCrater(board, log);
            passed = dragFlash && shop;
        }
        log << "overall-pass=" << passed << std::endl;
        Require(passed, "Beghouled differs from 1073; see the per-mode cases log");
        Report(twist ? "portable-beghouled-twist-predict-flash-real-rotation" : "portable-beghouled-normal-drag-flash-crater-upgrades", app);
        saved = Snapshot(board); packetCount = board.mSeedBank->mNumPackets;
        std::copy_n(board.mChallenge->mBeghouledPurcasedUpgrade, 3, upgrades.begin());
        Require(LawnSaveGame(&board, ProbePath("beghouled.dat64")), "Cannot save Beghouled fixture");
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 3; return;
    }
    if (stage == 3)
    {
        Require(!app.mBoard && app.mGameSelector, "Beghouled did not return to menu");
        RequireDeletionBoundary(app, twist ? "beghouled-twist-board-deleted" : "beghouled-normal-board-deleted");
        app.KillGameSelector(); app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("beghouled.dat64")), "Cannot load Beghouled fixture");
        app.mBoard->Pause(true); deadline = app.mUpdateCount + 50; stage = 4; return;
    }
    if (stage == 4)
    {
        auto& board = *app.mBoard;
        Require(Snapshot(board) == saved && board.mSeedBank->mNumPackets == packetCount &&
            std::equal(upgrades.begin(), upgrades.end(), board.mChallenge->mBeghouledPurcasedUpgrade),
            "Beghouled state changed across menu/dat64 reload");
        board.MarkAllDirty(); if (!app.mWidgetManager->DrawScreen()) return;
        RequireDeletionBoundary(app, twist ? "beghouled-twist-loaded-selector-deleted" : "beghouled-normal-loaded-selector-deleted");
        Capture(twist ? "beghouled-twist" : "beghouled-normal", app);
        if (!twist) ProbeScreenshot(app);
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 5; return;
    }
    Require(!app.mBoard && app.mGameSelector, "Beghouled final board did not return to menu");
    RequireDeletionBoundary(app, twist ? "beghouled-twist-loaded-board-deleted" : "beghouled-normal-loaded-board-deleted");
    if (!twist) { twist = true; stage = 1; return; }
    Report("portable-beghouled-ten-deferred-deletion-boundaries", app);
    Report("portable-beghouled-both-modes-dat64-menu-reload", app);
    Report("PASS beghouled; normal and twist input, hints, shop, crater, prediction and dat64", app);
    app.CloseRequestAsync(); stage = 6;
}
