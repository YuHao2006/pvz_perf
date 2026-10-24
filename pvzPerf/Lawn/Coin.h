#pragma once
#include "misc/TimeCounter.h"
#include "GameObject.h"
#include "System/PlayerInfo.h"

class HitResult;
namespace Sexy
{
    class Graphics;
}
using namespace Sexy;

class Coin : public GameObject
{
public:
    float                   mPosX;                  //+0x24
    float                   mPosY;                  //+0x28
    float                   mVelX;                  //+0x2C
    float                   mVelY;                  //+0x30
    float                   mScale;                 //+0x34
    bool                    mDead;                  //+0x38
    Sexy::TimeCounter                     mFadeCount;             //+0x3C
    // Falling and pickup segments are mutually exclusive and share their origin.
    // 当前拾取运动段的起点，不是恒定的生成坐标。Collect() 记录；
    // 普通拾取的目标切换或外部改位时，会重新绑定这两个起点。
    float                   mCollectX;              //+0x40
    float                   mCollectY;              //+0x44
    int                     mGroundY;               //+0x48
    Sexy::TimeCounter                     mCoinAge;               //+0x4C
    bool                    mIsBeingCollected;      //+0x50
    // 按状态复用，底层 mNanoseconds 的单位始终是 ns：
    // 1. 未拾取：空中为当前解析运动段经过的时间；落地时重置为消失计时。
    //    关卡奖品另用作奖品/显示计时。
    // 2. 拾取中的普通阳光、钱币、解锁提示礼盒：当前吸附段已经过的时间，
    //    Collect() / 运动重绑定时归零，再加本次更新的纳秒步长。
    // 上述路径互斥；状态 2 中不是“还剩多久消失”，不得同时跑落地计时。
    // 存档连同 mIsBeingCollected、mType 和 mCollectX/Y 保存并恢复其含义。
    Sexy::TimeCounter                     mDisappearCounter;      //+0x54
    CoinType                mType;                  //+0x58
    CoinMotion              mCoinMotion;            //+0x5C
    AttachmentID            mAttachmentID;          //+0x60
    // 拾取的入账/缩放/透明度采样距离；保留原版前一个 10ms 时刻的语义，
    // 不一定等于本次新坐标到目标的几何距离。
    float                   mCollectionDistance;    //+0x64
    SeedType                mUsableSeedType;        //+0x68
    PottedPlant             mPottedPlantSpec;       //+0x70
    bool                    mNeedsBouncyArrow;      //+0xC8
    bool                    mHasBouncyArrow;        //+0xC9
    bool                    mHitGround;             //+0xCA
    int                     mTimesDropped;          //+0xCC
    // Segment-origin velocities for analytic falling. Current mVelX/Y remain
    // public outputs and external edits rebind this segment on the next update.
    float                   mFallVelocityX = 0;
    float                   mFallVelocityY = 0;
    // Plant-sun growth advances only while UpdateFall runs. Coin age also
    // advances during scene freezes, and the flight/ground counter can rebase.
    // Keep this separate integer segment so pauses, landing and wall impacts
    // cannot change growth. Public scale edits rebind its origin.
    float                   mFallScaleOrigin = 1;
    std::uint64_t           mFallScaleElapsedNs = 0;

public:
    Coin();
    ~Coin();

    void                    CoinInitialize(int theX, int theY, CoinType theCoinType, CoinMotion theCoinMotion);
    void                    MouseDown(int x, int y, int theClickCount);
    bool                    MouseHitTest(int theX, int theY, HitResult* theHitResult);
    void                    Die();
    void                    Update();
    void                    Draw(Graphics* g);
    void                    Collect();
    inline int              GetSunValue()
    {
        return mType == CoinType::COIN_SUN ? 25 : mType == CoinType::COIN_SMALLSUN ? 15 : mType == CoinType::COIN_LARGESUN ? 50 : 0;
    }
    static inline int       GetCoinValue(CoinType theCoinType)
    {
        // B 形态 -> 常量表 kCoinValueRows（原 4 支三目链合并；行序 = CoinType 枚举序
        // 0..27，count_last=末值 PRESENT_SURVIVAL_MODE 锚定；0 槽 = 原默认支）
        static constexpr int kCoinValueRows[(int)CoinType::COIN_PRESENT_SURVIVAL_MODE + 1] = {
            0,    // 0 COIN_NONE（原默认支）
            1,    // 1 COIN_SILVER
            5,    // 2 COIN_GOLD
            100,  // 3 COIN_DIAMOND
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  // 4..27 其余（原默认支）
        };
        static_assert(sizeof(kCoinValueRows) / sizeof(kCoinValueRows[0]) == (int)CoinType::COIN_PRESENT_SURVIVAL_MODE + 1,
            "kCoinValueRows 槽位须与 CoinType 枚举同步");

        return (unsigned)theCoinType < sizeof(kCoinValueRows) / sizeof(kCoinValueRows[0]) ?
            kCoinValueRows[(int)theCoinType] : 0;
    }
    void                    UpdateFade();
    void                    UpdateFall();
    void                    ScoreCoin();
    void                    UpdateCollected();
    Color                   GetColor();
    /*inline*/ bool         IsMoney();
    /*inline*/ bool         IsSun();
    inline float            GetSunScale()
    {
        return mType == CoinType::COIN_SMALLSUN ? 0.5f : mType == CoinType::COIN_LARGESUN ? 2.0f : 1.0f;
    }
    inline bool             IsOnGround() { return false; }
    SeedType                GetFinalSeedPacketType();
    bool                    IsLevelAward();
    bool                    CoinGetsBouncyArrow();
    void                    FanOutCoins(CoinType theCoinType, int theNumCoins);
    int                     GetDisappearTime();
    void                    DroppedUsableSeed();
    void                    PlayCollectSound();
    void                    TryAutoCollectAfterLevelAward();
    bool                    IsPresentWithAdvice();
    void                    PlayLaunchSound();
    void                    PlayGroundSound();

    static /*inline*/ bool  IsMoney(CoinType theType);
};

