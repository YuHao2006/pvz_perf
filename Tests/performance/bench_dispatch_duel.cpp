// 段表化对拍重测（2026-10-07，用户指令"之前对拍输了的段表重测，全部放
// LPE14 基频核上跑"）：
//   场景 A —— Zombie.cpp:3389 UpdateZombieBackupDancer 的 aDancerPhase
//   switch 保留案（2026-10-03 对拍：96 槽表对 94% 落空槽 +25~28% 回归，
//   当时判"MSVC 已编成跳转表，落空相位白付间接调用"）。本次在 LPE14
//   恒频独占核上重测三形态：原版 switch（编译器自选）/ 96 槽稀疏 fn-ptr
//   表（nullptr=落空）/ 96 槽满表（落空也调空函数，分离 null 判成本）。
//   场景 B —— 本轮 DrawBossPart 5 支函数指针表 vs 原 5 case switch。
// 口径与 perf-fix-ledger 既定基准一致：MSVC x64 /O2，N=2M，min-of-5，
// ns/op。值域锚：ZombiePhase 共 96 值，dancer 分发值域 44..49 连续
// （ConstEnums.h 序，static_assert 拒编防漂移）。
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#define NOMINMAX 1
#include <windows.h>

using Clock = std::chrono::steady_clock;

static const int N_ITER = 2'000'000;
static const int POOL = 4096;
static volatile uint64_t gSink;

// ── 值域锚（本地复刻，防头拖拽；错值则拒编）──
static const int kPhaseNormal = 0;
static const int kPhaseDancingLeft = 44;
static const int kPhaseWalkToRaise = 45;
static const int kPhaseRaiseL1 = 46;
static const int kPhaseRaiseR1 = 47;
static const int kPhaseRaiseL2 = 48;
static const int kPhaseRaiseR2 = 49;
static_assert(kPhaseRaiseR2 - kPhaseDancingLeft == 5, "dancer 分发值域 44..49 须连续");

// 场景负载池：94% 落空（低值相位为主，模拟伴舞绝大部分时间 NORMAL/
// EATING/DYING 等非 dancer 独占相位）+ 6% 命中 44..49。i%16==0 命中。
static int gPhases[POOL];
static void InitPhases()
{
    for (int i = 0; i < POOL; i++)
    {
        if (i % 16 == 0)
            gPhases[i] = kPhaseDancingLeft + (i / 16) % 6;
        else
            gPhases[i] = kPhaseNormal + (i % 37);  // 落空相位散布 0..36
    }
}

// ── case 体/槽体同构 sink（单层 noinline；switch case 体与表槽体都直调，
// 无包装层差——PhaseWalk 双层税教训 2026-10-07）──
__declspec(noinline) void SinkWalk() { gSink = gSink * 3 + 1u; }
__declspec(noinline) void SinkRaise() { gSink = gSink * 5 + 2u; }
__declspec(noinline) void SinkNop() {}

struct DispatchState { int mX; };
__declspec(noinline) void PhaseSlotNop(DispatchState*, int) {}  // 空槽体（真 DancerDefault 同构）

// A1：原版形态（Zombie.cpp:3389 逐字同构：6 case 两段共体 + default 空）
__declspec(noinline) void KernelSwitch(const int* phases, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const int aDancerPhase = phases[i & 4095];
        switch (aDancerPhase)
        {
        case kPhaseDancingLeft:
            st->mX = aDancerPhase;
            SinkWalk();
            break;
        case kPhaseWalkToRaise:
            st->mX = aDancerPhase;
            SinkRaise();
            break;
        case kPhaseRaiseL1:
        case kPhaseRaiseR1:
        case kPhaseRaiseL2:
        case kPhaseRaiseR2:
            st->mX = aDancerPhase;
            SinkRaise();
            break;
        default:
            break;
        }
    }
}

