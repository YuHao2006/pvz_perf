#include "WaveSpawnSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Zombie.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Widget/GameSelector.h"
#include "Widget/ContinueDialog.h"
#include "Widget/TitleScreen.h"
#include "misc/KeyCodes.h"
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <stdexcept>
#include <algorithm>
#include <vector>

namespace {
using Clock = std::chrono::steady_clock;
struct Probe {
    struct Walker {
        unsigned int id;
        float x;
        int age;
        bool moved = false;
    };
    int stage = 0, initialWave = -1;
    unsigned int lastWaveUpdate = 0;
    unsigned int sampleUpdate = 0;
    Clock::time_point start = Clock::now();
    std::vector<unsigned int> loadedZombies;
    std::vector<Walker> walkers;
    unsigned int checkedFreshZombies = 0;
};
struct Callback {
    LawnApp& app;
    explicit Callback(LawnApp& value) : app(value) { ++app.mUpdateAppDepth; }
    ~Callback() { --app.mUpdateAppDepth; }
};
void Snapshot(LawnApp& app, const char* action)
{
    FILE* file = std::fopen(Sexy::GetLogFilePath("wave-spawn-smoke.log").c_str(), "a");
    if (!file) throw std::runtime_error("Cannot create wave diagnostic log");
    std::fprintf(file, "%s update=%u scene=%d mode=%d focus=%d active=%d",
        action, app.mUpdateCount, static_cast<int>(app.mGameScene),
        static_cast<int>(app.mGameMode), app.mHasFocus, app.mActive);
    if (auto* board = app.mBoard) {
        std::fprintf(file, " main=%u paused=%d level=%d wave=%d/%d total=%d countdown=%d"
            " huge=%d tutorial=%d tutorialTimer=%d zombies=%u plants=%u timeStop=%d award=%d fade=%d",
            board->mMainCounter, board->mPaused, board->mLevel, board->mCurrentWave,
            board->mNumWaves, board->mTotalSpawnedWaves, board->mZombieCountDown,
            board->mHugeWaveCountDown, static_cast<int>(board->mTutorialState),
            board->mTutorialTimer, board->mZombies.mSize, board->mPlants.mSize,
            board->mTimeStopCounter, board->mLevelAwardSpawned, board->mBoardFadeOutCounter);
        Zombie* zombie = nullptr;
        int count = 0;
        while (count++ < 5 && board->mZombies.IterateNext(zombie)) {
            std::fprintf(file, " zombie={id=%u x=%.3f age=%d phase=%d height=%d wave=%d hp=%d dead=%d visible=%d}",
                board->mZombies.DataArrayGetID(zombie), zombie->mPosX, zombie->mZombieAge, static_cast<int>(zombie->mZombiePhase),
                static_cast<int>(zombie->mZombieHeight), zombie->mFromWave, zombie->mBodyHealth,
                zombie->mDead, zombie->mVisible);
            if (auto* body = app.ReanimationTryToGet(zombie->mBodyReanimID)) {
                float groundSpan = 0;
                const int track = body->FindTrackIndex(ReanimTrackId::_ground);
                if (track >= 0 && body->mFrameCount > 0) {
                    const auto* transforms = body->mDefinition->mTracks.tracks[track].mTransforms.mTransforms;
                    groundSpan = transforms[body->mFrameStart + body->mFrameCount - 1].mTransX -
                        transforms[body->mFrameStart].mTransX;
                }
                std::fprintf(file, " body={rate=%.5f time=%.5f frames=%d+%d loop=%d dead=%d span=%.5f}"
                    " flags={ice=%d butter=%d yuck=%d/%d eat=%d original=%.5f scale=%.5f}",
                    body->mAnimRate, body->mAnimTime, body->mFrameStart, body->mFrameCount,
                    body->mLoopCount, body->mDead, groundSpan, zombie->mIceTrapCounter,
                    zombie->mButteredCounter, zombie->mYuckyFace, zombie->mYuckyFaceCounter,
                    zombie->mIsEating, zombie->mOriginalAnimRate, zombie->mScaleZombie);
            }
        }
    }
    std::fputc('\n', file);
    std::fclose(file);
}
}

