#pragma once
#include "ConstEnums.h"
#include "GameObject.h"

class Plant;
class Zombie;
namespace Sexy
{
    class Graphics;
};
using namespace Sexy;

class ProjectileDefinition
{
public:
    ProjectileType          mProjectileType;
    int                     mImageRow;
    int                     mDamage;
};

class Projectile : public GameObject
{
public:
    int                     mFrame;                 //+0x24
    int                     mNumFrames;             //+0x28
    int                     mAnimCounter;           //+0x2C
    float                   mPosX;                  //+0x30
    float                   mPosY;                  //+0x34
    float                   mPosZ;                  //+0x38
    float                   mVelX;                  //+0x3C
    float                   mVelY;                  //+0x40
    float                   mVelZ;                  //+0x44
    float                   mAccZ;                  //+0x48
    float                   mShadowY;               //+0x4C
    bool                    mDead;                  //+0x50
    int                     mAnimTicksPerFrame;     //+0x54
    ProjectileMotion        mMotionType;            //+0x58
    ProjectileType          mProjectileType;        //+0x5C
    int                     mProjectileAge;         //+0x60
    int                     mClickBackoffCounter;   //+0x64
    float                   mRotation;              //+0x68
    float                   mRotationSpeed;         //+0x6C
    bool                    mOnHighGround;          //+0x70
    int                     mDamageRangeFlags;      //+0x74
    int                     mHitTorchwoodGridX;     //+0x78
    AttachmentID            mAttachmentID;          //+0x7C
    float                   mCobTargetX;            //+0x80
    int                     mCobTargetRow;          //+0x84
    ZombieID                mTargetZombieID;        //+0x88
    int                     mLastPortalX;           //+0x8C

public:
    Projectile();
    ~Projectile();

    void                    ProjectileInitialize(int theX, int theY, int theRenderOrder, int theRow, ProjectileType theProjectileType);
    void                    Update();
    void                    Draw(Graphics* g);
    void                    DrawShadow(Graphics* g);
    void                    Die();
    void                    DoImpact(Zombie* theZombie);
    void                    UpdateMotion();
    void                    CheckForCollision();
    [[nodiscard]] Zombie*                 FindCollisionTarget();
    // shadow 对拍参照（env PVZ_ZOMBIE_ROW_SHADOW=1）：1073 原全池扫逐字保留，
    // 非 shadow 路径不执行
    [[nodiscard]] Zombie*                 FindCollisionTargetScanAll();
    void                    UpdateLobMotion();
    void                    CheckForHighGround();
    bool                    CantHitHighGround();
    void                    DoSplashDamage(Zombie* theZombie);
    ProjectileDefinition&   GetProjectileDef();
    unsigned int            GetDamageFlags(Zombie* theZombie/* = nullptr*/);
    inline Rect                    GetProjectileRect()
    {
        // B 形态 -> 常量表 kProjRectRows（原 5 支链合并；行序 = ProjectileType 枚举
        // 序 0..13，NUM_PROJECTILES 锚定）。mW/mH：正值 = 绝对宽/高；负值/0 =
        // mWidth/mHeight 增量（只可放大）；零槽 = 原默认 Rect(mX, mY, mWidth, mHeight)。
        // 表外特例（先行分发）：COBBIG 中心 230 方框；FIREBALL mWidth-10 收窄——
        // 增量编码无法表达负增量，2026-10-03 对拍代理 checksum DIFF 抓获（曾被
        // 编码成 mWidth+10 放大 20px；BUTTER 槽同批被误填豌豆族行，已归零槽）。
        if (mProjectileType == ProjectileType::PROJECTILE_COBBIG)
        {
            return Rect(mX + mWidth / 2 - 115, mY + mHeight / 2 - 115, 230, 230);
        }
        if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
        {
            return Rect(mX, mY, mWidth - 10, mHeight);
        }

        static constexpr struct { int mDX; int mDY; int mW; int mH; } kProjRectRows[(int)ProjectileType::NUM_PROJECTILES] = {
            { -15, 0, -15, 0 },  // 0 PEA
            { -15, 0, -15, 0 },  // 1 SNOWPEA（共体）
            {   0, 0,   0, 0 },  // 2 CABBAGE（原默认）
            {  20, 0,  60, 0 },  // 3 MELON
            {   0, 0,   0, 0 },  // 4 PUFF（原默认）
            {  20, 0,  60, 0 },  // 5 WINTERMELON（共体）
            {   0, 0,   0, 0 },  // 6 FIREBALL（表外特例：mWidth-10 收窄，增量编码不可表达）
            {   0, 0,   0, 0 },  // 7 STAR（原默认）
            { -25, 0, -25, 0 },  // 8 SPIKE
            {   0, 0,   0, 0 },  // 9 BASKETBALL（原默认）
            {   0, 0,   0, 0 },  // 10 KERNEL（原默认）
            {   0, 0,   0, 0 },  // 11 COBBIG（表外特例占位）
            {   0, 0,   0, 0 },  // 12 BUTTER（原链无此支=默认框；曾被误填豌豆族行，对拍抓获已改）
            { -15, 0, -15, 0 },  // 13 ZOMBIE_PEA（共体）
        };
        static_assert(sizeof(kProjRectRows) / sizeof(kProjRectRows[0]) == (int)ProjectileType::NUM_PROJECTILES,
            "kProjRectRows 槽位须与 ProjectileType 枚举同步");

        if ((unsigned)mProjectileType >= sizeof(kProjRectRows) / sizeof(kProjRectRows[0]))
        {
            return Rect(mX, mY, mWidth, mHeight);  // 原 else 兜底
        }

        const auto& aRow = kProjRectRows[(int)mProjectileType];
        const int aWidth = aRow.mW > 0 ? aRow.mW : mWidth - aRow.mW;
        const int aHeight = aRow.mH > 0 ? aRow.mH : mHeight - aRow.mH;
        return Rect(mX + aRow.mDX, mY + aRow.mDY, aWidth, aHeight);
    }
    void                    UpdateNormalMotion();
    [[nodiscard]] Plant*                  FindCollisionTargetPlant();
    void                    ConvertToFireball(int theGridX);
    void                    ConvertToPea(int theGridX);
    bool                    IsSplashDamage(Zombie* theZombie/* = nullptr*/);
    void                    PlayImpactSound(Zombie* theZombie);
    bool                    IsZombieHitBySplash(Zombie* theZombie);
    bool                    PeaAboutToHitTorchwood();

};

