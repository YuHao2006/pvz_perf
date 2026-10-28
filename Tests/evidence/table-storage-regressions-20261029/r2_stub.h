// r2_stub.h — PVZ 段表补测第二轮（Plant/Coin/Projectile/SeedPacket/LawnMower）共享桩框架
// 铁律：不依赖仓库任何头文件；全部最小桩。字段保留，函数空桩编号(salt)入 checksum。
// 枚举槽位值与仓库 ConstEnums.h / Plant.h 逐项核对（PlantState 0..48、SeedType 0..52+53、
// CoinType 0..27、CoinMotion 0..6、ProjectileType 0..13+14、ProjectileMotion 0..9、
// TutorialState 0..30、MowerHeight 0..3）。
#pragma once
#define _CRT_SECURE_NO_WARNINGS
#define NOMINMAX
#include <windows.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#include <algorithm>
#include <cmath>

// ---------------------------------------------------------------- 基准参数
constexpr int    NIN  = 2'000'000;   // 2M 输入
constexpr int    NOBJ = 256;         // 对象池轮转
constexpr uint64_t RNG_SEED0 = 0x243F6A8885A308D3ULL;

// ---------------------------------------------------------------- checksum 汇
inline uint64_t g_ck = 0x9E3779B97F4A7C15ULL;
inline uint64_t MixCk(uint64_t salt, uint64_t v = 0)
{
    g_ck = g_ck * 0x100000001B3ULL ^ (salt * 0x9E3779B97F4A7C15ULL + v + 0x165667B19E3779F9ULL);
    return 0;
}

// ---------------------------------------------------------------- 确定性 RNG（共享）
inline uint64_t g_rng = RNG_SEED0;
inline void     RngReset() { g_rng = RNG_SEED0; }
inline uint32_t RngNext()
{
    g_rng = g_rng * 6364136223846793005ULL + 1442695040888963407ULL;
    return (uint32_t)(g_rng >> 33);
}

// ---------------------------------------------------------------- QPC 计时
inline double NowNs()
{
    static LARGE_INTEGER f = [] { LARGE_INTEGER q; QueryPerformanceFrequency(&q); return q; }();
    LARGE_INTEGER t; QueryPerformanceCounter(&t);
    return (double)t.QuadPart / (double)f.QuadPart * 1e9;
}

// ---------------------------------------------------------------- TOD_ASSERT / trace
#define TOD_ASSERT(x) ((void)0)
inline void TodTrace(const char*) { MixCk(0x0000A000ULL); }

// ================================================================ 枚举（槽位对表）
enum PlantState
{
    STATE_NOTREADY, STATE_READY, STATE_DOINGSPECIAL, STATE_SQUASH_LOOK, STATE_SQUASH_PRE_LAUNCH,
    STATE_SQUASH_RISING, STATE_SQUASH_FALLING, STATE_SQUASH_DONE_FALLING, STATE_GRAVEBUSTER_LANDING,
    STATE_GRAVEBUSTER_EATING, STATE_CHOMPER_BITING, STATE_CHOMPER_BITING_GOT_ONE, STATE_CHOMPER_BITING_MISSED,
    STATE_CHOMPER_DIGESTING, STATE_CHOMPER_SWALLOWING, STATE_POTATO_RISING, STATE_POTATO_ARMED, STATE_POTATO_MASHED,
    STATE_SPIKEWEED_ATTACKING, STATE_SPIKEWEED_ATTACKING_2, STATE_SCAREDYSHROOM_LOWERING, STATE_SCAREDYSHROOM_SCARED,
    STATE_SCAREDYSHROOM_RAISING, STATE_SUNSHROOM_SMALL, STATE_SUNSHROOM_GROWING, STATE_SUNSHROOM_BIG,
    STATE_MAGNETSHROOM_SUCKING, STATE_MAGNETSHROOM_CHARGING, STATE_BOWLING_UP, STATE_BOWLING_DOWN,
    STATE_CACTUS_LOW, STATE_CACTUS_RISING, STATE_CACTUS_HIGH, STATE_CACTUS_LOWERING, STATE_TANGLEKELP_GRABBING,
    STATE_COBCANNON_ARMING, STATE_COBCANNON_LOADING, STATE_COBCANNON_READY, STATE_COBCANNON_FIRING,
    STATE_KERNELPULT_BUTTER, STATE_UMBRELLA_TRIGGERED, STATE_UMBRELLA_REFLECTING, STATE_IMITATER_MORPHING,
    STATE_ZEN_GARDEN_WATERED, STATE_ZEN_GARDEN_NEEDY, STATE_ZEN_GARDEN_HAPPY, STATE_MARIGOLD_ENDING,
    STATE_FLOWERPOT_INVULNERABLE, STATE_LILYPAD_INVULNERABLE
};

enum SeedType
{
    SEED_NONE = -1,
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
    NUM_SEED_TYPES
};

enum CoinType
{
    COIN_NONE, COIN_SILVER, COIN_GOLD, COIN_DIAMOND, COIN_SUN, COIN_SMALLSUN, COIN_LARGESUN,
    COIN_FINAL_SEED_PACKET, COIN_TROPHY, COIN_SHOVEL, COIN_ALMANAC, COIN_CARKEYS, COIN_VASE,
    COIN_WATERING_CAN, COIN_TACO, COIN_NOTE, COIN_USABLE_SEED_PACKET, COIN_PRESENT_PLANT,
    COIN_AWARD_MONEY_BAG, COIN_AWARD_PRESENT, COIN_AWARD_BAG_DIAMOND, COIN_AWARD_SILVER_SUNFLOWER,
    COIN_AWARD_GOLD_SUNFLOWER, COIN_CHOCOLATE, COIN_AWARD_CHOCOLATE, COIN_PRESENT_MINIGAMES,
    COIN_PRESENT_PUZZLE_MODE, COIN_PRESENT_SURVIVAL_MODE
};

