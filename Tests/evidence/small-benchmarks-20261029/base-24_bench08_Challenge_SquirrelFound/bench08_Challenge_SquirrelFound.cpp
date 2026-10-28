// bench08 | Challenge::SquirrelFound | 4 case switch on loop var -> kSquirrelStep[4][2] const table
// FormA = ac447d19^, FormB = HEAD. Discriminant is loop induction var i (0..3); input stream drives the
// squirrel state (zombie/else) and grid/plant hit-test stubs identically in both forms.
#include <windows.h>
#include <cstdint>
#include <cstdio>

static uint64_t g_checksum = 0;
static inline void Mix(uint64_t v) { g_checksum = g_checksum * 1315423911ULL + v + 1; }

static const int kN = 2000000;
static uint32_t g_raw[kN];
static int g_pos = 0;
static inline uint32_t NextVal() { uint32_t v = g_raw[g_pos % kN]; g_pos++; return v; }

enum GridItemStateS {
    GRIDITEM_STATE_SQUIRREL_RUNNING_UP = 8, GRIDITEM_STATE_SQUIRREL_RUNNING_DOWN = 9,
    GRIDITEM_STATE_SQUIRREL_RUNNING_LEFT = 10, GRIDITEM_STATE_SQUIRREL_RUNNING_RIGHT = 11,
    GRIDITEM_STATE_SQUIRREL_CAUGHT = 12, GRIDITEM_STATE_SQUIRREL_ZOMBIE = 13
};
enum GridItemTypeS { GRIDITEM_SQUIRREL = 1 };
enum RenderLayer { RENDER_LAYER_GRAVE_STONE = 4 };
enum PlantPriorityS { TOPPLANT_EATING_ORDER = 0 };
const int MESSAGE_STYLE_HINT_FAST = 1;
const int ADVICE_NONE = 0;
const int ADVICE_SQUIRREL_ZOMBIE = 10;

struct ZombieStub { float mPosX; };
static ZombieStub g_zombie;
struct GridItemStub {
    int mGridItemState; int mGridX; int mGridY; int mGridItemCounter; int mRenderOrder;
    void GridItemDie() { Mix(60); }
};
static GridItemStub g_gridItemAt;
struct PlantStub { int dummy; };
static PlantStub g_plantAt;
struct BoardStub {
    ZombieStub* AddZombieInRow(int type, int row, int i) { Mix(61); return &g_zombie; }
    int GridToPixelX(int x, int y) { Mix(62); return x * 80 + y; }
    int GridToPixelY(int x, int y) { Mix(63); return y * 100 + x; }
    void DisplayAdvice(int advice, int style, int none) { Mix(64); Mix((uint64_t)advice); (void)style; (void)none; }
    GridItemStub* GetGridItemAt(GridItemTypeS t, int x, int y) { Mix(65); return (NextVal() & 1) ? nullptr : &g_gridItemAt; }
    PlantStub* GetTopPlantAt(int x, int y, PlantPriorityS p) { Mix(66); return (NextVal() & 3) ? &g_plantAt : nullptr; }
    static int MakeRenderOrder(RenderLayer l, int row, int z) { Mix(67); return ((int)l << 12) + row * 64 + z; }
};
static BoardStub g_board;
struct AppStub { int Pluralize(int n, const char* a, const char* b) { Mix(68); return n; } };
static AppStub g_app;

struct TodWeightedGridArray { int mX; int mY; int mWeight; };
static TodWeightedGridArray g_pickResult;
static TodWeightedGridArray* TodPickFromWeightedGridArray(TodWeightedGridArray* picks, int count) {
    Mix(69);
    g_pickResult = picks[(int)(NextVal() % (uint32_t)count)];
    return &g_pickResult;
}
static const char* kStr1 = "one left";
static const char* kStr2 = "left";

struct ChallengeStub {
    BoardStub* mBoard;
    AppStub* mApp;

    void SquirrelFoundA(GridItemStub* theSquirrel);
    void SquirrelFoundB(GridItemStub* theSquirrel);
    int SquirrelCountUncaught() { Mix(70); return (int)(NextVal() % 3); }
};
static ChallengeStub g_challenge;

