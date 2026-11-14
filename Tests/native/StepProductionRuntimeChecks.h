#pragma once

// Real-object reproductions of the pre-fix ordering failures:
//  * Doom/Ice: update 10ms, then 2100ms. The 2s auto-removal used to
//    return before the pending 1s explosion/freeze (no crater/no freeze).
//  * Marigold: 20ms until retirement, coin due at 10ms, update 33ms.
//    The retirement return used to discard that coin permanently.
//  * Sun-shroom: 20ms until growth, small sun due at 10ms, update 33ms.
//    Replacing SMALL before production used to turn that sun into a big sun.
//  * Boss death: phase .09 -> .72 used to emit one explosion, not thirteen.
// Include after game headers/resources and call CheckStepProductionEvents(app).
inline void CheckStepProductionEvents(LawnApp& app)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value)throw std::runtime_error(message);
    };
    auto& clocks=*app.mEffectSystem->mReanimationHolder;
    struct Restore {
        LawnApp& app;Board* board=app.mBoard;PlayerInfo* player=app.mPlayerInfo;
        ZenGarden* garden=app.mZenGarden;GameMode mode=app.mGameMode;GameScenes scene=app.mGameScene;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mBoard=board;app.mPlayerInfo=player;app.mZenGarden=garden;
            app.mGameMode=mode;app.mGameScene=scene;
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    PlayerInfo profile;ZenGarden garden;
    profile.mLevel=31;profile.mFinishedAdventure=1;
    app.mPlayerInfo=&profile;app.mZenGarden=&garden;
    app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_PLAYING;
    const auto resetClocks=[&] {
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;Sexy::gLegacyTickPhaseNs=0;
    };
    const auto initialize=[&](Board& board) {
        board.mLevel=31;board.mCurrentWave=6;board.mNumWaves=20;
        board.mSeedBank->mNumPackets=0;board.mBackground=BACKGROUND_1_DAY;
        for(int row=0;row<MAX_GRID_SIZE_Y;++row)
            board.mPlantRow[row]=row==5?PLANTROW_DIRT:PLANTROW_NORMAL;
    };
    const auto advance=[&](Board& board,Plant& plant,std::uint64_t delta) {
        Sexy::ApplySimulationStep(delta);board.mLevelTimeNs+=delta;
        const auto now=static_cast<std::int64_t>(board.mLevelTimeNs);
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=now;
        plant.Update(now,now,now,delta);
    };
    const auto coinCounts=[](Board& board) {
        std::array<int,3> result{};Coin* coin=nullptr;
        while(board.IterateCoins(coin)) {
            ++result[0];result[1]+=coin->mType==COIN_SMALLSUN;result[2]+=coin->mType==COIN_SUN;
        }
        return result;
    };
    for(const auto seed:{SEED_DOOMSHROOM,SEED_ICESHROOM})
    for(int suppressed=0;suppressed<4;++suppressed) {
        resetClocks();
        {
            Board board(&app);initialize(board);
            auto* plant=board.NewPlant(3,2,seed,SEED_NONE);plant->mIsAsleep=false;
            auto* target=board.AddZombieInRow(ZOMBIE_NORMAL,2,0);
            target->mX=static_cast<float>(plant->mX+20);target->mRootBindingGeneration=0;
            target->mBodyHealth=target->mBodyMaxHealth=10000;
            advance(board,*plant,10'000'000);
            require(plant->mState==STATE_DOINGSPECIAL&&plant->mSpecialEndTimeNs==1'000'000'000,
                "Special/removal fixture did not arm the real one-second action");
            if(suppressed==1)plant->mSquished=true;
            if(suppressed==2)plant->mIsAsleep=true;
            if(suppressed==3)plant->mOnBungeeState=RISING_WITH_BUNGEE;
            advance(board,*plant,2'100'000'000);
            const bool effect=seed==SEED_DOOMSHROOM
                ?board.GetCraterAt(3,2)!=nullptr:target->mIceTrapEndTimeNs>static_cast<std::int64_t>(board.mLevelTimeNs);
            require(effect==(suppressed==0),"Auto-removal swallowed an earlier special, or revived a suppressed special");
            require(plant->mDead,"Expired special plant was retained after its removal point");
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    for(const std::int64_t due:{10'000'000LL,20'000'000LL,25'000'000LL}) {
        resetClocks();
        {
            Board board(&app);initialize(board);board.mCurrentWave=board.mNumWaves;
            auto* plant=board.NewPlant(3,2,SEED_MARIGOLD,SEED_NONE);
            plant->mState=STATE_MARIGOLD_ENDING;plant->mStateCountdown=2;
            plant->mNextLaunchTimeNs=due;plant->mLaunchWindowStartNs=0;
            plant->mLaunchPeriodNs=100'000'000'000;
            advance(board,*plant,33'000'000);
            const int expected=due<20'000'000?1:0;
            require(coinCounts(board)[0]==expected,"Marigold lost a pre-stop coin or emitted a coin at/after stop");
            const auto pending=plant->mNextLaunchTimeNs;
            for(int i=0;i<4;++i)advance(board,*plant,33'000'000);
            require(coinCounts(board)[0]==expected,"Stopped Marigold resumed producing on a later update");
            require(plant->mNextLaunchTimeNs==pending+4*33'000'000LL,
                "Stopped Marigold failed to freeze its remaining production time");
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    for(const std::int64_t due:{10'000'000LL,20'000'000LL,25'000'000LL}) {
        resetClocks();
        {
            Board board(&app);initialize(board);
            auto* plant=board.NewPlant(3,2,SEED_SUNSHROOM,SEED_NONE);plant->mIsAsleep=false;
            plant->mState=STATE_SUNSHROOM_SMALL;plant->mStateCountdown=2;
            plant->mNextLaunchTimeNs=due;plant->mLaunchWindowStartNs=0;
            plant->mLaunchPeriodNs=100'000'000'000;
            advance(board,*plant,33'000'000);
            const auto coins=coinCounts(board);
            require(coins[0]==(due<=20'000'000?1:0)&&coins[1]==(due<20'000'000?1:0)&&
                coins[2]==(due==20'000'000?1:0),
                "Sun-shroom replaced an earlier small sun, changed the growth tie, or produced during growth");
            require(plant->mState==STATE_SUNSHROOM_GROWING,"Sun-shroom failed to enter growth after production");
            if(due>20'000'000)require(plant->mNextLaunchTimeNs==due+13'000'000,
                "Sun-shroom failed to freeze the post-growth part of its interval");
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    resetClocks();
    {
        Board board(&app);initialize(board);
        auto* boss=board.AddZombieInRow(ZOMBIE_BOSS,2,0);
        boss->mZombiePhase=PHASE_ZOMBIE_DYING;
        boss->PlayZombieReanim(0,ReanimTrackId::anim_death,REANIM_PLAY_ONCE_AND_HOLD,0,14.0f);
        auto* animation=app.ReanimationGet(boss->mBodyReanimID);animation->SeekRatio(.09f);
        const auto delta=static_cast<std::uint64_t>(std::ceil(.63*animation->mPeriodNs));
        Sexy::ApplySimulationStep(delta);board.mLevelTimeNs=delta;
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=delta;animation->PrepareTimeAt(delta);
        const auto explosions=[&] {
            int count=0;TodParticleSystem* system=nullptr;
            while(app.mEffectSystem->mParticleHolder->mParticleSystems.IterateNext(system))
                count+=!system->mDead&&system->mEffectType==PARTICLE_BOSS_EXPLOSION;
            return count;
        };
        const int before=explosions();boss->UpdateDeath(delta,delta,delta);
        require(explosions()-before==13,"Boss death merged distinct crossed explosion events");
    }
    app.mEffectSystem->ProcessDeleteQueue();
    std::cout<<"PASS terminal production intervals: specials, Marigold stop, Sun-shroom growth ties, Boss explosions\n";
}
