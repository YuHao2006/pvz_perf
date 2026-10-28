// bench02 | Plant::DoSpecial | 8 case switch -> kPlantSpecialCases 53-slot lambda table
// FormA = ac447d19^ (verbatim switch), FormB = HEAD (table, lambda bodies per Plant_after.cpp).
#include <windows.h>
#include <cstdint>
#include <cstdio>

static uint64_t g_checksum = 0;
static inline void Mix(uint64_t v) { g_checksum = g_checksum * 1315423911ULL + v + 1; }

static const int kN = 2000000;
static uint32_t g_raw[kN];

// ---------------- stub types ----------------
enum SeedType {
    SEED_PEASHOOTER = 0, SEED_SUNFLOWER = 1, SEED_CHERRYBOMB = 2, SEED_WALLNUT = 3, SEED_POTATOMINE = 4,
    SEED_SNOWPEA = 5, SEED_CHOMPER = 6, SEED_REPEATER = 7, SEED_PUFFSHROOM = 8, SEED_SUNSHROOM = 9,
    SEED_FUMESHROOM = 10, SEED_GRAVEBUSTER = 11, SEED_HYPNOSHROOM = 12, SEED_SCAREDYSHROOM = 13,
    SEED_ICESHROOM = 14, SEED_DOOMSHROOM = 15, SEED_LILYPAD = 16, SEED_SQUASH = 17, SEED_THREEPEATER = 18,
    SEED_TANGLEKELP = 19, SEED_JALAPENO = 20, SEED_SPIKEWEED = 21, SEED_TORCHWOOD = 22, SEED_TALLNUT = 23,
    SEED_SEASHROOM = 24, SEED_PLANTERN = 25, SEED_CACTUS = 26, SEED_BLOVER = 27, SEED_SPLITPEA = 28,
    SEED_STARFRUIT = 29, SEED_PUMPKINSHELL = 30, SEED_MAGNETSHROOM = 31, SEED_CABBAGEPULT = 32,
    SEED_FLOWERPOT = 33, SEED_KERNELPULT = 34, SEED_INSTANT_COFFEE = 35, SEED_GARLIC = 36, SEED_UMBRELLA = 37,
    SEED_MARIGOLD = 38, SEED_MELONPULT = 39, SEED_GATLINGPEA = 40, SEED_TWINSUNFLOWER = 41,
    SEED_GLOOMSHROOM = 42, SEED_CATTAIL = 43, SEED_WINTERMELON = 44, SEED_GOLD_MAGNET = 45,
    SEED_SPIKEROCK = 46, SEED_COBCANNON = 47, SEED_IMITATER = 48, SEED_EXPLODE_O_NUT = 49,
    SEED_GIANT_WALLNUT = 50, SEED_SPROUT = 51, SEED_LEFTPEATER = 52,
    NUM_SEED_TYPES = 53
};
enum PlantState { STATE_IDLE = 0, STATE_DOINGSPECIAL = 10, STATE_UMBRELLA_TRIGGERED = 20, STATE_UMBRELLA_REFLECTING = 21 };
enum PlantWeapon { WEAPON_PRIMARY = 0 };
enum ReanimTrackId { anim_idle = 0, anim_block = 1, anim_crumble = 2 };
enum ReanimLoopType { REANIM_LOOP = 0, REANIM_PLAY_ONCE_AND_HOLD = 1 };
enum RenderLayer { RENDER_LAYER_TOP = 3, RENDER_LAYER_PARTICLE = 2 };
enum ParticleEffect { PARTICLE_POWIE = 1, PARTICLE_DOOM = 2, PARTICLE_ICE_TRAP = 3, PARTICLE_POTATO_MINE = 4 };
enum PlantPriority { TOPPLANT_ONLY_NORMAL_POSITION = 0 };
enum FoleyType { FOLEY_CHERRYBOMB = 1, FOLEY_JUICY = 2, FOLEY_JALAPENO_IGNITE = 3, FOLEY_FROZEN = 4, FOLEY_COFFEE = 5 };
enum AchievementId { Explodonator = 1, Spudow = 2 };
const int SOUND_DOOMSHROOM = 11, SOUND_POTATO_MINE = 12;

