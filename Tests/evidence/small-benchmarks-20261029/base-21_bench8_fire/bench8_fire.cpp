// bench8_fire.cpp - 目标8: Plant::Fire 原点 15 支 + 运动 7 支 -> kFireOrigin[53][2] 二维表（一项两测）
// FireOrigin: 原点链 vs [seed][weapon] 表（豌豆头族 4 特例表外保留）
// FireMotion: 运动链 vs 表分派 + 动力学特例 4 支
// 注：真实函数里 aFireRow 只算一次供原点+运动共用；拆测后 FormB 两个分节各付一次表载（对 FormB 保守，差值是下界）
#include "bench_common.h"

enum SeedType
{
    SEED_PEASHOOTER = 0, SEED_SUNFLOWER, SEED_CHERRYBOMB, SEED_WALLNUT, SEED_POTATOMINE,
    SEED_SNOWPEA, SEED_CHOMPER, SEED_REPEATER, SEED_PUFFSHROOM, SEED_SUNSHROOM,
    SEED_FUMESHROOM, SEED_GRAVEBUSTER, SEED_HYPNOSHROOM, SEED_SCAREDYSHROOM, SEED_ICESHROOM,
    SEED_DOOMSHROOM, SEED_LILYPAD, SEED_SQUASH, SEED_THREEPEATER, SEED_TANGLEKELP,
    SEED_JALAPENO, SEED_SPIKEWEED, SEED_TORCHWOOD, SEED_TALLNUT, SEED_SEASHROOM,
    SEED_PLANTERN, SEED_CACTUS, SEED_BLOVER, SEED_SPLITPEA, SEED_STARFRUIT,
    SEED_PUMPKINSHELL, SEED_MAGNETSHROOM, SEED_CABBAGEPULT, SEED_FLOWERPOT, SEED_KERNELPULT,
    SEED_INSTANT_COFFEE, SEED_GARLIC, SEED_UMBRELLA, SEED_MARIGOLD, SEED_MELONPULT,
    SEED_GATLINGPEA, SEED_TWINSUNFLOWER, SEED_GLOOMSHROOM, SEED_CATTAIL, SEED_WINTERMELON,
    SEED_GOLD_MAGNET, SEED_SPIKEROCK, SEED_COBCANNON, SEED_IMITATER, SEED_EXPLODE_O_NUT,
    SEED_GIANT_WALLNUT, SEED_SPROUT, SEED_LEFTPEATER,
    NUM_SEED_TYPES,
    SEED_NONE = -1
};
enum PlantWeapon { WEAPON_PRIMARY, WEAPON_SECONDARY };
enum ProjectileMotion { MOTION_NONE, MOTION_LOBBED, MOTION_BACKWARDS, MOTION_PUFF, MOTION_HOMING, MOTION_THREEPEATER };
enum ZombiePhase { PHASE_WALKING = 0, PHASE_DOLPHIN_RIDING, PHASE_SNORKEL_WALKING_IN_POOL };
enum ZombieType { ZOMBIE_NORMAL = 0, ZOMBIE_POGO, ZOMBIE_BOSS };

struct Rect { int mX, mY, mWidth, mHeight; };

struct Zombie
{
    ZombiePhase mZombiePhase;
    ZombieType mZombieType;
    bool mHasObject;
    Rect mRect;
    float mLeadX;
    Rect GetZombieRect() const { return mRect; }
    float ZombieTargetLeadX(float v) const { return mLeadX + v; }
};
static Zombie gZombie;

struct Projectile
{
    ProjectileMotion mMotionType;
    float mVelX, mVelY, mVelZ, mAccZ;
    float mShadowY;
    int mDamageRangeFlags;
    int mTargetZombieID;
    int mCobTargetX;
    int mCobTargetRow;
};
static Projectile gProjectile;

struct Board
{
    int mFlags;
    bool mHasPot;
    Projectile* AddProjectile(int x, int y, int ro, int row, int)
    {
        (void)x; (void)y; (void)ro; (void)row;
        gProjectile.mMotionType = MOTION_NONE;
        gProjectile.mVelX = gProjectile.mVelY = gProjectile.mVelZ = gProjectile.mAccZ = 0.0f;
        gProjectile.mShadowY = 0.0f;
        gProjectile.mDamageRangeFlags = 0;
        gProjectile.mTargetZombieID = 0;
        gProjectile.mCobTargetX = 0;
        gProjectile.mCobTargetRow = 0;
        return &gProjectile;
    }
    bool GetFlowerPotAt(int, int) { return mHasPot; }
    float GridToPixelY(int col, int row) { return (float)(col * 90 + row * 110 + 15); }
    int PixelToGridYKeepOnBoard(int x, int y) { return (x + y) % 9; }
    int ZombieGetID(Zombie* z) { return z ? 0xABCD : 0; }
};
static Board gBoard;

struct Plant
{
    SeedType mSeedType;
    int mX, mY;
    int mPlantCol, mRow;
    int mRenderOrder;
    int mTargetX, mTargetY;
    Board* mBoard;

