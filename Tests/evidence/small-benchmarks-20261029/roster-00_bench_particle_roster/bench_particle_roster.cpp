// 粒子名册微基准（2026-10-04 P3 第二步）：链表名册 vs 紧凑槽位侧表
// 全 pass 成本对比。口径同 bench_zombie_rowscan（MSVC x64 /O2，min-of-5）。
// 场景：60 发射器 × 15 粒子 = 900 活粒子（= 软阈值 MAX_PARTICLES_SIZE
// 上限，典型场景 100~600、重压贴 900）。每 pass = 全发射器粒子名册走
// 一遍 + 每粒子摸 160B 池槽一次（更新/绘制两 pass 的单 pass 形态）。
// ── 2026-10-04 追加两节（UpdateParticle 优化对拍）──
// 更新形态：每粒每帧 1 次时间值求取（除 vs 倒数乘）+ 2 条常值轨求值
//（间接调用 vs low==high 快路）+ 3 条未设轨求值（count==0 早退，两版同）。
// churn 删除形态：每发射器每帧死 1 粒（FIFO 最低位端，带散布取 idx=e%4
// 模拟持续期随机造成的非零死位）+ 尾补 1 粒；老路 = Find 槽位线性探测 +
// memmove，新路 = 下标直传 + memmove。
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstring>

using Clock = std::chrono::steady_clock;
static const int N_ITER = 200'000;
static const int EMITTERS = 60;
static const int PARTICLES_PER = 15;
static const int TOTAL = EMITTERS * PARTICLES_PER;  // 900

struct Particle { char mPad[152]; int mParticleAge; };  // 160B/槽近似
static Particle gParticlePool[1024];

// 链表形态（原）：24B 节点（4B ID+padding+双指针），共享节点池
struct Node { uint32_t mID; uint32_t mPad; Node* mNext; Node* mPrev; };
static Node gNodePool[1024];

// 侧表形态（新）：uint16 槽位数组/发射器
static uint16_t gRosters[EMITTERS][PARTICLES_PER];
static Node* gHeads[EMITTERS];

static volatile uint64_t gSink;

// ── 更新形态物料 ──
// 分布曲线模拟（=Curves::Linear 形态；经 volatile 表取，防编译器直调内联）
static float DistLinear(float t, float a, float b) { return a + (b - a) * t; }
using DistFn = float (*)(float, float, float);
static DistFn gDistTable[2] = { &DistLinear, &DistLinear };
static DistFn volatile gDistChoice = &DistLinear;

struct TrackNode { float mTime, mLow, mHigh; DistFn mDist; };
struct Track { TrackNode* mNodes; int mCount; };
// 典型 def 画像：2 条已设常值轨（如摩擦场 x/y）+ 3 条未设轨（自旋速/角/动画率）
static TrackNode gConstNodes[2] = { {0.f, 5.f, 5.f, nullptr}, {0.f, 5.f, 5.f, nullptr} };
static Track gConstTracks[2] = { {&gConstNodes[0], 1}, {&gConstNodes[1], 1} };
static Track gUnsetTrack = { nullptr, 0 };

static float EvalTrackOld(const Track& tr, float t, float interp)
{
    if (tr.mCount == 0) return 0.0f;
    if (t < tr.mNodes[0].mTime)
        return tr.mNodes[0].mDist(interp, tr.mNodes[0].mLow, tr.mNodes[0].mHigh);
    if (tr.mCount > 1)  // 多节点分支本画像不命中，保形不展开
        return tr.mNodes[tr.mCount - 1].mDist(interp, tr.mNodes[tr.mCount - 1].mLow, tr.mNodes[tr.mCount - 1].mHigh);
    return tr.mNodes[tr.mCount - 1].mDist(interp, tr.mNodes[tr.mCount - 1].mLow, tr.mNodes[tr.mCount - 1].mHigh);
}
static float EvalTrackNew(const Track& tr, float t, float interp)
{
    if (tr.mCount == 0) return 0.0f;
    if (tr.mCount == 1 && tr.mNodes[0].mLow == tr.mNodes[0].mHigh)  // 常值轨快路
        return tr.mNodes[0].mLow;
    return EvalTrackOld(tr, t, interp);
}