static inline void TOD_ASSERT_IMPL(bool) {}
#define TOD_ASSERT(x) TOD_ASSERT_IMPL((x))  // release no-op (game asserts compiled out)

struct Plant;  // fwd

struct GridItemStub { int mGridItemCounter; };
static GridItemStub g_crater;

struct AppStub {
    void PlayFoley(FoleyType f) { Mix(10); Mix(f); }
    void PlaySample(int s) { Mix(11); Mix((uint64_t)s); }
    void AddTodParticle(int x, int y, int layer, ParticleEffect e) { Mix(4); Mix((uint64_t)(unsigned)x + (unsigned)y + (unsigned)layer + (unsigned)e); }
};
static AppStub g_app;

static void GiveAchievement(AppStub* a, AchievementId id, bool b) { (void)a; Mix(2); Mix(id); (void)b; }

struct BoardStub;  // fwd

struct Plant {
    bool mIsAsleep; int mWakeUpCounter;  // also reused as the "other plant" type (same member shape)
    SeedType mSeedType;
    PlantState mState;
    int mStateCountdown;
    int mX, mY, mWidth, mHeight;
    int mPlantCol, mRow;
    AppStub* mApp;
    BoardStub* mBoard;

    int GetDamageRangeFlags(PlantWeapon w) { Mix(12); return (int)w + 3; }
    void BlowAwayFliers() { Mix(1); }
    void KillAllPlantsNearDoom() { Mix(13); }
    void Die() { Mix(14); }
    void BurnRow(int row) { Mix(15); Mix((uint64_t)row); }
    void IceZombies() { Mix(16); }
    void PlayBodyReanim(ReanimTrackId t, ReanimLoopType l, int blend, float rate) { Mix(17); Mix((uint64_t)t + (int)l + blend + (int)rate * 1000); }
};
static Plant g_plant, g_otherPlant;

struct BoardStub {
    int mIceTimer[6];
    int KillAllZombiesInRadius(int row, int x, int y, int r, int z, bool b, int flags) {
        Mix(3); Mix((uint64_t)(unsigned)row * 7 + (unsigned)x + (unsigned)y + (unsigned)r + (unsigned)z + (unsigned)flags + (b ? 1 : 0));
        return 12;
    }
    void ShakeBoard(int a, int b) { Mix(5); Mix((uint64_t)(unsigned)a * 31 + (unsigned)b); }
    GridItemStub* AddACrater(int col, int row) { Mix(6); Mix((uint64_t)(unsigned)col + (unsigned)row); return &g_crater; }
    void DoFwoosh(int row) { Mix(7); Mix((uint64_t)row); }
    Plant* GetTopPlantAt(int col, int row, PlantPriority p) { Mix(8); Mix((uint64_t)(unsigned)col + (unsigned)row + (unsigned)p); return &g_otherPlant; }
    static int MakeRenderOrder(RenderLayer l, int row, int z) { Mix(9); return ((int)l << 12) + row * 64 + z; }
};
static BoardStub g_board;

