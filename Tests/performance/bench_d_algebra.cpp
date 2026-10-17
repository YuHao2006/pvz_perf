// D 算术类两项 LPE14 补测（2026-10-07 用户裁决"性能数据只保留 LPE 核，
// 缺失直接补测"——此两项当日定性为代数等价未重建，今按指令实测）：
//   ①常值轨快路：原状=每条已设常值轨一次间接调用（kCurveEvals fn-ptr）
//     vs 现状=单节点 low==high 直返（代数位精确等价）。
//   ②粒子时间值：原状=每粒每帧 age/(dur-1) 除法 vs 现状=倒数乘
//     （mParticleDurationInv）。
// 口径：cl /O2 x64、N=2M、min-of-5、自锁 LP14（掩码 0x4000）。
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#define NOMINMAX 1
#include <windows.h>

using Clock = std::chrono::steady_clock;
static const int N_ITER = 2'000'000;
static const int POOL = 4096;
static volatile float gSink;

// ── ①常值轨 ──
__declspec(noinline) float EvalConstantOld(float, float a, float) { return a; }
static float (*const kIndirectConst)(float, float, float) = &EvalConstantOld;

__declspec(noinline) float KernelConstIndirect(const int* idx, int n)
{
    float acc = 0.f;
    for (int i = 0; i < n; i++)
        acc += kIndirectConst(0.3f, 7.5f, 9.25f) + (float)(idx[i & 4095] & 1);
    return acc;
}
__declspec(noinline) float KernelConstDirect(const int* idx, int n)
{
    // 现状：low==high 单节点直返（求值器内联路径，无间接调用）
    float acc = 0.f;
    for (int i = 0; i < n; i++)
    {
        const float t = 0.3f, a = 7.5f, b = 9.25f;  // low==high 时结果=a
        acc += a + (float)(idx[i & 4095] & 1);
    }
    return acc;
}

// ── ②粒子时间值：除法 vs 倒数乘 ──
static int gAges[POOL];
static int gDurs[POOL];

__declspec(noinline) float KernelDiv(const int*, int n)
{
    float acc = 0.f;
    for (int i = 0; i < n; i++)
        acc += (float)gAges[i & 4095] / (float)(gDurs[i & 4095] - 1);
    return acc;
}
__declspec(noinline) float KernelInvMul(const int*, int n)
{
    // 现状：出生时算一次 1/(dur-1)（此处模拟摊销后的每帧成本），
    // 每帧 age×倒数。
    static float sInv[POOL];
    for (int i = 0; i < POOL; i++) sInv[i] = 1.0f / (float)(gDurs[i] - 1);  // 预计算一次性
    float acc = 0.f;
    for (int i = 0; i < n; i++)
        acc += (float)gAges[i & 4095] * sInv[i & 4095];
    return acc;
}

template <typename F>
static double Measure(F&& fn)
{
    double best = 1e9;
    for (int r = 0; r < 5; r++)
    {
        auto t0 = Clock::now();
        fn();
        best = std::min(best, std::chrono::duration<double, std::nano>(Clock::now() - t0).count());
    }
    return best / N_ITER;
}

int main()
{
    SetProcessAffinityMask(GetCurrentProcess(), 0x4000);
    for (int i = 0; i < POOL; i++) { gAges[i] = i % 997; gDurs[i] = 100 + (i % 900); }
    static int idx[POOL];
    for (int i = 0; i < POOL; i++) idx[i] = i;
    const int* pi = idx;
    printf("== D 算术两项 LPE14（N=%d，min-of-5）==\n", N_ITER);
    double a1 = Measure([&] { gSink = KernelConstIndirect(pi, N_ITER); });
    double a2 = Measure([&] { gSink = KernelConstDirect(pi, N_ITER); });
    printf("①常值轨  间接调用 %.2f ns | 单节点直返 %.2f ns | 提升 %+.1f%%\n", a1, a2, (a1 - a2) / a1 * 100);
    double b1 = Measure([&] { gSink = KernelDiv(pi, N_ITER); });
    double b2 = Measure([&] { gSink = KernelInvMul(pi, N_ITER); });
    printf("②粒子时间值  每帧除法 %.2f ns | 倒数乘 %.2f ns | 提升 %+.1f%%\n", b1, b2, (b1 - b2) / b1 * 100);
    return 0;
}
