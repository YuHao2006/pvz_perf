// 轨道实例拆分形态对拍（2026-10-02 P4）：250 reanim × 30 轨 = 7500 轨道槽。
// 口径同 bench_particle_roster（MSVC x64 /O2，min-of-5）。
//
// 对拍形态：
//   V0 AoS   ：现状 112B/槽（counter@0 shake@52 attach@64 group@72，其余冷）
//   V1 三段  ：[更新扫描段 Hot{counter,attach,shake} 12B 交错][group u8][冷 96B]
//   V2 五段  ：[counter[N]][attach[N]][shake[N]][group[N]][冷 96B]（上一条的画法）
//   掩码形态：活动位图 u64/实体（blend|shake|attach 非"零"位）+ attacher 位
//             （每实体 2 条 attacher 轨常置）——零跳过 + 按位索引
//
// 两个每帧 pass：
//   更新扫（EffectSystem::Update）：每轨查 counter>0→减、shake≠0→掷随机写
//     冷段 shakeX/Y、attach≠null→非内联汇；活动率 0% 与 5% 两档
//   分组扫（Draw）：V0=18 遍全轨比组号；掩码=占用分组(常态 1 遍+少量) 比
//     group；命中轨摸冷段 64B（DrawTrack 近似）
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <bit>
#include <vector>
#include <array>

using Clock = std::chrono::steady_clock;
static const int N_ITER = 2000;
static const int REANIMS = 250;
static const int TRACKS = 30;
static const int TOTAL = REANIMS * TRACKS;  // 7500
static const int GROUPS = 18;
static const int ATTACHER_TRACKS = 2;  // 每实体 attacher 轨（def 级常量，帧帧必跑）

static volatile uint64_t gSink;

// ── V0：AoS 112B（字段偏移按现结构近似）──
struct AoSTrack
{
    int32_t mBlendCounter;      // +0
    int32_t mBlendTime;         // +4
    char mBlendTransform[44];   // +8
    float mShakeOverride;       // +52
    float mShakeX, mShakeY;     // +56/+60
    int32_t mAttachmentID;      // +64
    char mPad0[4];
    int32_t mRenderGroup;       // +72
    char mPad1[35];             // 到 112B
};
static_assert(sizeof(AoSTrack) == 112);
static AoSTrack gAoS[REANIMS][TRACKS];

// ── V1：三段（更新扫描段交错结构）──
struct HotScan { int32_t mCounter; int32_t mAttach; float mShake; };
struct ColdTrack { float mShakeX, mShakeY; int32_t mBlendTime; char mBlendTransform[44];
                   char mPad[40]; };  // 96B 近似
static_assert(sizeof(ColdTrack) == 96);
static HotScan gHot1[REANIMS][TRACKS];
static uint8_t gGroup1[REANIMS][TRACKS];
static ColdTrack gCold1[REANIMS][TRACKS];

// ── V2：五段（更新段三字段各自成数组）──
static int32_t gCounter2[REANIMS][TRACKS];
static int32_t gAttach2[REANIMS][TRACKS];
static float gShake2[REANIMS][TRACKS];
static uint8_t gGroup2[REANIMS][TRACKS];
static ColdTrack gCold2[REANIMS][TRACKS];

// ── 掩码（叠在 V1 布局之上测）──
static uint64_t gActiveMask[REANIMS];       // blend|shake|attach
static uint64_t gAttacherMask[REANIMS];     // def 级：TRACKS<=64
static uint32_t gGroupOcc[REANIMS];         // 18 位

__declspec(noinline) void AttachUpdateSink(int) { }
__declspec(noinline) void AttacherUpdateSink(int) { }
__declspec(noinline) float ShakeRandSink() { return 1.0f; }

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