// ================= FormA: verbatim switch (ac447d19^) =================
static void DoSpecialA()
{
    int aPosX = g_plant.mX + g_plant.mWidth / 2;
    int aPosY = g_plant.mY + g_plant.mHeight / 2;
    int aDamageRangeFlags = g_plant.GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY);

    switch (g_plant.mSeedType)
    {
    case SeedType::SEED_BLOVER:
    {
        if (g_plant.mState != PlantState::STATE_DOINGSPECIAL)
        {
            g_plant.mState = PlantState::STATE_DOINGSPECIAL;
            g_plant.BlowAwayFliers();
        }
        break;
    }
    case SeedType::SEED_CHERRYBOMB:
    {
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_CHERRYBOMB);
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_JUICY);

        if (g_plant.mBoard->KillAllZombiesInRadius(g_plant.mRow, aPosX, aPosY, 115, 1, true, aDamageRangeFlags) >= 10)
            GiveAchievement(&g_app, Explodonator, true);

        g_plant.mApp->AddTodParticle(aPosX, aPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_POWIE);
        g_plant.mBoard->ShakeBoard(3, -4);

        g_plant.Die();
        break;
    }
    case SeedType::SEED_DOOMSHROOM:
    {
        g_plant.mApp->PlaySample(SOUND_DOOMSHROOM);

        g_plant.mBoard->KillAllZombiesInRadius(g_plant.mRow, aPosX, aPosY, 250, 3, true, aDamageRangeFlags);
        g_plant.KillAllPlantsNearDoom();

        g_plant.mApp->AddTodParticle(aPosX, aPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_DOOM);
        g_plant.mBoard->AddACrater(g_plant.mPlantCol, g_plant.mRow)->mGridItemCounter = 18000;
        g_plant.mBoard->ShakeBoard(3, -4);

        g_plant.Die();
        break;
    }
    case SeedType::SEED_JALAPENO:
    {
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_JALAPENO_IGNITE);
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_JUICY);

        g_plant.mBoard->DoFwoosh(g_plant.mRow);
        g_plant.mBoard->ShakeBoard(3, -4);

        g_plant.BurnRow(g_plant.mRow);
        g_plant.mBoard->mIceTimer[g_plant.mRow] = 20;

        g_plant.Die();
        break;
    }
    case SeedType::SEED_UMBRELLA:
    {
        if (g_plant.mState != PlantState::STATE_UMBRELLA_TRIGGERED && g_plant.mState != PlantState::STATE_UMBRELLA_REFLECTING)
        {
            g_plant.mState = PlantState::STATE_UMBRELLA_TRIGGERED;
            g_plant.mStateCountdown = 5;

            g_plant.PlayBodyReanim(ReanimTrackId::anim_block, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 22.0f);
        }

        break;
    }
    case SeedType::SEED_ICESHROOM:
    {
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_FROZEN);
        g_plant.IceZombies();
        g_plant.mApp->AddTodParticle(aPosX, aPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_ICE_TRAP);

        g_plant.Die();
        break;
    }
    case SeedType::SEED_POTATOMINE:
    {
        aPosX = g_plant.mX + g_plant.mWidth / 2 - 20;
        aPosY = g_plant.mY + g_plant.mHeight / 2;

        g_plant.mApp->PlaySample(SOUND_POTATO_MINE);
        if (g_plant.mBoard->KillAllZombiesInRadius(g_plant.mRow, aPosX, aPosY, 60, 0, false, aDamageRangeFlags) >= 1)
            GiveAchievement(&g_app, Spudow, true);

        int aRenderPosition = BoardStub::MakeRenderOrder(RenderLayer::RENDER_LAYER_PARTICLE, g_plant.mRow, 0);
        g_plant.mApp->AddTodParticle(aPosX + 20.0f, aPosY, aRenderPosition, ParticleEffect::PARTICLE_POTATO_MINE);
        g_plant.mBoard->ShakeBoard(3, -4);

        g_plant.Die();
        break;
    }
    case SeedType::SEED_INSTANT_COFFEE:
    {
        Plant* aPlant = g_plant.mBoard->GetTopPlantAt(g_plant.mPlantCol, g_plant.mRow, PlantPriority::TOPPLANT_ONLY_NORMAL_POSITION);
        if (aPlant && aPlant->mIsAsleep)
        {
            aPlant->mWakeUpCounter = 100;
        }

        g_plant.mState = PlantState::STATE_DOINGSPECIAL;
        g_plant.PlayBodyReanim(ReanimTrackId::anim_crumble, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 22.0f);
        g_plant.mApp->PlayFoley(FoleyType::FOLEY_COFFEE);

        break;
    }
    default:
        break;
    }
}