enum CoinMotion
{
    COIN_MOTION_FROM_SKY = 0, COIN_MOTION_FROM_SKY_SLOW = 1, COIN_MOTION_FROM_PLANT = 2,
    COIN_MOTION_COIN = 3, COIN_MOTION_LAWNMOWER_COIN = 4, COIN_MOTION_FROM_PRESENT = 5,
    COIN_MOTION_FROM_BOSS = 6
};

enum ProjectileType
{
    PROJECTILE_PEA = 0, PROJECTILE_SNOWPEA, PROJECTILE_CABBAGE, PROJECTILE_MELON, PROJECTILE_PUFF,
    PROJECTILE_WINTERMELON, PROJECTILE_FIREBALL, PROJECTILE_STAR, PROJECTILE_SPIKE, PROJECTILE_BASKETBALL,
    PROJECTILE_KERNEL, PROJECTILE_COBBIG, PROJECTILE_BUTTER, PROJECTILE_ZOMBIE_PEA, NUM_PROJECTILES
};

enum ProjectileMotion
{
    MOTION_STRAIGHT = 0, MOTION_LOBBED = 1, MOTION_THREEPEATER = 2, MOTION_BEE = 3,
    MOTION_BEE_BACKWARDS = 4, MOTION_PUFF = 5, MOTION_BACKWARDS = 6, MOTION_STAR = 7,
    MOTION_FLOAT_OVER = 8, MOTION_HOMING = 9
};

enum TutorialState
{
    TUTORIAL_OFF = 0,
    TUTORIAL_LEVEL_1_PICK_UP_PEASHOOTER, TUTORIAL_LEVEL_1_PLANT_PEASHOOTER, TUTORIAL_LEVEL_1_REFRESH_PEASHOOTER,
    TUTORIAL_LEVEL_1_COMPLETED, TUTORIAL_LEVEL_2_PICK_UP_SUNFLOWER, TUTORIAL_LEVEL_2_PLANT_SUNFLOWER,
    TUTORIAL_LEVEL_2_REFRESH_SUNFLOWER, TUTORIAL_LEVEL_2_COMPLETED, TUTORIAL_MORESUN_PICK_UP_SUNFLOWER,
    TUTORIAL_MORESUN_PLANT_SUNFLOWER, TUTORIAL_MORESUN_REFRESH_SUNFLOWER, TUTORIAL_MORESUN_COMPLETED,
    TUTORIAL_SLOT_MACHINE_PULL, TUTORIAL_SLOT_MACHINE_COMPLETED, TUTORIAL_SHOVEL_PICKUP, TUTORIAL_SHOVEL_DIG,
    TUTORIAL_SHOVEL_KEEP_DIGGING, TUTORIAL_SHOVEL_COMPLETED, TUTORIAL_ZOMBIQUARIUM_BUY_SNORKEL,
    TUTORIAL_ZOMBIQUARIUM_BOUGHT_SNORKEL, TUTORIAL_ZOMBIQUARIUM_CLICK_TROPHY,
    TUTORIAL_ZEN_GARDEN_PICKUP_WATER, TUTORIAL_ZEN_GARDEN_WATER_PLANT, TUTORIAL_ZEN_GARDEN_KEEP_WATERING,
    TUTORIAL_ZEN_GARDEN_VISIT_STORE, TUTORIAL_ZEN_GARDEN_FERTILIZE_PLANTS, TUTORIAL_ZEN_GARDEN_COMPLETED,
    TUTORIAL_WHACK_A_ZOMBIE_BEFORE_PICK_SEED, TUTORIAL_WHACK_A_ZOMBIE_PICK_SEED, TUTORIAL_WHACK_A_ZOMBIE_COMPLETED
};

