#pragma once

// Real attack scheduling with immobile durable targets and unadvanced bullets.
// Include alongside StepActorEventRuntimeChecks.h and call after its resources
// have been initialized: CheckStepShooterEvents(app).
inline void CheckStepShooterEvents(LawnApp& app)
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
    struct Attack {SeedType seed;std::array<std::int64_t,4> events;int count;};
    constexpr Attack attacks[]{
        {SEED_PEASHOOTER,{1'340'000'000,0,0,0},1},
        {SEED_REPEATER,{1'000'000'000,1'250'000'000,0,0},2},
        {SEED_GATLINGPEA,{1'320'000'000,1'490'000'000,1'650'000'000,1'820'000'000},4},
        {SEED_WINTERMELON,{1'350'000'000,0,0,0},1}
    };
    for(const auto& attack:attacks)
    for(const std::uint64_t step:{10'000'000ULL,1'000'000'000ULL/30,1'000'000'000ULL/60,
        250'000'000ULL,500'000'000ULL,2'000'000'000ULL,3'500'000'000ULL}) {
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;Sexy::gLegacyTickPhaseNs=0;
        {
            Board board(&app);board.mLevel=31;board.mCurrentWave=6;board.mNumWaves=20;
            board.mSeedBank->mNumPackets=0;board.mBackground=BACKGROUND_1_DAY;
            for(int row=0;row<MAX_GRID_SIZE_Y;++row)
                board.mPlantRow[row]=row==5?PLANTROW_DIRT:PLANTROW_NORMAL;
            auto* plant=board.NewPlant(2,2,attack.seed,SEED_NONE);
            auto* target=board.AddZombieInRow(ZOMBIE_NORMAL,2,0);
            target->mX=650;target->mRootBindingGeneration=0;
            target->mBodyHealth=target->mBodyMaxHealth=1000000;
            plant->mLaunchWindowStartNs=0;plant->mNextLaunchTimeNs=1'000'000'000;
            const bool multipleCycles=step==3'500'000'000ULL;
            const std::uint64_t horizon=multipleCycles?3'500'000'000ULL:2'000'000'000ULL;
            plant->mLaunchPeriodNs=multipleCycles?1'500'000'000:100'000'000'000;
            plant->mShootingEndTimeNs=0;
            require(plant->FindTargetZombie(2,WEAPON_PRIMARY)==target,
                "Shooter deadline fixture has no real target");
            while(board.mLevelTimeNs<horizon) {
                const auto delta=std::min<std::uint64_t>(step,horizon-board.mLevelTimeNs);
                Sexy::ApplySimulationStep(delta);board.mLevelTimeNs+=delta;
                const auto now=static_cast<std::int64_t>(board.mLevelTimeNs);
                clocks.mVisualTimeNs=clocks.mBattleTimeNs=now;
                for(const auto id:{plant->mBodyReanimID,plant->mHeadReanimID,plant->mHeadReanimID2,plant->mHeadReanimID3})
                    if(auto* animation=app.ReanimationTryToGet(id))animation->PrepareTimeAt(now);
                plant->UpdateAbilities(now,now,now,delta);
                int actual=0,expected=0;Projectile* projectile=nullptr;
                while(board.IterateProjectiles(projectile))++actual;
                for(int index=0;index<attack.count;++index)expected+=attack.events[index]<=now;
                // With a 1.5s period, launch two is in [2.36,2.5]s and
                // launch three in [3.72,4]s. At 3.5s exactly two volleys
                // have fully emitted, independent of the random draw.
                if(multipleCycles)expected=attack.count*2;
                if(actual!=expected)std::cout<<"Shooter interval seed="<<int(attack.seed)<<" delta="<<step
                    <<" now="<<now<<" expected="<<expected<<" actual="<<actual<<'\n';
                require(actual==expected,"Shooter action was delayed or overwritten across its true deadline");
            }
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    std::cout<<"PASS shooter deadlines: actual-time projectile counts at 100/30/60Hz, 250/500ms and one/two-cycle steps\n";
}
