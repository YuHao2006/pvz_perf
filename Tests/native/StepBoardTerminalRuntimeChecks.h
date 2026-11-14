#pragma once
#include "GameConstants.h"

// Actual Board/coin/mower/particle calls on isolated state. The recorder is
// the existing DecodeOnlySoundManager, so LIGHTFILL observes real PlaySample.
template<class SoundRecorder>
inline void CheckStepBoardTerminalEvents(LawnApp& app,SoundRecorder& sounds)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value)throw std::runtime_error(message);
    };
    require(!app.mBoard&&!app.mSeedChooserScreen,
        "Board terminal fixture requires no existing Board or chooser");
    PlayerInfo profile;ZenGarden garden;
    struct Restore {
        LawnApp& app;PlayerInfo* player=app.mPlayerInfo;ZenGarden* garden=app.mZenGarden;
        GameMode mode=app.mGameMode;GameScenes scene=app.mGameScene;
        bool mute=app.mMuteSoundsForCutscene;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mEffectSystem->EffectSystemFreeAll();app.mBoard=nullptr;
            app.mPlayerInfo=player;app.mZenGarden=garden;app.mGameMode=mode;app.mGameScene=scene;
            app.mMuteSoundsForCutscene=mute;
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    profile.mId=47;profile.mLevel=11;profile.mFinishedAdventure=1;
    profile.mPurchases[STORE_ITEM_POOL_CLEANER]=1;
    app.mPlayerInfo=&profile;app.mZenGarden=&garden;
    app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_PLAYING;
    app.mMuteSoundsForCutscene=false;
    auto& clocks=*app.mEffectSystem->mReanimationHolder;
    const auto initialize=[&](Board& board) {
        board.mLevel=11;board.mBackground=BACKGROUND_3_POOL;
        board.mCurrentWave=20;board.mNumWaves=20;
        board.mSeedBank->mNumPackets=0;
        for(int row=0;row<MAX_GRID_SIZE_Y;++row)
            board.mPlantRow[row]=(row==2||row==3)?PLANTROW_POOL:PLANTROW_NORMAL;
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;
    };
    const auto addMowers=[&](Board& board,int count) {
        for(int row=0;row<count;++row) {
            auto* mower=board.mLawnMowers.DataArrayAlloc();mower->LawnMowerInitialize(row);
            mower->mPosX=-21;
        }
    };
    for(const std::uint64_t step:{6'100'000'000ULL,560'000'000ULL,10'000'000ULL}) {
        profile.mCoins=0;
        {
            Board board(&app);initialize(board);addMowers(board,6);
            board.mBoardFadeOutCounter=600;board.mScoreNextMowerCounter=200;
            const auto lightBefore=sounds.playbackRequests[SOUND_LIGHTFILL];
            std::uint64_t elapsed=0;
            while(!board.mLevelComplete&&elapsed<12'000'000'000ULL) {
                Sexy::ApplySimulationStep(step);elapsed+=step;
                clocks.mVisualTimeNs=clocks.mBattleTimeNs=static_cast<std::int64_t>(elapsed);
                board.UpdateLevelEndSequence();
            }
            require(board.mLevelComplete&&board.CountUntriggerLawnMowers()==0,
                "Level fade expired before consuming its scheduled mower conversions");
            const int reward=6*Coin::GetCoinValue(COIN_GOLD);
            require(profile.mCoins==reward&&board.mCoinsCollected==reward,
                "Terminal mower coins were discarded before their collection reached the bank");
            require(sounds.playbackRequests[SOUND_LIGHTFILL]==lightBefore+1,
                "Fade completion swallowed or repeated the crossed LIGHTFILL cue");
            board.UpdateLevelEndSequence();
            require(profile.mCoins==reward&&sounds.playbackRequests[SOUND_LIGHTFILL]==lightBefore+1,
                "A consumed level-fade terminal event repeated on another update");
        }
        app.mBoard=nullptr;app.mEffectSystem->ProcessDeleteQueue();
        std::cout<<"PASS real Board fade/mower terminal intervalNs="<<step<<'\n';
    }
    // The score event exactly at the fade deadline is consumed before retirement.
    profile.mCoins=0;
    {
        Board board(&app);initialize(board);addMowers(board,1);
        board.mBoardFadeOutCounter=1;board.mScoreNextMowerCounter=1;
        Sexy::ApplySimulationStep(33'333'333);
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=33'333'333;
        board.UpdateLevelEndSequence();
        require(board.mLevelComplete&&board.CountUntriggerLawnMowers()==0&&
            profile.mCoins==Coin::GetCoinValue(COIN_GOLD),
            "Mower scoring at the fade deadline was lost by the completion return");
    }
    app.mBoard=nullptr;app.mEffectSystem->ProcessDeleteQueue();
    // A global step can extend past retirement; do not invent a mower event
    // whose deadline falls after the board's own fade deadline.
    profile.mCoins=0;
    {
        Board board(&app);initialize(board);addMowers(board,1);
        board.mBoardFadeOutCounter=1;board.mScoreNextMowerCounter=2;
        Sexy::ApplySimulationStep(33'333'333);
        board.UpdateLevelEndSequence();
        require(board.mLevelComplete&&board.CountUntriggerLawnMowers()==1&&profile.mCoins==0,
            "The terminal interval consumed mower events after the fade deadline");
    }
    app.mBoard=nullptr;app.mEffectSystem->ProcessDeleteQueue();
    {
        Board board(&app);initialize(board);
        board.mIceTimer[0]=1;board.mIceMinX[0]=200;
        board.mIceParticleID[0]=ParticleSystemID::PARTICLESYSTEMID_NULL;
        Sexy::ApplySimulationStep(33'333'333);board.UpdateIce();
        require(board.mIceTimer[0].mNanoseconds==0&&board.mIceMinX[0]==BOARD_ICE_START,
            "An ice interval without a live particle failed to expire safely");
        board.mIceTimer[0]=100;board.mIceMinX[0]=200;
        Sexy::ApplySimulationStep(1'000'000);board.UpdateIce();
        auto* particle=app.ParticleTryToGet(board.mIceParticleID[0]);
        require(particle&&!particle->mDead,"Ice fixture failed to create its real sparkle particle");
        Sexy::ApplySimulationStep(2'000'000'000);board.UpdateIce();
        require(board.mIceTimer[0].mNanoseconds==0&&board.mIceMinX[0]==BOARD_ICE_START&&particle->mDead,
            "Ice expiry failed to retire its live sparkle particle");
    }
    app.mBoard=nullptr;app.mEffectSystem->ProcessDeleteQueue();
    std::cout<<"PASS real Board ice expiry with absent and live sparkle particles\n";
}
