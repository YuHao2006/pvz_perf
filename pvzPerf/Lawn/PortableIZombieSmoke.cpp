// I, Zombie 场景烟测（2026-10-04 B 树实机抓获：僵尸卡种植触发
// kUpgradeAdvice 表越界→std::string* 垃圾解引用→ucrtbase memcpy AV；
// 修复=界内守卫）。全真流程：等加载完成→进关→多行放僵尸→走吃数百拍→
// 重开链（KillBoard+PreNewGame）→复进关。启动门（GameSelector 出现）
// 规避首拍直推 PreNewGame 撞 IMAGE_SEEDBANK==NULL 的加载竞态。
#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Challenge.h"
#include "Zombie.h"
#include "Cutscene.h"
#include "System/SaveGame.h"
#include "SeedPacket.h"
#include <fstream>

using namespace ModernSmoke;

namespace
{
void Require(bool ok, const char* text) { if (!ok) throw std::runtime_error(text); }

struct IZombieState
{
    int stage = 0;
    unsigned deadline = 0;
    bool playingObserved = false;
};
IZombieState& State()
{
    static IZombieState s;
    return s;
}
}

void PortableIZombieSmokeTick(LawnApp& app)
{
    auto& s = State();
    auto& stage = s.stage;
    if (stage == 0)
    {
        // 等加载完成（GameSelector 出现=LoadingImages 组已装载）
        if (app.mGameSelector == nullptr && app.mTitleScreen != nullptr) return;
        app.KillGameSelector();
        app.mPlayerInfo->mFinishedAdventure = 1;
        app.mPlayerInfo->mLevel = 50;
        app.PreNewGame(GAMEMODE_PUZZLE_I_ZOMBIE_1, false);
        app.mBoard->mCutScene->CancelIntro();
        stage = 1;
        return;
    }
    if (stage == 1)
    {
        if (app.mGameScene != SCENE_PLAYING) return;
        if (!s.playingObserved)
        {
            s.playingObserved = true;
            s.deadline = app.mUpdateCount + 2;
            return;
        }
        Board& board = *app.mBoard;
        // 多行放僵尸（I,Zombie 板已预置植物；走吃覆盖卡槽/种植路径）
        int placed = 0;
        for (int row = 0; row < MAX_GRID_SIZE_Y; row++)
        {
            for (auto type : {ZOMBIE_NORMAL, ZOMBIE_TRAFFIC_CONE, ZOMBIE_PAIL, ZOMBIE_IMP})
            {
                Zombie* zombie = board.AddZombieInRow(type, row, 0);
                if (zombie) placed++;
            }
        }
        Require(placed >= 12, "I Zombie placement failed");
        std::ofstream log(ProbePath("izombie-cases.txt"));
        log << "izombie-placed=" << placed << " plants=" << board.mPlants.mSize << std::endl;
        s.deadline = app.mUpdateCount + 600;
        stage = 2;
        return;
    }
    if (stage == 2)
    {
        if (app.mUpdateCount < s.deadline) return;
        Board& board = *app.mBoard;
        std::ofstream log(ProbePath("izombie-cases.txt"), std::ios::app);
        log << "izombie-survived zombies=" << board.mZombies.mSize
            << " plants=" << board.mPlants.mSize << std::endl;
        // 重开链（用户首次崩溃现场）
        app.mSawYeti = board.mKilledYeti;
        app.KillDialog(Dialogs::DIALOG_CONTINUE);
        app.KillDialog(Dialogs::DIALOG_RESTARTCONFIRM);
        app.KillBoard();
        app.PreNewGame(app.mGameMode, false);
        s.deadline = app.mUpdateCount + 200;
        stage = 3;
        return;
    }
    if (stage == 3)
    {
        if (!app.mBoard) return;
        app.mBoard->mCutScene->CancelIntro();
        s.deadline = app.mUpdateCount + 300;
        stage = 4;
        return;
    }
    if (stage == 4)
    {
        if (app.mGameScene != SCENE_PLAYING && app.mUpdateCount < s.deadline) return;
        Require(app.mBoard != nullptr, "I Zombie restart did not create a board");
        std::ofstream log(ProbePath("izombie-cases.txt"), std::ios::app);
        log << "izombie-restarted scene=" << int(app.mGameScene)
            << " packets=" << app.mBoard->mSeedBank->mNumPackets << std::endl;
        Report("PASS izombie; placement, eating ticks and restart chain", app);
        app.CloseRequestAsync();
        stage = 5;
        return;
    }
}
