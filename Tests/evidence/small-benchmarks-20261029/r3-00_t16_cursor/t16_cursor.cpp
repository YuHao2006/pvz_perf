// t16_cursor.cpp — ★kCursorDrawCases -> CursorObject::Draw（每帧）
// FormA = d1ca84be^ 原 18 case switch（逐字）；FormB = HEAD 34→18 槽 lambda 表（逐字）。
#include "r3_entities.h"

// ==================== FormA：d1ca84be^ switch 逐字 ====================
__declspec(noinline) void CursorObject::Draw_A(Graphics* g)
{
    switch (mCursorType)
    {
    case CursorType::CURSOR_TYPE_SHOVEL:
        g->DrawImage(IMAGE_SHOVEL, 10, -30);
        break;

    case CursorType::CURSOR_TYPE_WATERING_CAN:
        if (mApp->mPlayerInfo->mPurchases[(int)StoreItem::STORE_ITEM_GOLD_WATERINGCAN])
        {
            g->DrawImage(IMAGE_ZEN_GOLDTOOLRETICLE, -62, -37);
            g->DrawImage(IMAGE_WATERINGCANGOLD, -3, 12);
        }
        else
        {
            g->DrawImage(IMAGE_WATERINGCAN, -3, 12);
        }
        break;

    case CursorType::CURSOR_TYPE_FERTILIZER:
        g->DrawImage(IMAGE_FERTILIZER, -15, 0);
        break;

    case CursorType::CURSOR_TYPE_BUG_SPRAY:
        g->DrawImage(IMAGE_BUG_SPRAY, -9, -1);
        break;

    case CursorType::CURSOR_TYPE_PHONOGRAPH:
        g->DrawImage(IMAGE_PHONOGRAPH, -17, 10);
        break;

    case CursorType::CURSOR_TYPE_CHOCOLATE:
        g->DrawImage(IMAGE_CHOCOLATE, -2, -8);
        break;

    case CursorType::CURSOR_TYPE_GLOVE:
        g->DrawImage(IMAGE_ZEN_GARDENGLOVE, -17, 15);
        break;

    case CursorType::CURSOR_TYPE_MONEY_SIGN:
        g->DrawImage(IMAGE_ZEN_MONEYSIGN, -17, -10);
        break;

    case CursorType::CURSOR_TYPE_TREE_FOOD:
        g->DrawImage(IMAGE_TREEFOOD, -15, 0);
        break;

    case CursorType::CURSOR_TYPE_WHEEELBARROW:
    {
        PottedPlant* aPottedPlant = mApp->mZenGarden->GetPottedPlantInWheelbarrow();
        if (aPottedPlant)
        {
            g->DrawImage(IMAGE_ZEN_WHEELBARROW, -20, -23);
            if (aPottedPlant->mPlantAge == PottedPlantAge::PLANTAGE_SMALL)
            {
                mApp->mZenGarden->DrawPottedPlant(g, 10.0f, -35.0f, aPottedPlant, 0.6f, true);
            }
            else if (aPottedPlant->mPlantAge == PottedPlantAge::PLANTAGE_MEDIUM)
            {
                mApp->mZenGarden->DrawPottedPlant(g, 15.0f, -25.0f, aPottedPlant, 0.5f, true);
            }
            else
            {
                mApp->mZenGarden->DrawPottedPlant(g, 21.0f, -15.0f, aPottedPlant, 0.4f, true);
            }
        }
        else
        {
            g->DrawImage(IMAGE_ZEN_WHEELBARROW, -20, -30);
        }

        break;
    }

    case CursorType::CURSOR_TYPE_PLANT_FROM_GLOVE:
    {
        Plant* aPlant = mBoard->mPlants.DataArrayGet((unsigned int)mGlovePlantID);
        PottedPlant* aPottedPlant = &mApp->mPlayerInfo->mPottedPlant[aPlant->mPottedPlantIndex];
        if (mBoard->mBackground == BackgroundType::BACKGROUND_MUSHROOM_GARDEN || mBoard->mBackground == BackgroundType::BACKGROUND_ZOMBIQUARIUM)
        {
            mApp->mZenGarden->DrawPottedPlant(g, -10.0f, -10.0f, aPottedPlant, 1.0f, false);
        }
        else
        {
            mApp->mZenGarden->DrawPottedPlant(g, -22.0f, -38.0f, aPottedPlant, 1.0f, true);
        }

        break;
    }

    case CursorType::CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW:
    {
        PottedPlant* aPottedPlant = mApp->mZenGarden->GetPottedPlantInWheelbarrow();
        if (mBoard->mBackground == BackgroundType::BACKGROUND_MUSHROOM_GARDEN || mBoard->mBackground == BackgroundType::BACKGROUND_ZOMBIQUARIUM)
        {
            mApp->mZenGarden->DrawPottedPlant(g, -10.0f, -10.0f, aPottedPlant, 1.0f, false);
        }
        else
        {
            mApp->mZenGarden->DrawPottedPlant(g, -22.0f, -38.0f, aPottedPlant, 1.0f, true);
        }

        break;
    }

    case CursorType::CURSOR_TYPE_PLANT_FROM_BANK:
    case CursorType::CURSOR_TYPE_PLANT_FROM_USABLE_COIN:
    case CursorType::CURSOR_TYPE_PLANT_FROM_DUPLICATOR:
    {
        float aOffsetX = -10.0f;
        float aOffsetY = Plant::PlantDrawHeightOffset(mBoard, nullptr, mType, -1, -1) - 10.0f;
        if (Plant::IsFlying(mType) || mType == SeedType::SEED_GRAVEBUSTER)
        {
            aOffsetY += 30.0f;
        }
        aOffsetY -= 15.0f;
        if (mApp->IsIZombieLevel())
        {
            aOffsetX -= 55.0f;
            aOffsetY -= 70.0f;
        }

        Plant::DrawSeedType(g, mType, mImitaterType, DrawVariation::VARIATION_NORMAL, aOffsetX, aOffsetY);
        break;
    }

    case CursorType::CURSOR_TYPE_HAMMER:
        mApp->ReanimationGet(mReanimCursorID)->Draw(g);
        break;

    case CursorType::CURSOR_TYPE_COBCANNON_TARGET:
    {
        HitResult aHitResult;
        mBoard->MouseHitTest(mBoard->mPrevMouseX, mBoard->mPrevMouseY, &aHitResult);
        if (aHitResult.mObjectType == GameObjectType::OBJECT_TYPE_NONE && mBoard->mPrevMouseY >= 80)
        {
            g->DrawImageCel(IMAGE_COBCANNON_TARGET, -11, 7, 0);
        }

        break;
    }
    case CursorType::CURSOR_TYPE_NORMAL:
        break;
    }
}

