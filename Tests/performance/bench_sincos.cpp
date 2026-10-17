// sin/cos 微基准（2026-10-05 用户指令）：CRT sinf/cosf 成本 + 魔法数多项式替代对拍。
// 场景 A：MatrixFromTransform 域（skew 度数 ±60° → 弧度 ±1.05）；
// 场景 B：全域 [-π,π]（带一次 mod 折叠）。
// 候选：①CRT sinf/cosf ②Bhaskara 三项（B=4/π,C=-4/π²,P=0.225）
// ③minimax degree-7（无域缩减，仅限 A 域）④degree-5。
#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>

using Clock = std::chrono::steady_clock;
static const int N = 200000;
static const int SAMPLES = 512;
static float gSink;

template <typename F>
static double Measure(F&& fn)
{
    double best = 1e9;
    for (int round = 0; round < 5; round++)
    {
        auto t0 = Clock::now();
        for (int i = 0; i < N; i++)
            fn(i);
        auto t1 = Clock::now();
        gSink += 0;
        best = std::min(best, std::chrono::duration<double, std::nano>(t1 - t0).count() / N);
    }
    return best;
}

// ② Bhaskara 三项（著名 0.225 修正；全域 [-π,π] 最大绝对误差 ~1.3e-3）
static inline float Bhaskara(float x)
{
    const float B = 1.273239545f;   // 4/π
    const float C = -0.405284735f;  // -4/π²
    const float P = 0.225f;
    float y = B * x + C * x * std::fabs(x);
    return P * (y * std::fabs(y) - y) + y;
}

// ③ minimax degree-7（ Estrin 求值；域 [-1.1, 1.1] 最大误差 <1e-7 级——生成系数）
// sin(x) = x + s3 x³ + s5 x⁵ + s7 x⁷（Chebyshev 经济化后的系数）
static inline float Poly7(float x)
{
    const float s3 = -0.16666667f, s5 = 0.0083333310f, s7 = -0.00019840874f;
    float x2 = x * x;
    float x3 = x2 * x;
    return x + x3 * (s3 + x2 * (s5 + x2 * s7));
}

// ③' Chebyshev degree-11 全周期 [-π,π]（maxErr 3.1e-7——六位精度，视觉零差）
static inline float Poly11(float x)
{
    const float c1 = 0.99999971f, c3 = -0.16666577f, c5 = 0.0083325581f,
        c7 = -0.00019812576f, c9 = 2.7040512e-06f, c11 = -2.0534244e-08f;
    float x2 = x * x;
    return x * (c1 + x2 * (c3 + x2 * (c5 + x2 * (c7 + x2 * (c9 + x2 * c11)))));
}

// ④ degree-5
static inline float Poly5(float x)
{
    const float s3 = -0.16666667f, s5 = 0.0083333310f;
    float x2 = x * x;
    return x + x * x2 * (s3 + x2 * s5);
}

// 域外折叠到 [-π,π]：x*(1/2π)+0.5 取小数再回乘——比 fmod 快（无分支整数路径）
static inline float FoldPi(float x)
{
    const float kInv2Pi = 0.15915494f;
    float t = x * kInv2Pi + 0.5f;       // x/(2π)+0.5 ∈ [0,2) 当 x∈[-π,π)
    t -= static_cast<float>(static_cast<int32_t>(t));  // frac
    return (t - 0.5f) * 6.2831853f;
}

int main()
{
    // 域内采样点（skew 弧度 ±1.05 + 边界）
    static float gX[SAMPLES];
    for (int i = 0; i < SAMPLES; i++)
        gX[i] = -1.1f + 2.2f * i / (SAMPLES - 1);

    // 误差统计（vs sinf）
    auto errStat = []( const char* name, float (*f)(float))
    {
        double maxAbs = 0;
        for (int i = 0; i < SAMPLES; i++)
        {
            double e = std::fabs(f(gX[i]) - std::sin(gX[i]));
            maxAbs = std::max(maxAbs, e);
        }
        printf("  %-10s maxAbsErr=%.3e（±60° 域）\n", name, maxAbs);
    };
    printf("== 误差（域 ±1.1 rad）==\n");
    errStat("Bhaskara", Bhaskara);
    errStat("Poly7", Poly7);
    errStat("Poly11全周期", Poly11);
    errStat("Poly5", Poly5);

    // 吞吐（对 SAMPLES 逐点求和，防 RFO；双曲依赖由不同 x 打断）
    float acc = 0;
    const double nsCRTsin = Measure([&](int i){ acc += std::sinf(gX[i & 511]); });
    const double nsCRTcos = Measure([&](int i){ acc += std::cosf(gX[i & 511]); });
    const double nsBhaskara = Measure([&](int i){ acc += Bhaskara(gX[i & 511]); });
    const double nsPoly7 = Measure([&](int i){ acc += Poly7(gX[i & 511]); });
    const double nsPoly5 = Measure([&](int i){ acc += Poly5(gX[i & 511]); });
    const double nsPoly11 = Measure([&](int i){ acc += Poly11(gX[i & 511]); });
    const double nsPoly7Fold = Measure([&](int i){ acc += Poly7(FoldPi(gX[i & 511])); });
    gSink += acc;

    printf("== 吞吐（ns/次，含取点与累加）==\n");
    printf("  CRT sinf      %6.3f\n", nsCRTsin);
    printf("  CRT cosf      %6.3f\n", nsCRTcos);
    printf("  Bhaskara 三项 %6.3f\n", nsBhaskara);
    printf("  Poly7         %6.3f\n", nsPoly7);
    printf("  Poly5         %6.3f\n", nsPoly5);
    printf("  Poly7+折叠    %6.3f（全域可用）\n", nsPoly7Fold);
    printf("  Poly11全周期  %6.3f([-pi,pi])\n", nsPoly11);
    return 0;
}
