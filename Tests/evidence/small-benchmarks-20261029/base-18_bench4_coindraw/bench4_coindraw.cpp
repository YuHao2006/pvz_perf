// bench4_coindraw.cpp - 目标4: Coin::Draw 19 支 -> kCoinDrawRows 28 槽 + 4 预检
// 计时区 = 提交 diff 区：aImage 声明起至函数尾（公共前缀 glow/attachment/hitGround/闪色/coinglow 两形态逐字相同，不计入）
#include "bench_common.h"

enum CoinType
{
    COIN_NONE, COIN_SILVER, COIN_GOLD, COIN_DIAMOND, COIN_SUN, COIN_SMALLSUN, COIN_LARGESUN,
    COIN_FINAL_SEED_PACKET, COIN_TROPHY, COIN_SHOVEL, COIN_ALMANAC, COIN_CARKEYS, COIN_VASE,
    COIN_WATERING_CAN, COIN_TACO, COIN_NOTE, COIN_USABLE_SEED_PACKET, COIN_PRESENT_PLANT,
    COIN_AWARD_MONEY_BAG, COIN_AWARD_PRESENT, COIN_AWARD_BAG_DIAMOND, COIN_AWARD_SILVER_SUNFLOWER,
    COIN_AWARD_GOLD_SUNFLOWER, COIN_CHOCOLATE, COIN_AWARD_CHOCOLATE, COIN_PRESENT_MINIGAMES,
    COIN_PRESENT_PUZZLE_MODE, COIN_PRESENT_SURVIVAL_MODE
};
enum SeedType { SEED_NONE = -1, SEED_PEASHOOTER = 0, SEED_WALLNUT = 3, SEED_IMX = 48, NUM_SEED_TYPES = 53 };

struct Image { int id; };
#define DEF_IMG(name, val) static Image g_##name{ val }; static Image* const name = &g_##name;
DEF_IMG(IMAGE_REANIM_COIN_SILVER_DOLLAR, 301)
DEF_IMG(IMAGE_REANIM_COIN_GOLD_DOLLAR, 302)
DEF_IMG(IMAGE_PRESENT, 303)
DEF_IMG(IMAGE_PRESENTOPEN, 304)
DEF_IMG(IMAGE_MONEYBAG_HI_RES, 305)
DEF_IMG(IMAGE_CHOCOLATE, 306)
DEF_IMG(IMAGE_TROPHY_HI_RES, 307)
DEF_IMG(IMAGE_SUNFLOWER_TROPHY, 308)
DEF_IMG(IMAGE_SHOVEL_HI_RES, 309)
DEF_IMG(IMAGE_CARKEYS, 310)
DEF_IMG(IMAGE_ALMANAC, 311)
DEF_IMG(IMAGE_TACO, 312)
DEF_IMG(IMAGE_SCARY_POT, 313)
DEF_IMG(IMAGE_WATERINGCAN, 314)
DEF_IMG(IMAGE_ZOMBIE_NOTE_SMALL, 315)
#undef DEF_IMG

struct Graphics
{
    float mScaleX = 1.0f, mScaleY = 1.0f;
    void SetColorizeImages(bool b) { Mix(0xC010u | (uint64_t)(b ? 1 : 0)); }
    void SetScale(float x, float y, float ox, float oy) { Mix(0xC020u); MixF(x); MixF(y); MixF(ox); MixF(oy); mScaleX = x; mScaleY = y; }
};
static void TodDrawImageCelCenterScaledFStub(Graphics* g, Image* theImage, float x, float y, int theCelCol, float sx, float sy, uint64_t tag)
{
    (void)g;
    Mix(tag); MixI(theImage ? theImage->id : -1); MixF(x); MixF(y); MixI(theCelCol); MixF(sx); MixF(sy);
}
// 原 TodDrawImageCelCenterScaledF(g, img, x, y, cel, sx, sy)
static void TodDrawImageCelCenterScaledF(Graphics* g, Image* theImage, float x, float y, int theCelCol, float sx, float sy)
{
    TodDrawImageCelCenterScaledFStub(g, theImage, x, y, theCelCol, sx, sy, 0xC0F0u);
}
static void DrawSeedPacket(Graphics* g, float x, float y, SeedType theSeedType, SeedType theImitaterType, float thePercentDark, int theGrayness, bool theDrawCost, bool theUseCurrentCost)
{
    Mix(0xD5A0u); MixF(x); MixF(y); MixI((int)theSeedType); MixI((int)theImitaterType); MixF(thePercentDark); MixI(theGrayness); MixI(theDrawCost); MixI(theUseCurrentCost); (void)g;
}
static void DrawPottedPlantIconStub(Graphics* g, float x, float y)
{
    Mix(0xD7A0u); MixF(x); MixF(y); (void)g;
}

