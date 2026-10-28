// bench10_prodraw - 目标10: Projectile::Draw 贴图选取 13 级 if 链 -> kDrawParams[14] static 表
// FormA = fdab0487^ 原链逐字（13 级 if + else 断言）；FormB = 当前 HEAD（Image* const* 表 + static）逐字。
// 账本旧数（裸 constexpr 表时代）：9.74 -> 1.91（-80%）。
// 计时分派区：aImage/aScale 决出即止（孢子龄曲线特例两形态同在）。
#include "bench_common.h"

enum ProjectileType
{
    PROJECTILE_PEA = 0, PROJECTILE_SNOWPEA, PROJECTILE_CABBAGE, PROJECTILE_MELON,
    PROJECTILE_PUFF, PROJECTILE_WINTERMELON, PROJECTILE_FIREBALL, PROJECTILE_STAR,
    PROJECTILE_SPIKE, PROJECTILE_BASKETBALL, PROJECTILE_KERNEL, PROJECTILE_COBBIG,
    PROJECTILE_BUTTER, PROJECTILE_ZOMBIE_PEA, NUM_PROJECTILES
};

// ---- Image* 编号桩（表存变量地址，用时解引用——与仓库形态一致） ----
struct Image { int id; };
static Image gImgPea{ 0x11 }, gImgSnowpea{ 0x12 }, gImgCabbage{ 0x13 }, gImgMelon{ 0x14 },
             gImgPuff{ 0x15 }, gImgWintermelon{ 0x16 }, gImgStar{ 0x17 }, gImgCactus{ 0x18 },
             gImgBasketball{ 0x19 }, gImgKernel{ 0x1A }, gImgCob{ 0x1B }, gImgButter{ 0x1C };
static Image* IMAGE_PROJECTILEPEA = &gImgPea;
static Image* IMAGE_PROJECTILESNOWPEA = &gImgSnowpea;
static Image* IMAGE_REANIM_CABBAGEPULT_CABBAGE = &gImgCabbage;
static Image* IMAGE_REANIM_MELONPULT_MELON = &gImgMelon;
static Image* IMAGE_PUFFSHROOM_PUFF1 = &gImgPuff;
static Image* IMAGE_REANIM_WINTERMELON_PROJECTILE = &gImgWintermelon;
static Image* IMAGE_PROJECTILE_STAR = &gImgStar;
static Image* IMAGE_PROJECTILECACTUS = &gImgCactus;
static Image* IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL = &gImgBasketball;
static Image* IMAGE_REANIM_CORNPULT_KERNAL = &gImgKernel;
static Image* IMAGE_REANIM_COBCANNON_COB = &gImgCob;
static Image* IMAGE_REANIM_CORNPULT_BUTTER = &gImgButter;

static float TodAnimateCurveFloat(int a, int b, int v, float lo, float hi, int curve)
{
    float r = lo + (hi - lo) * (float)(v - a) / (float)(b - a);
    Mix(0x70F0u); MixI(v); MixF(r);
    return r;
}