// ================= FormB: HEAD 53-slot table (verbatim structure) =================
namespace {
struct PlantSpecialLocals { int mPosX; int mPosY; int mDamageRangeFlags; };
using PlantSpecialCaseFn = void (*)(Plant&, PlantSpecialLocals&);

void PlantSpecialDefault(Plant& p, PlantSpecialLocals& lc) { (void)p; (void)lc; }

constexpr PlantSpecialCaseFn kPlantSpecialCases[(int)SeedType::NUM_SEED_TYPES] = {
    &PlantSpecialDefault,  // 0 SEED_PEASHOOTER
    &PlantSpecialDefault,  // 1 SEED_SUNFLOWER
    [](Plant& p, PlantSpecialLocals& lc)
    {
        p.mApp->PlayFoley(FoleyType::FOLEY_CHERRYBOMB);
        p.mApp->PlayFoley(FoleyType::FOLEY_JUICY);

        if (p.mBoard->KillAllZombiesInRadius(p.mRow, lc.mPosX, lc.mPosY, 115, 1, true, lc.mDamageRangeFlags) >= 10)
            GiveAchievement(p.mApp, Explodonator, true);

        p.mApp->AddTodParticle(lc.mPosX, lc.mPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_POWIE);
        p.mBoard->ShakeBoard(3, -4);

        p.Die();
    },  // 2 SEED_CHERRYBOMB
    &PlantSpecialDefault,  // 3 SEED_WALLNUT
    [](Plant& p, PlantSpecialLocals& lc)
    {
        lc.mPosX = p.mX + p.mWidth / 2 - 20;
        lc.mPosY = p.mY + p.mHeight / 2;

        p.mApp->PlaySample(SOUND_POTATO_MINE);
        if (p.mBoard->KillAllZombiesInRadius(p.mRow, lc.mPosX, lc.mPosY, 60, 0, false, lc.mDamageRangeFlags) >= 1)
            GiveAchievement(p.mApp, Spudow, true);

        int aRenderPosition = BoardStub::MakeRenderOrder(RenderLayer::RENDER_LAYER_PARTICLE, p.mRow, 0);
        p.mApp->AddTodParticle(lc.mPosX + 20.0f, lc.mPosY, aRenderPosition, ParticleEffect::PARTICLE_POTATO_MINE);
        p.mBoard->ShakeBoard(3, -4);

        p.Die();
    },  // 4 SEED_POTATOMINE
    &PlantSpecialDefault,  // 5 SEED_SNOWPEA
    &PlantSpecialDefault,  // 6 SEED_CHOMPER
    &PlantSpecialDefault,  // 7 SEED_REPEATER
    &PlantSpecialDefault,  // 8 SEED_PUFFSHROOM
    &PlantSpecialDefault,  // 9 SEED_SUNSHROOM
    &PlantSpecialDefault,  // 10 SEED_FUMESHROOM
    &PlantSpecialDefault,  // 11 SEED_GRAVEBUSTER
    &PlantSpecialDefault,  // 12 SEED_HYPNOSHROOM
    &PlantSpecialDefault,  // 13 SEED_SCAREDYSHROOM
    [](Plant& p, PlantSpecialLocals& lc)
    {
        p.mApp->PlayFoley(FoleyType::FOLEY_FROZEN);
        p.IceZombies();
        p.mApp->AddTodParticle(lc.mPosX, lc.mPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_ICE_TRAP);

        p.Die();
    },  // 14 SEED_ICESHROOM
    [](Plant& p, PlantSpecialLocals& lc)
    {
        p.mApp->PlaySample(SOUND_DOOMSHROOM);

        p.mBoard->KillAllZombiesInRadius(p.mRow, lc.mPosX, lc.mPosY, 250, 3, true, lc.mDamageRangeFlags);
        p.KillAllPlantsNearDoom();

        p.mApp->AddTodParticle(lc.mPosX, lc.mPosY, (int)RenderLayer::RENDER_LAYER_TOP, ParticleEffect::PARTICLE_DOOM);
        p.mBoard->AddACrater(p.mPlantCol, p.mRow)->mGridItemCounter = 18000;
        p.mBoard->ShakeBoard(3, -4);

        p.Die();
    },  // 15 SEED_DOOMSHROOM
    &PlantSpecialDefault,  // 16 SEED_LILYPAD
    &PlantSpecialDefault,  // 17 SEED_SQUASH
    &PlantSpecialDefault,  // 18 SEED_THREEPEATER
    &PlantSpecialDefault,  // 19 SEED_TANGLEKELP
    [](Plant& p, PlantSpecialLocals& lc)
    {
        (void)lc;
        p.mApp->PlayFoley(FoleyType::FOLEY_JALAPENO_IGNITE);
        p.mApp->PlayFoley(FoleyType::FOLEY_JUICY);

        p.mBoard->DoFwoosh(p.mRow);
        p.mBoard->ShakeBoard(3, -4);

        p.BurnRow(p.mRow);
        p.mBoard->mIceTimer[p.mRow] = 20;

        p.Die();
    },  // 20 SEED_JALAPENO
    &PlantSpecialDefault,  // 21 SEED_SPIKEWEED
    &PlantSpecialDefault,  // 22 SEED_TORCHWOOD
    &PlantSpecialDefault,  // 23 SEED_TALLNUT
    &PlantSpecialDefault,  // 24 SEED_SEASHROOM
    &PlantSpecialDefault,  // 25 SEED_PLANTERN
    &PlantSpecialDefault,  // 26 SEED_CACTUS
    [](Plant& p, PlantSpecialLocals& lc)
    {
        (void)lc;
        if (p.mState != PlantState::STATE_DOINGSPECIAL)
        {
            p.mState = PlantState::STATE_DOINGSPECIAL;
            p.BlowAwayFliers();
        }
    },  // 27 SEED_BLOVER
    &PlantSpecialDefault,  // 28 SEED_SPLITPEA
    &PlantSpecialDefault,  // 29 SEED_STARFRUIT
    &PlantSpecialDefault,  // 30 SEED_PUMPKINSHELL
    &PlantSpecialDefault,  // 31 SEED_MAGNETSHROOM
    &PlantSpecialDefault,  // 32 SEED_CABBAGEPULT
    &PlantSpecialDefault,  // 33 SEED_FLOWERPOT
    &PlantSpecialDefault,  // 34 SEED_KERNELPULT
    [](Plant& p, PlantSpecialLocals& lc)
    {
        (void)lc;
        Plant* aPlant = p.mBoard->GetTopPlantAt(p.mPlantCol, p.mRow, PlantPriority::TOPPLANT_ONLY_NORMAL_POSITION);
        if (aPlant && aPlant->mIsAsleep)
        {
            aPlant->mWakeUpCounter = 100;
        }

        p.mState = PlantState::STATE_DOINGSPECIAL;
        p.PlayBodyReanim(ReanimTrackId::anim_crumble, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 22.0f);
        p.mApp->PlayFoley(FoleyType::FOLEY_COFFEE);
    },  // 35 SEED_INSTANT_COFFEE
    &PlantSpecialDefault,  // 36 SEED_GARLIC
    [](Plant& p, PlantSpecialLocals& lc)
    {
        (void)lc;
        if (p.mState != PlantState::STATE_UMBRELLA_TRIGGERED && p.mState != PlantState::STATE_UMBRELLA_REFLECTING)
        {
            p.mState = PlantState::STATE_UMBRELLA_TRIGGERED;
            p.mStateCountdown = 5;

            p.PlayBodyReanim(ReanimTrackId::anim_block, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 0, 22.0f);
        }
    },  // 37 SEED_UMBRELLA
    &PlantSpecialDefault,  // 38 SEED_MARIGOLD
    &PlantSpecialDefault,  // 39 SEED_MELONPULT
    &PlantSpecialDefault,  // 40 SEED_GATLINGPEA
    &PlantSpecialDefault,  // 41 SEED_TWINSUNFLOWER
    &PlantSpecialDefault,  // 42 SEED_GLOOMSHROOM
    &PlantSpecialDefault,  // 43 SEED_CATTAIL
    &PlantSpecialDefault,  // 44 SEED_WINTERMELON
    &PlantSpecialDefault,  // 45 SEED_GOLD_MAGNET
    &PlantSpecialDefault,  // 46 SEED_SPIKEROCK
    &PlantSpecialDefault,  // 47 SEED_COBCANNON
    &PlantSpecialDefault,  // 48 SEED_IMITATER
    &PlantSpecialDefault,  // 49 SEED_EXPLODE_O_NUT
    &PlantSpecialDefault,  // 50 SEED_GIANT_WALLNUT
    &PlantSpecialDefault,  // 51 SEED_SPROUT
    &PlantSpecialDefault,  // 52 SEED_LEFTPEATER
};
static_assert(sizeof(kPlantSpecialCases) / sizeof(kPlantSpecialCases[0]) == (int)SeedType::NUM_SEED_TYPES, "slot count");
}  // namespace