struct ZenGardenStub { void DrawPottedPlantIcon(Graphics* g, float x, float y, void* spec) { (void)spec; DrawPottedPlantIconStub(g, x, y); } };
struct LawnAppStub { ZenGardenStub* mZenGarden; };
static LawnAppStub gApp;
static ZenGardenStub gZen;

struct Coin
{
    CoinType mType;
    float mPosX, mPosY, mScale;
    int mWidth, mHeight;   // 原为 int（保留整数除法语义）
    bool mIsBeingCollected;
    int mCoinAge, mDisappearCounter;
    SeedType mUsableSeedType;
    int mPottedPlantSpec;

    bool IsSun() const
    {
        return mType == CoinType::COIN_SUN || mType == CoinType::COIN_SMALLSUN || mType == CoinType::COIN_LARGESUN;
    }
    bool IsPresentWithAdvice() const
    {
        return mType == CoinType::COIN_PRESENT_MINIGAMES || mType == CoinType::COIN_PRESENT_PUZZLE_MODE || mType == CoinType::COIN_PRESENT_SURVIVAL_MODE;
    }
    SeedType GetFinalSeedPacketType() const { return (SeedType)((mCoinAge ^ mDisappearCounter) % (uint32_t)NUM_SEED_TYPES); }
    int GetDisappearTime() const { return (int)(mDisappearCounter % 2000u) + 500; }
};
static Coin gCoin;

static void SetupCoin(uint32_t inp)
{
    gCoin.mType = (CoinType)(inp % 28u);
    gCoin.mIsBeingCollected = (inp >> 27) & 1u;
    gCoin.mPosX = BitsToF(inp, 8);
    gCoin.mPosY = BitsToF(inp, 12);
    gCoin.mScale = BitsToF(inp, 16);
    gCoin.mWidth = (int)((inp >> 4) & 0x7F) + 20;
    gCoin.mHeight = (int)((inp >> 20) & 0x7F) + 20;
    gCoin.mCoinAge = (int)(inp >> 3);
    gCoin.mDisappearCounter = (int)(inp >> 7);
    gCoin.mUsableSeedType = (SeedType)((inp >> 17) % (uint32_t)NUM_SEED_TYPES);
    gApp.mZenGarden = &gZen;
}

