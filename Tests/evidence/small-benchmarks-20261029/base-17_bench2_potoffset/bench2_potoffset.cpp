// bench2_potoffset.cpp - 目标2: ZenGarden::PlantPottedDrawHeightOffset 17 支 -> kPotOffsets 53 槽
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

// ---------------- FormA：原 17 支链（逐字） ----------------
__declspec(noinline) float OneA(uint32_t inp)
{
    SeedType theSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    float theScale = BitsToF(inp, 8);

    float aScaleOffsetFix = 0.0f;
    float aHeightOffset = 0.0f;
    if (theSeedType == SeedType::SEED_GRAVEBUSTER)
    {
        aHeightOffset += 50.0f;
        aScaleOffsetFix += 15.0f;
    }
    else if (theSeedType == SeedType::SEED_PUFFSHROOM)
    {
        aHeightOffset += 10.0f;
        aScaleOffsetFix += 24.0f;
    }
    else if (theSeedType == SeedType::SEED_SUNSHROOM)
    {
        aHeightOffset += 10.0f;
        aScaleOffsetFix += 17.0f;
    }
    else if (theSeedType == SeedType::SEED_SCAREDYSHROOM)
    {
        aHeightOffset += 5.0f;
        aScaleOffsetFix += 5.0f;
    }
    else if (theSeedType == SeedType::SEED_TANGLEKELP)
    {
        aHeightOffset -= 18.0f;
        aScaleOffsetFix += 20.0f;
    }
    else if (theSeedType == SeedType::SEED_SEASHROOM)
    {
        aHeightOffset -= 20.0f;
        aScaleOffsetFix += 15.0f;
    }
    else if (theSeedType == SeedType::SEED_LILYPAD)
    {
        aHeightOffset -= 10.0f;
        aScaleOffsetFix += 30.0f;
    }
    else if (theSeedType == SeedType::SEED_CHOMPER)
    {
        aScaleOffsetFix += 0.0f;
    }
    else if (theSeedType == SeedType::SEED_HYPNOSHROOM || theSeedType == SeedType::SEED_MARIGOLD || theSeedType == SeedType::SEED_PEASHOOTER ||
        theSeedType == SeedType::SEED_REPEATER || theSeedType == SeedType::SEED_LEFTPEATER || theSeedType == SeedType::SEED_SNOWPEA ||
        theSeedType == SeedType::SEED_THREEPEATER || theSeedType == SeedType::SEED_SUNFLOWER || theSeedType == SeedType::SEED_MARIGOLD)
    {
        aScaleOffsetFix += 10.0f;
    }
    else if (theSeedType == SeedType::SEED_STARFRUIT)
    {
        aHeightOffset += 10.0f;
        aScaleOffsetFix += 24.0f;
    }
    else if (theSeedType == SeedType::SEED_CABBAGEPULT || theSeedType == SeedType::SEED_MELONPULT)
    {
        aScaleOffsetFix += 10.0f;
        aHeightOffset += 3.0f;
    }
    else if (theSeedType == SeedType::SEED_POTATOMINE)
    {
        aScaleOffsetFix += 5.0f;
    }
    else if (theSeedType == SeedType::SEED_TORCHWOOD)
    {
        aScaleOffsetFix += 3.0f;
    }
    else if (theSeedType == SeedType::SEED_SPIKEWEED)
    {
        aScaleOffsetFix += 10.0f;
        aHeightOffset -= 13.0f;
    }
    else if (theSeedType == SeedType::SEED_BLOVER)
    {
        aScaleOffsetFix += 10.0f;
    }
    else if (theSeedType == SeedType::SEED_PUMPKINSHELL)
    {
        aScaleOffsetFix += 20.0f;
    }
    else if (theSeedType == SeedType::SEED_PLANTERN)
    {
        aScaleOffsetFix -= 1.0f;
    }

    return aHeightOffset + (aScaleOffsetFix * theScale - aScaleOffsetFix);
}

