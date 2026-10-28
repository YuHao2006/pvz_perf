// bench16_falltime - 目标16: Zombie::UpdateDeath 落体时刻 switch(稠密) -> kZombieFallTime[34] static float 表
// FormA = e44390a6^ 原链逐字（switch 三组 + 依动画三选一组 + default -1）；
// FormB = 当前 HEAD（static 表 + -1/0 哨兵 + 依动画三选一表外）逐字。
// 账本旧数：结构化（无独立微基准数字）——本基准补 static 形态基线。
#include "bench_common.h"

enum ZombieType
{
    ZOMBIE_NORMAL = 0, ZOMBIE_FLAG, ZOMBIE_TRAFFIC_CONE, ZOMBIE_POLEVAULTER, ZOMBIE_PAIL,
    ZOMBIE_NEWSPAPER, ZOMBIE_DOOR, ZOMBIE_FOOTBALL, ZOMBIE_DANCER, ZOMBIE_BACKUP_DANCER,
    ZOMBIE_DUCKY_TUBE, ZOMBIE_SNORKEL, ZOMBIE_ZAMBONI, ZOMBIE_BOBSLED, ZOMBIE_DOLPHIN_RIDER,
    ZOMBIE_JACK_IN_THE_BOX, ZOMBIE_BALLOON, ZOMBIE_DIGGER, ZOMBIE_POGO, ZOMBIE_YETI,
    ZOMBIE_BUNGEE, ZOMBIE_LADDER, ZOMBIE_CATAPULT, ZOMBIE_GARGANTUAR, ZOMBIE_IMP,
    ZOMBIE_BOSS, ZOMBIE_PEA_HEAD, ZOMBIE_WALLNUT_HEAD, ZOMBIE_JALAPENO_HEAD, ZOMBIE_GATLING_HEAD,
    ZOMBIE_SQUASH_HEAD, ZOMBIE_TALLNUT_HEAD, ZOMBIE_REDEYE_GARGANTUAR, ZOMBIE_ZOMBATAR,
    NUM_ZOMBIE_TYPES
};

// ---- 桩 ----
struct Reanimation
{
    int mAnimKind;   // 0=superlongdeath 1=death2 2=其他
    bool IsAnimPlaying(int track) { Mix(0xF001u + (uint64_t)track); return mAnimKind == track; }
    bool ShouldTriggerTimedEvent(float f) { Mix(0xF002u); MixF(f); return f > 0.75f; }
};
static Reanimation gReanimStorage;
static Reanimation* gReanim = &gReanimStorage;

static void PlayFoleyStub(int foley) { Mix(0xF003u + (uint64_t)foley); }
static void ShakeBoardStub(int a, int b) { Mix(0xF004u); MixI(a); MixI(b); }
static void DoDaisiesStub() { Mix(0xF005u); }

// 两形态共段：伽刚特尔震屏（switch 前）
static void GargShake(ZombieType mZombieType, Reanimation* aBodyReanim)
{
    if (mZombieType == ZOMBIE_GARGANTUAR || mZombieType == ZOMBIE_REDEYE_GARGANTUAR)
    {
        if (aBodyReanim->ShouldTriggerTimedEvent(0.89f))
        {
            ShakeBoardStub(0, 3);
        }
        else if (aBodyReanim->ShouldTriggerTimedEvent(0.98f))
        {
            ShakeBoardStub(0, 1);
        }
    }
}

// 两形态共段：aFallTime 消费尾（触发音效/震地/雏菊）
static void FallTail(ZombieType mZombieType, Reanimation* aBodyReanim, float aFallTime, bool mDaisyMode)
{
    if (aFallTime > 0 && aBodyReanim->ShouldTriggerTimedEvent(aFallTime))
    {
        PlayFoleyStub(1 /*FOLEY_ZOMBIE_FALLING*/);
        if (mZombieType == ZOMBIE_GARGANTUAR || mZombieType == ZOMBIE_REDEYE_GARGANTUAR)
        {
            PlayFoleyStub(2 /*FOLEY_THUMP*/);
        }

        if (mDaisyMode)
        {
            DoDaisiesStub();
        }
    }
}