// ---------------- FormA：原 19 支链（逐字） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    SetupCoin(inp);
    Coin& mCoinL = gCoin;
    Graphics gStorage;
    Graphics* g = &gStorage;

    Image* aImage = nullptr;
    int aImageCelCol = 0;
    float aDrawScale = mCoinL.mScale;
    float aOffsetX = 0.0f;
    float aOffsetY = 0.0f;
    if (mCoinL.mType == CoinType::COIN_SILVER)
    {
        aImage = IMAGE_REANIM_COIN_SILVER_DOLLAR;
        aOffsetX = 8.0f;
        aOffsetY = 10.0f;
    }
    else if (mCoinL.mType == CoinType::COIN_GOLD)
    {
        aImage = IMAGE_REANIM_COIN_GOLD_DOLLAR;
        aOffsetX = 8.0f;
        aOffsetY = 10.0f;
    }
    else if (mCoinL.IsSun())
    {
        return;
    }
    else if (mCoinL.mType == CoinType::COIN_FINAL_SEED_PACKET)
    {
        SeedType aSeedType = mCoinL.GetFinalSeedPacketType();
        g->SetScale(mCoinL.mScale, mCoinL.mScale, 0.0f, 0.0f);
        DrawSeedPacket(g, 0.5f * (mCoinL.mWidth - mCoinL.mScale * mCoinL.mWidth) + mCoinL.mPosX, 0.5f * (mCoinL.mHeight - mCoinL.mScale * mCoinL.mHeight) + mCoinL.mPosY, aSeedType, SeedType::SEED_NONE, 0.0f, 255, true, false);
        g->SetScale(1.0f, 1.0f, 0.0f, 0.0f);
        return;
    }
    else if (mCoinL.mType == CoinType::COIN_PRESENT_PLANT || mCoinL.mType == CoinType::COIN_AWARD_PRESENT)
    {
        if (mCoinL.mIsBeingCollected)
        {
            gApp.mZenGarden->DrawPottedPlantIcon(g, mCoinL.mPosX + 10.0f, mCoinL.mPosY - 20.0f, &mCoinL.mPottedPlantSpec);
            return;
        }

        aImage = IMAGE_PRESENT;
        aOffsetY = -20.0f;
    }
    else if (mCoinL.IsPresentWithAdvice())
    {
        aOffsetY = -20.0f;

        if (mCoinL.mIsBeingCollected)
        {
            aOffsetX = -10.0f;
            aOffsetY -= -10.0f;
            aImage = IMAGE_PRESENTOPEN;
        }
        else
        {
            aImage = IMAGE_PRESENT;
        }
    }
    else if (mCoinL.mType == CoinType::COIN_AWARD_MONEY_BAG || mCoinL.mType == CoinType::COIN_AWARD_BAG_DIAMOND)
    {
        aImage = IMAGE_MONEYBAG_HI_RES;
        aOffsetX -= mCoinL.mWidth / 2;
        aOffsetY -= mCoinL.mHeight / 2;
        aDrawScale *= 0.5f;
    }
    else if (mCoinL.mType == CoinType::COIN_CHOCOLATE || mCoinL.mType == CoinType::COIN_AWARD_CHOCOLATE)
    {
        aImage = IMAGE_CHOCOLATE;
    }
    else if (mCoinL.mType == CoinType::COIN_TROPHY)
    {
        aImage = IMAGE_TROPHY_HI_RES;
        aOffsetX -= mCoinL.mWidth / 2;
        aOffsetY -= mCoinL.mHeight / 2;
        aDrawScale *= 0.5f;
    }
    else if (mCoinL.mType == CoinType::COIN_AWARD_SILVER_SUNFLOWER)
    {
        aImage = IMAGE_SUNFLOWER_TROPHY;
        aOffsetX -= 5.0f;
        aDrawScale *= 0.6f;
    }
    else if (mCoinL.mType == CoinType::COIN_AWARD_GOLD_SUNFLOWER)
    {
        aImage = IMAGE_SUNFLOWER_TROPHY;
        aImageCelCol = 1;
        aOffsetX -= 5.0f;
        aDrawScale *= 0.6f;
    }
    else if (mCoinL.mType == CoinType::COIN_SHOVEL)
    {
        aImage = IMAGE_SHOVEL_HI_RES;
        aOffsetX -= 20.0f;
        aOffsetY -= 20.0f;
        aDrawScale *= 0.5f;
    }
    else if (mCoinL.mType == CoinType::COIN_CARKEYS)
    {
        aImage = IMAGE_CARKEYS;
    }
    else if (mCoinL.mType == CoinType::COIN_ALMANAC)
    {
        aImage = IMAGE_ALMANAC;
    }
    else if (mCoinL.mType == CoinType::COIN_TACO)
    {
        aImage = IMAGE_TACO;
    }
    else if (mCoinL.mType == CoinType::COIN_VASE)
    {
        aImage = IMAGE_SCARY_POT;
    }
    else if (mCoinL.mType == CoinType::COIN_WATERING_CAN)
    {
        aImage = IMAGE_WATERINGCAN;
    }
    else if (mCoinL.mType == CoinType::COIN_NOTE)
    {
        aImage = IMAGE_ZOMBIE_NOTE_SMALL;
    }
    else if (mCoinL.mType == CoinType::COIN_USABLE_SEED_PACKET)
    {
        int aGrayness = 255;
        if (mCoinL.mIsBeingCollected)
        {
            aGrayness = 128;
        }
        else
        {
            int aDisappearTime = mCoinL.GetDisappearTime();
            if (mCoinL.mDisappearCounter > aDisappearTime - 300 && mCoinL.mDisappearCounter % 60 < 30)
            {
                aGrayness = 192;
            }
        }

        g->SetColorizeImages(true);
        DrawSeedPacket(g, (int)mCoinL.mPosX, (int)mCoinL.mPosY, mCoinL.mUsableSeedType, SeedType::SEED_NONE, 0.0f, aGrayness, false, false);
        g->SetColorizeImages(false);

        return;
    }
    else
    {
        TOD_ASSERT(false);
    }

    g->SetColorizeImages(true);
    TodDrawImageCelCenterScaledF(g, aImage, mCoinL.mPosX + aOffsetX, mCoinL.mPosY + aOffsetY, aImageCelCol, aDrawScale, aDrawScale);
    g->SetColorizeImages(false);
}

