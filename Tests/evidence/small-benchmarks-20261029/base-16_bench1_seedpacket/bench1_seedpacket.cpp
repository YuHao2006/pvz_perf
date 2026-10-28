// bench1_seedpacket.cpp - 目标1: SeedPacket::DrawSeed 13 支 if-else -> kSeedPacketCel 53 槽
// FormA = 998879a6^ 原链逐字还原（仅计时分派区：POTATOMINE 链起至 else 兜底）
// FormB = 当前表形态逐字还原（表 + 守卫 + else）
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
    SEED_BEGHOULED_BUTTON_SHUFFLE, SEED_BEGHOULED_BUTTON_CRATER,
    SEED_NONE = -1
};
enum DrawVariation { VARIATION_NORMAL };

struct Image { int id; };
static Image  gImgPacketPlants{ 100 };            // IMAGE_PACKET_PLANTS 桩（编号入 checksum）
static Image* IMAGE_PACKET_PLANTS = &gImgPacketPlants;

struct Graphics
{
    float mScaleX, mScaleY;
    Graphics() : mScaleX(1.0f), mScaleY(1.0f) {}
    Graphics(const Graphics& o) : mScaleX(o.mScaleX), mScaleY(o.mScaleY) { Mix(0x51EED001u); }
};

static void TodDrawImageCelScaledF(Graphics* g, Image* theImage, float x, float y, int theCelCol, int theCelRow, float theScaleX, float theScaleY)
{
    Mix(0xC001u); MixI(theImage ? theImage->id : -1); MixF(x); MixF(y); MixI(theCelCol); MixI(theCelRow); MixF(theScaleX); MixF(theScaleY);
}

struct Plant
{
    static void DrawSeedType(Graphics* g, SeedType theSeedType, SeedType theImitaterType, DrawVariation v, float x, float y)
    {
        Mix(0xD5EEDu); MixI((int)theSeedType); MixI((int)theImitaterType); MixI((int)v); MixF(x); MixF(y);
        MixF(g->mScaleX); MixF(g->mScaleY);
    }
};

// ---------------- FormA：原 13 支链（逐字） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    Graphics gStorage;
    Graphics* g = &gStorage;
    g->mScaleX = 1.0f; g->mScaleY = 1.0f;
    Image* aImage = IMAGE_PACKET_PLANTS;
    SeedType aSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    SeedType theSeedType = aSeedType;
    SeedType theImitaterType = SeedType::SEED_NONE;
    float x = BitsToF(inp, 8), y = BitsToF(inp, 16);
    float theOffsetX = BitsToF(inp, 4), theOffsetY = BitsToF(inp, 12);
    float theScale = BitsToF(inp, 20);

    if (aSeedType == SeedType::SEED_POTATOMINE && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 0, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_CHOMPER && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 1, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_HYPNOSHROOM && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 2, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_TALLNUT && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 3, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_BLOVER && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 4, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_PUMPKINSHELL && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 5, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_TWINSUNFLOWER && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 6, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_COBCANNON && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 7, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_CABBAGEPULT && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 8, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_KERNELPULT && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 9, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_MELONPULT && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 10, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_WINTERMELON && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 11, 0, g->mScaleX, g->mScaleY);
    }
    else if (aSeedType == SeedType::SEED_SPIKEROCK && g->mScaleX <= 1.0f)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, 12, 0, g->mScaleX, g->mScaleY);
    }
    else
    {
        Graphics aSeedG(*g);
        aSeedG.mScaleX = theScale * g->mScaleX;
        aSeedG.mScaleY = theScale * g->mScaleY;
        Plant::DrawSeedType(&aSeedG, theSeedType, theImitaterType, DrawVariation::VARIATION_NORMAL, x + theOffsetX, y + theOffsetY);
    }
}

// ---------------- FormB：当前表形态（逐字） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    Graphics gStorage;
    Graphics* g = &gStorage;
    g->mScaleX = 1.0f; g->mScaleY = 1.0f;
    Image* aImage = IMAGE_PACKET_PLANTS;
    SeedType aSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    SeedType theSeedType = aSeedType;
    SeedType theImitaterType = SeedType::SEED_NONE;
    float x = BitsToF(inp, 8), y = BitsToF(inp, 16);
    float theOffsetX = BitsToF(inp, 4), theOffsetY = BitsToF(inp, 12);
    float theScale = BitsToF(inp, 20);

    constexpr uint8_t kSeedPacketCelNone = 0xFF;
    constexpr uint8_t kSeedPacketCel[(int)SeedType::NUM_SEED_TYPES] = {
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 0..3
        0,                   kSeedPacketCelNone,  1,                   kSeedPacketCelNone,  // 4..7
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 8..11
        2,                   kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 12..15
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 16..19
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  3,                   // 20..23
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  4,                   // 24..27
        kSeedPacketCelNone,  kSeedPacketCelNone,  5,                   kSeedPacketCelNone,  // 28..31
        8,                   kSeedPacketCelNone,  9,                   kSeedPacketCelNone,  // 32..35
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  10,                  // 36..39
        kSeedPacketCelNone,  6,                   kSeedPacketCelNone,  kSeedPacketCelNone,  // 40..43
        11,                  kSeedPacketCelNone,  12,                  7,                   // 44..47
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 48..51
        kSeedPacketCelNone,                                                                                      // 52
    };
    static_assert(sizeof(kSeedPacketCel) / sizeof(kSeedPacketCel[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kSeedPacketCel 槽位须与 SeedType 枚举同步");
    if (g->mScaleX <= 1.0f &&
        (unsigned)aSeedType < sizeof(kSeedPacketCel) / sizeof(kSeedPacketCel[0]) &&
        kSeedPacketCel[(int)aSeedType] != kSeedPacketCelNone)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, kSeedPacketCel[(int)aSeedType], 0, g->mScaleX, g->mScaleY);
    }
    else
    {
        Graphics aSeedG(*g);
        aSeedG.mScaleX = theScale * g->mScaleX;
        aSeedG.mScaleY = theScale * g->mScaleY;
        Plant::DrawSeedType(&aSeedG, theSeedType, theImitaterType, DrawVariation::VARIATION_NORMAL, x + theOffsetX, y + theOffsetY);
    }
}