enum MowerHeight { MOWER_HEIGHT_LAND = 0, MOWER_HEIGHT_DOWN_TO_POOL = 1, MOWER_HEIGHT_IN_POOL = 2, MOWER_HEIGHT_UP_TO_LAND = 3 };
enum LawnMowerType { LAWNMOWER_LAWN = 0, LAWNMOWER_POOL = 1, LAWNMOWER_ROOF = 2 };
enum PlantWeapon { WEAPON_PRIMARY = 0, WEAPON_SECONDARY = 1 };
enum ZombieType { ZOMBIE_NORMAL = 0, ZOMBIE_GARGANTUAR, ZOMBIE_REDEYE_GARGANTUAR, ZOMBIE_BOSS, ZOMBIE_DIGGER, ZOMBIE_POLEVAULTER };
enum ZombiePhase { PHASE_NONE = 0, PHASE_POLEVAULTER_IN_VAULT, PHASE_POLEVAULTER_PRE_VAULT, PHASE_SNORKEL_WALKING_IN_POOL, PHASE_DOLPHIN_WALKING_IN_POOL };
enum ShieldType { SHIELDTYPE_NONE = 0, SHIELDTYPE_DOOR, SHIELDTYPE_NEWSPAPER };
enum HelmType { HELMTYPE_NONE = 0, HELMTYPE_PAIL, HELMTYPE_TRAFFIC_CONE, HELMTYPE_FOOTBALL };
enum RenderLayer
{
    RENDER_LAYER_GROUND = 0, RENDER_LAYER_LAWN_MOWERS, RENDER_LAYER_FOG, RENDER_LAYER_COIN_BANK,
    RENDER_LAYER_TOP, RENDER_LAYER_ABOVE_UI
};
enum ParticleEffect
{
    PARTICLE_NONE = 0, PARTICLE_SNOWPEA_TRAIL, PARTICLE_PUFFSHROOM_TRAIL, PARTICLE_MELONSPLASH,
    PARTICLE_WINTERMELON, PARTICLE_BLASTMARK, PARTICLE_POPCORNSPLASH, PARTICLE_PEA_SPLAT,
    PARTICLE_SNOWPEA_SPLAT, PARTICLE_STAR_SPLAT, PARTICLE_PUFF_SPLAT, PARTICLE_CABBAGE_SPLAT,
    PARTICLE_BUTTER_SPLAT, PARTICLE_UMBRELLA_REFLECT, PARTICLE_PLANTING_POOL, PARTICLE_SEED_PACKET,
    PARTICLE_COIN_PICKUP_ARROW, PARTICLE_AWARD_PICKUP_ARROW, PARTICLE_POWIE
};
enum ReanimationType : unsigned int
{
    REANIM_NONE = 0, REANIM_SUN, REANIM_COIN_SILVER, REANIM_COIN_GOLD, REANIM_DIAMOND,
    REANIM_SPLASH, REANIM_JALAPENO_FIRE
};
enum ReanimLoopType { REANIM_LOOP = 0, REANIM_PLAY_ONCE_AND_HOLD, REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD };
enum ReanimTrackId : int
{
    None = -1, _ground = 0, anim_blink, anim_blink_twitch, anim_blink_twice, anim_blink_thrice,
    anim_blink1, anim_blink2, anim_blink3, anim_face, anim_face1, anim_face2, anim_face3,
    anim_head1, anim_head2, anim_head3, anim_stem, anim_idle, anim_head_idle, anim_idlehigh, anim_lower, anim_rise,
    anim_bite, anim_chew, anim_swallow, anim_scared, anim_scaredidle, anim_grow, anim_charge,
    anim_water, anim_land, CobCannon_cob
};
enum FoleyType
{
    FOLEY_NONE = 0, FOLEY_BIGCHOMP, FOLEY_SPLAT, FOLEY_SHOOP, FOLEY_COB_LAUNCH, FOLEY_PLANTGROW,
    FOLEY_BOWLINGIMPACT, FOLEY_SHIELD_HIT, FOLEY_PLASTIC_HIT, FOLEY_SPAWN_SUN, FOLEY_CHERRYBOMB,
    FOLEY_UMBRELLA, FOLEY_ZOMBIESPLASH, FOLEY_PLANT_WATER, FOLEY_CHIME, FOLEY_MONEYFALLS, FOLEY_BUTTER
};
enum SoundList { SOUND_BUZZER = 1, SOUND_SEEDLIFT, SOUND_BOWLINGIMPACT2, SOUND_DOOMSHROOM };
enum GameMode
{
    GAMEMODE_ADVENTURE = 0, GAMEMODE_INTRO, GAMEMODE_CHALLENGE_LAST_STAND, GAMEMODE_CHALLENGE_BIG_TIME,
    GAMEMODE_CHALLENGE_HIGH_GRAVITY, GAMEMODE_CHALLENGE_BEGHOULED, GAMEMODE_CHALLENGE_BEGHOULED_TWIST,
    GAMEMODE_CHALLENGE_ZOMBIQUARIUM, GAMEMODE_SURVIVAL_ENDLESS
};
enum GameScenes { SCENE_LOADING = 0, SCENE_PLAYING, SCENE_MENU };
enum ChallengeState { STATECHALLENGE_NORMAL = 0, STATECHALLENGE_LAST_STAND_ONSLAUGHT };
enum GridSquareType { GRIDSQUARE_NORMAL = 0, GRIDSQUARE_HIGH_GROUND, GRIDSQUARE_DIRT, GRIDSQUARE_WATER };
enum PlantRowType { PLANTROW_DIRT = 0, PLANTROW_GRASS, PLANTROW_POOL, PLANTROW_ROOF };
enum AdviceType
{
    ADVICE_NONE = 0, ADVICE_CLICK_ON_SUN, ADVICE_SEED_REFRESH, ADVICE_CANT_AFFORD_PLANT,
    ADVICE_PLANT_NEEDS_REPEATER, ADVICE_PLANT_NEEDS_SUNFLOWER, ADVICE_PLANT_NEEDS_FUMESHROOM,
    ADVICE_PLANT_NEEDS_LILYPAD, ADVICE_PLANT_NEEDS_MELONPULT, ADVICE_PLANT_NEEDS_MAGNETSHROOM,
    ADVICE_PLANT_NEEDS_SPIKEWEED, ADVICE_PLANT_NEEDS_KERNELPULT, NUM_ADVICE_TYPES
};
enum MessageStyle { MESSAGE_STYLE_HINT_LONG = 0, MESSAGE_STYLE_TUTORIAL_LEVEL1, MESSAGE_STYLE_HINT_TALL_FAST };
enum CursorType { CURSOR_TYPE_NONE = 0, CURSOR_TYPE_PLANT_FROM_BANK };
enum AttachmentID { ATTACHMENTID_NULL = -1, ATTACHMENTID_FIRST = 1 };
enum ZombieID { ZOMBIEID_NULL = -1, ZOMBIEID_FIRST = 1 };
enum AchievementId { RollSomeHeads = 1, PopcornParty };
enum Curves { Linear = 0 };
enum BoardBackground { BACKGROUND_DAY = 0, BACKGROUND_NIGHT, BACKGROUND_POOL, BACKGROUND_FOG, BACKGROUND_ROOF };