static void DoSpecialB()
{
    int aPosX = g_plant.mX + g_plant.mWidth / 2;
    int aPosY = g_plant.mY + g_plant.mHeight / 2;
    int aDamageRangeFlags = g_plant.GetDamageRangeFlags(PlantWeapon::WEAPON_PRIMARY);

    PlantSpecialLocals aSpecialLocals{aPosX, aPosY, aDamageRangeFlags};
    const unsigned aSeedIndex = static_cast<unsigned>(g_plant.mSeedType);
    if (aSeedIndex < static_cast<unsigned>(SeedType::NUM_SEED_TYPES))
    {
        kPlantSpecialCases[aSeedIndex](g_plant, aSpecialLocals);
    }
}

// ---------------- harness ----------------
static double g_nsPerTick = 0;
static inline double QpcNs() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (double)c.QuadPart * g_nsPerTick; }

static void SetupState(int i)
{
    uint32_t v = g_raw[i];
    g_plant.mSeedType = (SeedType)(v % 53);
    g_plant.mState = (PlantState)(((v >> 8) & 1) ? STATE_DOINGSPECIAL : STATE_IDLE);
    g_plant.mStateCountdown = 0;
    g_plant.mX = (v % 71) * 3; g_plant.mY = (v % 43) * 5;
    g_plant.mWidth = 80; g_plant.mHeight = 100;
    g_plant.mPlantCol = (v >> 4) % 9; g_plant.mRow = (v >> 6) % 5;
    g_plant.mApp = &g_app;
    g_plant.mBoard = &g_board;
    g_otherPlant.mIsAsleep = ((v >> 3) & 1) != 0;
    g_otherPlant.mWakeUpCounter = 0;
    g_crater.mGridItemCounter = 0;
    for (int k = 0; k < 6; k++) g_board.mIceTimer[k] = 0;
}

static inline void MixOutputs()
{
    Mix(g_plant.mState); Mix(g_plant.mStateCountdown); Mix(g_otherPlant.mWakeUpCounter);
    Mix(g_crater.mGridItemCounter); Mix(g_board.mIceTimer[g_plant.mRow]);
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
        for (int i = 0; i < kN; i++) { SetupState(i); DoSpecialA(); MixOutputs(); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestA) bestA = ns;
    }
    csA = g_checksum; g_checksum = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); DoSpecialB(); MixOutputs(); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestB) bestB = ns;
    }
    csB = g_checksum;

    printf("Plant::DoSpecial | before %.2f ns | after %.2f ns | diff %+.1f%% | csA=%llx csB=%llx %s\n",
        bestA, bestB, (bestB - bestA) / bestA * 100.0,
        (unsigned long long)csA, (unsigned long long)csB, csA == csB ? "checksum=OK" : "checksum=FAIL");
    return csA == csB ? 0 : 1;
}