// ---------------- FormB：当前表形态（逐字，槽值照抄源码） ----------------
__declspec(noinline) float OneB(uint32_t inp)
{
    SeedType theSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    float theScale = BitsToF(inp, 8);

    constexpr struct { float mHeight; float mScaleFix; } kPotOffsets[] = {
        {  0.0f, 10.0f },  // 0 SEED_PEASHOOTER
        {  0.0f, 10.0f },  // 1 SEED_SUNFLOWER
        {  0.0f,  0.0f },  // 2 SEED_CHERRYBOMB
        {  0.0f,  0.0f },  // 3 SEED_WALLNUT
        {  0.0f,  5.0f },  // 4 SEED_POTATOMINE
        {  0.0f, 10.0f },  // 5 SEED_SNOWPEA
        {  0.0f,  0.0f },  // 6 SEED_CHOMPER
        {  0.0f, 10.0f },  // 7 SEED_REPEATER
        { 10.0f, 24.0f },  // 8 SEED_PUFFSHROOM
        { 10.0f, 17.0f },  // 9 SEED_SUNSHROOM
        {  0.0f,  0.0f },  // 10 SEED_FUMESHROOM
        { 50.0f, 15.0f },  // 11 SEED_GRAVEBUSTER
        {  0.0f, 10.0f },  // 12 SEED_HYPNOSHROOM
        {  5.0f,  5.0f },  // 13 SEED_SCAREDYSHROOM
        {  0.0f,  0.0f },  // 14 SEED_ICESHROOM
        {  0.0f,  0.0f },  // 15 SEED_DOOMSHROOM
        {-10.0f, 30.0f },  // 16 SEED_LILYPAD
        {  0.0f,  0.0f },  // 17 SEED_SQUASH
        {  0.0f, 10.0f },  // 18 SEED_THREEPEATER
        {-18.0f, 20.0f },  // 19 SEED_TANGLEKELP
        {  0.0f,  0.0f },  // 20 SEED_JALAPENO
        {-13.0f, 10.0f },  // 21 SEED_SPIKEWEED
        {  0.0f,  3.0f },  // 22 SEED_TORCHWOOD
        {  0.0f,  0.0f },  // 23 SEED_TALLNUT
        {-20.0f, 15.0f },  // 24 SEED_SEASHROOM
        {  0.0f, -1.0f },  // 25 SEED_PLANTERN
        {  0.0f,  0.0f },  // 26 SEED_CACTUS
        {  0.0f, 10.0f },  // 27 SEED_BLOVER
        {  0.0f,  0.0f },  // 28 SEED_SPLITPEA
        { 10.0f, 24.0f },  // 29 SEED_STARFRUIT
        {  0.0f, 20.0f },  // 30 SEED_PUMPKINSHELL
        {  0.0f,  0.0f },  // 31 SEED_MAGNETSHROOM
        {  3.0f, 10.0f },  // 32 SEED_CABBAGEPULT
        {  0.0f,  0.0f },  // 33 SEED_FLOWERPOT
        {  0.0f,  0.0f },  // 34 SEED_KERNELPULT
        {  0.0f,  0.0f },  // 35 SEED_INSTANT_COFFEE
        {  0.0f,  0.0f },  // 36 SEED_GARLIC
        {  0.0f,  0.0f },  // 37 SEED_UMBRELLA
        {  0.0f, 10.0f },  // 38 SEED_MARIGOLD
        {  3.0f, 10.0f },  // 39 SEED_MELONPULT
        {  0.0f,  0.0f },  // 40 SEED_GATLINGPEA
        {  0.0f,  0.0f },  // 41 SEED_TWINSUNFLOWER
        {  0.0f,  0.0f },  // 42 SEED_GLOOMSHROOM
        {  0.0f,  0.0f },  // 43 SEED_CATTAIL
        {  0.0f,  0.0f },  // 44 SEED_WINTERMELON
        {  0.0f,  0.0f },  // 45 SEED_GOLD_MAGNET
        {  0.0f,  0.0f },  // 46 SEED_SPIKEROCK
        {  0.0f,  0.0f },  // 47 SEED_COBCANNON
        {  0.0f,  0.0f },  // 48 SEED_IMITATER
        {  0.0f,  0.0f },  // 49 SEED_EXPLODE_O_NUT
        {  0.0f,  0.0f },  // 50 SEED_GIANT_WALLNUT
        {  0.0f,  0.0f },  // 51 SEED_SPROUT
        {  0.0f, 10.0f },  // 52 SEED_LEFTPEATER
    };
    static_assert(sizeof(kPotOffsets) / sizeof(kPotOffsets[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kPotOffsets 槽位须与 SeedType 枚举同步");
    float aScaleOffsetFix = 0.0f;
    float aHeightOffset = 0.0f;
    if ((unsigned)theSeedType < sizeof(kPotOffsets) / sizeof(kPotOffsets[0]))
    {
        aHeightOffset += kPotOffsets[(int)theSeedType].mHeight;
        aScaleOffsetFix += kPotOffsets[(int)theSeedType].mScaleFix;
    }

    return aHeightOffset + (aScaleOffsetFix * theScale - aScaleOffsetFix);
}

// ---------------- FormC：FormB 逐字 + static constexpr（诊断：免每次调用栈物化） ----------------
__declspec(noinline) float OneC(uint32_t inp)
{
    SeedType theSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    float theScale = BitsToF(inp, 8);

    static constexpr struct { float mHeight; float mScaleFix; } kPotOffsets[] = {
        {  0.0f, 10.0f },  // 0 SEED_PEASHOOTER
        {  0.0f, 10.0f },  // 1 SEED_SUNFLOWER
        {  0.0f,  0.0f },  // 2 SEED_CHERRYBOMB
        {  0.0f,  0.0f },  // 3 SEED_WALLNUT
        {  0.0f,  5.0f },  // 4 SEED_POTATOMINE
        {  0.0f, 10.0f },  // 5 SEED_SNOWPEA
        {  0.0f,  0.0f },  // 6 SEED_CHOMPER
        {  0.0f, 10.0f },  // 7 SEED_REPEATER
        { 10.0f, 24.0f },  // 8 SEED_PUFFSHROOM
        { 10.0f, 17.0f },  // 9 SEED_SUNSHROOM
        {  0.0f,  0.0f },  // 10 SEED_FUMESHROOM
        { 50.0f, 15.0f },  // 11 SEED_GRAVEBUSTER
        {  0.0f, 10.0f },  // 12 SEED_HYPNOSHROOM
        {  5.0f,  5.0f },  // 13 SEED_SCAREDYSHROOM
        {  0.0f,  0.0f },  // 14 SEED_ICESHROOM
        {  0.0f,  0.0f },  // 15 SEED_DOOMSHROOM
        {-10.0f, 30.0f },  // 16 SEED_LILYPAD
        {  0.0f,  0.0f },  // 17 SEED_SQUASH
        {  0.0f, 10.0f },  // 18 SEED_THREEPEATER
        {-18.0f, 20.0f },  // 19 SEED_TANGLEKELP
        {  0.0f,  0.0f },  // 20 SEED_JALAPENO
        {-13.0f, 10.0f },  // 21 SEED_SPIKEWEED
        {  0.0f,  3.0f },  // 22 SEED_TORCHWOOD
        {  0.0f,  0.0f },  // 23 SEED_TALLNUT
        {-20.0f, 15.0f },  // 24 SEED_SEASHROOM
        {  0.0f, -1.0f },  // 25 SEED_PLANTERN
        {  0.0f,  0.0f },  // 26 SEED_CACTUS
        {  0.0f, 10.0f },  // 27 SEED_BLOVER
        {  0.0f,  0.0f },  // 28 SEED_SPLITPEA
        { 10.0f, 24.0f },  // 29 SEED_STARFRUIT
        {  0.0f, 20.0f },  // 30 SEED_PUMPKINSHELL
        {  0.0f,  0.0f },  // 31 SEED_MAGNETSHROOM
        {  3.0f, 10.0f },  // 32 SEED_CABBAGEPULT
        {  0.0f,  0.0f },  // 33 SEED_FLOWERPOT
        {  0.0f,  0.0f },  // 34 SEED_KERNELPULT
        {  0.0f,  0.0f },  // 35 SEED_INSTANT_COFFEE
        {  0.0f,  0.0f },  // 36 SEED_GARLIC
        {  0.0f,  0.0f },  // 37 SEED_UMBRELLA
        {  0.0f, 10.0f },  // 38 SEED_MARIGOLD
        {  3.0f, 10.0f },  // 39 SEED_MELONPULT
        {  0.0f,  0.0f },  // 40 SEED_GATLINGPEA
        {  0.0f,  0.0f },  // 41 SEED_TWINSUNFLOWER
        {  0.0f,  0.0f },  // 42 SEED_GLOOMSHROOM
        {  0.0f,  0.0f },  // 43 SEED_CATTAIL
        {  0.0f,  0.0f },  // 44 SEED_WINTERMELON
        {  0.0f,  0.0f },  // 45 SEED_GOLD_MAGNET
        {  0.0f,  0.0f },  // 46 SEED_SPIKEROCK
        {  0.0f,  0.0f },  // 47 SEED_COBCANNON
        {  0.0f,  0.0f },  // 48 SEED_IMITATER
        {  0.0f,  0.0f },  // 49 SEED_EXPLODE_O_NUT
        {  0.0f,  0.0f },  // 50 SEED_GIANT_WALLNUT
        {  0.0f,  0.0f },  // 51 SEED_SPROUT
        {  0.0f, 10.0f },  // 52 SEED_LEFTPEATER
    };
    static_assert(sizeof(kPotOffsets) / sizeof(kPotOffsets[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kPotOffsets 槽位须与 SeedType 枚举同步");
    float aScaleOffsetFix = 0.0f;
    float aHeightOffset = 0.0f;
    if ((unsigned)theSeedType < sizeof(kPotOffsets) / sizeof(kPotOffsets[0]))
    {
        aHeightOffset += kPotOffsets[(int)theSeedType].mHeight;
        aScaleOffsetFix += kPotOffsets[(int)theSeedType].mScaleFix;
    }

    return aHeightOffset + (aScaleOffsetFix * theScale - aScaleOffsetFix);
}

static void RunA() { for (int i = 0; i < kN; i++) MixF(OneA(gInput[i])); }
static void RunB() { for (int i = 0; i < kN; i++) MixF(OneB(gInput[i])); }
static void RunC() { for (int i = 0; i < kN; i++) MixF(OneC(gInput[i])); }

int main()
{
    GenInput();
    uint64_t ca = CheckOnly(RunA);
    uint64_t cb = CheckOnly(RunB);
    uint64_t cc = CheckOnly(RunC);
    double a = TimePerIterNs(RunA, kN);
    double b = TimePerIterNs(RunB, kN);
    double c = TimePerIterNs(RunC, kN);
    printf("bench2 PlantPottedDrawHeightOffset | before %.2f ns | after %.2f ns | diff %.1f%% | C(static) %.2f ns | checksum=%s (A=%016llX B=%016llX C=%016llX)\n",
        a, b, (a - b) / a * 100.0, c, ca == cb && cb == cc ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb, (unsigned long long)cc);
    return (ca == cb && cb == cc) ? 0 : 1;
}