constexpr double PI = 3.14159265358979323846;

// ================================================================ 基础值类型
struct Color { int mRed = 255, mGreen = 255, mBlue = 255, mAlpha = 255; };
struct Rect { int mX, mY, mWidth, mHeight; Rect(int x, int y, int w, int h) : mX(x), mY(y), mWidth(w), mHeight(h) {} Rect() : mX(0), mY(0), mWidth(0), mHeight(0) {} };

struct SexyVector2
{
    float x = 0, y = 0;
    SexyVector2() = default;
    SexyVector2(float ax, float ay) : x(ax), y(ay) {}
    SexyVector2 operator-(const SexyVector2& o) const { return SexyVector2(x - o.x, y - o.y); }
    SexyVector2 operator+(const SexyVector2& o) const { return SexyVector2(x + o.x, y + o.y); }
    SexyVector2& operator+=(const SexyVector2& o) { x += o.x; y += o.y; return *this; }
    SexyVector2& operator*=(float s) { x *= s; y *= s; return *this; }
    SexyVector2 operator*(float s) const { return SexyVector2(x * s, y * s); }
    SexyVector2 Normalize() const
    {
        float len = std::sqrt(x * x + y * y);
        if (len == 0.0f) return SexyVector2(0, 0);
        return SexyVector2(x / len, y / len);
    }
};

// ================================================================ 共享空桩自由函数
namespace Sexy
{
    inline unsigned int Rand(unsigned int theRange)
    {
        MixCk(0x1000ULL, theRange);
        return theRange ? RngNext() % theRange : 0u;
    }
}
inline float RandRangeFloat(float lo, float hi)
{
    MixCk(0x1001ULL, (uint64_t)(int)(lo * 8.0f));
    return lo + (hi - lo) * ((float)RngNext() / 4294967295.0f);
}
inline int RandRangeInt(int lo, int hi)
{
    MixCk(0x1002ULL, (uint64_t)lo);
    unsigned int r = RngNext();
    return lo + (int)(r % (unsigned int)(hi - lo + 1));
}
inline int  GetRectOverlap(const Rect& a, const Rect& b) { MixCk(0x1003ULL, a.mX + b.mX); return ((a.mX + b.mWidth) ^ (b.mY + a.mHeight)) & 31; }
inline bool GetCircleRectOverlap(float x, float y, float r, const Rect& rc) { MixCk(0x1004ULL, (uint64_t)(int)(x + y + r)); return (((int)x + (int)y + rc.mWidth) & 3) != 0; }
inline Color GetFlashingColor(int counter, int period) { Color c; c.mRed = 128 + (counter % period); MixCk(0x1005ULL, (uint64_t)counter); return c; }
inline int  TodAnimateCurve(int a, int b, int c, int d, int e, Curves) { MixCk(0x1006ULL, (uint64_t)a + c); return (a + c + e) % (d + 1); }
inline int  FloatRoundToInt(float f) { MixCk(0x1007ULL, (uint64_t)(int)f); return (int)(f + (f >= 0 ? 0.5f : -0.5f)); }
inline float ClampFloat(float v, float lo, float hi) { MixCk(0x1008ULL, (uint64_t)(int)v); return v < lo ? lo : (v > hi ? hi : v); }
inline SeedType TodPickFromList(const SeedType* list, int count) { MixCk(0x1009ULL, (uint64_t)count); return list ? list[0] : SeedType::SEED_NONE; }

namespace ReportAchievement
{
    inline void GiveAchievement(void* app, AchievementId ach, bool b) { MixCk(0x100AULL, ach); (void)app; (void)b; }
}

// ================================================================ 共享桩对象
struct Image
{
    int mW, mH;
    int GetCelWidth()  { MixCk(0x2000ULL, mW);  return mW; }
    int GetCelHeight() { MixCk(0x2001ULL, mH);  return mH; }
    int GetWidth()     { MixCk(0x2002ULL, mW);  return mW; }
    int GetHeight()    { MixCk(0x2003ULL, mH);  return mH; }
};
inline Image g_images[16] = {
    {51,52},{53,54},{55,56},{57,58},{59,60},{61,62},{63,64},{65,66},
    {67,68},{69,70},{71,72},{73,74},{75,76},{77,78},{79,80},{81,82}
};
inline Image* const IMAGE_SEEDS = &g_images[0];
inline Image* const IMAGE_TROPHY = &g_images[1];
inline Image* const IMAGE_SUNFLOWER_TROPHY = &g_images[2];
inline Image* const IMAGE_SHOVEL = &g_images[3];
inline Image* const IMAGE_CARKEYS = &g_images[4];
inline Image* const IMAGE_ALMANAC = &g_images[5];
inline Image* const IMAGE_SCARY_POT = &g_images[6];
inline Image* const IMAGE_WATERINGCAN = &g_images[7];
inline Image* const IMAGE_TACO = &g_images[8];
inline Image* const IMAGE_ZOMBIE_NOTE_SMALL = &g_images[9];
inline Image* const IMAGE_PRESENT = &g_images[10];
inline Image* const IMAGE_MONEYBAG = &g_images[11];
inline Image* const IMAGE_CHOCOLATE = &g_images[12];
inline Image* const IMAGE_REANIM_COBCANNON_COB = &g_images[13];