// ==================== FormB：HEAD lambda 表（逐字） ====================
namespace
{
// CursorObject::Draw 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器
// + 逆变换 token 对拍 0 差异）；PLANT_FROM_BANK 三标签共体具名。
using CursorDrawCaseFn = void (*)(CursorObject&, Graphics* g);

// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
// 原 case CURSOR_TYPE_PLANT_FROM_BANK, CURSOR_TYPE_PLANT_FROM_USABLE_COIN, CURSOR_TYPE_PLANT_FROM_DUPLICATOR
void CursorDrawCursorTypePlantFromBank(CursorObject& c, Graphics* g)
{
            float aOffsetX = -10.0f;
            float aOffsetY = Plant::PlantDrawHeightOffset(c.mBoard, nullptr, c.mType, -1, -1) - 10.0f;
            if (Plant::IsFlying(c.mType) || c.mType == SeedType::SEED_GRAVEBUSTER)
            {
                aOffsetY += 30.0f;
            }
            aOffsetY -= 15.0f;
            if (c.mApp->IsIZombieLevel())
            {
                aOffsetX -= 55.0f;
                aOffsetY -= 70.0f;
            }

            Plant::DrawSeedType(g, c.mType, c.mImitaterType, DrawVariation::VARIATION_NORMAL, aOffsetX, aOffsetY);
}

// 匿名 lambda 函数指针表，行序 = CursorType 枚举值序（0..17）。
constexpr CursorDrawCaseFn kCursorDrawCases[(int)CursorType::CURSOR_TYPE_TREE_FOOD + 1] = {
    // 原 case CURSOR_TYPE_NORMAL
    [](CursorObject& c, Graphics* g)
    {

    },  // 0 CURSOR_TYPE_NORMAL
    &CursorDrawCursorTypePlantFromBank,  // 1 CURSOR_TYPE_PLANT_FROM_BANK（共体）
    &CursorDrawCursorTypePlantFromBank,  // 2 CURSOR_TYPE_PLANT_FROM_USABLE_COIN（共体）
    // 原 case CURSOR_TYPE_PLANT_FROM_GLOVE
    [](CursorObject& c, Graphics* g)
    {
            Plant* aPlant = c.mBoard->mPlants.DataArrayGet((unsigned int)c.mGlovePlantID);
            PottedPlant* aPottedPlant = &c.mApp->mPlayerInfo->mPottedPlant[aPlant->mPottedPlantIndex];
            if (c.mBoard->mBackground == BackgroundType::BACKGROUND_MUSHROOM_GARDEN || c.mBoard->mBackground == BackgroundType::BACKGROUND_ZOMBIQUARIUM)
            {
                c.mApp->mZenGarden->DrawPottedPlant(g, -10.0f, -10.0f, aPottedPlant, 1.0f, false);
            }
            else
            {
                c.mApp->mZenGarden->DrawPottedPlant(g, -22.0f, -38.0f, aPottedPlant, 1.0f, true);
            }
    },  // 3 CURSOR_TYPE_PLANT_FROM_GLOVE
    &CursorDrawCursorTypePlantFromBank,  // 4 CURSOR_TYPE_PLANT_FROM_DUPLICATOR（共体）
    // 原 case CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW
    [](CursorObject& c, Graphics* g)
    {
            PottedPlant* aPottedPlant = c.mApp->mZenGarden->GetPottedPlantInWheelbarrow();
            if (c.mBoard->mBackground == BackgroundType::BACKGROUND_MUSHROOM_GARDEN || c.mBoard->mBackground == BackgroundType::BACKGROUND_ZOMBIQUARIUM)
            {
                c.mApp->mZenGarden->DrawPottedPlant(g, -10.0f, -10.0f, aPottedPlant, 1.0f, false);
            }
            else
            {
                c.mApp->mZenGarden->DrawPottedPlant(g, -22.0f, -38.0f, aPottedPlant, 1.0f, true);
            }
    },  // 5 CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW
    // 原 case CURSOR_TYPE_SHOVEL
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_SHOVEL, 10, -30);
    },  // 6 CURSOR_TYPE_SHOVEL
    // 原 case CURSOR_TYPE_HAMMER
    [](CursorObject& c, Graphics* g)
    {
            c.mApp->ReanimationGet(c.mReanimCursorID)->Draw(g);
    },  // 7 CURSOR_TYPE_HAMMER
    // 原 case CURSOR_TYPE_COBCANNON_TARGET
    [](CursorObject& c, Graphics* g)
    {
            HitResult aHitResult;
            c.mBoard->MouseHitTest(c.mBoard->mPrevMouseX, c.mBoard->mPrevMouseY, &aHitResult);
            if (aHitResult.mObjectType == GameObjectType::OBJECT_TYPE_NONE && c.mBoard->mPrevMouseY >= 80)
            {
                g->DrawImageCel(IMAGE_COBCANNON_TARGET, -11, 7, 0);
            }
    },  // 8 CURSOR_TYPE_COBCANNON_TARGET
    // 原 case CURSOR_TYPE_WATERING_CAN
    [](CursorObject& c, Graphics* g)
    {
            if (c.mApp->mPlayerInfo->mPurchases[(int)StoreItem::STORE_ITEM_GOLD_WATERINGCAN])
            {
                g->DrawImage(IMAGE_ZEN_GOLDTOOLRETICLE, -62, -37);
                g->DrawImage(IMAGE_WATERINGCANGOLD, -3, 12);
            }
            else
            {
                g->DrawImage(IMAGE_WATERINGCAN, -3, 12);
            }
    },  // 9 CURSOR_TYPE_WATERING_CAN
    // 原 case CURSOR_TYPE_FERTILIZER
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_FERTILIZER, -15, 0);
    },  // 10 CURSOR_TYPE_FERTILIZER
    // 原 case CURSOR_TYPE_BUG_SPRAY
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_BUG_SPRAY, -9, -1);
    },  // 11 CURSOR_TYPE_BUG_SPRAY
    // 原 case CURSOR_TYPE_PHONOGRAPH
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_PHONOGRAPH, -17, 10);
    },  // 12 CURSOR_TYPE_PHONOGRAPH
    // 原 case CURSOR_TYPE_CHOCOLATE
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_CHOCOLATE, -2, -8);
    },  // 13 CURSOR_TYPE_CHOCOLATE
    // 原 case CURSOR_TYPE_GLOVE
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_ZEN_GARDENGLOVE, -17, 15);
    },  // 14 CURSOR_TYPE_GLOVE
    // 原 case CURSOR_TYPE_MONEY_SIGN
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_ZEN_MONEYSIGN, -17, -10);
    },  // 15 CURSOR_TYPE_MONEY_SIGN
    // 原 case CURSOR_TYPE_WHEEELBARROW
    [](CursorObject& c, Graphics* g)
    {
            PottedPlant* aPottedPlant = c.mApp->mZenGarden->GetPottedPlantInWheelbarrow();
            if (aPottedPlant)
            {
                g->DrawImage(IMAGE_ZEN_WHEELBARROW, -20, -23);
                if (aPottedPlant->mPlantAge == PottedPlantAge::PLANTAGE_SMALL)
                {
                    c.mApp->mZenGarden->DrawPottedPlant(g, 10.0f, -35.0f, aPottedPlant, 0.6f, true);
                }
                else if (aPottedPlant->mPlantAge == PottedPlantAge::PLANTAGE_MEDIUM)
                {
                    c.mApp->mZenGarden->DrawPottedPlant(g, 15.0f, -25.0f, aPottedPlant, 0.5f, true);
                }
                else
                {
                    c.mApp->mZenGarden->DrawPottedPlant(g, 21.0f, -15.0f, aPottedPlant, 0.4f, true);
                }
            }
            else
            {
                g->DrawImage(IMAGE_ZEN_WHEELBARROW, -20, -30);
            }
    },  // 16 CURSOR_TYPE_WHEEELBARROW
    // 原 case CURSOR_TYPE_TREE_FOOD
    [](CursorObject& c, Graphics* g)
    {
            g->DrawImage(IMAGE_TREEFOOD, -15, 0);
    },  // 17 CURSOR_TYPE_TREE_FOOD
};
static_assert(sizeof(kCursorDrawCases) / sizeof(kCursorDrawCases[0]) ==
    (int)CursorType::CURSOR_TYPE_TREE_FOOD + 1, "kCursorDrawCases 槽位数须与 CursorType 枚举同步");
}  // namespace