// ---------------- FormA：原 13 级 if 链（fdab0487^ 逐字，计时分派区） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    ProjectileType mProjectileType = (ProjectileType)(inp % (uint32_t)NUM_PROJECTILES);
    int mProjectileAge = (int)((inp >> 8) & 0xFF);

    Image* aImage = nullptr;
    float aScale = 1.0f;
    if (mProjectileType == ProjectileType::PROJECTILE_COBBIG)
    {
        aImage = IMAGE_REANIM_COBCANNON_COB;
        aScale = 0.9f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_PEA || mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA)
    {
        aImage = IMAGE_PROJECTILEPEA;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_SNOWPEA)
    {
        aImage = IMAGE_PROJECTILESNOWPEA;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_FIREBALL)
    {
        aImage = nullptr;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_SPIKE)
    {
        aImage = IMAGE_PROJECTILECACTUS;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_STAR)
    {
        aImage = IMAGE_PROJECTILE_STAR;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_PUFF)
    {
        aImage = IMAGE_PUFFSHROOM_PUFF1;
        aScale = TodAnimateCurveFloat(0, 30, mProjectileAge, 0.3f, 1.0f, 0 /*Linear*/);
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_BASKETBALL)
    {
        aImage = IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL;
        aScale = 1.1f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_CABBAGE)
    {
        aImage = IMAGE_REANIM_CABBAGEPULT_CABBAGE;
        aScale = 1.0f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_KERNEL)
    {
        aImage = IMAGE_REANIM_CORNPULT_KERNAL;
        aScale = 0.95f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_BUTTER)
    {
        aImage = IMAGE_REANIM_CORNPULT_BUTTER;
        aScale = 0.8f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_MELON)
    {
        aImage = IMAGE_REANIM_MELONPULT_MELON;
        aScale = 1.0f;
    }
    else if (mProjectileType == ProjectileType::PROJECTILE_WINTERMELON)
    {
        aImage = IMAGE_REANIM_WINTERMELON_PROJECTILE;
        aScale = 1.0f;
    }
    else
    {
        TOD_ASSERT(false);
    }
    MixI(aImage ? aImage->id : -1);
    MixF(aScale);
}

// ---------------- FormB：当前 HEAD（static 表逐字，计时分派区） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    ProjectileType mProjectileType = (ProjectileType)(inp % (uint32_t)NUM_PROJECTILES);
    int mProjectileAge = (int)((inp >> 8) & 0xFF);

    static constexpr struct { Image* const* mImage; float mScale; } kDrawParams[] = {
        { &IMAGE_PROJECTILEPEA,                     1.0f  },  // PROJECTILE_PEA
        { &IMAGE_PROJECTILESNOWPEA,                 1.0f  },  // PROJECTILE_SNOWPEA
        { &IMAGE_REANIM_CABBAGEPULT_CABBAGE,        1.0f  },  // PROJECTILE_CABBAGE
        { &IMAGE_REANIM_MELONPULT_MELON,            1.0f  },  // PROJECTILE_MELON
        { &IMAGE_PUFFSHROOM_PUFF1,                  0.3f  },  // PROJECTILE_PUFF（缩放走曲线，下行覆盖）
        { &IMAGE_REANIM_WINTERMELON_PROJECTILE,     1.0f  },  // PROJECTILE_WINTERMELON
        { nullptr,                                 1.0f  },  // PROJECTILE_FIREBALL（空，占位）
        { &IMAGE_PROJECTILE_STAR,                   1.0f  },  // PROJECTILE_STAR
        { &IMAGE_PROJECTILECACTUS,                  1.0f  },  // PROJECTILE_SPIKE
        { &IMAGE_REANIM_ZOMBIE_CATAPULT_BASKETBALL, 1.1f  },  // PROJECTILE_BASKETBALL
        { &IMAGE_REANIM_CORNPULT_KERNAL,            0.95f },  // PROJECTILE_KERNEL
        { &IMAGE_REANIM_COBCANNON_COB,              0.9f  },  // PROJECTILE_COBBIG
        { &IMAGE_REANIM_CORNPULT_BUTTER,            0.8f  },  // PROJECTILE_BUTTER
        { &IMAGE_PROJECTILEPEA,                     1.0f  },  // PROJECTILE_ZOMBIE_PEA
    };
    static_assert(sizeof(kDrawParams) / sizeof(kDrawParams[0]) == (int)ProjectileType::NUM_PROJECTILES,
        "弹体贴图槽位须与 ProjectileType 枚举同步");
    Image* aImage = kDrawParams[mProjectileType].mImage ? *kDrawParams[mProjectileType].mImage : nullptr;
    float aScale = kDrawParams[mProjectileType].mScale;
    if (mProjectileType == ProjectileType::PROJECTILE_PUFF)
    {
        aScale = TodAnimateCurveFloat(0, 30, mProjectileAge, 0.3f, 1.0f, 0 /*Linear*/);
    }
    MixI(aImage ? aImage->id : -1);
    MixF(aScale);
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
    printf("bench10 kDrawParams | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
