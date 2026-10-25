#pragma once
#include "misc/TimeCounter.h"
#include "ConstEnums.h"
#include "misc/Rect.h"

class LawnApp;
class Board;
class Zombie;
namespace Sexy
{
    class Graphics;
};
using namespace Sexy;

class LawnMower
{
public:
    LawnApp*            mApp;                   //+0x0
    Board*              mBoard;                 //+0x4
    float               mPosX;                  //+0x8
    float               mPosY;                  //+0xC
    int                 mRenderOrder;           //+0x10
    int                 mRow;                   //+0x14
    Sexy::TimeCounter                 mAnimTicksPerFrame;     //+0x18
    ReanimationID       mReanimID;              //+0x1C
    Sexy::TimeCounter                 mChompCounter;          //+0x20
    Sexy::TimeCounter                 mRollingInCounter;      //+0x24
    Sexy::TimeCounter                 mSquishedCounter;       //+0x28
    LawnMowerState      mMowerState;            //+0x2C
    bool                mDead;                  //+0x30
    bool                mVisible;               //+0x31
    LawnMowerType       mMowerType;             //+0x34
    float               mAltitude;              //+0x38
    MowerHeight         mMowerHeight;           //+0x3C
    int                 mLastPortalX;           //+0x40
    double              mMotionOriginX = 0;
    // UINT64_MAX means unbound. Otherwise this is integer time in the current
    // constant-base-speed/chomp segment, never a rounded coordinate accumulator.
    std::uint64_t       mMotionElapsedNs = UINT64_MAX;
    std::int64_t        mMotionChompStartNs = 0;
    float               mMotionBaseSpeed = 0;
    // Pool entry/exit always starts at 0/-28; only these transitions write altitude.
    std::uint64_t       mAltitudeElapsedNs = 0;

public:
    void                LawnMowerInitialize(int theRow);
    void                StartMower();
    void                Update();
    void                Draw(Graphics* g);
    void                Die();
    inline Rect         GetLawnMowerAttackRect() { return Rect(mPosX, mPosY, 50, 80); }
    void                UpdatePool();
    void                MowZombie(Zombie* theZombie);
    void                SquishMower();
    /*inline*/ void     EnableSuperMower(bool theEnable);
};