//0x438820
__declspec(noinline) void CursorObject::Draw_B(Graphics* g)
{
    // C 形态 -> 匿名 lambda 函数指针表：行序 = CursorType 枚举序（0..17，
    // 全覆盖无 default）；Graphics* 经参传入。
    const unsigned aCursorIndex = static_cast<unsigned>(mCursorType);
    if (aCursorIndex <= static_cast<unsigned>(CursorType::CURSOR_TYPE_TREE_FOOD))
    {
        kCursorDrawCases[aCursorIndex](*this, g);
    }

}

// ============================ main ============================
static CursorObject g_cursor;
static Board g_board;
static LawnApp g_app;
static ZenGarden g_zen;
static PlayerInfo g_pi;
static WidgetManager g_wm;
static Graphics g_gfx;

int main()
{
    g_cursor.mApp = &g_app;
    g_cursor.mBoard = &g_board;
    g_app.mBoard = &g_board;
    g_app.mZenGarden = &g_zen;
    g_app.mPlayerInfo = &g_pi;
    g_app.mWidgetManager = &g_wm;
    g_board.mApp = &g_app;
    g_board.mPrevMouseX = 400; g_board.mPrevMouseY = 300;
    g_pi.mPurchases[(int)StoreItem::STORE_ITEM_GOLD_WATERINGCAN] = 1;

    int rc = 0;
    {
        auto reset = []() {};
        auto pa = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                g_cursor.mCursorType = (CursorType)(g_inputs[i].a % 18);
                g_cursor.mType = (SeedType)(g_inputs[i].b % 48);
                g_cursor.mImitaterType = (SeedType)(g_inputs[i].c % 48);
                g_board.mBackground = (BackgroundType)(g_inputs[i].d % 10);
                g_cursor.Draw_A(&g_gfx);
                ck = ZBMixU64(ck, (uint64_t)(uint32_t)g_cursor.mCursorType);
            }
        };
        auto pb = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                g_cursor.mCursorType = (CursorType)(g_inputs[i].a % 18);
                g_cursor.mType = (SeedType)(g_inputs[i].b % 48);
                g_cursor.mImitaterType = (SeedType)(g_inputs[i].c % 48);
                g_board.mBackground = (BackgroundType)(g_inputs[i].d % 10);
                g_cursor.Draw_B(&g_gfx);
                ck = ZBMixU64(ck, (uint64_t)(uint32_t)g_cursor.mCursorType);
            }
        };
        rc |= R3BenchMain("t16_CursorObject_Draw_kCursorDrawCases", reset, pa, pb);
    }
    return rc;
}