// ── churn 删除形态物料 ──
static uint16_t gChurnRosters[EMITTERS][PARTICLES_PER];
static int gChurnCounts[EMITTERS];

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

// 老路删除：Find 槽位线性探测（uint16 比对）+ memmove（=P3 改造后、
// 下标化前形态）；victim 槽位经池指针差取（与真实现同构）
static inline void DeleteOld(int e, uint16_t victimSlot)
{
    uint16_t* slots = gChurnRosters[e];
    int& count = gChurnCounts[e];
    int idx = 0;
    while (idx < count && slots[idx] != victimSlot) idx++;
    if (idx < count)
    {
        std::memmove(&slots[idx], &slots[idx + 1], (count - idx - 1) * sizeof(uint16_t));
        count--;
    }
}
// 新路删除：下标直传（更新循环已知 idx）+ memmove
static inline void DeleteNew(int e, int idx)
{
    uint16_t* slots = gChurnRosters[e];
    int& count = gChurnCounts[e];
    if ((unsigned)idx < (unsigned)count)
    {
        std::memmove(&slots[idx], &slots[idx + 1], (count - idx - 1) * sizeof(uint16_t));
        count--;
    }
}

// ── 环形+凋零侧表形态（2026-10-02 用户提案对拍）──
// 机制：环形数组存槽位，平行 bool 标凋零；删除=标凋零+首尾惰性推进
//（首部被标→head++ 跳过连续凋零；尾前一位被标→tail-- 回缩）；
// 中段凋零留待首部推进时回收。保序 O(1) 删除，代价=迭代逐项跳凋零。
constexpr int RING_CAP = PARTICLES_PER * 2;  // 30：15 活 + 凋零暂存余量
static uint16_t gRingSlots[EMITTERS][RING_CAP];
static uint8_t gRingTombs[EMITTERS][RING_CAP];
static int gRingHead[EMITTERS], gRingTail[EMITTERS];

static inline int RingPrev(int i) { return i == 0 ? RING_CAP - 1 : i - 1; }
static inline int RingNext(int i) { return i == RING_CAP - 1 ? 0 : i + 1; }

static void RingSeed()
{
    for (int e = 0; e < EMITTERS; e++)
    {
        gRingHead[e] = e % 7;  // 错开首相位，让回绕路径都出现
        int i = gRingHead[e];
        for (int k = 0; k < PARTICLES_PER; k++)
        {
            gRingSlots[e][i] = (uint16_t)(e * PARTICLES_PER + k);
            gRingTombs[e][i] = 0;
            i = RingNext(i);
        }
        gRingTail[e] = i;
    }
}
static int RingCountFlagged(int e, bool wantTomb)
{
    int n = 0;
    int i = gRingHead[e];
    while (i != gRingTail[e])
    {
        if ((gRingTombs[e][i] != 0) == wantTomb) n++;
        i = RingNext(i);
    }
    return n;
}
// 删除：标凋零 + 首尾推进（用户提案机制原文）
static inline void RingDeleteAt(int e, int idx)
{
    gRingTombs[e][idx] = 1;
    if (idx == gRingHead[e])
        while (gRingHead[e] != gRingTail[e] && gRingTombs[e][gRingHead[e]])
            gRingHead[e] = RingNext(gRingHead[e]);
    if (idx == RingPrev(gRingTail[e]))
        while (gRingHead[e] != gRingTail[e] && gRingTombs[e][RingPrev(gRingTail[e])])
            gRingTail[e] = RingPrev(gRingTail[e]);
}
// 出生：尾入（容量按环占用计，含凋零——凋零密度高时提前拒生）
static inline bool RingAdd(int e, uint16_t slot)
{
    if (RingNext(gRingTail[e]) == gRingHead[e]) return false;
    gRingSlots[e][gRingTail[e]] = slot;
    gRingTombs[e][gRingTail[e]] = 0;
    gRingTail[e] = RingNext(gRingTail[e]);
    return true;
}
// 走册（倒序=新→旧；条件回绕 + 凋零跳过）——与 gRosters 稠密走册对拍
static uint64_t RingWalk()
{
    uint64_t hit = 0;
    for (int e = 0; e < EMITTERS; e++)
    {
        int i = gRingTail[e];
        while (i != gRingHead[e])
        {
            i = RingPrev(i);
            if (!gRingTombs[e][i])
                hit += (uint64_t)gParticlePool[gRingSlots[e][i]].mParticleAge;
        }
    }
    return hit;
}
// churn：FIFO 主导死亡（60% 首位、20% 次位、20% 中段第 8 位）+ 尾生 1
static uint64_t RingChurn()
{
    for (int e = 0; e < EMITTERS; e++)
    {
        int rel = (e % 5 == 4) ? 8 : (e % 5) % 2;
        int idx = gRingHead[e];
        while (rel--) idx = RingNext(idx);
        uint16_t victim = gRingSlots[e][idx];
        RingDeleteAt(e, idx);
        RingAdd(e, (uint16_t)((victim + 1) & 1023));
    }
    return 0;
}