// A2：96 槽稀疏 fn-ptr 表（44..49 有函数，其余 nullptr；越界守卫同款）
using PhaseFn = void (*)(DispatchState*, int);
// 表槽体：lambda 直含完整 case 体（st 赋值 + 单层 sink）——与 switch
// case 体逐字同构，无包装层
static void PhaseWalk(DispatchState* st, int p) { st->mX = p; SinkWalk(); }
static void PhaseRaise(DispatchState* st, int p) { st->mX = p; SinkRaise(); }
static const PhaseFn kPhaseTable96[96] = {
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 0-7
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 8-15
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 16-23
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 24-31
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 32-39
    nullptr, nullptr, nullptr, nullptr, PhaseWalk, PhaseRaise,               // 40-45
    PhaseRaise, PhaseRaise, PhaseRaise, PhaseRaise,                           // 46-49
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 50-57
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 58-65
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 66-73
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 74-81
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 82-89
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,                     // 90-95
};
__declspec(noinline) void KernelTable96Sparse(const int* phases, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const unsigned p = (unsigned)phases[i & 4095];
        if (p < 96)
        {
            if (PhaseFn fn = kPhaseTable96[p])
                fn(st, (int)p);
        }
    }
}

// A3：96 槽满表（落空槽指向空函数——分离 nullptr 判与间接调用成本）
static const PhaseFn kPhaseTable96Full[96] = {
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 0-7
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 8-15
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 16-23
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 24-31
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 32-39
    nullptr, nullptr, nullptr, nullptr, PhaseWalk, PhaseRaise,               // 40-45
    PhaseRaise, PhaseRaise, PhaseRaise, PhaseRaise,                           // 46-49
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 50-57
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 58-65
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 66-73
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 74-81
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,  // 82-89
    nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,                     // 90-95
};
// 满表：把落空槽填 BodyNop 会在初始化处冗长——改为运行前一次性填充
static PhaseFn kPhaseTable96Filled[96];
__declspec(noinline) void KernelTable96Filled(const int* phases, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const unsigned p = (unsigned)phases[i & 4095];
        if (p < 96)
            kPhaseTable96Filled[p](st, (int)p);
    }
}

// ── 场景 B：DrawBossPart（本轮改动，均匀 0..4）──
static int gParts[POOL];
__declspec(noinline) void SinkDrawReanim() { gSink = gSink * 7 + 3u; }
__declspec(noinline) void SinkDrawArm() { gSink = gSink * 11 + 4u; }
__declspec(noinline) void SinkDrawFireball() { gSink = gSink * 13 + 5u; }

// B1：原版形态（5 case + default 空）
__declspec(noinline) void KernelSwitch5(const int* parts, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        switch (parts[i & 4095])
        {
        case 0: SinkDrawReanim(); break;
        case 1: SinkDrawReanim(); break;
        case 2: SinkDrawReanim(); break;
        case 3: SinkDrawArm(); break;
        case 4: SinkDrawFireball(); break;
        default: break;
        }
    }
}

// B2：本轮形态（5 槽 lambda fn-ptr 表 + 越界守卫）
using PartFn = void (*)(DispatchState*);
static const PartFn kPartTable[5] = {
    [](DispatchState* st) { SinkDrawReanim(); },
    [](DispatchState* st) { SinkDrawReanim(); },
    [](DispatchState* st) { SinkDrawReanim(); },
    [](DispatchState* st) { SinkDrawArm(); },
    [](DispatchState* st) { SinkDrawFireball(); },
};
__declspec(noinline) void KernelTable5(const int* parts, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const unsigned p = (unsigned)parts[i & 4095];
        if (p < 5)
            kPartTable[p](st);
    }
}

// ── 场景 C：UpdateZombieDancer 赢案复核（表化时判净赚 19%）──
// 舞王本尊负载：命中主导（~90% 相位落在 dancer 域稀疏 case 集
// {40,41,44..49,50}），原 switch 值域分散 MSVC 编成比较级联。
static int gDancerHeavy[POOL];
static const int kDancerCaseSet[] = { 40, 41, 44, 45, 46, 47, 48, 49, 50 };
static void InitDancerHeavy()
{
    for (int i = 0; i < POOL; i++)
    {
        if (i % 10 != 9)  // 90% 命中 dancer 域
            gDancerHeavy[i] = kDancerCaseSet[i % 9];
        else              // 10% 落空（普通相位）
            gDancerHeavy[i] = kPhaseNormal + (i % 37);
    }
}

