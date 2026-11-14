#pragma once

inline void CheckStepCollectionEvents(LawnApp& app)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value) throw std::runtime_error(message);
    };
    auto& clocks=*app.mEffectSystem->mReanimationHolder;
    struct Restore {
        LawnApp& app;
        PlayerInfo* player=app.mPlayerInfo;
        GameMode mode=app.mGameMode;
        GameScenes scene=app.mGameScene;
        bool landscape=app.mLandscapeUIActive;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mBoard=nullptr;app.mPlayerInfo=player;app.mGameMode=mode;app.mGameScene=scene;
            app.mLandscapeUIActive=landscape;
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    PlayerInfo profile;profile.mLevel=31;profile.mFinishedAdventure=1;
    app.mPlayerInfo=&profile;app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_PLAYING;
    app.mLandscapeUIActive=false;
    for(const auto type:{COIN_SUN,COIN_GOLD,COIN_PRESENT_PUZZLE_MODE})
    for(const std::uint64_t delta:{10'000'000ULL,133'333'333ULL,420'000'000ULL,2'000'000'000ULL}) {
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;
        {
            Board board(&app);board.mLevel=31;board.mCurrentWave=6;board.mNumWaves=20;
            board.mSeedBank->mNumPackets=0;
            auto* coin=board.AddCoin(600,200,type,COIN_MOTION_COIN);
            coin->mPosX=600;coin->mPosY=200;coin->mIsBeingCollected=true;
            const auto sun=board.mSunMoney,coins=profile.mCoins;
            for(int i=0;i<180&&!coin->mDead;++i) {
                Sexy::ApplySimulationStep(delta);clocks.mVisualTimeNs+=delta;
                coin->UpdateCollected();
                if(type==COIN_PRESENT_PUZZLE_MODE&&board.mHelpDisplayed[int(ADVICE_UNLOCKED_MODE)])break;
            }
            if(type==COIN_PRESENT_PUZZLE_MODE)
                require(board.mHelpDisplayed[int(ADVICE_UNLOCKED_MODE)],"Collected gift never reached its advice destination");
            else {
                require(coin->mDead,"Collected sun/money did not converge to its scoring destination");
                require(type==COIN_SUN?board.mSunMoney==sun+25:profile.mCoins==coins+5,
                    "Collected sun/money was not credited exactly once");
            }
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    std::cout<<"PASS collected sun/money/gifts converge at ordinary, 133ms, 420ms and 2s steps\n";
}