void WaveSpawnSmokeTick(LawnApp& app)
{
    static const bool enabled = std::getenv("PVZ_WAVE_SPAWN_SMOKE") != nullptr;
    if (!enabled || app.mUpdateAppDepth != 0 || app.mShutdown) return;
    static Probe probe;
    if (probe.stage == 4) return;
    if (Clock::now() - probe.start > std::chrono::seconds(180)) {
        Snapshot(app, "FAIL timeout");
        throw std::runtime_error("Wave spawn reproduction timed out; see wave-spawn-smoke.log");
    }
    if (!std::getenv("PVZ_APPDATA_DIR") || !std::getenv("PVZ_LOG_DIR"))
        throw std::runtime_error("Wave spawn reproduction requires isolated data/log directories");
    switch (probe.stage) {
    case 0:
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        Snapshot(app, "ACTION title-start");
        probe.stage = 1;
        {
            Callback callback(app);
            app.mTitleScreen->ButtonDepress(TitleScreen::TitleScreen_Start);
        }
        return;
    case 1:
        if (!app.mGameSelector || app.mGameSelector->mLoading || app.mGameSelector->mStartingGame ||
            app.mGameSelector->mSelectorState != SELECTOR_IDLE || app.GetDialogCount()) return;
        if (!app.SaveFileExists()) throw std::runtime_error("Wave reproduction fixture has no interruption save");
        {
            DataArray<Zombie> pool;
            pool.DataArrayInitialize(1, DataArrayKind::Zombies);
            for (int cycle = 0; cycle < 128; ++cycle) {
                Zombie* zombie = pool.DataArrayAlloc();
                if (zombie->mDead || zombie->mOriginalAnimRate != 0 ||
                    zombie->mBodyReanimID != ReanimationID::REANIMATIONID_NULL)
                    throw std::runtime_error("Reused Zombie construction retained stale state");
                zombie->mDead = true;
                pool.DataArrayFree(zombie);
            }
            Snapshot(app, "CHECK zombie-slot-reuse=128");
        }
        Snapshot(app, "ACTION adventure-continue");
        probe.stage = 2;
        {
            Callback callback(app);
            app.mGameSelector->ButtonDepress(app.mGameSelector->mAdventureButton->mId);
        }
        return;
    case 2:
        if (auto* dialog = app.GetDialog(DIALOG_CONTINUE)) {
            Snapshot(app, "ACTION accept-continue");
            probe.stage = 3;
            Callback callback(app);
            static_cast<ContinueDialog*>(dialog)->ButtonDepress(ContinueDialog::ContinueDialog_Continue);
        }
        return;
    case 3:
        if (!app.mBoard) throw std::runtime_error("Reproduction lost its Board");
        if (auto* paused = app.GetDialog(DIALOG_PAUSED)) {
            Snapshot(app, "ACTION resume-real-pause-dialog");
            Callback callback(app);
            paused->KeyDown(Sexy::KEYCODE_RETURN);
            return;
        }
        if (app.mUpdateCount - probe.sampleUpdate >= 100) {
            Snapshot(app, "SAMPLE");
            probe.sampleUpdate = app.mUpdateCount;
        }
        if (probe.initialWave < 0 && !app.mBoard->mPaused) {
            probe.initialWave = app.mBoard->mCurrentWave;
            Zombie* zombie = nullptr;
            while (app.mBoard->mZombies.IterateNext(zombie))
                probe.loadedZombies.push_back(app.mBoard->mZombies.DataArrayGetID(zombie));
        }
        if (probe.initialWave >= 0) {
            Zombie* zombie = nullptr;
            while (app.mBoard->mZombies.IterateNext(zombie)) {
                const auto id = app.mBoard->mZombies.DataArrayGetID(zombie);
                if (std::find(probe.loadedZombies.begin(), probe.loadedZombies.end(), id) !=
                    probe.loadedZombies.end()) continue;
                if (zombie->mZombieType != ZombieType::ZOMBIE_NORMAL ||
                    zombie->mZombiePhase != ZombiePhase::PHASE_ZOMBIE_NORMAL ||
                    zombie->mZombieAge < 100 || zombie->mDead || zombie->mIsEating ||
                    zombie->IsImmobilizied() || zombie->mYuckyFace || zombie->mMindControlled) continue;
                auto* body = app.ReanimationTryToGet(zombie->mBodyReanimID);
                if (!body || body->mAnimRate <= 0) {
                    Snapshot(app, "FAIL fresh-walking-zombie-zero-rate");
                    throw std::runtime_error("Fresh walking zombie has no advancing animation");
                }
                auto walker = std::find_if(probe.walkers.begin(), probe.walkers.end(),
                    [id](const Probe::Walker& value) { return value.id == id; });
                if (walker == probe.walkers.end()) {
                    probe.walkers.push_back({id, zombie->mPosX, zombie->mZombieAge});
                } else if (!walker->moved && zombie->mZombieAge - walker->age >= 100) {
                    if (zombie->mPosX >= walker->x) {
                        Snapshot(app, "FAIL fresh-walking-zombie-stationary");
                        throw std::runtime_error("Fresh walking zombie did not move over 100 updates");
                    }
                    walker->moved = true;
                    ++probe.checkedFreshZombies;
                }
            }
        }
        if (app.mBoard->mZombieCountDown < 0) {
            Snapshot(app, "FAIL negative-wave-countdown");
            throw std::runtime_error("Wave countdown passed zero without spawning");
        }
        if (probe.initialWave >= 0 && app.mBoard->mCurrentWave >= app.mBoard->mNumWaves) {
            if (!probe.lastWaveUpdate) {
                Snapshot(app, "CHECK all-waves-spawned");
                probe.lastWaveUpdate = app.mUpdateCount;
            }
            if (app.mUpdateCount - probe.lastWaveUpdate < 500) return;
            if (!probe.checkedFreshZombies)
                throw std::runtime_error("Wave probe did not verify a fresh walking zombie");
            char result[128];
            std::snprintf(result, sizeof(result), "PASS all-waves-spawned fresh-moving-zombies=%u",
                probe.checkedFreshZombies);
            Snapshot(app, result);
            probe.stage = 4;
            app.RequestNativeClose();
        }
        return;
    }
}