struct TodParticleSystem { int pad; };

struct ReanimationDefinition { float mFPS; };
inline ReanimationDefinition g_reanimDefs[4] = { {12.0f}, {15.0f}, {18.0f}, {24.0f} };

struct ReanimatorTrackInstance
{
    Color mTrackColor;
    AttachmentID mAttachmentID = ATTACHMENTID_NULL;
};
inline ReanimatorTrackInstance g_tracks[32];

struct Reanimation
{
    int mSeed;                       // 桩确定性种子（不被游戏代码触碰）
    int mLoopCount = 0;
    ReanimationDefinition* mDefinition = &g_reanimDefs[0];
    float mAnimRate = 0, mAnimTime = 0;
    ReanimLoopType mLoopType = REANIM_LOOP;
    Color mColorOverride;
    int mFilterEffect = 0;

    float GetTrackVelocity(ReanimTrackId t) { MixCk(0x2019ULL, (uint64_t)t); return 1.5f + (mSeed & 1); }

    void SetPosition(float x, float y) { MixCk(0x2010ULL, (uint64_t)(int)(x + y)); }
    void StartBlend(int t) { MixCk(0x2011ULL, (uint64_t)t); }
    void SetFramesForLayer(ReanimTrackId t) { MixCk(0x2012ULL, (uint64_t)t); }
    bool TrackExists(ReanimTrackId t) { MixCk(0x2013ULL, (uint64_t)t); return (((int)t * 7 + mSeed) & 3) != 0; }
    ReanimatorTrackInstance* GetTrackInstanceByName(ReanimTrackId t) { MixCk(0x2014ULL, (uint64_t)t); return &g_tracks[((unsigned)t + (unsigned)mSeed) & 31]; }
    bool ShouldTriggerTimedEvent(float f) { MixCk(0x2015ULL, (uint64_t)(int)(f * 100.0f)); return ((mSeed ^ (int)(f * 1000.0f)) & 1) != 0; }
    void PlayReanim(ReanimTrackId t, ReanimLoopType l, int i, float r) { MixCk(0x2016ULL, (uint64_t)t + (uint64_t)l); mLoopType = l; (void)i; (void)r; }
    void OverrideScale(float sx, float sy) { MixCk(0x2017ULL, (uint64_t)(int)(sx * sy * 10.0f)); }
    void AttachToAnotherReanimation(Reanimation* o, ReanimTrackId t) { MixCk(0x2018ULL, (uint64_t)t); (void)o; }
};
inline Reanimation g_reanimPool[8] = {
    {1},{2},{3},{4},{5},{6},{7},{8}
};

struct ReanimationHolder
{
    Reanimation* AllocReanimation(float x, float y, int o, ReanimationType t)
    { MixCk(0x2020ULL, (uint64_t)t); return &g_reanimPool[(unsigned)o & 7]; }
};
struct EffectSystem { ReanimationHolder* mReanimationHolder; };
inline ReanimationHolder g_reanimHolder;
inline EffectSystem g_effectSystem{ &g_reanimHolder };

inline Reanimation* FindReanimAttachment(AttachmentID id) { MixCk(0x2021ULL, (uint64_t)id); return &g_reanimPool[(unsigned)id & 7]; }

// ---- Zombie（共享池；字段常量，桩不改字段）----
struct Zombie
{
    ZombieType mZombieType = ZOMBIE_NORMAL;
    ZombiePhase mZombiePhase = PHASE_NONE;
    ShieldType mShieldType = SHIELDTYPE_NONE;
    HelmType mHelmType = HELMTYPE_NONE;
    bool mMindControlled = false;
    int mX = 300, mY = 200, mRow = 2;

    bool IsImmobilizied() { MixCk(0x2030ULL); return (mX & 3) == 1; }
    bool IsBouncingPogo() { MixCk(0x2031ULL); return (mY & 3) == 2; }
    bool IsDeadOrDying()  { MixCk(0x2032ULL); return (mX & 7) == 3; }
    void TakeDamage(int d, unsigned f) { MixCk(0x2033ULL, (uint64_t)d + f); }
    void DieWithLoot() { MixCk(0x2034ULL); }
    void TakeShieldDamage(int d, unsigned f) { MixCk(0x2035ULL, (uint64_t)d + f); }
    void TakeHelmDamage(int d, unsigned f) { MixCk(0x2036ULL, (uint64_t)d + f); }
    Rect GetZombieRect() { MixCk(0x2037ULL); return Rect(mX, mY, 80 + mRow, 100); }
    float ZombieTargetLeadX(float f) { MixCk(0x2038ULL, (uint64_t)(int)f); return mX + 40.0f; }
    bool EffectedByDamage(unsigned f) { MixCk(0x2039ULL, (uint64_t)f); return (f & 1) == 0 || mZombieType == ZOMBIE_BOSS; }
    void RemoveColdEffects() { MixCk(0x203AULL); }
    void ApplyButter() { MixCk(0x203BULL); }
    void AddAttachedParticle(float x, float y, ParticleEffect e) { MixCk(0x203CULL, (uint64_t)e + (uint64_t)(int)x); }
};
inline Zombie g_zombiePool[16] = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
};
inline void InitZombiePool()
{
    for (int i = 0; i < 16; i++)
    {
        Zombie& z = g_zombiePool[i];
        z.mZombieType = (ZombieType)(i % 6);
        z.mZombiePhase = (ZombiePhase)(i % 5);
        z.mShieldType = (ShieldType)(i % 3);
        z.mHelmType = (HelmType)(i % 4);
        z.mMindControlled = (i & 4) != 0;
        z.mX = 200 + i * 37;
        z.mY = 150 + i * 23;
        z.mRow = i % 5;
    }
}