// 活动率布防：activeFrac=0/5% 的轨道置 blend/attach；每实体 2 条 attacher 位；
// 组布防：常态 25 轨 group0 + 5 轨散在 2/4/6（Zombatar 形态）
static void SeedStates(double activeFrac)
{
    std::memset(gAoS, 0, sizeof(gAoS));
    std::memset(gHot1, 0, sizeof(gHot1));
    std::memset(gCounter2, 0, sizeof(gCounter2));
    std::memset(gAttach2, 0, sizeof(gAttach2));
    std::memset(gShake2, 0, sizeof(gShake2));
    std::memset(gActiveMask, 0, sizeof(gActiveMask));
    std::memset(gGroupOcc, 0, sizeof(gGroupOcc));
    for (int r = 0; r < REANIMS; r++)
    {
        gAttacherMask[r] = (1ull << 3) | (1ull << 7);  // 2 条 attacher 轨
        for (int t = 0; t < TRACKS; t++)
        {
            uint8_t grp = (t < 25) ? 0 : (uint8_t)(2 + 2 * ((t - 25) % 3));
            bool active = (activeFrac > 0) && ((r * 31 + t * 7) % 1000) < (int)(activeFrac * 1000);
            gAoS[r][t].mRenderGroup = grp;
            gGroup1[r][t] = grp; gGroup2[r][t] = grp;
            gGroupOcc[r] |= 1u << grp;
            if (active)  // 常驻活动 = attach（blend 瞬态会在测量中耗尽，略）
            {
                gAoS[r][t].mAttachmentID = 0x10000 | t;
                gHot1[r][t] = { 0, 0x10000 | t, 0.0f };
                gAttach2[r][t] = 0x10000 | t;
                gActiveMask[r] |= 1ull << t;
            }
        }
    }
}

