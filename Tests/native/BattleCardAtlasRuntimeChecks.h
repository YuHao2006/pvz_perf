#pragma once
#include "Lawn/BattleCardAtlas.h"

// Caller supplies real loaded resources, definitions, portrait cache and audio.
// Only isolated fixture profiles/Boards are used; never read player saves.
inline void CheckBattleCardAtlas(LawnApp& app,void (*deletes)(LawnApp&)) {
    using namespace Sexy;
    const auto require=[](bool value,const char* message){if(!value)throw std::runtime_error(message);};
    const auto oldBounds=app.mScreenBounds;
    const auto oldLandscape=app.mLandscapeUI,oldActive=app.mLandscapeUIActive;
    PoolEffect pool;pool.PoolEffectInitialize();ZenGarden garden;
    auto* oldPool=app.mPoolEffect;auto* oldGarden=app.mZenGarden;
    app.mPoolEffect=&pool;app.mZenGarden=&garden;
    struct Restore {LawnApp& app;void (*deletes)(LawnApp&);Rect bounds;bool landscape,active;PoolEffect* pool;ZenGarden* garden;
        ~Restore(){app.KillBoard();deletes(app);app.mScreenBounds=bounds;app.mLandscapeUI=landscape;app.mLandscapeUIActive=active;app.mPoolEffect=pool;app.mZenGarden=garden;}
    } restore{app,deletes,oldBounds,oldLandscape,oldActive,oldPool,oldGarden};
    auto& render=*app.mDDInterface->mRenderInterface;
    for(bool landscape:{false,true}) {
        app.mLandscapeUI=app.mLandscapeUIActive=landscape;
        app.mScreenBounds=Rect(-100,0,1000,600);
        app.mPlayerInfo->mLevel=50;app.mPlayerInfo->mFinishedAdventure=1;
        app.mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE]=4;
        for(bool conveyor:{false,true}) {
            app.PreNewGame(conveyor?GAMEMODE_ADVENTURE:GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,false);
            auto& b=*app.mBoard;app.KillSeedChooserScreen();
            require(b.mLandscapeHud==landscape,"Card atlas fixture created wrong layout");
            constexpr SeedType seeds[]{SEED_PEASHOOTER,SEED_WINTERMELON,SEED_IMITATER,SEED_TALLNUT,SEED_COBCANNON,SEED_POTATOMINE,SEED_GIANT_WALLNUT,SEED_SUNFLOWER,SEED_CHERRYBOMB,SEED_GLOOMSHROOM};
            if(!conveyor)for(int i=0;i<b.mSeedBank->mNumPackets;++i)b.mSeedBank->mSeedPackets[i].SetPacketType(seeds[i],seeds[i]==SEED_IMITATER?SEED_MELONPULT:SEED_NONE);
            app.StartPlaying();require(bool(app.mBattleCardAtlas),"Battle card atlas was not created");
            const auto compare=[&](SeedPacket& p,float dark,int gray){
                auto* expected=render.CreateRenderImage(90,80);auto* actual=render.CreateRenderImage(90,80);
                struct Targets {Image* a;Image* b;~Targets(){delete a;delete b;}} cleanup{expected,actual};
                {GpuImageDrawScope scope(render,expected);Graphics g(expected);g.mColor=Color(30,70,20);g.FillRect(0,0,90,80);
                    if(landscape)LandscapeHud::DrawPacket(&g,0,0,p.mPacketType,p.mImitaterType,dark,gray,!conveyor,true);
                    else DrawSeedPacket(&g,0,0,p.mPacketType,p.mImitaterType,dark,gray,!conveyor,true);}
                {GpuImageDrawScope scope(render,actual);Graphics g(actual);g.mColor=Color(30,70,20);g.FillRect(0,0,90,80);
                    require(app.mBattleCardAtlas->Draw(p,&g,dark,gray),"Card absent from temporary atlas");}
                render.Flush();auto e=render.ReadImagePixels(*expected),a=render.ReadImagePixels(*actual);
                unsigned differing=0,maxError=0;
                for(size_t i=0;i<e.pixels.size();++i)for(int channel=0;channel<3;++channel){
                    const unsigned error=std::abs(int((e.pixels[i]>>(8*channel))&255)-int((a.pixels[i]>>(8*channel))&255));
                    maxError=std::max(maxError,error);differing+=error>3;
                }
                if(differing){(void)ImageLib::WritePNGImage("card-atlas-expected.png",90,80,e.pixels);(void)ImageLib::WritePNGImage("card-atlas-actual.png",90,80,a.pixels);}
                require(maxError<=3,"Cached card pixels differ from layered reference");
            };
            if(conveyor) {
                auto& p=b.mSeedBank->mSeedPackets[0];p.mOffsetX=0;
                for(auto seed:b.mChallenge->ConveyorCardTypes()){p.SetPacketType(seed);compare(p,0,255);}
            } else {
                for(int i=0;i<b.mSeedBank->mNumPackets;++i){auto& p=b.mSeedBank->mSeedPackets[i];p.mOffsetX=0;compare(p,0,255);compare(p,.37f,128);}
                const auto* atlas=app.mBattleCardAtlas->AtlasImage();
                const auto before=render.ReadImagePixels(*atlas);
                b.AddPlant(0,0,SEED_WINTERMELON,SEED_NONE);app.mBattleCardAtlas->UpdatePrices();
                require(app.mBattleCardAtlas->AtlasImage()==atlas,"Price change replaced the whole atlas Image");
                const auto after=render.ReadImagePixels(*atlas);
                const int cellWidth=(landscape?81:50)+4;
                for(size_t i=0;i<before.pixels.size();++i) {
                    const int x=static_cast<int>(i%before.width);
                    if(x<cellWidth+2||x>=2*cellWidth-2)require(before.pixels[i]==after.pixels[i],"Price update changed a different card region");
                }
                compare(b.mSeedBank->mSeedPackets[1],0,255);
                b.InitSurvivalStage();require(!app.mBattleCardAtlas,"Survival repick retained old card atlas");
            }
            app.KillBoard();deletes(app);require(!app.mBattleCardAtlas,"Board disposal retained card atlas");
            std::cout<<"PASS card atlas landscape="<<landscape<<" conveyor="<<conveyor<<" pixels/prices/lifetime\n";
        }
    }
}