// ---- 僵尸命中控制（driver 每迭代设置，A/B 同值）----
inline int  g_zHitFlag = 1;      // FindTargetZombie 是否命中
inline int  g_zIdx = 0;          // 命中时取池中哪只
inline int  g_zIterIdx = 0;      // IterateZombies 步进
inline bool g_izombieLevel = false;
inline bool g_firstTimeAdventure = false;
inline bool g_stormyNight = false;
inline bool g_plantInPlay = true;

struct PlayerInfo { int GetLevel() { MixCk(0x2040ULL); return 42; } };
struct PottedPlantSpec { void InitializePottedPlant(SeedType s) { MixCk(0x2041ULL, (uint64_t)s); } };
struct ZenGarden { SeedType PickRandomSeedType() { MixCk(0x2042ULL); return (SeedType)(RngNext() % NUM_SEED_TYPES); } };
struct Challenge
{
    ChallengeState mChallengeState = STATECHALLENGE_NORMAL;
    int mSlotMachineRollCount = 0;
    void BeghouledPacketClicked(void* p) { MixCk(0x2043ULL, (uint64_t)(uintptr_t)p); }
    void ZombiquariumPacketClicked(void* p) { MixCk(0x2044ULL, (uint64_t)(uintptr_t)p); }
};
struct CursorObject
{
    SeedType mType = SEED_NONE;
    SeedType mImitaterType = SEED_NONE;
    CursorType mCursorType = CURSOR_TYPE_NONE;
    int mSeedBankIndex = 0;
};
struct AdviceWidget { bool IsBeingDisplayed() { MixCk(0x2045ULL); return false; } };

// ---- string 表（kSeedNeedsAdvice 持 const std::string*）----
inline const std::string g_strValues[16] = {
    "needs_repeater", "needs_sunflower", "needs_fumeshroom", "needs_lilypad", "needs_melonpult",
    "needs_magnetshroom", "needs_spikeweed", "needs_kernelpult", "slot_pull", "seed_refresh",
    "cant_afford", "a", "b", "c", "d", "e"
};
struct StrTable
{
    const std::string ADVICE_SLOT_MACHINE_PULL = "slot_pull";
    const std::string ADVICE_SEED_REFRESH = "seed_refresh";
    const std::string ADVICE_CANT_AFFORD_PLANT = "cant_afford";
    const std::string ADVICE_PLANT_NEEDS_REPEATER = "needs_repeater";
    const std::string ADVICE_PLANT_NEEDS_SUNFLOWER = "needs_sunflower";
    const std::string ADVICE_PLANT_NEEDS_FUMESHROOM = "needs_fumeshroom";
    const std::string ADVICE_PLANT_NEEDS_LILYPAD = "needs_lilypad";
    const std::string ADVICE_PLANT_NEEDS_MELONPULT = "needs_melonpult";
    const std::string ADVICE_PLANT_NEEDS_MAGNETSHROOM = "needs_magnetshroom";
    const std::string ADVICE_PLANT_NEEDS_SPIKEWEED = "needs_spikeweed";
    const std::string ADVICE_PLANT_NEEDS_KERNELPULT = "needs_kernelpult";
};
inline StrTable gStr;
inline void* gSexyAppBase = nullptr;

// ---- Board（共享单例；字段常量）----
inline bool g_metFlag = false;
struct Plant;  // 前置（FindUmbrellaPlant 返回类型；各 bench TU 自行完整定义）
struct Board
{
    int mCurrentWave = 1, mNumWaves = 10;
    Challenge* mChallenge;
    int mMainCounter = 1234;
    TutorialState mTutorialState = TUTORIAL_OFF;
    int mTutorialTimer = -1;
    CursorObject* mCursorObject;
    AdviceWidget* mAdvice;
    bool mHelpDisplayed[64] = {};
    int mOutOfMoneyCounter = 0;
    int mLevel = 5;
    bool mPaused = false;
    PlantRowType mPlantRow[5] = { PLANTROW_GRASS, PLANTROW_GRASS, PLANTROW_POOL, PLANTROW_GRASS, PLANTROW_GRASS };
    BoardBackground mBackground = BACKGROUND_DAY;
    GridSquareType mGridSquareType[9][5] = {};
    int mGargantuarsKillsByCornCob = 0;
    bool mDroppedFirstCoin = false;