// ---------------- FormA：原 switch（e44390a6^ 逐字，落体时刻段） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    ZombieType mZombieType = (ZombieType)(inp % (uint32_t)NUM_ZOMBIE_TYPES);
    bool mInPool = ((inp >> 12) & 1) != 0;
    bool mDaisyMode = ((inp >> 13) & 1) != 0;
    gReanim->mAnimKind = (int)((inp >> 14) & 3) == 0 ? 0 : ((inp >> 14) & 3) == 1 ? 1 : 2;
    Reanimation* aBodyReanim = gReanim;

    GargShake(mZombieType, aBodyReanim);

    if (!mInPool)
    {
        float aFallTime;
        switch (mZombieType)
        {
        case ZOMBIE_SNORKEL:
        case ZOMBIE_ZAMBONI:
        case ZOMBIE_DOLPHIN_RIDER:
        case ZOMBIE_BUNGEE:
        case ZOMBIE_CATAPULT:
        case ZOMBIE_IMP:
        case ZOMBIE_BOSS:
            aFallTime = -1.0f;
            break;

        case ZOMBIE_NORMAL:
        case ZOMBIE_FLAG:
        case ZOMBIE_ZOMBATAR:
        case ZOMBIE_TRAFFIC_CONE:
        case ZOMBIE_PAIL:
        case ZOMBIE_DOOR:
        case ZOMBIE_PEA_HEAD:
        case ZOMBIE_WALLNUT_HEAD:
        case ZOMBIE_TALLNUT_HEAD:
        case ZOMBIE_JALAPENO_HEAD:
        case ZOMBIE_GATLING_HEAD:
        case ZOMBIE_SQUASH_HEAD:
        case ZOMBIE_DUCKY_TUBE:
            if (aBodyReanim->IsAnimPlaying(0 /*anim_superlongdeath*/))
            {
                aFallTime = 0.788f;
            }
            else if (aBodyReanim->IsAnimPlaying(1 /*anim_death2*/))
            {
                aFallTime = 0.71f;
            }
            else
            {
                aFallTime = 0.77f;
            }
            break;

        case ZOMBIE_POLEVAULTER:
            aFallTime = 0.68f;
            break;

        case ZOMBIE_FOOTBALL:
            aFallTime = 0.52f;
            break;

        case ZOMBIE_NEWSPAPER:
            aFallTime = 0.63f;
            break;

        case ZOMBIE_DANCER:
        case ZOMBIE_BACKUP_DANCER:
            aFallTime = 0.83f;
            break;

        case ZOMBIE_BOBSLED:
            aFallTime = 0.81f;
            break;

        case ZOMBIE_JACK_IN_THE_BOX:
            aFallTime = 0.64f;
            break;

        case ZOMBIE_BALLOON:
            aFallTime = 0.68f;
            break;

        case ZOMBIE_DIGGER:
            aFallTime = 0.85f;
            break;

        case ZOMBIE_POGO:
            aFallTime = 0.84f;
            break;

        case ZOMBIE_YETI:
            aFallTime = 0.68f;
            break;

        case ZOMBIE_LADDER:
            aFallTime = 0.62f;
            break;

        case ZOMBIE_GARGANTUAR:
        case ZOMBIE_REDEYE_GARGANTUAR:
            aFallTime = 0.86f;
            break;

        default:
            aFallTime = -1.0f;
            break;
        }

        FallTail(mZombieType, aBodyReanim, aFallTime, mDaisyMode);
    }
}

