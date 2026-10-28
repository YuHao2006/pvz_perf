// bench11 | ZombatarItems::DrawCategoryHighlight | 9 case switch -> kZombatarCategoryHighlight member-pointer table
// IMPORTANT: HEAD of the repo still contains the SWITCH (the ac447d19 batch conversion of ZombatarItems was
// rolled back; ledger row is stale). FormA = current switch verbatim; FormB = faithful reconstruction of the
// ledger-described member-pointer table (9 slots, struct{Image*, GameButton* ZombatarItems::*}).
#include <windows.h>
#include <cstdint>
#include <cstdio>

static uint64_t g_checksum = 0;
static inline void Mix(uint64_t v) { g_checksum = g_checksum * 1315423911ULL + v + 1; }

static const int kN = 2000000;
static uint32_t g_raw[kN];

enum ZombatarCategory {
    ZOMBATAR_CUSTOM_SKIN = 0, ZOMBATAR_CUSTOM_CLOTHES = 1, ZOMBATAR_CUSTOM_TIDBITS = 2,
    ZOMBATAR_CUSTOM_ACCESSORIES = 3, ZOMBATAR_CUSTOM_FACIAL_HAIR = 4, ZOMBATAR_CUSTOM_HAIR = 5,
    ZOMBATAR_CUSTOM_EYEWEAR = 6, ZOMBATAR_CUSTOM_HATS = 7, ZOMBATAR_CUSTOM_BACKDROPS = 8
};

struct ImageStub { int id; };
static ImageStub g_hlSkin{1}, g_hlClothes{2}, g_hlTidbits{3}, g_hlAccessory{4}, g_hlFacialHair{5}, g_hlHair{6}, g_hlEyeWear{7}, g_hlHats{8}, g_hlBackdrops{9};
struct GraphicsStub {
    void DrawImage(ImageStub* img, int x, int y) { Mix(100); Mix((uint64_t)img->id * 53 + (uint64_t)x * 7 + (uint64_t)y); }
};
struct GameButtonStub { int mX; int mY; };

// Real class holds GameButton* members; stub keeps pointer shape (member-pointer table needs it)
static GameButtonStub g_btnSkin, g_btnClothes, g_btnTidbits, g_btnAccessory, g_btnFacialHair, g_btnHair, g_btnEyeWear, g_btnHats, g_btnBackdrops;
struct ZombatarItems {
    ZombatarCategory mCurrentCategory;
    GameButtonStub* mSkinButton; GameButtonStub* mClothesButton; GameButtonStub* mTidbitsButton; GameButtonStub* mAccessoryButton;
    GameButtonStub* mFacialHairButton; GameButtonStub* mHairButton; GameButtonStub* mEyeWearButton; GameButtonStub* mHatsButton; GameButtonStub* mBackdropsButton;
};
static ZombatarItems g_items;

// ================= FormA: current repo switch (never converted — rollback in ac447d19) =================
static void DrawCategoryHighlightA(GraphicsStub* g)
{
    ImageStub* aHighlight = nullptr;
    GameButtonStub* aButton = nullptr;
    switch (g_items.mCurrentCategory)
    {
    case ZOMBATAR_CUSTOM_SKIN:
        aHighlight = &g_hlSkin;
        aButton = g_items.mSkinButton;
        break;
    case ZOMBATAR_CUSTOM_CLOTHES:
        aHighlight = &g_hlClothes;
        aButton = g_items.mClothesButton;
        break;
    case ZOMBATAR_CUSTOM_TIDBITS:
        aHighlight = &g_hlTidbits;
        aButton = g_items.mTidbitsButton;
        break;
    case ZOMBATAR_CUSTOM_ACCESSORIES:
        aHighlight = &g_hlAccessory;
        aButton = g_items.mAccessoryButton;
        break;
    case ZOMBATAR_CUSTOM_FACIAL_HAIR:
        aHighlight = &g_hlFacialHair;
        aButton = g_items.mFacialHairButton;
        break;
    case ZOMBATAR_CUSTOM_HAIR:
        aHighlight = &g_hlHair;
        aButton = g_items.mHairButton;
        break;
    case ZOMBATAR_CUSTOM_EYEWEAR:
        aHighlight = &g_hlEyeWear;
        aButton = g_items.mEyeWearButton;
        break;
    case ZOMBATAR_CUSTOM_HATS:
        aHighlight = &g_hlHats;
        aButton = g_items.mHatsButton;
        break;
    case ZOMBATAR_CUSTOM_BACKDROPS:
        aHighlight = &g_hlBackdrops;
        aButton = g_items.mBackdropsButton;
        break;
    default:
        break;
    }
    if (aHighlight && aButton)
        g->DrawImage(aHighlight, aButton->mX, aButton->mY);
}