    void GetPeaHeadOffset(int& theOffsetX, int& theOffsetY)
    {
        theOffsetX = (int)(mX % 17);
        theOffsetY = (int)(mY % 13);
    }
    int GetDamageRangeFlags(PlantWeapon w) const { return w == PlantWeapon::WEAPON_PRIMARY ? 1 : 2; }
};
static Plant gPlant;

static void SetupFire(uint32_t inp)
{
    gPlant.mSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    gPlant.mX = (int)((inp >> 8) & 0xFFu) + 40;
    gPlant.mY = (int)((inp >> 16) & 0xFFu) + 60;
    gPlant.mPlantCol = (int)((inp >> 6) & 0xFu);
    gPlant.mRow = (int)((inp >> 12) & 0x7u);
    gPlant.mRenderOrder = (int)(inp >> 3);
    gPlant.mTargetX = (int)((inp >> 10) & 0x3FFu);
    gPlant.mTargetY = (int)((inp >> 14) & 0x3FFu);
    gPlant.mBoard = &gBoard;
    gBoard.mHasPot = (inp >> 23) & 1u;
    gZombie.mZombiePhase = (ZombiePhase)((inp >> 25) % 3u);
    gZombie.mZombieType = (ZombieType)((inp >> 27) % 3u);
    gZombie.mHasObject = (inp >> 24) & 1u;
    gZombie.mRect = { (int)(inp & 0xFF), (int)((inp >> 5) & 0x7F), 80, 120 };
    gZombie.mLeadX = BitsToF(inp, 20);
}

// ================= FireOrigin =================

// ---------------- FormA：原 15 支原点链（逐字） ----------------
__declspec(noinline) void OneOriginA(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int mX = p.mX, mY = p.mY;

    int aOriginX, aOriginY;
    if (p.mSeedType == SeedType::SEED_PUFFSHROOM)
    {
        aOriginX = mX + 40;
        aOriginY = mY + 40;
    }
    else if (p.mSeedType == SeedType::SEED_SEASHROOM)
    {
        aOriginX = mX + 45;
        aOriginY = mY + 63;
    }
    else if (p.mSeedType == SeedType::SEED_CABBAGEPULT)
    {
        aOriginX = mX + 5;
        aOriginY = mY - 12;
    }
    else if (p.mSeedType == SeedType::SEED_MELONPULT || p.mSeedType == SeedType::SEED_WINTERMELON)
    {
        aOriginX = mX + 25;
        aOriginY = mY - 46;
    }
    else if (p.mSeedType == SeedType::SEED_CATTAIL)
    {
        aOriginX = mX + 20;
        aOriginY = mY - 3;
    }
    else if (p.mSeedType == SeedType::SEED_KERNELPULT && thePlantWeapon == PlantWeapon::WEAPON_PRIMARY)
    {
        aOriginX = mX + 19;
        aOriginY = mY - 37;
    }
    else if (p.mSeedType == SeedType::SEED_KERNELPULT && thePlantWeapon == PlantWeapon::WEAPON_SECONDARY)
    {
        aOriginX = mX + 12;
        aOriginY = mY - 56;
    }
    else if (p.mSeedType == SeedType::SEED_PEASHOOTER || p.mSeedType == SeedType::SEED_SNOWPEA || p.mSeedType == SeedType::SEED_REPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 24;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_LEFTPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX - aOffsetX + 27;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_GATLINGPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 34;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_SPLITPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginY = mY + aOffsetY - 33;

        if (thePlantWeapon == PlantWeapon::WEAPON_SECONDARY)
        {
            aOriginX = mX + aOffsetX - 64;
        }
        else
        {
            aOriginX = mX + aOffsetX + 24;
        }
    }
    else if (p.mSeedType == SeedType::SEED_THREEPEATER)
    {
        aOriginX = mX + 45;
        aOriginY = mY + 10;
    }
    else if (p.mSeedType == SeedType::SEED_SCAREDYSHROOM)
    {
        aOriginX = mX + 29;
        aOriginY = mY + 21;
    }
    else if (p.mSeedType == SeedType::SEED_CACTUS)
    {
        if (thePlantWeapon == PlantWeapon::WEAPON_PRIMARY)
        {
            aOriginX = mX + 93;
            aOriginY = mY - 50;
        }
        else
        {
            aOriginX = mX + 70;
            aOriginY = mY + 23;
        }
    }
    else if (p.mSeedType == SeedType::SEED_COBCANNON)
    {
        aOriginX = mX - 44;
        aOriginY = mY - 184;
    }
    else
    {
        aOriginX = mX + 10;
        aOriginY = mY + 5;
    }
    if (p.mBoard->GetFlowerPotAt(p.mPlantCol, p.mRow))
    {
        aOriginY -= 5;
    }

    MixI(aOriginX); MixI(aOriginY);
}