// ---------------- FormC：FormB 逐字 + static constexpr（诊断：免每次调用栈物化） ----------------
__declspec(noinline) void OneC(uint32_t inp)
{
    Graphics gStorage;
    Graphics* g = &gStorage;
    g->mScaleX = 1.0f; g->mScaleY = 1.0f;
    Image* aImage = IMAGE_PACKET_PLANTS;
    SeedType aSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    SeedType theSeedType = aSeedType;
    SeedType theImitaterType = SeedType::SEED_NONE;
    float x = BitsToF(inp, 8), y = BitsToF(inp, 16);
    float theOffsetX = BitsToF(inp, 4), theOffsetY = BitsToF(inp, 12);
    float theScale = BitsToF(inp, 20);

    constexpr uint8_t kSeedPacketCelNone = 0xFF;
    static constexpr uint8_t kSeedPacketCel[(int)SeedType::NUM_SEED_TYPES] = {
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 0..3
        0,                   kSeedPacketCelNone,  1,                   kSeedPacketCelNone,  // 4..7
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 8..11
        2,                   kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 12..15
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 16..19
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  3,                   // 20..23
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  4,                   // 24..27
        kSeedPacketCelNone,  kSeedPacketCelNone,  5,                   kSeedPacketCelNone,  // 28..31
        8,                   kSeedPacketCelNone,  9,                   kSeedPacketCelNone,  // 32..35
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  10,                  // 36..39
        kSeedPacketCelNone,  6,                   kSeedPacketCelNone,  kSeedPacketCelNone,  // 40..43
        11,                  kSeedPacketCelNone,  12,                  7,                   // 44..47
        kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  kSeedPacketCelNone,  // 48..51
        kSeedPacketCelNone,                                                                                      // 52
    };
    static_assert(sizeof(kSeedPacketCel) / sizeof(kSeedPacketCel[0]) == (int)SeedType::NUM_SEED_TYPES,
        "kSeedPacketCel 槽位须与 SeedType 枚举同步");
    if (g->mScaleX <= 1.0f &&
        (unsigned)aSeedType < sizeof(kSeedPacketCel) / sizeof(kSeedPacketCel[0]) &&
        kSeedPacketCel[(int)aSeedType] != kSeedPacketCelNone)
    {
        TodDrawImageCelScaledF(g, aImage, x, y, kSeedPacketCel[(int)aSeedType], 0, g->mScaleX, g->mScaleY);
    }
    else
    {
        Graphics aSeedG(*g);
        aSeedG.mScaleX = theScale * g->mScaleX;
        aSeedG.mScaleY = theScale * g->mScaleY;
        Plant::DrawSeedType(&aSeedG, theSeedType, theImitaterType, DrawVariation::VARIATION_NORMAL, x + theOffsetX, y + theOffsetY);
    }
}

static void RunA() { for (int i = 0; i < kN; i++) OneA(gInput[i]); }
static void RunB() { for (int i = 0; i < kN; i++) OneB(gInput[i]); }
static void RunC() { for (int i = 0; i < kN; i++) OneC(gInput[i]); }

int main()
{
    GenInput();
    uint64_t ca = CheckOnly(RunA);
    uint64_t cb = CheckOnly(RunB);
    uint64_t cc = CheckOnly(RunC);
    double a = TimePerIterNs(RunA, kN);
    double b = TimePerIterNs(RunB, kN);
    double c = TimePerIterNs(RunC, kN);
    printf("bench1 SeedPacketDrawSeed | before %.2f ns | after %.2f ns | diff %.1f%% | C(static) %.2f ns | checksum=%s (A=%016llX B=%016llX C=%016llX)\n",
        a, b, (a - b) / a * 100.0, c, ca == cb && cb == cc ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb, (unsigned long long)cc);
    return (ca == cb && cb == cc) ? 0 : 1;
}