// ---- FormB 表（HEAD 位于匿名命名空间文件作用域，逐字提升） ----
static constexpr float kFallTimeNone = -1.0f;
static constexpr float kFallTimeByAnim = 0.0f;
static constexpr float kZombieFallTime[(int)ZombieType::NUM_ZOMBIE_TYPES] = {
    kFallTimeByAnim,  // 0 ZOMBIE_NORMAL
    kFallTimeByAnim,  // 1 ZOMBIE_FLAG
    kFallTimeByAnim,  // 2 ZOMBIE_TRAFFIC_CONE
    0.68f,  // 3 ZOMBIE_POLEVAULTER
    kFallTimeByAnim,  // 4 ZOMBIE_PAIL
    0.63f,  // 5 ZOMBIE_NEWSPAPER
    kFallTimeByAnim,  // 6 ZOMBIE_DOOR
    0.52f,  // 7 ZOMBIE_FOOTBALL
    0.83f,  // 8 ZOMBIE_DANCER
    0.83f,  // 9 ZOMBIE_BACKUP_DANCER
    kFallTimeByAnim,  // 10 ZOMBIE_DUCKY_TUBE
    kFallTimeNone,  // 11 ZOMBIE_SNORKEL
    kFallTimeNone,  // 12 ZOMBIE_ZAMBONI
    0.81f,  // 13 ZOMBIE_BOBSLED
    kFallTimeNone,  // 14 ZOMBIE_DOLPHIN_RIDER
    0.64f,  // 15 ZOMBIE_JACK_IN_THE_BOX
    0.68f,  // 16 ZOMBIE_BALLOON
    0.85f,  // 17 ZOMBIE_DIGGER
    0.84f,  // 18 ZOMBIE_POGO
    0.68f,  // 19 ZOMBIE_YETI
    kFallTimeNone,  // 20 ZOMBIE_BUNGEE
    0.62f,  // 21 ZOMBIE_LADDER
    kFallTimeNone,  // 22 ZOMBIE_CATAPULT
    0.86f,  // 23 ZOMBIE_GARGANTUAR
    kFallTimeNone,  // 24 ZOMBIE_IMP
    kFallTimeNone,  // 25 ZOMBIE_BOSS
    kFallTimeByAnim,  // 26 ZOMBIE_PEA_HEAD
    kFallTimeByAnim,  // 27 ZOMBIE_WALLNUT_HEAD
    kFallTimeByAnim,  // 28 ZOMBIE_JALAPENO_HEAD
    kFallTimeByAnim,  // 29 ZOMBIE_GATLING_HEAD
    kFallTimeByAnim,  // 30 ZOMBIE_SQUASH_HEAD
    kFallTimeByAnim,  // 31 ZOMBIE_TALLNUT_HEAD
    0.86f,  // 32 ZOMBIE_REDEYE_GARGANTUAR
    kFallTimeByAnim,  // 33 ZOMBIE_ZOMBATAR
};

// ---------------- FormB：当前 HEAD（static 表逐字，落体时刻段） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    ZombieType mZombieType = (ZombieType)(inp % (uint32_t)NUM_ZOMBIE_TYPES);
    bool mInPool = ((inp >> 12) & 1) != 0;
    bool mDaisyMode = ((inp >> 13) & 1) != 0;
    gReanim->mAnimKind = (int)((inp >> 14) & 3) == 0 ? 0 : ((inp >> 14) & 3) == 1 ? 1 : 2;
    Reanimation* aBodyReanim = gReanim;

    GargShake(mZombieType, aBodyReanim);

    if (!mInPool)
    {
        float aFallTime = kFallTimeNone;
        const unsigned aTypeIndex = static_cast<unsigned>(mZombieType);
        if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))
        {
            aFallTime = kZombieFallTime[aTypeIndex];
        }
        if (aFallTime == kFallTimeByAnim)
        {
            if (aBodyReanim->IsAnimPlaying(0 /*anim_superlongdeath*/))
            {
                aFallTime = 0.788f;
            }
            else if (aBodyReanim->IsAnimPlaying(1 /*anim_death2*/))
            {
                aFallTime = 0.71f;
            }
            else
            {
                aFallTime = 0.77f;
            }
        }

        FallTail(mZombieType, aBodyReanim, aFallTime, mDaisyMode);
    }
}

static void RunA() { for (int i = 0; i < kN; i++) OneA(gInput[i]); }
static void RunB() { for (int i = 0; i < kN; i++) OneB(gInput[i]); }

int main()
{
    GenInput();
    uint64_t ca = CheckOnly(RunA);
    uint64_t cb = CheckOnly(RunB);
    double a = TimePerIterNs(RunA, kN);
    double b = TimePerIterNs(RunB, kN);
    printf("bench16 kZombieFallTime | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