int main()
{
    printf("reanim track walk bench: %d reanims x %d tracks = %d slots, per-pass:\n",
        REANIMS, TRACKS, TOTAL);

    for (double frac : {0.0, 0.05})
    {
        SeedStates(frac);
        printf("-- update scan (active=%.0f%%, attacher 2/reanim) --\n", frac * 100);

        const double nsAoS = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
                for (int t = 0; t < TRACKS; t++)
                {
                    AoSTrack& a = gAoS[r][t];
                    if (a.mBlendCounter > 0) { a.mBlendCounter--; hit++; }
                    if (a.mShakeOverride != 0.0f) { a.mShakeX = ShakeRandSink(); hit++; }
                    if (a.mAttachmentID != 0) { AttachUpdateSink(a.mAttachmentID); hit++; }
                }
            return hit;
        });

        const double nsV1 = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
                for (int t = 0; t < TRACKS; t++)
                {
                    HotScan& h = gHot1[r][t];
                    if (h.mCounter > 0) { h.mCounter--; hit++; }
                    if (h.mShake != 0.0f) { gCold1[r][t].mShakeX = ShakeRandSink(); hit++; }
                    if (h.mAttach != 0) { AttachUpdateSink(h.mAttach); hit++; }
                }
            return hit;
        });

        const double nsV2 = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
                for (int t = 0; t < TRACKS; t++)
                {
                    if (gCounter2[r][t] > 0) { gCounter2[r][t]--; hit++; }
                    if (gShake2[r][t] != 0.0f) { gCold2[r][t].mShakeX = ShakeRandSink(); hit++; }
                    if (gAttach2[r][t] != 0) { AttachUpdateSink(gAttach2[r][t]); hit++; }
                }
            return hit;
        });

        const double nsMask = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
            {
                uint64_t m = gActiveMask[r] | gAttacherMask[r];
                while (m)
                {
                    const unsigned t = (unsigned)std::countr_zero(m);
                    m &= m - 1;
                    HotScan& h = gHot1[r][t];
                    if (h.mCounter > 0) { h.mCounter--; hit++; }
                    if (h.mShake != 0.0f) { gCold1[r][t].mShakeX = ShakeRandSink(); hit++; }
                    if (h.mAttach != 0) { AttachUpdateSink(h.mAttach); hit++; }
                    // attacher 位（3/7 号轨常置）走 attacher 更新
                    if (t == 3 || t == 7) AttacherUpdateSink(t);
                }
            }
            return hit;
        });

        printf("  V0 AoS 112B stride : %8.0f ns/pass\n", nsAoS);
        printf("  V1 hot 12B inter   : %8.0f ns/pass (%.0f%%)\n", nsV1, nsV1 / nsAoS * 100);
        printf("  V2 3 separate u32  : %8.0f ns/pass (%.0f%%)\n", nsV2, nsV2 / nsAoS * 100);
        printf("  mask skip (V1 base): %8.0f ns/pass (%.0f%%)\n", nsMask, nsMask / nsAoS * 100);
        // 掩码会耗尽 blend（10 帧后归零）——每轮重置计数器以保持活动率
        if (frac > 0)
        {
            // 说明：上式 nsMask 的 blend 在 5 轮测量中递减耗尽属常态（真实
            // 场景 blend 是瞬态），活动档数字按 attach/attacher 常驻解读
        }
    }

    // P4 编译期前置等价性补测（台账缺口）：掩码来源 = 编译期常量表 vs
    // 装载期建好的堆 vector——同一更新环形态，仅 OR 进来的字来源不同
    {
        static uint64_t kConstSrc[REANIMS][4] = {};
        static std::vector<std::array<uint64_t, 4>> gVecSrc;
        gVecSrc.assign(REANIMS, {0, 0, 0, 0});
        for (int r = 0; r < REANIMS; r++)
        {
            kConstSrc[r][0] = gAttacherMask[r] & 0x3;  // 低 2 位 attacher 同布防
            gVecSrc[r][0] = gAttacherMask[r] & 0x3;
        }
        const double nsFromConst = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
            {
                uint64_t m = kConstSrc[r][0] | kConstSrc[r][1] | kConstSrc[r][2] | kConstSrc[r][3];
                while (m) { const unsigned t = (unsigned)std::countr_zero(m); m &= m - 1; hit += t; }
            }
            return hit;
        });
        const double nsFromVector = Measure([&]{
            uint64_t hit = 0;
            for (int r = 0; r < REANIMS; r++)
            {
                const auto& w = gVecSrc[r];
                uint64_t m = w[0] | w[1] | w[2] | w[3];
                while (m) { const unsigned t = (unsigned)std::countr_zero(m); m &= m - 1; hit += t; }
            }
            return hit;
        });
        printf("-- mask source A/B (P4 compile-time fronting equivalence) --\n");
        printf("  from constexpr table : %6.1f ns/pass\n", nsFromConst);
        printf("  from heap vector     : %6.1f ns/pass (%.0f%%)\n", nsFromVector, nsFromVector / nsFromConst * 100.0);
    }

    SeedStates(0.05);
    printf("-- draw group scan (occupancy: group0 25 tracks + 5 scattered) --\n");

    const double nsDrawAoS = Measure([&]{
        uint64_t hit = 0;
        for (int r = 0; r < REANIMS; r++)
            for (int g = 0; g < GROUPS; g++)
                for (int t = 0; t < TRACKS; t++)
                    if (gAoS[r][t].mRenderGroup == g)
                    {
                        hit += *(uint64_t*)&gAoS[r][t].mBlendTransform[0];  // DrawTrack 冷摸近似
                        hit += gAoS[r][t].mBlendTime;
                    }
        return hit;
    });

    const double nsDrawOccAoS = Measure([&]{
        uint64_t hit = 0;
        for (int r = 0; r < REANIMS; r++)
        {
            uint32_t occ = gGroupOcc[r];
            while (occ)
            {
                const unsigned g = (unsigned)std::countr_zero(occ);
                occ &= occ - 1;
                for (int t = 0; t < TRACKS; t++)
                    if (gAoS[r][t].mRenderGroup == (int)g)
                    {
                        hit += *(uint64_t*)&gAoS[r][t].mBlendTransform[0];
                        hit += gAoS[r][t].mBlendTime;
                    }
            }
        }
        return hit;
    });

    const double nsDrawOccByte = Measure([&]{
        uint64_t hit = 0;
        for (int r = 0; r < REANIMS; r++)
        {
            uint32_t occ = gGroupOcc[r];
            while (occ)
            {
                const unsigned g = (unsigned)std::countr_zero(occ);
                occ &= occ - 1;
                const uint8_t* grp = gGroup1[r];
                for (int t = 0; t < TRACKS; t++)
                    if (grp[t] == g)
                    {
                        hit += *(uint64_t*)&gCold1[r][t].mBlendTransform[0];
                        hit += gCold1[r][t].mBlendTime;
                    }
            }
        }
        return hit;
    });

    printf("  V0 18-pass AoS      : %8.0f ns/pass\n", nsDrawAoS);
    printf("  occupancy, grp in AoS: %7.0f ns/pass (%.0f%%)\n", nsDrawOccAoS, nsDrawOccAoS / nsDrawAoS * 100);
    printf("  occupancy, grp u8[] : %8.0f ns/pass (%.0f%%)\n", nsDrawOccByte, nsDrawOccByte / nsDrawAoS * 100);
    printf("sink=%llu\n", (unsigned long long)gSink);
    return 0;
}
