// ImageVariationList 定长化对拍（2026-10-02 台账补测，用户指令"缺实测数据的补上"）
// 口径同库内其他 bench（MSVC x64 /O2，min-of-5）。
// 形态：TodList<ReanimCacheImageVariation>（32B 节点池：16B 值 + 双指针）vs
// ImageVariationTable（128×16B 定长 + mCount 线性查）。
// 场景：会话常驻 ≤10 条（模仿者+万寿莲变体）；每 pass = 一次按键 Find
//（末位命中=最坏）+ 一次未命中 + 一次 Dispose 走册删图。
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Clock = std::chrono::steady_clock;
static const int N_ITER = 2'000'000;
static volatile uint64_t gSink;

struct Variation { int32_t mSeed; int32_t mVariation; void* mImage; };  // 16B

// 链表形态（原）
struct Node { Variation mV; Node* mNext; Node* mPrev; };
static Node gNodePool[128];
static Node* gListHead;

// 定长形态（现）
static Variation gTable[128];
static int gTableCount;

__declspec(noinline) void DisposeImage(void*) {}

template <typename F>
static double Measure(F&& fn)
{
    double best = 1e9;
    for (int round = 0; round < 5; round++)
    {
        uint64_t acc = 0;
        auto t0 = Clock::now();
        for (int n = 0; n < N_ITER; n++)
            acc += fn();
        auto t1 = Clock::now();
        gSink ^= acc;
        best = std::min(best, std::chrono::duration<double, std::nano>(t1 - t0).count() / N_ITER);
    }
    return best;
}

static void Seed(int n)
{
    gListHead = nullptr;
    gTableCount = n;
    for (int i = 0; i < n; i++)
    {
        gNodePool[i].mV = { i * 3 + 1, i * 7 + 2, (void*)(size_t)(0x1000 + i) };
        gNodePool[i].mPrev = nullptr;
        gNodePool[i].mNext = gListHead;
        if (gListHead) gListHead->mPrev = &gNodePool[i];
        gListHead = &gNodePool[i];
        gTable[i] = gNodePool[i].mV;
    }
}

int main()
{
    for (int n : {2, 10})
    {
        Seed(n);
        const int hitSeed = (n - 1) * 3 + 1;   // 末位（链头最深=最坏命中）
        const int hitVar = (n - 1) * 7 + 2;

        // 全秩平均：每 pass 轮询全部键（Rank-0/最坏/平均一网打尽，口径公平）
        const double nsListAvg = Measure([&]{
            uint64_t acc = 0;
            for (int k = 0; k < n; k++)
            {
                const int seed = k * 3 + 1, var = k * 7 + 2;
                for (Node* p = gListHead; p; p = p->mNext)
                    if (p->mV.mSeed == seed && p->mV.mVariation == var)
                    { acc += (uint64_t)p->mV.mImage; break; }
            }
            return acc;
        }) / n;
        const double nsTableAvg = Measure([&]{
            uint64_t acc = 0;
            for (int k = 0; k < n; k++)
            {
                const int seed = k * 3 + 1, var = k * 7 + 2;
                for (int i = 0; i < gTableCount; i++)
                    if (gTable[i].mSeed == seed && gTable[i].mVariation == var)
                    { acc += (uint64_t)gTable[i].mImage; break; }
            }
            return acc;
        }) / n;
        const double nsListMiss = Measure([&]{
            for (Node* p = gListHead; p; p = p->mNext)
                if (p->mV.mSeed == -1 && p->mV.mVariation == -1)
                    return (uint64_t)p->mV.mImage;
            return (uint64_t)0;
        });
        const double nsTableMiss = Measure([&]{
            for (int i = 0; i < gTableCount; i++)
                if (gTable[i].mSeed == -1 && gTable[i].mVariation == -1)
                    return (uint64_t)gTable[i].mImage;
            return (uint64_t)0;
        });
        const double nsListWalk = Measure([&]{
            uint64_t acc = 0;
            for (Node* p = gListHead; p; p = p->mNext)
            { DisposeImage(p->mV.mImage); acc += (uint64_t)p->mV.mImage; }
            return acc;
        });
        const double nsTableWalk = Measure([&]{
            uint64_t acc = 0;
            for (int i = 0; i < gTableCount; i++)
            { DisposeImage(gTable[i].mImage); acc += (uint64_t)gTable[i].mImage; }
            return acc;
        });

        printf("image variation bench: N=%d, per-op:\n", n);
        printf("  find avg   list %6.2f ns / table %6.2f ns (%.0f%%)\n", nsListAvg, nsTableAvg, nsTableAvg / nsListAvg * 100);
        printf("  find miss  list %6.2f ns / table %6.2f ns (%.0f%%)\n", nsListMiss, nsTableMiss, nsTableMiss / nsListMiss * 100);
        printf("  walk+free  list %6.2f ns / table %6.2f ns (%.0f%%)\n", nsListWalk, nsTableWalk, nsTableWalk / nsListWalk * 100);
    }
    printf("sink=%llu\n", (unsigned long long)gSink);
    return 0;
}
