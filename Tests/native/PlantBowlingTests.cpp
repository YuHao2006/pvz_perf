// The runner supplies the unchanged production UpdateBowling function body.
// Only its collaborators are replaced; no game application or GPU is created.
#include "misc/TimeCounter.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <tuple>
#include <vector>

enum class SeedType { SEED_WALLNUT, SEED_GIANT_WALLNUT, SEED_EXPLODE_O_NUT };
enum class PlantState { STATE_NOTREADY, STATE_BOWLING_UP, STATE_BOWLING_DOWN };
enum class ReanimTrackId { _ground };
enum class PlantWeapon { WEAPON_PRIMARY };
enum class ShieldType { SHIELDTYPE_NONE, SHIELDTYPE_DOOR, SHIELDTYPE_OTHER };
enum class HelmType { HELMTYPE_NONE, HELMTYPE_PAIL, HELMTYPE_TRAFFIC_CONE };
enum class FoleyType { FOLEY_CHERRYBOMB, FOLEY_BOWLINGIMPACT, FOLEY_SHIELD_HIT,
    FOLEY_PLASTIC_HIT, FOLEY_SPAWN_SUN };
enum class ParticleEffect { PARTICLE_POWIE };
enum class RenderLayer { RENDER_LAYER_TOP };
enum class CoinType { COIN_SILVER, COIN_GOLD };
enum class CoinMotion { COIN_MOTION_COIN };
constexpr int SOUND_BOWLINGIMPACT2=0, RollSomeHeads=0;
namespace Sexy { inline int Rand(int) { return 1; } }
void Require(bool value,const char* message)
{
    if (!value) throw std::runtime_error(message);
}
struct Reanimation
{
    float mAnimTime=0, mAnimRate=15;
    bool mVariable=false;
    // Populated from the production Wallnut DSL by the test runner.
    static constexpr float ground[]{ BOWLING_GROUND_VALUES };
    bool TrackExists(ReanimTrackId) { return true; }
    float GetTrackVelocity(ReanimTrackId)
    {
        if (!mVariable) return -1.75f;
        const int frame=std::min(int(mAnimTime*12),11);
        return (ground[frame+1]-ground[frame])*0.01f*mAnimRate;
    }
    void Update()
    {
        mAnimTime+=0.01f*static_cast<float>(Sexy::gUpdateTicks)*mAnimRate/13;
        if (mAnimTime>=1) mAnimTime-=std::floor(mAnimTime);
    }
};
struct PlayerInfo { int mLevel=11; };
struct App
{
    Reanimation animation;
    PlayerInfo player;
    PlayerInfo* mPlayerInfo=&player;
    Reanimation* ReanimationTryToGet(int) { return &animation; }
    bool IsFirstTimeAdventureMode() { return false; }
    void PlayFoley(FoleyType) {}
    void PlaySample(int) {}
    void AddTodParticle(int,int,int,ParticleEffect) {}
};
namespace ReportAchievement { inline void GiveAchievement(App*,int,bool) {} }
struct Zombie
{
    ShieldType mShieldType=ShieldType::SHIELDTYPE_NONE;
    HelmType mHelmType=HelmType::HELMTYPE_NONE;
    int damage=0,hits=0;
    void TakeDamage(int value,unsigned) { damage+=value; ++hits; }
    void TakeShieldDamage(int value,unsigned) { damage+=value; ++hits; }
    void TakeHelmDamage(int value,unsigned) { damage+=value; ++hits; }
};
struct Plant;
struct Board
{
    Sexy::TimeCounter mShakeCounter=0;
    int mShakeAmountX=0,mShakeAmountY=0,coins=0,explosions=0;
    std::vector<std::pair<int,int>> moves;
    int GridToPixelY(int,int row) { return 100*row; }
    void MovePlantCellBucket(Plant*,int,int);
    void KillAllZombiesInRadius(int,int,int,int,int,bool,int) { ++explosions; }
    void AddCoin(int,int,CoinType,CoinMotion) { ++coins; }
};
struct Plant
{
    App* mApp;
    Board* mBoard;
    Zombie zombie;
    int mBodyReanimID=0,mX=0,mY=200,mRow=2,mWidth=80,mHeight=80,mPlantCol=0,mRenderOrder=0;
    bool mDead=false,mCollide=false;
    SeedType mSeedType=SeedType::SEED_WALLNUT;
    PlantState mState=PlantState::STATE_NOTREADY;
    Sexy::TimeCounter mLaunchCounter=0;
    Zombie* FindTargetZombie(int,PlantWeapon) { return mCollide ? &zombie : nullptr; }
    int GetDamageRangeFlags(PlantWeapon) { return 0; }
    int CalcRenderOrder() { return mRow; }
    void Die() { mDead=true; }
    void UpdateBowling();
};
void Board::MovePlantCellBucket(Plant* plant,int oldRow,int)
{
    Require(oldRow>=0 && oldRow<5 && plant->mRow>=0 && plant->mRow<5,
        "Bowling moved outside the five playable rows");
    moves.emplace_back(oldRow,plant->mRow);
}
#include "PlantBowlingBody.inc"

