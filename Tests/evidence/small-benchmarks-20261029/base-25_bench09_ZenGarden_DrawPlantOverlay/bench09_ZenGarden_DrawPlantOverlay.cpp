// bench09 | ZenGarden::DrawPlantOverlay | 5 case switch -> kZenNeedIcon 3-slot table (WATER out-of-table)
// FormA = ac447d19^, FormB = HEAD. Discriminant GetPlantsNeed() uniform over PottedPlantNeed 0..4.
#include <windows.h>
#include <cstdint>
#include <cstdio>

static uint64_t g_checksum = 0;
static inline void Mix(uint64_t v) { g_checksum = g_checksum * 1315423911ULL + v + 1; }

static const int kN = 2000000;
static uint32_t g_raw[kN];

enum PottedPlantNeed {
    PLANTNEED_NONE = 0, PLANTNEED_WATER = 1, PLANTNEED_FERTILIZER = 2, PLANTNEED_BUGSPRAY = 3, PLANTNEED_PHONOGRAPH = 4
};

struct ImageStub { int id; };
static ImageStub g_imgBubble{ 1 }, g_imgIcons{ 2 }, g_imgDrop{ 3 };
struct GraphicsStub {
    void DrawImage(ImageStub* img, int x, int y) { Mix(70); Mix((uint64_t)img->id * 271 + (uint64_t)x * 17 + (uint64_t)y); }
    void DrawImageCel(ImageStub* img, int x, int y, int cel, int col) { Mix(71); Mix((uint64_t)img->id * 271 + (uint64_t)x * 17 + (uint64_t)y * 5 + (uint64_t)cel * 3 + (uint64_t)col); }
};
struct PottedPlantStub { int dummy; };
static PottedPlantStub g_potted;
static PottedPlantNeed g_inputNeed;
struct ZenGardenStub { PottedPlantNeed GetPlantsNeed(PottedPlantStub*) { Mix(72); return g_inputNeed; } };
static ZenGardenStub g_zen;
struct AppStub { ZenGardenStub* mZenGarden; };
static AppStub g_app;

struct PlantStub { int mPottedPlantIndex; };
static PlantStub g_plant;

static PottedPlantStub* PottedPlantFromIndex(int idx) { Mix(73); (void)idx; return &g_potted; }

// ================= FormA: verbatim switch (ac447d19^) =================
static void DrawPlantOverlayA(GraphicsStub* g)
{
    if (g_plant.mPottedPlantIndex == -1)
    {
        return;
    }

    PottedPlantStub* aPottedPlant = PottedPlantFromIndex(g_plant.mPottedPlantIndex);
    PottedPlantNeed aPlantNeed = g_app.mZenGarden->GetPlantsNeed(aPottedPlant);
    if (aPlantNeed == PottedPlantNeed::PLANTNEED_NONE)
    {
        return;
    }

    g->DrawImage(&g_imgBubble, 50, 0);
    switch (aPlantNeed)
    {
    case PottedPlantNeed::PLANTNEED_FERTILIZER:
        g->DrawImageCel(&g_imgIcons, 61, 7, 0, 0);
        break;

    case PottedPlantNeed::PLANTNEED_BUGSPRAY:
        g->DrawImageCel(&g_imgIcons, 61, 7, 1, 0);
        break;

    case PottedPlantNeed::PLANTNEED_PHONOGRAPH:
        g->DrawImageCel(&g_imgIcons, 60, 7, 2, 0);
        break;

    case PottedPlantNeed::PLANTNEED_WATER:
        g->DrawImage(&g_imgDrop, 67, 9);
        break;

    case PottedPlantNeed::PLANTNEED_NONE:
        break;
    }
}

// ================= FormB: HEAD table =================
namespace {
struct ZenNeedIcon { int mX; int mCel; };
constexpr ZenNeedIcon kZenNeedIcon[(int)PottedPlantNeed::PLANTNEED_PHONOGRAPH -
                                    (int)PottedPlantNeed::PLANTNEED_FERTILIZER + 1] = {
    {61, 0},  // 0 PLANTNEED_FERTILIZER
    {61, 1},  // 1 PLANTNEED_BUGSPRAY
    {60, 2},  // 2 PLANTNEED_PHONOGRAPH
};
static_assert(sizeof(kZenNeedIcon) / sizeof(kZenNeedIcon[0]) ==
    (int)PottedPlantNeed::PLANTNEED_PHONOGRAPH - (int)PottedPlantNeed::PLANTNEED_FERTILIZER + 1, "slot sync");
}  // namespace

static void DrawPlantOverlayB(GraphicsStub* g)
{
    if (g_plant.mPottedPlantIndex == -1)
    {
        return;
    }

    PottedPlantStub* aPottedPlant = PottedPlantFromIndex(g_plant.mPottedPlantIndex);
    PottedPlantNeed aPlantNeed = g_app.mZenGarden->GetPlantsNeed(aPottedPlant);
    if (aPlantNeed == PottedPlantNeed::PLANTNEED_NONE)
    {
        return;
    }

    g->DrawImage(&g_imgBubble, 50, 0);
    if (aPlantNeed == PottedPlantNeed::PLANTNEED_WATER)
    {
        g->DrawImage(&g_imgDrop, 67, 9);
    }
    else
    {
        const ZenNeedIcon& aIcon = kZenNeedIcon[(int)aPlantNeed - (int)PottedPlantNeed::PLANTNEED_FERTILIZER];
        g->DrawImageCel(&g_imgIcons, aIcon.mX, 7, aIcon.mCel, 0);
    }
}

// ---------------- harness ----------------
static double g_nsPerTick = 0;
static inline double QpcNs() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (double)c.QuadPart * g_nsPerTick; }
static GraphicsStub g_gfx;

static void SetupState(int i)
{
    uint32_t v = g_raw[i];
    g_inputNeed = (PottedPlantNeed)(v % 5);
    g_plant.mPottedPlantIndex = 3;
    g_app.mZenGarden = &g_zen;
}

int main()
{
    LARGE_INTEGER f; QueryPerformanceFrequency(&f); g_nsPerTick = 1e9 / (double)f.QuadPart;
    uint32_t x = 0x9E3779B9u;
    for (int i = 0; i < kN; i++) { x ^= x << 13; x ^= x >> 17; x ^= x << 5; g_raw[i] = x; }

    double bestA = 1e300, bestB = 1e300;
    uint64_t csA = 0, csB = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); DrawPlantOverlayA(&g_gfx); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestA) bestA = ns;
    }
    csA = g_checksum; g_checksum = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); DrawPlantOverlayB(&g_gfx); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestB) bestB = ns;
    }
    csB = g_checksum;

    printf("ZenGarden::DrawPlantOverlay | before %.2f ns | after %.2f ns | diff %+.1f%% | csA=%llx csB=%llx %s\n",
        bestA, bestB, (bestB - bestA) / bestA * 100.0,
        (unsigned long long)csA, (unsigned long long)csB, csA == csB ? "checksum=OK" : "checksum=FAIL");
    return csA == csB ? 0 : 1;
}