int main()
{
    // 曲线指针运行期自 volatile 表填入（编译器不可见目标，防直调内联）
    for (auto& n : gConstNodes)
        n.mDist = gDistChoice;

    // 布防：900 粒占槽 0..899；每发射器 15 连号节点（节点池顺序段=
    // 链表的乐观下界，实际回收后散布更差）；链 mNext 顺接、头插序一致
    for (int i = 0; i < TOTAL; i++)
    {
        gNodePool[i].mID = (uint32_t)i;
        gNodePool[i].mNext = (i + 1 < TOTAL) ? &gNodePool[i + 1] : nullptr;
        gParticlePool[i].mParticleAge = i;
    }
    for (int e = 0; e < EMITTERS; e++)
    {
        gHeads[e] = &gNodePool[e * PARTICLES_PER];
        for (int i = 0; i < PARTICLES_PER; i++)
            gRosters[e][i] = (uint16_t)(e * PARTICLES_PER + i);
    }

    const double nsLinked = Measure([&]{
        uint64_t hit = 0;
        for (int e = 0; e < EMITTERS; e++)
            for (Node* n = gHeads[e]; n != nullptr; n = n->mNext)
                hit += (uint64_t)gParticlePool[n->mID & 0xFFFF].mParticleAge;
        return hit;
    });

    const double nsRoster = Measure([&]{
        uint64_t hit = 0;
        for (int e = 0; e < EMITTERS; e++)
            for (int i = 0; i < PARTICLES_PER; i++)
                hit += (uint64_t)gParticlePool[gRosters[e][i]].mParticleAge;
        return hit;
    });

    // 更新形态：除 vs 倒数乘（每粒 1 次），interp 取静态值防随机数成本混入
    const double nsUpdDiv = Measure([&]{
        float acc = 0.f;
        for (int i = 0; i < TOTAL; i++)
        {
            int age = gParticlePool[i].mParticleAge & 63;
            int dur = 64;
            acc += age / ((float)dur - 1);
        }
        return (uint64_t)acc;
    });
    const double nsUpdMul = Measure([&]{
        float acc = 0.f;
        const float inv = 1.0f / (64 - 1);
        for (int i = 0; i < TOTAL; i++)
        {
            int age = gParticlePool[i].mParticleAge & 63;
            acc += age * inv;
        }
        return (uint64_t)acc;
    });

    // 更新形态：常值轨×2 + 未设轨×3，间接调用 vs 快路
    const double nsUpdEvalOld = Measure([&]{
        float acc = 0.f;
        for (int i = 0; i < TOTAL; i++)
        {
            float t = (float)(gParticlePool[i].mParticleAge & 63) * (1.0f / 63);
            for (int k = 0; k < 2; k++)
                acc += EvalTrackOld(gConstTracks[k], t, 0.5f);
            for (int k = 0; k < 3; k++)
                acc += EvalTrackOld(gUnsetTrack, t, 0.5f);
        }
        return (uint64_t)acc;
    });
    const double nsUpdEvalNew = Measure([&]{
        float acc = 0.f;
        for (int i = 0; i < TOTAL; i++)
        {
            float t = (float)(gParticlePool[i].mParticleAge & 63) * (1.0f / 63);
            for (int k = 0; k < 2; k++)
                acc += EvalTrackNew(gConstTracks[k], t, 0.5f);
            for (int k = 0; k < 3; k++)
                acc += EvalTrackNew(gUnsetTrack, t, 0.5f);
        }
        return (uint64_t)acc;
    });

    // churn 删除形态：每发射器每 pass 死 1 + 生 1（稳态）；死位 idx=e%4
    //（FIFO 低端 + 持续期随机散布），900 粒世界
    auto churnSeed = [&]{
        for (int e = 0; e < EMITTERS; e++)
        {
            gChurnCounts[e] = PARTICLES_PER;
            for (int i = 0; i < PARTICLES_PER; i++)
                gChurnRosters[e][i] = (uint16_t)(e * PARTICLES_PER + i);
        }
    };
    churnSeed();
    const double nsChurnOld = Measure([&]{
        for (int e = 0; e < EMITTERS; e++)
        {
            int idx = e & 3;
            uint16_t victim = gChurnRosters[e][idx];
            DeleteOld(e, victim);                       // Find 探测 + memmove
            gChurnRosters[e][gChurnCounts[e]++] = (uint16_t)((victim + 1) & 1023);  // 尾补
        }
        return (uint64_t)gChurnCounts[0];
    });
    churnSeed();
    const double nsChurnNew = Measure([&]{
        for (int e = 0; e < EMITTERS; e++)
        {
            int idx = e & 3;
            uint16_t victim = gChurnRosters[e][idx];
            DeleteNew(e, idx);                          // 下标直传 + memmove
            gChurnRosters[e][gChurnCounts[e]++] = (uint16_t)((victim + 1) & 1023);
        }
        return (uint64_t)gChurnCounts[0];
    });

    // 环形+凋零形态：先 churn 收敛至稳态凋零密度，再测走册（只读）、churn
    RingSeed();
    for (int n = 0; n < 20000; n++) RingChurn();  // 收敛
    int aTombs = 0, aLive = 0;
    for (int e = 0; e < EMITTERS; e++)
    {
        aTombs += RingCountFlagged(e, true);
        aLive += RingCountFlagged(e, false);
    }
    const double nsRingWalk = Measure(RingWalk);
    const double nsRingChurn = Measure(RingChurn);

    printf("particle roster bench: %d emitters x %d particles = %d total, per-pass:\n",
        EMITTERS, PARTICLES_PER, TOTAL);
    printf("  linked (node->id->slot) : %7.1f ns/pass\n", nsLinked);
    printf("  roster (u16->slot)       : %7.1f ns/pass  (%.0f%%)\n",
        nsRoster, nsRoster / nsLinked * 100.0);
    printf("update shape (per pass, %d particles):\n", TOTAL);
    printf("  timevalue div            : %7.1f ns/pass\n", nsUpdDiv);
    printf("  timevalue mul (recip)    : %7.1f ns/pass  (%.0f%%)\n",
        nsUpdMul, nsUpdMul / nsUpdDiv * 100.0);
    printf("  2 const + 3 unset tracks : old %7.1f  new %7.1f ns/pass  (%.0f%%)\n",
        nsUpdEvalOld, nsUpdEvalNew, nsUpdEvalNew / nsUpdEvalOld * 100.0);
    printf("churn delete (1 death/emitter/pass):\n");
    printf("  Find-scan + memmove      : %7.1f ns/pass\n", nsChurnOld);
    printf("  index-pass + memmove     : %7.1f ns/pass  (%.0f%%)\n",
        nsChurnNew, nsChurnNew / nsChurnOld * 100.0);
    printf("ring+tombstone (user proposal; steady %d live + %d tombs = %.0f%% tomb density):\n",
        aLive, aTombs, aTombs * 100.0 / (aLive + aTombs));
    printf("  walk (rev + tomb skip)   : %7.1f ns/pass vs dense %7.1f (%.0f%%)\n",
        nsRingWalk, nsRoster, nsRingWalk / nsRoster * 100.0);
    printf("  churn (tomb + head/tail) : %7.1f ns/pass vs memmove %7.1f (%.0f%%)\n",
        nsRingChurn, nsChurnNew, nsRingChurn / nsChurnNew * 100.0);
    printf("sink=%llu\n", (unsigned long long)gSink);
    return 0;
}