// ---------------- FormB：当前表形态（逐字：4 预检 + 28 槽表 + advice 覆盖） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    SetupCoin(inp);
    Coin& mCoinL = gCoin;
    Graphics gStorage;
    Graphics* g = &gStorage;

    // 表外早退/特绘预检（原链 Sun/FinalSeedPacket/Present(收集态)/UsableSeedPacket
    // 四支自定义绘制路径，提前于表分派，语义与原链顺序等价——各判别值互斥）。
    if (mCoinL.IsSun())
    {
        return;
    }

    if (mCoinL.mType == CoinType::COIN_FINAL_SEED_PACKET)
    {
        SeedType aSeedType = mCoinL.GetFinalSeedPacketType();
        g->SetScale(mCoinL.mScale, mCoinL.mScale, 0.0f, 0.0f);
        DrawSeedPacket(g, 0.5f * (mCoinL.mWidth - mCoinL.mScale * mCoinL.mWidth) + mCoinL.mPosX, 0.5f * (mCoinL.mHeight - mCoinL.mScale * mCoinL.mHeight) + mCoinL.mPosY, aSeedType, SeedType::SEED_NONE, 0.0f, 255, true, false);
        g->SetScale(1.0f, 1.0f, 0.0f, 0.0f);
        return;
    }

    if ((mCoinL.mType == CoinType::COIN_PRESENT_PLANT || mCoinL.mType == CoinType::COIN_AWARD_PRESENT) && mCoinL.mIsBeingCollected)
    {
        gApp.mZenGarden->DrawPottedPlantIcon(g, mCoinL.mPosX + 10.0f, mCoinL.mPosY - 20.0f, &mCoinL.mPottedPlantSpec);
        return;
    }

    if (mCoinL.mType == CoinType::COIN_USABLE_SEED_PACKET)
    {
        int aGrayness = 255;
        if (mCoinL.mIsBeingCollected)
        {
            aGrayness = 128;
        }
        else
        {
            int aDisappearTime = mCoinL.GetDisappearTime();
            if (mCoinL.mDisappearCounter > aDisappearTime - 300 && mCoinL.mDisappearCounter % 60 < 30)
            {
                aGrayness = 192;
            }
        }

        g->SetColorizeImages(true);
        DrawSeedPacket(g, (int)mCoinL.mPosX, (int)mCoinL.mPosY, mCoinL.mUsableSeedType, SeedType::SEED_NONE, 0.0f, aGrayness, false, false);
        g->SetColorizeImages(false);

        return;
    }

    constexpr struct { Image* const* mImage; uint8_t mCelCol; float mOffX; float mOffY; float mScaleMul; bool mCentered; } kCoinDrawRows[] = {
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 0 COIN_NONE
        { &IMAGE_REANIM_COIN_SILVER_DOLLAR, 0,   8.0f,  10.0f, 1.0f, false },  // 1 COIN_SILVER
        { &IMAGE_REANIM_COIN_GOLD_DOLLAR,   0,   8.0f,  10.0f, 1.0f, false },  // 2 COIN_GOLD
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 3 COIN_DIAMOND
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 4 COIN_SUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 5 COIN_SMALLSUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 6 COIN_LARGESUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 7 COIN_FINAL_SEED_PACKET
        { &IMAGE_TROPHY_HI_RES,             0,   0.0f,   0.0f, 0.5f, true  },  // 8 COIN_TROPHY
        { &IMAGE_SHOVEL_HI_RES,             0, -20.0f, -20.0f, 0.5f, false },  // 9 COIN_SHOVEL
        { &IMAGE_ALMANAC,                   0,   0.0f,   0.0f, 1.0f, false },  // 10 COIN_ALMANAC
        { &IMAGE_CARKEYS,                   0,   0.0f,   0.0f, 1.0f, false },  // 11 COIN_CARKEYS
        { &IMAGE_SCARY_POT,                 0,   0.0f,   0.0f, 1.0f, false },  // 12 COIN_VASE
        { &IMAGE_WATERINGCAN,               0,   0.0f,   0.0f, 1.0f, false },  // 13 COIN_WATERING_CAN
        { &IMAGE_TACO,                      0,   0.0f,   0.0f, 1.0f, false },  // 14 COIN_TACO
        { &IMAGE_ZOMBIE_NOTE_SMALL,         0,   0.0f,   0.0f, 1.0f, false },  // 15 COIN_NOTE
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 16 COIN_USABLE_SEED_PACKET
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 17 COIN_PRESENT_PLANT
        { &IMAGE_MONEYBAG_HI_RES,           0,   0.0f,   0.0f, 0.5f, true  },  // 18 COIN_AWARD_MONEY_BAG
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 19 COIN_AWARD_PRESENT
        { &IMAGE_MONEYBAG_HI_RES,           0,   0.0f,   0.0f, 0.5f, true  },  // 20 COIN_AWARD_BAG_DIAMOND
        { &IMAGE_SUNFLOWER_TROPHY,          0,  -5.0f,   0.0f, 0.6f, false },  // 21 COIN_AWARD_SILVER_SUNFLOWER
        { &IMAGE_SUNFLOWER_TROPHY,          1,  -5.0f,   0.0f, 0.6f, false },  // 22 COIN_AWARD_GOLD_SUNFLOWER
        { &IMAGE_CHOCOLATE,                 0,   0.0f,   0.0f, 1.0f, false },  // 23 COIN_CHOCOLATE
        { &IMAGE_CHOCOLATE,                 0,   0.0f,   0.0f, 1.0f, false },  // 24 COIN_AWARD_CHOCOLATE
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 25 COIN_PRESENT_MINIGAMES
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 26 COIN_PRESENT_PUZZLE_MODE
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 27 COIN_PRESENT_SURVIVAL_MODE
    };
    static_assert(sizeof(kCoinDrawRows) / sizeof(kCoinDrawRows[0]) == (int)CoinType::COIN_PRESENT_SURVIVAL_MODE + 1,
        "kCoinDrawRows 槽位须与 CoinType 枚举同步");

    Image* aImage = nullptr;
    int aImageCelCol = 0;
    float aDrawScale = mCoinL.mScale;
    float aOffsetX = 0.0f;
    float aOffsetY = 0.0f;
    if ((unsigned)mCoinL.mType < sizeof(kCoinDrawRows) / sizeof(kCoinDrawRows[0]) && kCoinDrawRows[(int)mCoinL.mType].mImage != nullptr)
    {
        const auto& aRow = kCoinDrawRows[(int)mCoinL.mType];
        aImage = *aRow.mImage;
        aImageCelCol = aRow.mCelCol;
        aDrawScale = mCoinL.mScale * aRow.mScaleMul;
        aOffsetX = aRow.mOffX;
        aOffsetY = aRow.mOffY;
        if (aRow.mCentered)
        {
            aOffsetX -= mCoinL.mWidth / 2;
            aOffsetY -= mCoinL.mHeight / 2;
        }
    }
    else
    {
        TOD_ASSERT(false);  // 原 else 兜底
    }

    // 建议礼盒收集态：开盖图 + 平移（原链 IsPresentWithAdvice 分支内嵌值）
    if (mCoinL.IsPresentWithAdvice() && mCoinL.mIsBeingCollected)
    {
        aImage = IMAGE_PRESENTOPEN;
        aOffsetX = -10.0f;
        aOffsetY = -10.0f;
    }

    g->SetColorizeImages(true);
    TodDrawImageCelCenterScaledF(g, aImage, mCoinL.mPosX + aOffsetX, mCoinL.mPosY + aOffsetY, aImageCelCol, aDrawScale, aDrawScale);
    g->SetColorizeImages(false);
}

