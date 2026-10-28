// bench03_shootctr - 目标3: Plant::Fire 射击节奏 switch -> kShootingCounter[53] static 表
// FormA = fdab0487^ 原链逐字（switch + KERNELPULT 黄油特判在 case 体内）；
// FormB = 当前 HEAD（黄油特判移表外前置 + static 表）逐字。
// 账本旧数（裸 constexpr 表时代）：5.16 -> 1.16（-78%）。
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

// ---- 桩：Reanimation / PlayBodyReanim / Sexy::Rand（字段保留，空桩编号入 checksum） ----
struct Reanimation
{
    bool TrackExists(int id) { Mix(0xAA00u + (uint64_t)id); return true; }
    void AssignRenderGroupToRange(int range, int group) { Mix(0xAA10u + (uint64_t)range * 8 + (uint64_t)group); }
};
static Reanimation gReanimStorage;
static Reanimation* gReanim = &gReanimStorage;

static uint32_t gRandState = 0x27220A95u;   // Sexy::Rand 桩（确定性）
static int SexyRand(int n) { gRandState = gRandState * 1664525u + 1013904223u; return (int)(gRandState % (uint32_t)n); }
static void ResetRand() { gRandState = 0x27220A95u; }

static void PlayBodyReanimStub(int track, int loop, int blend, float rate)
{ Mix(0xBB01u + (uint64_t)track); MixI(blend); MixF(rate); }

static SeedType gSeedType;
static int gShootingCounter;
static int gState;

// ---------------- FormA：原 switch（fdab0487^ 逐字，anim_shooting 臂内） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    gSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    Reanimation* aBodyReanim = gReanim;

    if (aBodyReanim && aBodyReanim->TrackExists(55 /*anim_shooting*/))
    {
        PlayBodyReanimStub(55, 1, 20, 35.0f);

        switch (gSeedType)
        {
        case SeedType::SEED_FUMESHROOM:     gShootingCounter = 50;  break;
        case SeedType::SEED_PUFFSHROOM:     gShootingCounter = 29;  break;
        case SeedType::SEED_SCAREDYSHROOM:  gShootingCounter = 25;  break;
        case SeedType::SEED_CABBAGEPULT:    gShootingCounter = 32;  break;
        case SeedType::SEED_MELONPULT:
        case SeedType::SEED_WINTERMELON:    gShootingCounter = 36;  break;
        case SeedType::SEED_KERNELPULT:
        {
            if (SexyRand(4) == 0)
            {
                aBodyReanim->AssignRenderGroupToRange(1 /*Cornpult_butter*/, 0 /*NORMAL*/);
                aBodyReanim->AssignRenderGroupToRange(2 /*Cornpult_kernal*/, 1 /*HIDDEN*/);
                gState = 1;   // STATE_KERNELPULT_BUTTER
            }

            gShootingCounter = 30;
            break;
        }
        case SeedType::SEED_CACTUS:         gShootingCounter = 35;  break;
        default:                            gShootingCounter = 29;  break;
        }
    }
    MixI(gShootingCounter);
}

// ---------------- FormB：当前 HEAD（static 表逐字，黄油特判表外前置） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    gSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    Reanimation* aBodyReanim = gReanim;

    if (aBodyReanim && aBodyReanim->TrackExists(55 /*anim_shooting*/))
    {
        PlayBodyReanimStub(55, 1, 20, 35.0f);

        if (gSeedType == SeedType::SEED_KERNELPULT && SexyRand(4) == 0)
        {
            aBodyReanim->AssignRenderGroupToRange(1 /*Cornpult_butter*/, 0 /*NORMAL*/);
            aBodyReanim->AssignRenderGroupToRange(2 /*Cornpult_kernal*/, 1 /*HIDDEN*/);
            gState = 1;   // STATE_KERNELPULT_BUTTER
        }
        static constexpr uint8_t kShootingCounter[] = {
            29,  // SEED_PEASHOOTER
            29,  // SEED_SUNFLOWER
            29,  // SEED_CHERRYBOMB
            29,  // SEED_WALLNUT
            29,  // SEED_POTATOMINE
            29,  // SEED_SNOWPEA
            29,  // SEED_CHOMPER
            29,  // SEED_REPEATER
            29,  // SEED_PUFFSHROOM
            29,  // SEED_SUNSHROOM
            50,  // SEED_FUMESHROOM
            29,  // SEED_GRAVEBUSTER
            29,  // SEED_HYPNOSHROOM
            25,  // SEED_SCAREDYSHROOM
            29,  // SEED_ICESHROOM
            29,  // SEED_DOOMSHROOM
            29,  // SEED_LILYPAD
            29,  // SEED_SQUASH
            29,  // SEED_THREEPEATER
            29,  // SEED_TANGLEKELP
            29,  // SEED_JALAPENO
            29,  // SEED_SPIKEWEED
            29,  // SEED_TORCHWOOD
            29,  // SEED_TALLNUT
            29,  // SEED_SEASHROOM
            29,  // SEED_PLANTERN
            35,  // SEED_CACTUS
            29,  // SEED_BLOVER
            29,  // SEED_SPLITPEA
            29,  // SEED_STARFRUIT
            29,  // SEED_PUMPKINSHELL
            29,  // SEED_MAGNETSHROOM
            32,  // SEED_CABBAGEPULT
            29,  // SEED_FLOWERPOT
            30,  // SEED_KERNELPULT
            29,  // SEED_INSTANT_COFFEE
            29,  // SEED_GARLIC
            29,  // SEED_UMBRELLA
            29,  // SEED_MARIGOLD
            36,  // SEED_MELONPULT
            29,  // SEED_GATLINGPEA
            29,  // SEED_TWINSUNFLOWER
            29,  // SEED_GLOOMSHROOM
            29,  // SEED_CATTAIL
            36,  // SEED_WINTERMELON
            29,  // SEED_GOLD_MAGNET
            29,  // SEED_SPIKEROCK
            29,  // SEED_COBCANNON
            29,  // SEED_IMITATER
            29,  // SEED_EXPLODE_O_NUT
            29,  // SEED_GIANT_WALLNUT
            29,  // SEED_SPROUT
            29,  // SEED_LEFTPEATER
        };
        static_assert(sizeof(kShootingCounter) / sizeof(kShootingCounter[0]) == (int)SeedType::NUM_SEED_TYPES,
            "射击节奏槽位须与 SeedType 枚举同步");
        gShootingCounter = kShootingCounter[gSeedType];
    }
    MixI(gShootingCounter);
}

static void RunA() { ResetRand(); for (int i = 0; i < kN; i++) OneA(gInput[i]); }
static void RunB() { ResetRand(); for (int i = 0; i < kN; i++) OneB(gInput[i]); }

int main()
{
    GenInput();
    uint64_t ca = CheckOnly(RunA);
    uint64_t cb = CheckOnly(RunB);
    double a = TimePerIterNs(RunA, kN);
    double b = TimePerIterNs(RunB, kN);
    printf("bench03 kShootingCounter | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