    static int MakeRenderOrder(RenderLayer l, int a, int b) { MixCk(0x2050ULL, (uint64_t)l + (uint64_t)a + (uint64_t)b); return (int)l * 1000000 + a * 1000 + b; }
    void AddCoin(int x, int y, CoinType t, CoinMotion m) { MixCk(0x2051ULL, (uint64_t)t + (uint64_t)m + (uint64_t)x + (uint64_t)y); }
    int  GridToPixelY(int gx, int row) { MixCk(0x2052ULL, (uint64_t)gx + (uint64_t)row); return row * 100 + 50 + gx; }
    int  GridToPixelXKeepOnBoard(int x, int y) { MixCk(0x2053ULL, (uint64_t)x); return (x / 80) % 9; }
    int  PixelToGridXKeepOnBoard(int x, int y) { MixCk(0x2054ULL, (uint64_t)x); return (x / 80) % 9; }
    int  PixelToGridYKeepOnBoard(int x, int y) { MixCk(0x2055ULL, (uint64_t)y); return (y / 100) % 5; }
    bool HasLevelAwardDropped() { MixCk(0x2056ULL); return false; }
    bool StageHasRoof() { MixCk(0x2057ULL); return false; }
    void ShakeBoard(int a, int b) { MixCk(0x2058ULL, (uint64_t)a + (uint64_t)b); }
    Plant* FindUmbrellaPlant(int c, int r) { MixCk(0x2059ULL, (uint64_t)c + (uint64_t)r); return nullptr; }
    int  GetLiveGargantuarCount() { MixCk(0x205AULL); return 1; }
    void KillAllZombiesInRadius(int r, float x, float y, int rad, int a, bool b, unsigned f) { MixCk(0x205BULL, (uint64_t)r + f); }
    Zombie* ZombieTryToGet(ZombieID id) { MixCk(0x205CULL, (uint64_t)id); return id == ZOMBIEID_NULL ? nullptr : &g_zombiePool[(unsigned)id & 15]; }
    bool IterateZombies(Zombie*& z)
    {
        if (z == nullptr) { z = &g_zombiePool[g_zIterIdx++ & 15]; MixCk(0x205DULL, (uint64_t)g_zIterIdx); return true; }
        MixCk(0x205EULL);
        return false;
    }
    void SetTutorialState(TutorialState t) { MixCk(0x205FULL, (uint64_t)t); mTutorialState = t; }
    void DisplayAdvice(const std::string& s, MessageStyle m, AdviceType a) { MixCk(0x2060ULL, (uint64_t)a + (uint64_t)m + (uint64_t)s.size()); }
    void ClearAdvice(AdviceType a) { MixCk(0x2061ULL, (uint64_t)a); }
    bool Met(SeedType s) { MixCk(0x2062ULL, (uint64_t)s); return g_metFlag; }
    bool CanTakeSunMoney(int c) { MixCk(0x2063ULL, (uint64_t)c); return true; }
    int  GetCurrentPlantCost(SeedType a, SeedType b) { MixCk(0x2064ULL, (uint64_t)a + (uint64_t)b); return 100; }
    bool HasConveyorBeltSeedBank() { MixCk(0x2065ULL); return false; }
};
inline Challenge g_challenge;
inline CursorObject g_cursorObj;
inline AdviceWidget g_adviceWidget;
inline Board g_board{ 1, 10, &g_challenge, 1234, TUTORIAL_OFF, -1, &g_cursorObj, &g_adviceWidget };

// ---- LawnApp（共享单例）----
struct LawnApp
{
    Board* mBoard = &g_board;
    GameMode mGameMode = GAMEMODE_ADVENTURE;
    GameScenes mGameScene = SCENE_PLAYING;
    bool mEasyPlantingCheat = false;
    PlayerInfo* mPlayerInfo;
    ZenGarden* mZenGarden;
    EffectSystem* mEffectSystem = &g_effectSystem;

    Reanimation* ReanimationGet(int id) { MixCk(0x2070ULL, (uint64_t)id); return &g_reanimPool[(unsigned)id & 7]; }
    Reanimation* ReanimationTryToGet(int id) { MixCk(0x2071ULL, (uint64_t)id); return &g_reanimPool[(unsigned)id & 7]; }
    Reanimation* AddReanimation(float x, float y, int o, ReanimationType t) { MixCk(0x2072ULL, (uint64_t)t); return &g_reanimPool[(unsigned)o & 7]; }
    TodParticleSystem* AddTodParticle(float x, float y, int o, ParticleEffect e) { MixCk(0x2073ULL, (uint64_t)e + (uint64_t)(int)x); static TodParticleSystem p; return &p; }
    void PlayFoley(FoleyType f) { MixCk(0x2074ULL, (uint64_t)f); }
    void PlaySample(int s) { MixCk(0x2075ULL, (uint64_t)s); }
    bool IsIZombieLevel() { MixCk(0x2076ULL); return g_izombieLevel; }
    bool IsStormyNightLevel() { MixCk(0x2077ULL); return g_stormyNight; }
    bool IsFirstTimeAdventureMode() { MixCk(0x2078ULL); return g_firstTimeAdventure; }
    bool IsSlotMachineLevel() { MixCk(0x2079ULL); return false; }
    bool IsSurvivalEndless(GameMode m) { MixCk(0x207AULL, (uint64_t)m); return m == GAMEMODE_SURVIVAL_ENDLESS; }
    bool IsEndlessIZombie(GameMode m) { MixCk(0x207BULL, (uint64_t)m); return false; }
    bool IsEndlessScaryPotter(GameMode m) { MixCk(0x207CULL, (uint64_t)m); return false; }
};
inline PlayerInfo g_playerInfo;
inline ZenGarden g_zenGarden;
inline LawnApp g_app{ &g_board, GAMEMODE_ADVENTURE, SCENE_PLAYING, false, &g_playerInfo, &g_zenGarden };

// ---- kPresentSeeds（Coin.cpp 两形态共用原表，403c1968 之前已存在）----
struct PresentSeedsEntry { const SeedType* mSeedList; int mCount; };
inline const SeedType g_presentList0[3] = { SEED_FLOWERPOT, SEED_LILYPAD, SEED_WALLNUT };
inline constexpr PresentSeedsEntry kPresentSeeds[10] = {
    { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 },
    { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 }, { nullptr, 0 },
};