// ---------------- FormC：FormB 逐字 + static constexpr（诊断：免每次调用栈物化） ----------------
__declspec(noinline) void OneC(uint32_t inp)
{
    SetupCoin(inp);
    Coin& mCoinL = gCoin;
    Graphics gStorage;
    Graphics* g = &gStorage;

    // 表外早退/特绘预检（原链 Sun/FinalSeedPacket/Present(收集态)/UsableSeedPacket
    // 四支自定义绘制路径，提前于表分派，语义与原链顺序等价——各判别值互斥）。
    if (mCoinL.IsSun())
    {
        return;
    }

    if (mCoinL.mType == CoinType::COIN_FINAL_SEED_PACKET)
    {
        SeedType aSeedType = mCoinL.GetFinalSeedPacketType();
        g->SetScale(mCoinL.mScale, mCoinL.mScale, 0.0f, 0.0f);
        DrawSeedPacket(g, 0.5f * (mCoinL.mWidth - mCoinL.mScale * mCoinL.mWidth) + mCoinL.mPosX, 0.5f * (mCoinL.mHeight - mCoinL.mScale * mCoinL.mHeight) + mCoinL.mPosY, aSeedType, SeedType::SEED_NONE, 0.0f, 255, true, false);
        g->SetScale(1.0f, 1.0f, 0.0f, 0.0f);
        return;
    }

    if ((mCoinL.mType == CoinType::COIN_PRESENT_PLANT || mCoinL.mType == CoinType::COIN_AWARD_PRESENT) && mCoinL.mIsBeingCollected)
    {
        gApp.mZenGarden->DrawPottedPlantIcon(g, mCoinL.mPosX + 10.0f, mCoinL.mPosY - 20.0f, &mCoinL.mPottedPlantSpec);
        return;
    }

    if (mCoinL.mType == CoinType::COIN_USABLE_SEED_PACKET)
    {
        int aGrayness = 255;
        if (mCoinL.mIsBeingCollected)
        {
            aGrayness = 128;
        }
        else
        {
            int aDisappearTime = mCoinL.GetDisappearTime();
            if (mCoinL.mDisappearCounter > aDisappearTime - 300 && mCoinL.mDisappearCounter % 60 < 30)
            {
                aGrayness = 192;
            }
        }

        g->SetColorizeImages(true);
        DrawSeedPacket(g, (int)mCoinL.mPosX, (int)mCoinL.mPosY, mCoinL.mUsableSeedType, SeedType::SEED_NONE, 0.0f, aGrayness, false, false);
        g->SetColorizeImages(false);

        return;
    }

    static constexpr struct { Image* const* mImage; uint8_t mCelCol; float mOffX; float mOffY; float mScaleMul; bool mCentered; } kCoinDrawRows[] = {
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 0 COIN_NONE
        { &IMAGE_REANIM_COIN_SILVER_DOLLAR, 0,   8.0f,  10.0f, 1.0f, false },  // 1 COIN_SILVER
        { &IMAGE_REANIM_COIN_GOLD_DOLLAR,   0,   8.0f,  10.0f, 1.0f, false },  // 2 COIN_GOLD
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 3 COIN_DIAMOND
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 4 COIN_SUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 5 COIN_SMALLSUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 6 COIN_LARGESUN
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 7 COIN_FINAL_SEED_PACKET
        { &IMAGE_TROPHY_HI_RES,             0,   0.0f,   0.0f, 0.5f, true  },  // 8 COIN_TROPHY
        { &IMAGE_SHOVEL_HI_RES,             0, -20.0f, -20.0f, 0.5f, false },  // 9 COIN_SHOVEL
        { &IMAGE_ALMANAC,                   0,   0.0f,   0.0f, 1.0f, false },  // 10 COIN_ALMANAC
        { &IMAGE_CARKEYS,                   0,   0.0f,   0.0f, 1.0f, false },  // 11 COIN_CARKEYS
        { &IMAGE_SCARY_POT,                 0,   0.0f,   0.0f, 1.0f, false },  // 12 COIN_VASE
        { &IMAGE_WATERINGCAN,               0,   0.0f,   0.0f, 1.0f, false },  // 13 COIN_WATERING_CAN
        { &IMAGE_TACO,                      0,   0.0f,   0.0f, 1.0f, false },  // 14 COIN_TACO
        { &IMAGE_ZOMBIE_NOTE_SMALL,         0,   0.0f,   0.0f, 1.0f, false },  // 15 COIN_NOTE
        { nullptr,                          0,   0.0f,   0.0f, 1.0f, false },  // 16 COIN_USABLE_SEED_PACKET
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 17 COIN_PRESENT_PLANT
        { &IMAGE_MONEYBAG_HI_RES,           0,   0.0f,   0.0f, 0.5f, true  },  // 18 COIN_AWARD_MONEY_BAG
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 19 COIN_AWARD_PRESENT
        { &IMAGE_MONEYBAG_HI_RES,           0,   0.0f,   0.0f, 0.5f, true  },  // 20 COIN_AWARD_BAG_DIAMOND
        { &IMAGE_SUNFLOWER_TROPHY,          0,  -5.0f,   0.0f, 0.6f, false },  // 21 COIN_AWARD_SILVER_SUNFLOWER
        { &IMAGE_SUNFLOWER_TROPHY,          1,  -5.0f,   0.0f, 0.6f, false },  // 22 COIN_AWARD_GOLD_SUNFLOWER
        { &IMAGE_CHOCOLATE,                 0,   0.0f,   0.0f, 1.0f, false },  // 23 COIN_CHOCOLATE
        { &IMAGE_CHOCOLATE,                 0,   0.0f,   0.0f, 1.0f, false },  // 24 COIN_AWARD_CHOCOLATE
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 25 COIN_PRESENT_MINIGAMES
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 26 COIN_PRESENT_PUZZLE_MODE
        { &IMAGE_PRESENT,                   0,   0.0f, -20.0f, 1.0f, false },  // 27 COIN_PRESENT_SURVIVAL_MODE
    };
    static_assert(sizeof(kCoinDrawRows) / sizeof(kCoinDrawRows[0]) == (int)CoinType::COIN_PRESENT_SURVIVAL_MODE + 1,
        "kCoinDrawRows 槽位须与 CoinType 枚举同步");

    Image* aImage = nullptr;
    int aImageCelCol = 0;
    float aDrawScale = mCoinL.mScale;
    float aOffsetX = 0.0f;
    float aOffsetY = 0.0f;
    if ((unsigned)mCoinL.mType < sizeof(kCoinDrawRows) / sizeof(kCoinDrawRows[0]) && kCoinDrawRows[(int)mCoinL.mType].mImage != nullptr)
    {
        const auto& aRow = kCoinDrawRows[(int)mCoinL.mType];
        aImage = *aRow.mImage;
        aImageCelCol = aRow.mCelCol;
        aDrawScale = mCoinL.mScale * aRow.mScaleMul;
        aOffsetX = aRow.mOffX;
        aOffsetY = aRow.mOffY;
        if (aRow.mCentered)
        {
            aOffsetX -= mCoinL.mWidth / 2;
            aOffsetY -= mCoinL.mHeight / 2;
        }
    }
    else
    {
        TOD_ASSERT(false);  // 原 else 兜底
    }

    // 建议礼盒收集态：开盖图 + 平移（原链 IsPresentWithAdvice 分支内嵌值）
    if (mCoinL.IsPresentWithAdvice() && mCoinL.mIsBeingCollected)
    {
        aImage = IMAGE_PRESENTOPEN;
        aOffsetX = -10.0f;
        aOffsetY = -10.0f;
    }

    g->SetColorizeImages(true);
    TodDrawImageCelCenterScaledF(g, aImage, mCoinL.mPosX + aOffsetX, mCoinL.mPosY + aOffsetY, aImageCelCol, aDrawScale, aDrawScale);
    g->SetColorizeImages(false);
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
    printf("bench4 CoinDraw | before %.2f ns | after %.2f ns | diff %.1f%% | C(static) %.2f ns | checksum=%s (A=%016llX B=%016llX C=%016llX)\n",
        a, b, (a - b) / a * 100.0, c, ca == cb && cb == cc ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb, (unsigned long long)cc);
    return (ca == cb && cb == cc) ? 0 : 1;
}
