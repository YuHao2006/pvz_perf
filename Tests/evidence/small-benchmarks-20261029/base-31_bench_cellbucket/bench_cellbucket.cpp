// 植物格桶对拍：GetPlantsOnLawn 全池扫（原形态）vs 桶直读（新形态）。
// 桩：48 株植物均匀散布 9x6（每格至多 4 层），2M 次均匀格查询，QPC min-of-5 两遍。
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <random>
#include <windows.h>

constexpr int GX = 9, GY = 6, LAYERS = 4;

struct PlantStub
{
    int mSeedType;      // 0 普通 1 花盆 2 南瓜 3 飞行 4 玉米炮
    int mPlantCol, mRow;
    bool mNotOnGround;
    bool mIsImitaterWith;  // 模仿者解析位（false=不需要解析）
    bool mDead;
};
static PlantStub gPlants[1024];
static int gPlantCount = 0;

struct PlantsOnLawnStub
{
    PlantStub* mUnder; PlantStub* mPumpkin; PlantStub* mFlying; PlantStub* mNormal;
};

static PlantStub* gBucket[GY][GX][LAYERS];

static bool IsFlyingStub(int s) { return s == 3; }

static int ResolveType(const PlantStub* p)
{
    return p->mSeedType;  // 模仿者已预解析进 mSeedType（简化）
}

// FormA：1073 全池扫逐字形态（关键路径）
static void FormA_PoolScan(int x, int y, PlantsOnLawnStub* out)
{
    out->mUnder = out->mPumpkin = out->mFlying = out->mNormal = nullptr;
    PlantStub* p = nullptr;
    for (int i = 0; i < gPlantCount; i++)
    {
        p = &gPlants[i];
        int st = ResolveType(p);
        if (p->mRow != y) continue;
        if (st == 4) { if (p->mPlantCol < x - 1 || p->mPlantCol > x) continue; }
        else if (p->mPlantCol != x) continue;
        if (p->mNotOnGround) continue;
        if (IsFlyingStub(st)) out->mFlying = p;
        else if (st == 1) out->mUnder = p;
        else if (st == 2) out->mPumpkin = p;
        else out->mNormal = p;
    }
}

// FormB：桶直读（NotOnGround 读侧过滤 + 玉米炮双格注册的等价读）
static void FormB_Bucket(int x, int y, PlantsOnLawnStub* out)
{
    out->mUnder = out->mPumpkin = out->mFlying = out->mNormal = nullptr;
    PlantStub* const* cell = gBucket[y][x];
    for (int l = 0; l < LAYERS; l++)
    {
        PlantStub* p = cell[l];
        if (!p || p->mNotOnGround) continue;
        switch (l)
        {
        case 0: out->mUnder = p; break;
        case 2: out->mPumpkin = p; break;
        case 3: out->mFlying = p; break;
        default: out->mNormal = p; break;
        }
    }
}

static uint64_t Checksum(void (*fn)(int, int, PlantsOnLawnStub*), const int* xs, const int* ys, int n)
{
    uint64_t h = 1469598103934665603ull;
    PlantsOnLawnStub r;
    for (int i = 0; i < n; i++)
    {
        fn(xs[i], ys[i], &r);
        h = (h ^ (uint64_t)r.mUnder) * 1099511628211ull;
        h = (h ^ (uint64_t)r.mPumpkin) * 1099511628211ull;
        h = (h ^ (uint64_t)r.mFlying) * 1099511628211ull;
        h = (h ^ (uint64_t)r.mNormal) * 1099511628211ull;
    }
    return h;
}

static double gSink;
static double TimeIt(void (*fn)(int, int, PlantsOnLawnStub*), const int* xs, const int* ys, int n)
{
    LARGE_INTEGER f, a, b;
    QueryPerformanceFrequency(&f);
    double best = 1e30;
    PlantsOnLawnStub r;
    for (int rep = 0; rep < 5; rep++)
    {
        QueryPerformanceCounter(&a);
        double acc = 0.0;
        for (int i = 0; i < n; i++)
        {
            fn(xs[i], ys[i], &r);
            acc += double(uintptr_t(r.mUnder) + uintptr_t(r.mPumpkin) + uintptr_t(r.mFlying) + uintptr_t(r.mNormal));
        }
        QueryPerformanceCounter(&b);
        gSink += acc * 1e-300;  // 防整段消除（两项形态同付累加成本）
        double s = double(b.QuadPart - a.QuadPart) / f.QuadPart;
        if (s < best) best = s;
    }
    return best * 1e9 / n;
}

int main()
{
    // 48 株：42 普通（含 2 玉米炮双格）+ 花盆 2 + 南瓜 2 + 飞行 2，均匀散布
    std::mt19937 rng(20261003);
    auto taken = [](int c, int r, int l) { return gBucket[r][c][l] != nullptr; };
    auto place = [&](int type) {
        for (;;)
        {
            int c = rng() % GX, r = rng() % GY;
            int layer = type == 1 ? 0 : type == 2 ? 2 : type == 3 ? 3 : 1;
            if (type == 4)
            {
                // 游戏规则：玉米炮双格都必须空（CanPlantAt 语义）
                if (taken(c, r, 1) || c + 1 >= GX || taken(c + 1, r, 1)) continue;
            }
            else if (taken(c, r, layer)) continue;
            PlantStub* p = &gPlants[gPlantCount++];
            p->mSeedType = type; p->mPlantCol = c; p->mRow = r;
            p->mNotOnGround = false; p->mIsImitaterWith = false; p->mDead = false;
            gBucket[r][c][layer] = p;
            if (type == 4)
                gBucket[r][c + 1][1] = p;  // 玉米炮双格
            return;
        }
    };
    for (int i = 0; i < 40; i++) place(0);
    for (int i = 0; i < 2; i++) place(4);
    for (int i = 0; i < 2; i++) place(1);
    for (int i = 0; i < 2; i++) place(2);
    for (int i = 0; i < 2; i++) place(3);

    constexpr int N = 2'000'000;
    static int xs[N], ys[N];
    for (int i = 0; i < N; i++) { xs[i] = rng() % GX; ys[i] = rng() % GY; }

    uint64_t ca = Checksum(FormA_PoolScan, xs, ys, N);
    uint64_t cb = Checksum(FormB_Bucket, xs, ys, N);
    if (ca != cb) { printf("CHECKSUM MISMATCH %llu vs %llu\n", ca, cb); return 1; }
    printf("checksum=OK(%llu)  plants=%d\n", ca, gPlantCount);
    printf("pool-scan: %.2f ns  bucket: %.2f ns\n", TimeIt(FormA_PoolScan, xs, ys, N), TimeIt(FormB_Bucket, xs, ys, N));
    return 0;
}
