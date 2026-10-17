// 曲线分发表 LPE14 恒频复核（2026-10-07，用户指令"所有数据不是来自
// LPE 核的都重测"）：当时 P 核判 21.4→17.1ns（-20%）。两形态对拍：
// before = 原 switch 曲线分发（14 case）；after = 现行 kCurveEvals
// 函数指针表直下标。求值函数 noinline 模拟跨 TU（真实代码 Curves 族
// 定义于 TodCommon.cpp、消费者跨 TU 不可内联）。口径：cl /O2、N=2M、
// min-of-5、自锁 LP14（掩码 0x4000）。负载两形态：均匀 0..13 与
// 真实偏置（CONSTANT/LINEAR 主导——装载语料分布）。
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

// ── 求值核心（与 TodCommon.cpp Curves 族同构，noinline 模拟跨 TU）──
__declspec(noinline) float EvalConstant(float, float a, float) { return a; }
__declspec(noinline) float EvalLinear(float t, float a, float b) { return a + (b - a) * t; }
__declspec(noinline) float EvalQuad(float t, float a, float b) { return a + (b - a) * t * t; }
__declspec(noinline) float EvalInvQuad(float t, float a, float b) { const float u = 1.0f - t; return a + (b - a) * (1.0f - u * u); }
__declspec(noinline) float EvalDoubleS(float t, float a, float b) { const float u = t * 2.0f - 1.0f; return a + (b - a) * 0.5f * (u * u * u - u) * -0.75f; }
__declspec(noinline) float EvalS(float t, float a, float b) { const float u = t * 2.0f - 1.0f; return a + (b - a) * 0.5f * (u * u * u - u) * -0.375f; }
__declspec(noinline) float EvalBounce(float t, float a, float b) { float u = t; if (u < 0.363636f) u *= 7.5625f * u * u; else if (u < 0.727272f) { u -= 0.545454f; u = 7.5625f * u * u + 0.75f; } else if (u < 0.909090f) { u -= 0.818181f; u = 7.5625f * u * u + 0.9375f; } else { u -= 0.954545f; u = 7.5625f * u * u + 0.984375f; } return a + (b - a) * u; }
__declspec(noinline) float EvalSinWave(float t, float a, float b) { return a + (b - a) * (0.5f - 0.5f * cosf(3.14159265f * t)); }

using CurveFn = float (*)(float, float, float);

// before：原 switch 曲线分发（case 体=调用求值函数，与原版同构）
__declspec(noinline) float KernelSwitch(int c, float t, float a, float b)
{
    switch (c)
    {
    case 0: case 8: return EvalConstant(t, a, b);
    case 1: return EvalLinear(t, a, b);
    case 2: return EvalQuad(t, a, b);
    case 3: return EvalInvQuad(t, a, b);
    case 4: return EvalDoubleS(t, a, b);
    case 5: return EvalS(t, a, b);
    case 6: return EvalQuad(t, a, b);
    case 7: return EvalS(t, a, b);
    case 9: case 10: case 11: return EvalBounce(t, a, b);
    case 12: case 13: return EvalSinWave(t, a, b);
    default: return a;
    }
}

// after：现行 kCurveEvals 直下标（TodCommon.cpp:361 同构）
static constexpr CurveFn kCurveEvals[14] = {
    EvalConstant, EvalLinear, EvalQuad, EvalInvQuad, EvalDoubleS, EvalS,
    EvalQuad, EvalS, EvalConstant, EvalBounce, EvalBounce, EvalBounce,
    EvalSinWave, EvalSinWave,
};
__declspec(noinline) float KernelTable(int c, float t, float a, float b)
{
    if ((unsigned)c < 14)
        return kCurveEvals[c](t, a, b);
    return a;
}

static int gUniform[POOL];
static int gBiased[POOL];

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
    SetProcessAffinityMask(GetCurrentProcess(), 0x4000);
    for (int i = 0; i < POOL; i++)
    {
        gUniform[i] = i % 14;
        // 真实偏置：CONSTANT 15%/LINEAR 35%/EASE 族 30%/其余 20%
        const int r = i % 20;
        gBiased[i] = r < 3 ? 0 : r < 10 ? 1 : r < 13 ? 2 : r < 15 ? 4 : r < 17 ? 9 : kCurveEvals[i % 14] == nullptr ? 1 : (i % 14);
    }
    float acc = 0;
    printf("== 曲线分发表 LPE14 复核（N=%d，min-of-5）==\n", N_ITER);
    for (int pass = 0; pass < 2; pass++)
    {
        const int* dist = pass == 0 ? gUniform : gBiased;
        const char* tag = pass == 0 ? "均匀 0..13" : "真实偏置";
        double s = Measure([&] { for (int i = 0; i < N_ITER; i++) acc += KernelSwitch(dist[i & 4095], (i & 255) / 255.0f, 1.0f, 5.0f); });
        double t = Measure([&] { for (int i = 0; i < N_ITER; i++) acc += KernelTable(dist[i & 4095], (i & 255) / 255.0f, 1.0f, 5.0f); });
        printf("%s | switch %5.2f ns | 表直下标 %5.2f ns | 提升 %+.1f%%\n", tag, s, t, (s - t) / s * 100.0);
    }
    gSink = acc;
    return 0;
}