// ================= FormA: verbatim switch (ac447d19^) =================
static void Challenge_SquirrelFoundA(ChallengeStub* ch, GridItemStub* theSquirrel)
{
    if (theSquirrel->mGridItemState == GRIDITEM_STATE_SQUIRREL_ZOMBIE)
    {
        ZombieStub* aZombie = ch->mBoard->AddZombieInRow(1, theSquirrel->mGridY, 0);
        aZombie->mPosX = (float)(ch->mBoard->GridToPixelX(theSquirrel->mGridX, theSquirrel->mGridY));
        theSquirrel->GridItemDie();
        ch->mBoard->DisplayAdvice(ADVICE_SQUIRREL_ZOMBIE, MESSAGE_STYLE_HINT_FAST, ADVICE_NONE);
    }
    else
    {
        TodWeightedGridArray aPicks[4];
        int aPickCount = 0;
        for (int i = 0; i < 4; i++)
        {
            int aGridX = theSquirrel->mGridX;
            int aGridY = theSquirrel->mGridY;
            switch (i)
            {
            case 0: aGridX--; break;
            case 1: aGridX++; break;
            case 2: aGridY--; break;
            case 3: aGridY++; break;
            }

            if (!ch->mBoard->GetGridItemAt(GRIDITEM_SQUIRREL, aGridX, aGridY) && ch->mBoard->GetTopPlantAt(aGridX, aGridY, TOPPLANT_EATING_ORDER))
            {
                aPicks[aPickCount].mX = aGridX;
                aPicks[aPickCount].mY = aGridY;
                aPicks[aPickCount].mWeight = 1;
                aPickCount++;
            }
        }

        if (aPickCount > 0)
        {
            TodWeightedGridArray* aGrid = TodPickFromWeightedGridArray(aPicks, aPickCount);

            theSquirrel->mGridItemState =
                aGrid->mX < theSquirrel->mGridX ? GRIDITEM_STATE_SQUIRREL_RUNNING_LEFT :
                aGrid->mX > theSquirrel->mGridX ? GRIDITEM_STATE_SQUIRREL_RUNNING_RIGHT :
                aGrid->mY < theSquirrel->mGridY ? GRIDITEM_STATE_SQUIRREL_RUNNING_UP : GRIDITEM_STATE_SQUIRREL_RUNNING_DOWN;

            theSquirrel->mGridItemCounter = 50;
            theSquirrel->mGridX = aGrid->mX;
            theSquirrel->mGridY = aGrid->mY;
            theSquirrel->mRenderOrder = BoardStub::MakeRenderOrder(RENDER_LAYER_GRAVE_STONE, aGrid->mY, 1);
        }
        else
        {
            theSquirrel->mGridItemState = GRIDITEM_STATE_SQUIRREL_CAUGHT;
            theSquirrel->mGridItemCounter = 100;

            int aSquirrelsRemaining = ch->SquirrelCountUncaught();
            if (aSquirrelsRemaining)
            {
                int aMessage = ch->mApp->Pluralize(aSquirrelsRemaining, kStr1, kStr2);
                Mix((uint64_t)aMessage);
            }
        }
    }
}
void ChallengeStub::SquirrelFoundA(GridItemStub* s) { Challenge_SquirrelFoundA(this, s); }

// ================= FormB: HEAD table =================
namespace {
constexpr int kSquirrelStep[4][2] = {
    {-1, 0},
    {1, 0},
    {0, -1},
    {0, 1},
};
static_assert(sizeof(kSquirrelStep) / sizeof(kSquirrelStep[0]) == 4, "slot sync");
}  // namespace