struct Result
{
    int x,y,row,hits,damage,coins,explosions;
    double impacts;
    bool dead;
    PlantState state;
    std::vector<std::pair<int,int>> moves;
    bool operator==(const Result&) const=default;
};
Result Run(unsigned fps,SeedType seed,PlantState state,bool collide,
    bool variable=false,int startX=0,ShieldType shield=ShieldType::SHIELDTYPE_NONE,
    HelmType helm=HelmType::HELMTYPE_NONE)
{
    App app;
    app.animation.mVariable=variable;
    Board board;
    Plant plant{&app,&board};
    plant.mSeedType=seed; plant.mState=state; plant.mCollide=collide; plant.mX=startX;
    plant.zombie.mShieldType=shield; plant.zombie.mHelmType=helm;
    Sexy::gLegacyTickPhaseNs=0;
    constexpr unsigned long long duration=2'000'000'000ULL;
    for (unsigned long long elapsed=0;elapsed<duration;)
    {
        Sexy::gUpdateIntervalNs=std::min(1'000'000'000ULL/fps,duration-elapsed);
        Sexy::gUpdateTicks=double(Sexy::gUpdateIntervalNs)/10'000'000.0;
        Sexy::gStepsPerLegacyTick=1.0/Sexy::gUpdateTicks;
        Sexy::BeginTimedUpdate();
        app.animation.Update();
        plant.UpdateBowling();
        elapsed+=Sexy::gUpdateIntervalNs;
    }
    return {plant.mX,plant.mY,plant.mRow,plant.zombie.hits,plant.zombie.damage,
        board.coins,board.explosions,plant.mLaunchCounter.LegacyTicks(),plant.mDead,
        plant.mState,board.moves};
}
int main()
{
    try
    {
        unsigned cases=0;
        for (const auto seed:{SeedType::SEED_WALLNUT,SeedType::SEED_GIANT_WALLNUT,
            SeedType::SEED_EXPLODE_O_NUT})
            for (const auto state:{PlantState::STATE_NOTREADY,PlantState::STATE_BOWLING_UP,
                PlantState::STATE_BOWLING_DOWN})
                for (const bool collide:{false,true})
                    for (const auto shield:{ShieldType::SHIELDTYPE_NONE,ShieldType::SHIELDTYPE_DOOR,
                        ShieldType::SHIELDTYPE_OTHER})
                        for (const auto helm:{HelmType::HELMTYPE_NONE,HelmType::HELMTYPE_PAIL,
                            HelmType::HELMTYPE_TRAFFIC_CONE})
                        {
                            const auto reference=Run(100,seed,state,collide,false,0,shield,helm);
                            for (const unsigned fps:{50u,60u,100u,144u,200u,250u})
                                Require(Run(fps,seed,state,collide,false,0,shield,helm)==reference,
                                    "Equal elapsed time changed movement, collision, bounce, reward or row migration");
                            ++cases;
                        }
        const auto straight=Run(200,SeedType::SEED_WALLNUT,PlantState::STATE_NOTREADY,false);
        Require(straight.x==200,"200 FPS bowling doubled movement or lost integer steps");
        const auto impact=Run(200,SeedType::SEED_WALLNUT,PlantState::STATE_NOTREADY,true);
        Require(impact.hits>=5 && impact.impacts==impact.hits && impact.coins>0,
            "Collision-count test did not exercise repeated bounce rewards");
        for (const unsigned fps:{50u,100u,200u})
        {
            const auto exit=Run(fps,SeedType::SEED_GIANT_WALLNUT,PlantState::STATE_NOTREADY,false,false,799);
            Require(exit.dead && exit.x==802 && exit.moves.empty(),"Off-board death ran extra bowling steps");
        }
        const auto reference=Run(100,SeedType::SEED_WALLNUT,PlantState::STATE_BOWLING_UP,false,true);
        int maxDrift=0;
        for (const unsigned fps:{50u,60u,100u,144u,200u,250u})
        {
            const auto actual=Run(fps,SeedType::SEED_WALLNUT,PlantState::STATE_BOWLING_UP,false,true);
            maxDrift=std::max(maxDrift,std::abs(actual.x-reference.x));
            Require(std::abs(actual.x-reference.x)<=4 && actual.y==reference.y &&
                actual.row==reference.row && actual.moves==reference.moves,
                "Production ground animation caused excessive sampling drift or changed vertical physics");
        }
        std::cout<<"PASS production UpdateBowling: "<<cases
            <<" movement/collision scenarios x 6 FPS; 200 FPS speed; impact counts; row buckets; death; "
            <<"production ground animation max drift="<<maxDrift<<"px over 2 seconds\n";
    }
    catch (const std::exception& error)
    {
        std::cerr<<error.what()<<'\n';
        return 1;
    }
}