// ================= FormB: reconstructed member-pointer table (ledger intent) =================
namespace {
struct ZombatarCategoryHighlightEntry {
    ImageStub* mHighlight;
    GameButtonStub* ZombatarItems::* mButton;
};
constexpr ZombatarCategoryHighlightEntry kZombatarCategoryHighlight[9] = {
    {&g_hlSkin,       &ZombatarItems::mSkinButton},        // 0 SKIN
    {&g_hlClothes,    &ZombatarItems::mClothesButton},     // 1 CLOTHES
    {&g_hlTidbits,    &ZombatarItems::mTidbitsButton},     // 2 TIDBITS
    {&g_hlAccessory,  &ZombatarItems::mAccessoryButton},   // 3 ACCESSORIES
    {&g_hlFacialHair, &ZombatarItems::mFacialHairButton},  // 4 FACIAL_HAIR
    {&g_hlHair,       &ZombatarItems::mHairButton},        // 5 HAIR
    {&g_hlEyeWear,    &ZombatarItems::mEyeWearButton},     // 6 EYEWEAR
    {&g_hlHats,       &ZombatarItems::mHatsButton},        // 7 HATS
    {&g_hlBackdrops,  &ZombatarItems::mBackdropsButton},   // 8 BACKDROPS
};
static_assert(sizeof(kZombatarCategoryHighlight) / sizeof(kZombatarCategoryHighlight[0]) == 9, "slot sync");
}  // namespace

static void DrawCategoryHighlightB(GraphicsStub* g)
{
    ImageStub* aHighlight = nullptr;
    GameButtonStub* aButton = nullptr;
    const unsigned aCategoryIndex = static_cast<unsigned>(g_items.mCurrentCategory);
    if (aCategoryIndex < 9)
    {
        aHighlight = kZombatarCategoryHighlight[aCategoryIndex].mHighlight;
        aButton = g_items.*kZombatarCategoryHighlight[aCategoryIndex].mButton;
    }
    if (aHighlight && aButton)
        g->DrawImage(aHighlight, aButton->mX, aButton->mY);
}

// ---------------- harness ----------------
static double g_nsPerTick = 0;
static inline double QpcNs() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (double)c.QuadPart * g_nsPerTick; }
static GraphicsStub g_gfx;

static void SetupState(int i)
{
    uint32_t v = g_raw[i];
    g_items.mCurrentCategory = (ZombatarCategory)(v % 9);
    g_btnSkin = { 10, 20 };
    g_btnClothes = { 110, 120 };
    g_btnTidbits = { 210, 220 };
    g_btnAccessory = { 310, 320 };
    g_btnFacialHair = { 410, 420 };
    g_btnHair = { 510, 520 };
    g_btnEyeWear = { 610, 620 };
    g_btnHats = { 710, 720 };
    g_btnBackdrops = { 810, 820 };
    g_items.mSkinButton = &g_btnSkin; g_items.mClothesButton = &g_btnClothes; g_items.mTidbitsButton = &g_btnTidbits;
    g_items.mAccessoryButton = &g_btnAccessory; g_items.mFacialHairButton = &g_btnFacialHair; g_items.mHairButton = &g_btnHair;
    g_items.mEyeWearButton = &g_btnEyeWear; g_items.mHatsButton = &g_btnHats; g_items.mBackdropsButton = &g_btnBackdrops;
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
        for (int i = 0; i < kN; i++) { SetupState(i); DrawCategoryHighlightA(&g_gfx); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestA) bestA = ns;
    }
    csA = g_checksum; g_checksum = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); DrawCategoryHighlightB(&g_gfx); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestB) bestB = ns;
    }
    csB = g_checksum;

    printf("ZombatarItems::DrawCategoryHighlight | before %.2f ns | after %.2f ns | diff %+.1f%% | csA=%llx csB=%llx %s\n",
        bestA, bestB, (bestB - bestA) / bestA * 100.0,
        (unsigned long long)csA, (unsigned long long)csB, csA == csB ? "checksum=OK" : "checksum=FAIL");
    return csA == csB ? 0 : 1;
}