static void Challenge_SquirrelFoundB(ChallengeStub* ch, GridItemStub* theSquirrel)
{
    if (theSquirrel->mGridItemState == GRIDITEM_STATE_SQUIRREL_ZOMBIE)
    {
        ZombieStub* aZombie = ch->mBoard->AddZombieInRow(1, theSquirrel->mGridY, 0);
        aZombie->mPosX = (float)(ch->mBoard->GridToPixelX(theSquirrel->mGridX, theSquirrel->mGridY));
        theSquirrel->GridItemDie();
        ch->mBoard->DisplayAdvice(ADVICE_SQUIRREL_ZOMBIE, MESSAGE_STYLE_HINT_FAST, ADVICE_NONE);
    }
    else
    {
        TodWeightedGridArray aPicks[4];
        int aPickCount = 0;
        for (int i = 0; i < 4; i++)
        {
            const int* aStep = kSquirrelStep[i];
            int aGridX = theSquirrel->mGridX + aStep[0];
            int aGridY = theSquirrel->mGridY + aStep[1];

            if (!ch->mBoard->GetGridItemAt(GRIDITEM_SQUIRREL, aGridX, aGridY) && ch->mBoard->GetTopPlantAt(aGridX, aGridY, TOPPLANT_EATING_ORDER))
            {
                aPicks[aPickCount].mX = aGridX;
                aPicks[aPickCount].mY = aGridY;
                aPicks[aPickCount].mWeight = 1;
                aPickCount++;
            }
        }

        if (aPickCount > 0)
        {
            TodWeightedGridArray* aGrid = TodPickFromWeightedGridArray(aPicks, aPickCount);

            theSquirrel->mGridItemState =
                aGrid->mX < theSquirrel->mGridX ? GRIDITEM_STATE_SQUIRREL_RUNNING_LEFT :
                aGrid->mX > theSquirrel->mGridX ? GRIDITEM_STATE_SQUIRREL_RUNNING_RIGHT :
                aGrid->mY < theSquirrel->mGridY ? GRIDITEM_STATE_SQUIRREL_RUNNING_UP : GRIDITEM_STATE_SQUIRREL_RUNNING_DOWN;

            theSquirrel->mGridItemCounter = 50;
            theSquirrel->mGridX = aGrid->mX;
            theSquirrel->mGridY = aGrid->mY;
            theSquirrel->mRenderOrder = BoardStub::MakeRenderOrder(RENDER_LAYER_GRAVE_STONE, aGrid->mY, 1);
        }
        else
        {
            theSquirrel->mGridItemState = GRIDITEM_STATE_SQUIRREL_CAUGHT;
            theSquirrel->mGridItemCounter = 100;

            int aSquirrelsRemaining = ch->SquirrelCountUncaught();
            if (aSquirrelsRemaining)
            {
                int aMessage = ch->mApp->Pluralize(aSquirrelsRemaining, kStr1, kStr2);
                Mix((uint64_t)aMessage);
            }
        }
    }
}
void ChallengeStub::SquirrelFoundB(GridItemStub* s) { Challenge_SquirrelFoundB(this, s); }

// ---------------- harness ----------------
static double g_nsPerTick = 0;
static inline double QpcNs() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (double)c.QuadPart * g_nsPerTick; }

static GridItemStub g_squirrel;
static const int kStates[6] = { 13, 10, 11, 8, 9, 12 };  // zombie + running_* + caught

static void SetupState(int i)
{
    uint32_t v = g_raw[i];
    g_squirrel.mGridItemState = kStates[v % 6];
    g_squirrel.mGridX = (int)((v >> 4) % 7) + 1;
    g_squirrel.mGridY = (int)((v >> 7) % 4) + 1;
    g_squirrel.mGridItemCounter = 0;
    g_squirrel.mRenderOrder = 0;
    g_challenge.mBoard = &g_board;
    g_challenge.mApp = &g_app;
    g_zombie.mPosX = 0.0f;
    g_pos = 0;
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
        for (int i = 0; i < kN; i++) { SetupState(i); g_challenge.SquirrelFoundA(&g_squirrel); Mix(g_squirrel.mGridItemState); Mix(g_squirrel.mGridItemCounter); Mix(g_squirrel.mRenderOrder); Mix(g_squirrel.mGridX); Mix(g_squirrel.mGridY); Mix((uint64_t)(g_zombie.mPosX * 10)); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestA) bestA = ns;
    }
    csA = g_checksum; g_checksum = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); g_challenge.SquirrelFoundB(&g_squirrel); Mix(g_squirrel.mGridItemState); Mix(g_squirrel.mGridItemCounter); Mix(g_squirrel.mRenderOrder); Mix(g_squirrel.mGridX); Mix(g_squirrel.mGridY); Mix((uint64_t)(g_zombie.mPosX * 10)); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestB) bestB = ns;
    }
    csB = g_checksum;

    printf("Challenge::SquirrelFound | before %.2f ns | after %.2f ns | diff %+.1f%% | csA=%llx csB=%llx %s\n",
        bestA, bestB, (bestB - bestA) / bestA * 100.0,
        (unsigned long long)csA, (unsigned long long)csB, csA == csB ? "checksum=OK" : "checksum=FAIL");
    return csA == csB ? 0 : 1;
}
