// bench13_dynamics - 目标13: Projectile::Update 直飞判定 10 连 OR 链 -> static bool 表
// 命名查证：git log -S kDynamics -- Lawn/ 全史零命中，仓库无 "kDynamics" 表；
// fdab0487 引入的 "Update 直飞判定" 表在当前 HEAD 即 kImmediateRender（本行=账本 -74% 行）。
// 本基准与 bench12 为同一物理目标的独立复测（两轮进程），口径一致：
// FormA = fdab0487^ 原链逐字（10 连 OR，aTime=20 起始）；
// FormB = 当前 HEAD（static constexpr bool 表逐字）。
// 账本旧数（裸 constexpr 表时代，保守下限）：4.82 -> 1.24（-74%）。
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
    Mix(0x7113u); MixI(layer); MixI(row); MixI(z);
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
        true,   // PROJECTILE_PEA          豌豆
        true,   // PROJECTILE_SNOWPEA      冰豌豆
        true,   // PROJECTILE_CABBAGE      卷心菜
        true,   // PROJECTILE_MELON        西瓜
        false,  // PROJECTILE_PUFF         孢子
        true,   // PROJECTILE_WINTERMELON  冰瓜
        false,  // PROJECTILE_FIREBALL     火豌豆
        false,  // PROJECTILE_STAR         星星
        true,   // PROJECTILE_SPIKE        尖刺
        false,  // PROJECTILE_BASKETBALL   篮球
        true,   // PROJECTILE_KERNEL       玉米粒
        true,   // PROJECTILE_COBBIG       玉米加农炮
        true,   // PROJECTILE_BUTTER       黄油
        true,   // PROJECTILE_ZOMBIE_PEA   僵尸豌豆
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
    printf("bench13 kDynamics(=kImmediateRender 直飞判定) | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