// C1：原版形态（稀疏 case 集：40,41,44..49,50 —— 值域分散，MSVC 比较级联）
__declspec(noinline) void KernelCascade(const int* phases, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const int aDancerPhase = phases[i & 4095];
        switch (aDancerPhase)
        {
        case 40:
        case 41:
            st->mX = aDancerPhase;
            SinkWalk();
            break;
        case kPhaseDancingLeft:
            st->mX = aDancerPhase;
            SinkWalk();
            break;
        case kPhaseWalkToRaise:
            st->mX = aDancerPhase;
            SinkRaise();
            break;
        case kPhaseRaiseL1:
        case kPhaseRaiseR1:
        case kPhaseRaiseL2:
        case kPhaseRaiseR2:
            st->mX = aDancerPhase;
            SinkRaise();
            break;
        case 50:
            st->mX = aDancerPhase;
            SinkRaise();
            break;
        default:
            break;
        }
    }
}

// C2：现行形态（kDancerPhaseCases 同构 96 槽满表，无 null 判）
static PhaseFn kDancerFull96[96];
__declspec(noinline) void KernelDancerFull96(const int* phases, int n, DispatchState* st)
{
    for (int i = 0; i < n; i++)
    {
        const unsigned p = (unsigned)phases[i & 4095];
        if (p < 96)
            kDancerFull96[p](st, (int)p);
    }
}

template <typename F>
static double Measure(F&& fn)
{
    double best = 1e9;
    for (int round = 0; round < 5; round++)
    {
        auto t0 = Clock::now();
        fn();
        double ns = std::chrono::duration<double, std::nano>(Clock::now() - t0).count();
        best = std::min(best, ns);
    }
    return best / N_ITER;
}

int main()
{
    // 自锁 LP14（LPE 岛，掩码 0x4000）：恒频独占核口径（run-on-lpe.cmd
    // 同环境契约；启动器不传 affinity 时也保证锁定）。
    SetProcessAffinityMask(GetCurrentProcess(), 0x4000);
    InitPhases();
    for (int i = 0; i < POOL; i++)
        gParts[i] = i % 5;
    for (int i = 0; i < 96; i++)
        kPhaseTable96Filled[i] = (i >= kPhaseDancingLeft && i <= kPhaseRaiseR2)
        ? ((i == kPhaseDancingLeft) ? PhaseWalk : PhaseRaise)
        : &PhaseSlotNop;
    InitDancerHeavy();
    for (int i = 0; i < 96; i++)
        kDancerFull96[i] = (i >= 40 && i <= 50 && i != 42 && i != 43)
        ? ((i == kPhaseDancingLeft || i <= 41) ? PhaseWalk : PhaseRaise)
        : &PhaseSlotNop;

    DispatchState st = { 1 };
    const int* ph = gPhases;
    const int* pr = gParts;
    DispatchState* pst = &st;

    printf("== A. aDancerPhase 败案重测（负载：94%% 落空 / 6%% 命中 44..49，N=%d）==\n", N_ITER);
    printf("A1 原版 switch（编译器自选）      : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelSwitch(ph, N_ITER, pst); }), (unsigned long long)gSink);
    printf("A2 96 槽稀疏 fn-ptr 表（null 判） : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelTable96Sparse(ph, N_ITER, pst); }), (unsigned long long)gSink);
    printf("A3 96 槽满表（落空也调空函数）    : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelTable96Filled(ph, N_ITER, pst); }), (unsigned long long)gSink);
    printf("== B. DrawBossPart 本轮改动（负载：均匀 0..4，N=%d）==\n", N_ITER);
    printf("B1 原 5 case switch              : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelSwitch5(pr, N_ITER, pst); }), (unsigned long long)gSink);
    printf("B2 5 槽 lambda fn-ptr 表（本轮）  : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelTable5(pr, N_ITER, pst); }), (unsigned long long)gSink);
    const int* dh = gDancerHeavy;
    printf("== C. UpdateZombieDancer 赢案复核（负载：90%% 命中稀疏 case 集，N=%d）==\n", N_ITER);
    printf("C1 原 switch（值域分散=比较级联） : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelCascade(dh, N_ITER, pst); }), (unsigned long long)gSink);
    printf("C2 96 槽满表（kDancerPhaseCases）  : %6.2f ns/op  sink=%llu\n",
        Measure([&] { KernelDancerFull96(dh, N_ITER, pst); }), (unsigned long long)gSink);
    return 0;
}
