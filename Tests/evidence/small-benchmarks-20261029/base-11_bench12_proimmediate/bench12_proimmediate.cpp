// bench12_proimmediate - 目标12+13（合并）: Projectile::Update 直飞判定 10 连 OR 链 -> kImmediateRender[14] static bool 表
// 注：仓库无 "kDynamics" 表——git log -S 全史无此名；fdab0487 引入的"Update 直飞判定"
// 表即 kImmediateRender（账本 -74% 行），任务清单 #12/#13 实为同一张表，本基准即其 static 复测。
// FormA = fdab0487^ 原链逐字（10 连 OR）；FormB = 当前 HEAD（static bool 表）逐字。
#include "bench_common.h"

enum ProjectileType
{
    PROJECTILE_PEA = 0, PROJECTILE_SNOWPEA, PROJECTILE_CABBAGE, PROJECTILE_MELON,
    PROJECTILE_PUFF, PROJECTILE_WINTERMELON, PROJECTILE_FIREBALL, PROJECTILE_STAR,
    PROJECTILE_SPIKE, PROJECTILE_BASKETBALL, PROJECTILE_KERNEL, PROJECTILE_COBBIG,
    PROJECTILE_BUTTER, PROJECTILE_ZOMBIE_PEA, NUM_PROJECTILES
};

static int MakeRenderOrderStub(int layer, int row, int z)
{
    Mix(0x7111u); MixI(layer); MixI(row); MixI(z);
    return (layer << 12) + (row << 4) + z;
}

// ---------------- FormA：原 10 连 OR 链（fdab0487^ 逐字，计时分派区） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    ProjectileType mProjectileType = (ProjectileType)(inp % (uint32_t)NUM_PROJECTILES);
    int mProjectileAge = (int)((inp >> 8) & 0xFF) + 1;
    int mRow = (int)((inp >> 16) & 7);
    int mRenderOrder = 0;
    int mClickBackoffCounter = 0;
    float mRotation = BitsToF(inp, 0), mRotationSpeed = BitsToF(inp, 4) * 0.01f;

    int aTime = 20;
    if (mProjectileType == ProjectileType::PROJECTILE_PEA ||
        mProjectileType == ProjectileType::PROJECTILE_SNOWPEA ||
        mProjectileType == ProjectileType::PROJECTILE_CABBAGE ||
        mProjectileType == ProjectileType::PROJECTILE_MELON ||
        mProjectileType == ProjectileType::PROJECTILE_WINTERMELON ||
        mProjectileType == ProjectileType::PROJECTILE_KERNEL ||
        mProjectileType == ProjectileType::PROJECTILE_BUTTER ||
        mProjectileType == ProjectileType::PROJECTILE_COBBIG ||
        mProjectileType == ProjectileType::PROJECTILE_ZOMBIE_PEA ||
        mProjectileType == ProjectileType::PROJECTILE_SPIKE)
    {
        aTime = 0;
    }
    if (mProjectileAge > aTime)
    {
        mRenderOrder = MakeRenderOrderStub(4 /*RENDER_LAYER_PROJECTILE*/, mRow, 0);
    }

    if (mClickBackoffCounter > 0)
    {
        mClickBackoffCounter--;
    }
    mRotation += mRotationSpeed;

    MixI(aTime); MixI(mRenderOrder); MixF(mRotation);
}

// ---------------- FormB：当前 HEAD（static bool 表逐字，计时分派区） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    ProjectileType mProjectileType = (ProjectileType)(inp % (uint32_t)NUM_PROJECTILES);
    int mProjectileAge = (int)((inp >> 8) & 0xFF) + 1;
    int mRow = (int)((inp >> 16) & 7);
    int mRenderOrder = 0;
    int mClickBackoffCounter = 0;
    float mRotation = BitsToF(inp, 0), mRotationSpeed = BitsToF(inp, 4) * 0.01f;

    static constexpr bool kImmediateRender[] = {
        true,   // PROJECTILE_PEA
        true,   // PROJECTILE_SNOWPEA
        true,   // PROJECTILE_CABBAGE
        true,   // PROJECTILE_MELON
        false,  // PROJECTILE_PUFF
        true,   // PROJECTILE_WINTERMELON
        false,  // PROJECTILE_FIREBALL
        false,  // PROJECTILE_STAR
        true,   // PROJECTILE_SPIKE
        false,  // PROJECTILE_BASKETBALL
        true,   // PROJECTILE_KERNEL
        true,   // PROJECTILE_COBBIG
        true,   // PROJECTILE_BUTTER
        true,   // PROJECTILE_ZOMBIE_PEA
    };
    static_assert(sizeof(kImmediateRender) / sizeof(kImmediateRender[0]) == (int)ProjectileType::NUM_PROJECTILES,
        "直飞槽位须与 ProjectileType 枚举同步");
    int aTime = kImmediateRender[mProjectileType] ? 0 : 20;
    if (mProjectileAge > aTime)
    {
        mRenderOrder = MakeRenderOrderStub(4 /*RENDER_LAYER_PROJECTILE*/, mRow, 0);
    }

    if (mClickBackoffCounter > 0)
    {
        mClickBackoffCounter--;
    }
    mRotation += mRotationSpeed;

    MixI(aTime); MixI(mRenderOrder); MixF(mRotation);
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
    printf("bench12 kImmediateRender | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