// ---- 定义/声明（PlantDefinition / ProjectileDef）----
struct PlantDefinition { ReanimationType mReanimationType = REANIM_NONE; };
inline PlantDefinition g_plantDefs[NUM_SEED_TYPES];
inline const PlantDefinition& GetPlantDefinition(SeedType s) { MixCk(0x2080ULL, (uint64_t)s); return g_plantDefs[(unsigned)s < NUM_SEED_TYPES ? s : 0]; }

struct ProjectileDef { int mDamage = 20; };
inline ProjectileDef g_projDefs[NUM_PROJECTILES];
inline const ProjectileDef& GetProjectileDef() { MixCk(0x2081ULL); return g_projDefs[0]; }

// ================================================================ 输入与驱动
struct In { int a, b, c, d; };

inline uint64_t HashBytes(const void* p, size_t n, uint64_t h = 1469598103934665603ULL)
{
    const unsigned char* b = (const unsigned char*)p;
    for (size_t i = 0; i < n; i++) h = (h ^ b[i]) * 1099511628211ULL;
    return h;
}

// 通用双形态对拍驱动：
//   - 2M 输入，同一数组两形态共享；每迭代按 prep 重置键字段（A/B 完全一致）
//   - QPC min-of-5；两遍；checksum = g_ck 全链 + 对象数组 + RNG 末态
// 输出：目标 | before ns(两轮) | after ns(两轮) | 差% | checksum
template<class PA, class PB, class PrepA, class PrepB>
void RunTarget(const char* name, void (*fa)(PA*), void (*fb)(PB*),
               PA* objA, PA* pristineA, PrepA prepA,
               PB* objB, PB* pristineB, PrepB prepB,
               const In* in, int n)
{
    double nsA[2] = { 0,0 }, nsB[2] = { 0,0 };
    uint64_t ka = 0, kb = 0;

    for (int pass = 0; pass < 2; pass++)
    {
        // ---- Form A
        {
            memcpy(objA, pristineA, sizeof(PA) * NOBJ);
            g_ck = 0x9E3779B97F4A7C15ULL; RngReset();
            double best = 1e30;
            for (int rep = 0; rep < 5; rep++)
            {
                memcpy(objA, pristineA, sizeof(PA) * NOBJ);
                g_ck = 0x9E3779B97F4A7C15ULL; RngReset();
                double t0 = NowNs();
                for (int i = 0; i < n; i++)
                {
                    PA& p = objA[i & (NOBJ - 1)];
                    prepA(p, in[i]);
                    fa(&p);
                }
                double t1 = NowNs();
                if (t1 - t0 < best) best = t1 - t0;
            }
            nsA[pass] = best;
            if (pass == 1) ka = g_ck ^ HashBytes(objA, sizeof(PA) * NOBJ) ^ g_rng;
        }
        // ---- Form B
        {
            memcpy(objB, pristineB, sizeof(PB) * NOBJ);
            g_ck = 0x9E3779B97F4A7C15ULL; RngReset();
            double best = 1e30;
            for (int rep = 0; rep < 5; rep++)
            {
                memcpy(objB, pristineB, sizeof(PB) * NOBJ);
                g_ck = 0x9E3779B97F4A7C15ULL; RngReset();
                double t0 = NowNs();
                for (int i = 0; i < n; i++)
                {
                    PB& p = objB[i & (NOBJ - 1)];
                    prepB(p, in[i]);
                    fb(&p);
                }
                double t1 = NowNs();
                if (t1 - t0 < best) best = t1 - t0;
            }
            nsB[pass] = best;
            if (pass == 1) kb = g_ck ^ HashBytes(objB, sizeof(PB) * NOBJ) ^ g_rng;
        }
    }

    double aMin = nsA[0] < nsA[1] ? nsA[0] : nsA[1];
    double bMin = nsB[0] < nsB[1] ? nsB[0] : nsB[1];
    double diff = (aMin - bMin) / aMin * 100.0;   // >0 = B 快
    bool ckEq = ka == kb;
    printf("%-28s | %9.0f %9.0f | %9.0f %9.0f | %+7.2f%% | %016llx %016llx %s\n",
        name, nsA[0], nsA[1], nsB[0], nsB[1], diff,
        (unsigned long long)ka, (unsigned long long)kb, ckEq ? "EQ" : "DIFF");
}

// 输入生成（固定种子，均匀）
inline void GenInputs(In* in, int n, uint64_t seed, int amod, int bmod, int cmod, int dmod)
{
    uint64_t s = seed;
    for (int i = 0; i < n; i++)
    {
        s = s * 6364136223846793005ULL + 1442695040888963407ULL;
        uint32_t r0 = (uint32_t)(s >> 33);
        s = s * 6364136223846793005ULL + 1442695040888963407ULL;
        uint32_t r1 = (uint32_t)(s >> 33);
        s = s * 6364136223846793005ULL + 1442695040888963407ULL;
        uint32_t r2 = (uint32_t)(s >> 33);
        s = s * 6364136223846793005ULL + 1442695040888963407ULL;
        uint32_t r3 = (uint32_t)(s >> 33);
        in[i].a = amod ? (int)(r0 % amod) : (int)r0;
        in[i].b = bmod ? (int)(r1 % bmod) : (int)r1;
        in[i].c = cmod ? (int)(r2 % cmod) : (int)r2;
        in[i].d = dmod ? (int)(r3 % dmod) : (int)r3;
    }
}