// ---------------- FormB：当前表形态（逐字） ----------------
__declspec(noinline) void OneOriginB(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int mX = p.mX, mY = p.mY;

    constexpr ProjectileMotion kFireMotionNone = (ProjectileMotion)-1;
    struct FireOriginEntry { int mDx; int mDy; ProjectileMotion mMotion; };
    constexpr FireOriginEntry kFireOriginDefault = { 10, 5, kFireMotionNone };
    constexpr FireOriginEntry kFireOrigin[(int)SeedType::NUM_SEED_TYPES][2] = {
        /* SEED_PEASHOOTER        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SUNFLOWER         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHERRYBOMB        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_WALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_POTATOMINE        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SNOWPEA           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHOMPER           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_REPEATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUFFSHROOM        */ { { 40, 40, ProjectileMotion::MOTION_PUFF }, { 40, 40, ProjectileMotion::MOTION_PUFF } },
        /* SEED_SUNSHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_FUMESHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GRAVEBUSTER       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_HYPNOSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SCAREDYSHROOM     */ { { 29, 21, kFireMotionNone }, { 29, 21, kFireMotionNone } },
        /* SEED_ICESHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_DOOMSHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LILYPAD           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SQUASH            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_THREEPEATER       */ { { 45, 10, ProjectileMotion::MOTION_THREEPEATER }, { 45, 10, ProjectileMotion::MOTION_THREEPEATER } },
        /* SEED_TANGLEKELP        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_JALAPENO          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEWEED         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TORCHWOOD         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SEASHROOM         */ { { 45, 63, ProjectileMotion::MOTION_PUFF }, { 45, 63, ProjectileMotion::MOTION_PUFF } },
        /* SEED_PLANTERN          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CACTUS            */ { { 93, -50, kFireMotionNone }, { 70, 23, kFireMotionNone } },
        /* SEED_BLOVER            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPLITPEA          */ { { 10, 5, kFireMotionNone }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
        /* SEED_STARFRUIT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUMPKINSHELL      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MAGNETSHROOM      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CABBAGEPULT       */ { { 5, -12, ProjectileMotion::MOTION_LOBBED }, { 5, -12, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_FLOWERPOT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_KERNELPULT        */ { { 19, -37, ProjectileMotion::MOTION_LOBBED }, { 12, -56, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_INSTANT_COFFEE    */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GARLIC            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_UMBRELLA          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MARIGOLD          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MELONPULT         */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GATLINGPEA        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TWINSUNFLOWER     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GLOOMSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CATTAIL           */ { { 20, -3, ProjectileMotion::MOTION_HOMING }, { 20, -3, ProjectileMotion::MOTION_HOMING } },
        /* SEED_WINTERMELON       */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GOLD_MAGNET       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEROCK         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_COBCANNON         */ { { -44, -184, ProjectileMotion::MOTION_LOBBED }, { -44, -184, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_IMITATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_EXPLODE_O_NUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GIANT_WALLNUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPROUT            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LEFTPEATER        */ { { 10, 5, ProjectileMotion::MOTION_BACKWARDS }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
    };
    static_assert(sizeof(kFireOrigin) / sizeof(kFireOrigin[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kFireOrigin 槽位须与 SeedType 枚举同步");
    const FireOriginEntry& aFireRow = (unsigned)p.mSeedType < (int)SeedType::NUM_SEED_TYPES
        ? kFireOrigin[(int)p.mSeedType][(int)thePlantWeapon]
        : kFireOriginDefault;

    int aOriginX, aOriginY;
    if (p.mSeedType == SeedType::SEED_PEASHOOTER || p.mSeedType == SeedType::SEED_SNOWPEA || p.mSeedType == SeedType::SEED_REPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 24;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_LEFTPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX - aOffsetX + 27;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_GATLINGPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 34;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_SPLITPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginY = mY + aOffsetY - 33;

        if (thePlantWeapon == PlantWeapon::WEAPON_SECONDARY)
        {
            aOriginX = mX + aOffsetX - 64;
        }
        else
        {
            aOriginX = mX + aOffsetX + 24;
        }
    }
    else
    {
        aOriginX = mX + aFireRow.mDx;
        aOriginY = mY + aFireRow.mDy;
    }
    if (p.mBoard->GetFlowerPotAt(p.mPlantCol, p.mRow))
    {
        aOriginY -= 5;
    }

    MixI(aOriginX); MixI(aOriginY);
}

// ---------------- FormC：FormB 逐字 + static constexpr（诊断：免每次调用栈物化） ----------------
__declspec(noinline) void OneOriginC(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int mX = p.mX, mY = p.mY;

    constexpr ProjectileMotion kFireMotionNone = (ProjectileMotion)-1;
    struct FireOriginEntry { int mDx; int mDy; ProjectileMotion mMotion; };
    constexpr FireOriginEntry kFireOriginDefault = { 10, 5, kFireMotionNone };
    static constexpr FireOriginEntry kFireOrigin[(int)SeedType::NUM_SEED_TYPES][2] = {
        /* SEED_PEASHOOTER        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SUNFLOWER         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHERRYBOMB        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_WALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_POTATOMINE        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SNOWPEA           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHOMPER           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_REPEATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUFFSHROOM        */ { { 40, 40, ProjectileMotion::MOTION_PUFF }, { 40, 40, ProjectileMotion::MOTION_PUFF } },
        /* SEED_SUNSHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_FUMESHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GRAVEBUSTER       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_HYPNOSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SCAREDYSHROOM     */ { { 29, 21, kFireMotionNone }, { 29, 21, kFireMotionNone } },
        /* SEED_ICESHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_DOOMSHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LILYPAD           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SQUASH            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_THREEPEATER       */ { { 45, 10, ProjectileMotion::MOTION_THREEPEATER }, { 45, 10, ProjectileMotion::MOTION_THREEPEATER } },
        /* SEED_TANGLEKELP        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_JALAPENO          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEWEED         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TORCHWOOD         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SEASHROOM         */ { { 45, 63, ProjectileMotion::MOTION_PUFF }, { 45, 63, ProjectileMotion::MOTION_PUFF } },
        /* SEED_PLANTERN          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CACTUS            */ { { 93, -50, kFireMotionNone }, { 70, 23, kFireMotionNone } },
        /* SEED_BLOVER            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPLITPEA          */ { { 10, 5, kFireMotionNone }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
        /* SEED_STARFRUIT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUMPKINSHELL      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MAGNETSHROOM      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CABBAGEPULT       */ { { 5, -12, ProjectileMotion::MOTION_LOBBED }, { 5, -12, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_FLOWERPOT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_KERNELPULT        */ { { 19, -37, ProjectileMotion::MOTION_LOBBED }, { 12, -56, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_INSTANT_COFFEE    */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GARLIC            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_UMBRELLA          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MARIGOLD          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MELONPULT         */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GATLINGPEA        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TWINSUNFLOWER     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GLOOMSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CATTAIL           */ { { 20, -3, ProjectileMotion::MOTION_HOMING }, { 20, -3, ProjectileMotion::MOTION_HOMING } },
        /* SEED_WINTERMELON       */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GOLD_MAGNET       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEROCK         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_COBCANNON         */ { { -44, -184, ProjectileMotion::MOTION_LOBBED }, { -44, -184, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_IMITATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_EXPLODE_O_NUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GIANT_WALLNUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPROUT            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LEFTPEATER        */ { { 10, 5, ProjectileMotion::MOTION_BACKWARDS }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
    };
    static_assert(sizeof(kFireOrigin) / sizeof(kFireOrigin[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kFireOrigin 槽位须与 SeedType 枚举同步");
    const FireOriginEntry& aFireRow = (unsigned)p.mSeedType < (int)SeedType::NUM_SEED_TYPES
        ? kFireOrigin[(int)p.mSeedType][(int)thePlantWeapon]
        : kFireOriginDefault;

    int aOriginX, aOriginY;
    if (p.mSeedType == SeedType::SEED_PEASHOOTER || p.mSeedType == SeedType::SEED_SNOWPEA || p.mSeedType == SeedType::SEED_REPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 24;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_LEFTPEATER)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX - aOffsetX + 27;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_GATLINGPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginX = mX + aOffsetX + 34;
        aOriginY = mY + aOffsetY - 33;
    }
    else if (p.mSeedType == SeedType::SEED_SPLITPEA)
    {
        int aOffsetX, aOffsetY;
        p.GetPeaHeadOffset(aOffsetX, aOffsetY);
        aOriginY = mY + aOffsetY - 33;

        if (thePlantWeapon == PlantWeapon::WEAPON_SECONDARY)
        {
            aOriginX = mX + aOffsetX - 64;
        }
        else
        {
            aOriginX = mX + aOffsetX + 24;
        }
    }
    else
    {
        aOriginX = mX + aFireRow.mDx;
        aOriginY = mY + aFireRow.mDy;
    }
    if (p.mBoard->GetFlowerPotAt(p.mPlantCol, p.mRow))
    {
        aOriginY -= 5;
    }

    MixI(aOriginX); MixI(aOriginY);
}

// ================= FireMotion =================
// theRow = mRow ± 1（由输入位选择）：原链 THREEPEATER 同行支不设运动型，
// 表形态槽位恒 MOTION_THREEPEATER——这是提交本身的语义差异（同行三线射手），
// 对拍输入构造规避同行，差异单列备注。

// ---------------- FormA：原 7 支运动链（逐字） ----------------
__declspec(noinline) void OneMotionA(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int theRow = p.mRow + (((inp >> 25) & 1u) ? 1 : -1);
    Zombie* theTargetZombie = ((inp >> 24) & 1u) ? &gZombie : nullptr;
    // 原点（公共）：取中位确定值，两形态相同
    int aOriginX = p.mX + 10, aOriginY = p.mY + 5;

    Projectile* aProjectile = p.mBoard->AddProjectile(aOriginX, aOriginY, p.mRenderOrder - 1, theRow, 0);
    aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(thePlantWeapon);

    if (p.mSeedType == SeedType::SEED_CABBAGEPULT || p.mSeedType == SeedType::SEED_KERNELPULT ||
        p.mSeedType == SeedType::SEED_MELONPULT || p.mSeedType == SeedType::SEED_WINTERMELON)
    {
        float aRangeX, aRangeY;
        if (theTargetZombie)
        {
            Rect aZombieRect = theTargetZombie->GetZombieRect();
            aRangeX = theTargetZombie->ZombieTargetLeadX(50.0f) - aOriginX - 30.0f;
            aRangeY = aZombieRect.mY - aOriginY;

            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_DOLPHIN_RIDING)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_POGO && theTargetZombie->mHasObject)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL)
            {
                aRangeX -= 40.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_BOSS)
            {
                aRangeY = p.mBoard->GridToPixelY(8, p.mRow) - aOriginY;
            }
        }
        else
        {
            aRangeX = 700.0f - aOriginX;
            aRangeY = 0.0f;
        }
        if (aRangeX < 40.0f)
        {
            aRangeX = 40.0f;
        }

        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelX = aRangeX / 120.0f;
        aProjectile->mVelY = 0.0f;
        aProjectile->mVelZ = aRangeY / 120.0f - 7.0f;
        aProjectile->mAccZ = 0.115f;
    }
    else if (p.mSeedType == SeedType::SEED_THREEPEATER)
    {
        if (theRow < p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = -3.0f;
            aProjectile->mShadowY += 80.0f;
        }
        else if (theRow > p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = 3.0f;
            aProjectile->mShadowY -= 80.0f;
        }
    }
    else if (p.mSeedType == SeedType::SEED_PUFFSHROOM || p.mSeedType == SeedType::SEED_SEASHROOM)
    {
        aProjectile->mMotionType = ProjectileMotion::MOTION_PUFF;
    }
    else if (p.mSeedType == SeedType::SEED_SPLITPEA && thePlantWeapon == PlantWeapon::WEAPON_SECONDARY)
    {
        aProjectile->mMotionType = ProjectileMotion::MOTION_BACKWARDS;
    }
    else if (p.mSeedType == SeedType::SEED_LEFTPEATER)
    {
        aProjectile->mMotionType = ProjectileMotion::MOTION_BACKWARDS;
    }
    else if (p.mSeedType == SeedType::SEED_CATTAIL)
    {
        aProjectile->mVelX = 2.0f;
        aProjectile->mMotionType = ProjectileMotion::MOTION_HOMING;
        aProjectile->mTargetZombieID = p.mBoard->ZombieGetID(theTargetZombie);
    }
    else if (p.mSeedType == SeedType::SEED_COBCANNON)
    {
        aProjectile->mVelX = 0.001f;
        aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY);
        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelY = 0.0f;
        aProjectile->mAccZ = 0.0f;
        aProjectile->mVelZ = -8.0f;
        aProjectile->mCobTargetX = p.mTargetX - 40;
        aProjectile->mCobTargetRow = p.mBoard->PixelToGridYKeepOnBoard(p.mTargetX, p.mTargetY);
    }

    MixI((int)aProjectile->mMotionType);
    MixF(aProjectile->mVelX); MixF(aProjectile->mVelY); MixF(aProjectile->mVelZ); MixF(aProjectile->mAccZ);
    MixF(aProjectile->mShadowY); MixI(aProjectile->mDamageRangeFlags); MixI(aProjectile->mTargetZombieID);
    MixI(aProjectile->mCobTargetX); MixI(aProjectile->mCobTargetRow);
}

// ---------------- FormB：当前表形态（逐字：表分派 + 动力学特例 4 支） ----------------
__declspec(noinline) void OneMotionB(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int theRow = p.mRow + (((inp >> 25) & 1u) ? 1 : -1);
    Zombie* theTargetZombie = ((inp >> 24) & 1u) ? &gZombie : nullptr;
    int aOriginX = p.mX + 10, aOriginY = p.mY + 5;

    constexpr ProjectileMotion kFireMotionNone = (ProjectileMotion)-1;
    struct FireOriginEntry { int mDx; int mDy; ProjectileMotion mMotion; };
    constexpr FireOriginEntry kFireOriginDefault = { 10, 5, kFireMotionNone };
    constexpr FireOriginEntry kFireOrigin[(int)SeedType::NUM_SEED_TYPES][2] = {
        /* SEED_PEASHOOTER        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SUNFLOWER         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHERRYBOMB        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_WALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_POTATOMINE        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SNOWPEA           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHOMPER           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_REPEATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUFFSHROOM        */ { { 40, 40, ProjectileMotion::MOTION_PUFF }, { 40, 40, ProjectileMotion::MOTION_PUFF } },
        /* SEED_SUNSHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_FUMESHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GRAVEBUSTER       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_HYPNOSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SCAREDYSHROOM     */ { { 29, 21, kFireMotionNone }, { 29, 21, kFireMotionNone } },
        /* SEED_ICESHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_DOOMSHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LILYPAD           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SQUASH            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_THREEPEATER       */ { { 45, 10, ProjectileMotion::MOTION_THREEPEATER }, { 45, 10, ProjectileMotion::MOTION_THREEPEATER } },
        /* SEED_TANGLEKELP        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_JALAPENO          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEWEED         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TORCHWOOD         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SEASHROOM         */ { { 45, 63, ProjectileMotion::MOTION_PUFF }, { 45, 63, ProjectileMotion::MOTION_PUFF } },
        /* SEED_PLANTERN          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CACTUS            */ { { 93, -50, kFireMotionNone }, { 70, 23, kFireMotionNone } },
        /* SEED_BLOVER            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPLITPEA          */ { { 10, 5, kFireMotionNone }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
        /* SEED_STARFRUIT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUMPKINSHELL      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MAGNETSHROOM      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CABBAGEPULT       */ { { 5, -12, ProjectileMotion::MOTION_LOBBED }, { 5, -12, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_FLOWERPOT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_KERNELPULT        */ { { 19, -37, ProjectileMotion::MOTION_LOBBED }, { 12, -56, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_INSTANT_COFFEE    */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GARLIC            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_UMBRELLA          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MARIGOLD          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MELONPULT         */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GATLINGPEA        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TWINSUNFLOWER     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GLOOMSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CATTAIL           */ { { 20, -3, ProjectileMotion::MOTION_HOMING }, { 20, -3, ProjectileMotion::MOTION_HOMING } },
        /* SEED_WINTERMELON       */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GOLD_MAGNET       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEROCK         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_COBCANNON         */ { { -44, -184, ProjectileMotion::MOTION_LOBBED }, { -44, -184, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_IMITATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_EXPLODE_O_NUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GIANT_WALLNUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPROUT            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LEFTPEATER        */ { { 10, 5, ProjectileMotion::MOTION_BACKWARDS }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
    };
    static_assert(sizeof(kFireOrigin) / sizeof(kFireOrigin[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kFireOrigin 槽位须与 SeedType 枚举同步");
    const FireOriginEntry& aFireRow = (unsigned)p.mSeedType < (int)SeedType::NUM_SEED_TYPES
        ? kFireOrigin[(int)p.mSeedType][(int)thePlantWeapon]
        : kFireOriginDefault;

    Projectile* aProjectile = p.mBoard->AddProjectile(aOriginX, aOriginY, p.mRenderOrder - 1, theRow, 0);
    aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(thePlantWeapon);

    if (aFireRow.mMotion != kFireMotionNone)
    {
        aProjectile->mMotionType = aFireRow.mMotion;
    }

    if (p.mSeedType == SeedType::SEED_CABBAGEPULT || p.mSeedType == SeedType::SEED_KERNELPULT ||
        p.mSeedType == SeedType::SEED_MELONPULT || p.mSeedType == SeedType::SEED_WINTERMELON)
    {
        float aRangeX, aRangeY;
        if (theTargetZombie)
        {
            Rect aZombieRect = theTargetZombie->GetZombieRect();
            aRangeX = theTargetZombie->ZombieTargetLeadX(50.0f) - aOriginX - 30.0f;
            aRangeY = aZombieRect.mY - aOriginY;

            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_DOLPHIN_RIDING)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_POGO && theTargetZombie->mHasObject)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL)
            {
                aRangeX -= 40.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_BOSS)
            {
                aRangeY = p.mBoard->GridToPixelY(8, p.mRow) - aOriginY;
            }
        }
        else
        {
            aRangeX = 700.0f - aOriginX;
            aRangeY = 0.0f;
        }
        if (aRangeX < 40.0f)
        {
            aRangeX = 40.0f;
        }

        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelX = aRangeX / 120.0f;
        aProjectile->mVelY = 0.0f;
        aProjectile->mVelZ = aRangeY / 120.0f - 7.0f;
        aProjectile->mAccZ = 0.115f;
    }
    else if (p.mSeedType == SeedType::SEED_THREEPEATER)
    {
        if (theRow < p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = -3.0f;
            aProjectile->mShadowY += 80.0f;
        }
        else if (theRow > p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = 3.0f;
            aProjectile->mShadowY -= 80.0f;
        }
    }
    else if (p.mSeedType == SeedType::SEED_CATTAIL)
    {
        aProjectile->mVelX = 2.0f;
        aProjectile->mMotionType = ProjectileMotion::MOTION_HOMING;
        aProjectile->mTargetZombieID = p.mBoard->ZombieGetID(theTargetZombie);
    }
    else if (p.mSeedType == SeedType::SEED_COBCANNON)
    {
        aProjectile->mVelX = 0.001f;
        aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY);
        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelY = 0.0f;
        aProjectile->mAccZ = 0.0f;
        aProjectile->mVelZ = -8.0f;
        aProjectile->mCobTargetX = p.mTargetX - 40;
        aProjectile->mCobTargetRow = p.mBoard->PixelToGridYKeepOnBoard(p.mTargetX, p.mTargetY);
    }

    MixI((int)aProjectile->mMotionType);
    MixF(aProjectile->mVelX); MixF(aProjectile->mVelY); MixF(aProjectile->mVelZ); MixF(aProjectile->mAccZ);
    MixF(aProjectile->mShadowY); MixI(aProjectile->mDamageRangeFlags); MixI(aProjectile->mTargetZombieID);
    MixI(aProjectile->mCobTargetX); MixI(aProjectile->mCobTargetRow);
}

// ---------------- FormC：FormB 逐字 + static constexpr（诊断：免每次调用栈物化） ----------------
__declspec(noinline) void OneMotionC(uint32_t inp)
{
    SetupFire(inp);
    Plant& p = gPlant;
    PlantWeapon thePlantWeapon = (inp >> 26) & 1u ? PlantWeapon::WEAPON_SECONDARY : PlantWeapon::WEAPON_PRIMARY;
    int theRow = p.mRow + (((inp >> 25) & 1u) ? 1 : -1);
    Zombie* theTargetZombie = ((inp >> 24) & 1u) ? &gZombie : nullptr;
    int aOriginX = p.mX + 10, aOriginY = p.mY + 5;

    constexpr ProjectileMotion kFireMotionNone = (ProjectileMotion)-1;
    struct FireOriginEntry { int mDx; int mDy; ProjectileMotion mMotion; };
    constexpr FireOriginEntry kFireOriginDefault = { 10, 5, kFireMotionNone };
    static constexpr FireOriginEntry kFireOrigin[(int)SeedType::NUM_SEED_TYPES][2] = {
        /* SEED_PEASHOOTER        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SUNFLOWER         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHERRYBOMB        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_WALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_POTATOMINE        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SNOWPEA           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CHOMPER           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_REPEATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUFFSHROOM        */ { { 40, 40, ProjectileMotion::MOTION_PUFF }, { 40, 40, ProjectileMotion::MOTION_PUFF } },
        /* SEED_SUNSHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_FUMESHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GRAVEBUSTER       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_HYPNOSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SCAREDYSHROOM     */ { { 29, 21, kFireMotionNone }, { 29, 21, kFireMotionNone } },
        /* SEED_ICESHROOM         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_DOOMSHROOM        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LILYPAD           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SQUASH            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_THREEPEATER       */ { { 45, 10, ProjectileMotion::MOTION_THREEPEATER }, { 45, 10, ProjectileMotion::MOTION_THREEPEATER } },
        /* SEED_TANGLEKELP        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_JALAPENO          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEWEED         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TORCHWOOD         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TALLNUT           */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SEASHROOM         */ { { 45, 63, ProjectileMotion::MOTION_PUFF }, { 45, 63, ProjectileMotion::MOTION_PUFF } },
        /* SEED_PLANTERN          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CACTUS            */ { { 93, -50, kFireMotionNone }, { 70, 23, kFireMotionNone } },
        /* SEED_BLOVER            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPLITPEA          */ { { 10, 5, kFireMotionNone }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
        /* SEED_STARFRUIT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_PUMPKINSHELL      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MAGNETSHROOM      */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CABBAGEPULT       */ { { 5, -12, ProjectileMotion::MOTION_LOBBED }, { 5, -12, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_FLOWERPOT         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_KERNELPULT        */ { { 19, -37, ProjectileMotion::MOTION_LOBBED }, { 12, -56, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_INSTANT_COFFEE    */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GARLIC            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_UMBRELLA          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MARIGOLD          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_MELONPULT         */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GATLINGPEA        */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_TWINSUNFLOWER     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GLOOMSHROOM       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_CATTAIL           */ { { 20, -3, ProjectileMotion::MOTION_HOMING }, { 20, -3, ProjectileMotion::MOTION_HOMING } },
        /* SEED_WINTERMELON       */ { { 25, -46, ProjectileMotion::MOTION_LOBBED }, { 25, -46, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_GOLD_MAGNET       */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPIKEROCK         */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_COBCANNON         */ { { -44, -184, ProjectileMotion::MOTION_LOBBED }, { -44, -184, ProjectileMotion::MOTION_LOBBED } },
        /* SEED_IMITATER          */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_EXPLODE_O_NUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_GIANT_WALLNUT     */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_SPROUT            */ { kFireOriginDefault, kFireOriginDefault },
        /* SEED_LEFTPEATER        */ { { 10, 5, ProjectileMotion::MOTION_BACKWARDS }, { 10, 5, ProjectileMotion::MOTION_BACKWARDS } },
    };
    static_assert(sizeof(kFireOrigin) / sizeof(kFireOrigin[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kFireOrigin 槽位须与 SeedType 枚举同步");
    const FireOriginEntry& aFireRow = (unsigned)p.mSeedType < (int)SeedType::NUM_SEED_TYPES
        ? kFireOrigin[(int)p.mSeedType][(int)thePlantWeapon]
        : kFireOriginDefault;

    Projectile* aProjectile = p.mBoard->AddProjectile(aOriginX, aOriginY, p.mRenderOrder - 1, theRow, 0);
    aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(thePlantWeapon);

    if (aFireRow.mMotion != kFireMotionNone)
    {
        aProjectile->mMotionType = aFireRow.mMotion;
    }

    if (p.mSeedType == SeedType::SEED_CABBAGEPULT || p.mSeedType == SeedType::SEED_KERNELPULT ||
        p.mSeedType == SeedType::SEED_MELONPULT || p.mSeedType == SeedType::SEED_WINTERMELON)
    {
        float aRangeX, aRangeY;
        if (theTargetZombie)
        {
            Rect aZombieRect = theTargetZombie->GetZombieRect();
            aRangeX = theTargetZombie->ZombieTargetLeadX(50.0f) - aOriginX - 30.0f;
            aRangeY = aZombieRect.mY - aOriginY;

            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_DOLPHIN_RIDING)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_POGO && theTargetZombie->mHasObject)
            {
                aRangeX -= 60.0f;
            }
            if (theTargetZombie->mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL)
            {
                aRangeX -= 40.0f;
            }
            if (theTargetZombie->mZombieType == ZombieType::ZOMBIE_BOSS)
            {
                aRangeY = p.mBoard->GridToPixelY(8, p.mRow) - aOriginY;
            }
        }
        else
        {
            aRangeX = 700.0f - aOriginX;
            aRangeY = 0.0f;
        }
        if (aRangeX < 40.0f)
        {
            aRangeX = 40.0f;
        }

        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelX = aRangeX / 120.0f;
        aProjectile->mVelY = 0.0f;
        aProjectile->mVelZ = aRangeY / 120.0f - 7.0f;
        aProjectile->mAccZ = 0.115f;
    }
    else if (p.mSeedType == SeedType::SEED_THREEPEATER)
    {
        if (theRow < p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = -3.0f;
            aProjectile->mShadowY += 80.0f;
        }
        else if (theRow > p.mRow)
        {
            aProjectile->mMotionType = ProjectileMotion::MOTION_THREEPEATER;
            aProjectile->mVelY = 3.0f;
            aProjectile->mShadowY -= 80.0f;
        }
    }
    else if (p.mSeedType == SeedType::SEED_CATTAIL)
    {
        aProjectile->mVelX = 2.0f;
        aProjectile->mMotionType = ProjectileMotion::MOTION_HOMING;
        aProjectile->mTargetZombieID = p.mBoard->ZombieGetID(theTargetZombie);
    }
    else if (p.mSeedType == SeedType::SEED_COBCANNON)
    {
        aProjectile->mVelX = 0.001f;
        aProjectile->mDamageRangeFlags = p.GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY);
        aProjectile->mMotionType = ProjectileMotion::MOTION_LOBBED;
        aProjectile->mVelY = 0.0f;
        aProjectile->mAccZ = 0.0f;
        aProjectile->mVelZ = -8.0f;
        aProjectile->mCobTargetX = p.mTargetX - 40;
        aProjectile->mCobTargetRow = p.mBoard->PixelToGridYKeepOnBoard(p.mTargetX, p.mTargetY);
    }

    MixI((int)aProjectile->mMotionType);
    MixF(aProjectile->mVelX); MixF(aProjectile->mVelY); MixF(aProjectile->mVelZ); MixF(aProjectile->mAccZ);
    MixF(aProjectile->mShadowY); MixI(aProjectile->mDamageRangeFlags); MixI(aProjectile->mTargetZombieID);
    MixI(aProjectile->mCobTargetX); MixI(aProjectile->mCobTargetRow);
}

static void RunOriginA() { for (int i = 0; i < kN; i++) OneOriginA(gInput[i]); }
static void RunOriginB() { for (int i = 0; i < kN; i++) OneOriginB(gInput[i]); }
static void RunOriginC() { for (int i = 0; i < kN; i++) OneOriginC(gInput[i]); }
static void RunMotionA() { for (int i = 0; i < kN; i++) OneMotionA(gInput[i]); }
static void RunMotionB() { for (int i = 0; i < kN; i++) OneMotionB(gInput[i]); }
static void RunMotionC() { for (int i = 0; i < kN; i++) OneMotionC(gInput[i]); }

int main()
{
    GenInput();
    uint64_t ca1 = CheckOnly(RunOriginA);
    uint64_t cb1 = CheckOnly(RunOriginB);
    uint64_t cc1 = CheckOnly(RunOriginC);
    double a1 = TimePerIterNs(RunOriginA, kN);
    double b1 = TimePerIterNs(RunOriginB, kN);
    double c1 = TimePerIterNs(RunOriginC, kN);
    printf("bench8a FireOrigin | before %.2f ns | after %.2f ns | diff %.1f%% | C(static) %.2f ns | checksum=%s (A=%016llX B=%016llX C=%016llX)\n",
        a1, b1, (a1 - b1) / a1 * 100.0, c1, ca1 == cb1 && cb1 == cc1 ? "OK" : "MISMATCH",
        (unsigned long long)ca1, (unsigned long long)cb1, (unsigned long long)cc1);

    uint64_t ca2 = CheckOnly(RunMotionA);
    uint64_t cb2 = CheckOnly(RunMotionB);
    uint64_t cc2 = CheckOnly(RunMotionC);
    double a2 = TimePerIterNs(RunMotionA, kN);
    double b2 = TimePerIterNs(RunMotionB, kN);
    double c2 = TimePerIterNs(RunMotionC, kN);
    printf("bench8b FireMotion | before %.2f ns | after %.2f ns | diff %.1f%% | C(static) %.2f ns | checksum=%s (A=%016llX B=%016llX C=%016llX)\n",
        a2, b2, (a2 - b2) / a2 * 100.0, c2, ca2 == cb2 && cb2 == cc2 ? "OK" : "MISMATCH",
        (unsigned long long)ca2, (unsigned long long)cb2, (unsigned long long)cc2);
    return (ca1 == cb1 && cb1 == cc1 && ca2 == cb2 && cb2 == cc2) ? 0 : 1;
}
