// bench07 | Challenge::BeghouledPickSeed | 6 case switch on loop var -> kBeghouledSeedChoices const table
// FormA = ac447d19^, FormB = HEAD. NOTE: discriminant is the loop induction variable i (0..5), not a free
// enum input; the closest constructible benchmark drives the auxiliary branches (match test / upgrades)
// from the shared input stream so both forms traverse identical control flow.
#include <windows.h>
#include <cstdint>
#include <cstdio>

static uint64_t g_checksum = 0;
static inline void Mix(uint64_t v) { g_checksum = g_checksum * 1315423911ULL + v + 1; }

static const int kN = 2000000;
static uint32_t g_raw[kN];
static int g_pos = 0;
static inline uint32_t NextVal() { uint32_t v = g_raw[g_pos % kN]; g_pos++; return v; }

enum SeedTypeB {
    SEED_NONE = 0, SEED_PEASHOOTER = 1, SEED_SNOWPEA = 2, SEED_PUFFSHROOM = 3, SEED_STARFRUIT = 4,
    SEED_MAGNETSHROOM = 5, SEED_WALLNUT = 6, SEED_REPEATER = 7, SEED_FUMESHROOM = 8, SEED_TALLNUT = 9
};
enum BeghouledUpgrade { BEGHOULED_UPGRADE_REPEATER = 0, BEGHOULED_UPGRADE_FUMESHROOM = 1, BEGHOULED_UPGRADE_TALLNUT = 2 };
const int BEGHOULED_MAX_GRIDSIZEX = 9;
const int BEGHOULED_MAX_GRIDSIZEY = 5;

static inline void TOD_ASSERT_IMPL(bool) {}
#define TOD_ASSERT(x) TOD_ASSERT_IMPL((x))  // release no-op (game asserts compiled out)

struct BeghouledBoardState {
    SeedTypeB mSeedType[9][5];
};
struct TodPickState { int dummy; };

static bool BeghouledBoardHasMatch(BeghouledBoardState* s) { Mix(50); (void)s; return (NextVal() & 1) != 0; }
static SeedTypeB TodPickFromArray(SeedTypeB* arr, int count) { Mix(51); SeedTypeB r = SEED_NONE; for (int k = 0; k < count; k++) r = (SeedTypeB)((int)arr[k] + k); return r; }

struct ChallengeStub {
    bool mBeghouledPurcasedUpgrade[3];

    SeedTypeB BeghouledPickSeedA(int theGridX, int theGridY, BeghouledBoardState* theBoardState, int theAllowMatches);
    SeedTypeB BeghouledPickSeedB(int theGridX, int theGridY, BeghouledBoardState* theBoardState, int theAllowMatches);
};
static ChallengeStub g_challenge;

// ================= FormA: verbatim switch (ac447d19^) =================
namespace {
SeedTypeB ChallengeStub_BeghouledPickSeedA(int theGridX, int theGridY, BeghouledBoardState* theBoardState, int theAllowMatches)
{
    TOD_ASSERT(theBoardState->mSeedType[theGridX][theGridY] == SEED_NONE);
    int aCount = 0;
    SeedTypeB aPickArray[6];

    for (int i = 0; i < 6; i++)
    {
        SeedTypeB aSeedType;
        switch (i)
        {
        case 0:     aSeedType = SeedTypeB::SEED_PUFFSHROOM;      break;
        case 1:     aSeedType = SeedTypeB::SEED_STARFRUIT;       break;
        case 2:     aSeedType = SeedTypeB::SEED_MAGNETSHROOM;    break;
        case 3:     aSeedType = SeedTypeB::SEED_SNOWPEA;         break;
        case 4:     aSeedType = SeedTypeB::SEED_WALLNUT;         break;
        case 5:     aSeedType = SeedTypeB::SEED_PEASHOOTER;      break;
        default:    TOD_ASSERT(false);                           break;
        }

        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_REPEATER] && aSeedType == SeedTypeB::SEED_PEASHOOTER)
        {
            aSeedType = SeedTypeB::SEED_REPEATER;
        }
        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_FUMESHROOM] && aSeedType == SeedTypeB::SEED_PUFFSHROOM)
        {
            aSeedType = SeedTypeB::SEED_FUMESHROOM;
        }
        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_TALLNUT] && aSeedType == SeedTypeB::SEED_WALLNUT)
        {
            aSeedType = SeedTypeB::SEED_TALLNUT;
        }

        theBoardState->mSeedType[theGridX][theGridY] = aSeedType;

        if (theAllowMatches || !BeghouledBoardHasMatch(theBoardState))
        {
            aPickArray[aCount] = aSeedType;
            aCount++;
        }
    }

    theBoardState->mSeedType[theGridX][theGridY] = SEED_NONE;
    return TodPickFromArray(aPickArray, aCount);
}
}  // namespace
SeedTypeB ChallengeStub::BeghouledPickSeedA(int x, int y, BeghouledBoardState* s, int m)
{
    return ChallengeStub_BeghouledPickSeedA(x, y, s, m);
}

// ================= FormB: HEAD table =================
namespace {
constexpr SeedTypeB kBeghouledSeedChoices[6] = {
    SeedTypeB::SEED_PUFFSHROOM,
    SeedTypeB::SEED_STARFRUIT,
    SeedTypeB::SEED_MAGNETSHROOM,
    SeedTypeB::SEED_SNOWPEA,
    SeedTypeB::SEED_WALLNUT,
    SeedTypeB::SEED_PEASHOOTER,
};
static_assert(sizeof(kBeghouledSeedChoices) / sizeof(kBeghouledSeedChoices[0]) == 6, "slot sync");

SeedTypeB ChallengeStub_BeghouledPickSeedB(int theGridX, int theGridY, BeghouledBoardState* theBoardState, int theAllowMatches)
{
    TOD_ASSERT(theBoardState->mSeedType[theGridX][theGridY] == SEED_NONE);
    int aCount = 0;
    SeedTypeB aPickArray[6];

    for (int i = 0; i < 6; i++)
    {
        TOD_ASSERT((unsigned)i < 6);
        SeedTypeB aSeedType = kBeghouledSeedChoices[i];

        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_REPEATER] && aSeedType == SeedTypeB::SEED_PEASHOOTER)
        {
            aSeedType = SeedTypeB::SEED_REPEATER;
        }
        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_FUMESHROOM] && aSeedType == SeedTypeB::SEED_PUFFSHROOM)
        {
            aSeedType = SeedTypeB::SEED_FUMESHROOM;
        }
        if (g_challenge.mBeghouledPurcasedUpgrade[(int)BeghouledUpgrade::BEGHOULED_UPGRADE_TALLNUT] && aSeedType == SeedTypeB::SEED_WALLNUT)
        {
            aSeedType = SeedTypeB::SEED_TALLNUT;
        }

        theBoardState->mSeedType[theGridX][theGridY] = aSeedType;

        if (theAllowMatches || !BeghouledBoardHasMatch(theBoardState))
        {
            aPickArray[aCount] = aSeedType;
            aCount++;
        }
    }

    theBoardState->mSeedType[theGridX][theGridY] = SEED_NONE;
    return TodPickFromArray(aPickArray, aCount);
}
}  // namespace
SeedTypeB ChallengeStub::BeghouledPickSeedB(int x, int y, BeghouledBoardState* s, int m)
{
    return ChallengeStub_BeghouledPickSeedB(x, y, s, m);
}

// ---------------- harness ----------------
static double g_nsPerTick = 0;
static inline double QpcNs() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (double)c.QuadPart * g_nsPerTick; }

static BeghouledBoardState g_boardState;
static void SetupState(int i)
{
    uint32_t v = g_raw[i];
    g_challenge.mBeghouledPurcasedUpgrade[0] = ((v >> 2) & 1) != 0;
    g_challenge.mBeghouledPurcasedUpgrade[1] = ((v >> 3) & 1) != 0;
    g_challenge.mBeghouledPurcasedUpgrade[2] = ((v >> 4) & 1) != 0;
    for (int a = 0; a < 9; a++) for (int b = 0; b < 5; b++) g_boardState.mSeedType[a][b] = SEED_NONE;
    g_pos = 0;
}

int main()
{
    LARGE_INTEGER f; QueryPerformanceFrequency(&f); g_nsPerTick = 1e9 / (double)f.QuadPart;
    uint32_t x = 0x9E3779B9u;
    for (int i = 0; i < kN; i++) { x ^= x << 13; x ^= x >> 17; x ^= x << 5; g_raw[i] = x; }

    double bestA = 1e300, bestB = 1e300;
    uint64_t csA = 0, csB = 0;
    SeedTypeB sinkA = SEED_NONE, sinkB = SEED_NONE;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); sinkA = g_challenge.BeghouledPickSeedA(4, 2, &g_boardState, 0); Mix(sinkA); Mix(g_boardState.mSeedType[4][2]); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestA) bestA = ns;
    }
    csA = g_checksum; g_checksum = 0;
    for (int r = 0; r < 5; r++) {
        double t0 = QpcNs();
        for (int i = 0; i < kN; i++) { SetupState(i); sinkB = g_challenge.BeghouledPickSeedB(4, 2, &g_boardState, 0); Mix(sinkB); Mix(g_boardState.mSeedType[4][2]); }
        double t1 = QpcNs();
        double ns = (t1 - t0) / kN; if (ns < bestB) bestB = ns;
    }
    csB = g_checksum;

    printf("Challenge::BeghouledPickSeed | before %.2f ns | after %.2f ns | diff %+.1f%% | csA=%llx csB=%llx %s\n",
        bestA, bestB, (bestB - bestA) / bestA * 100.0,
        (unsigned long long)csA, (unsigned long long)csB, csA == csB ? "checksum=OK" : "checksum=FAIL");
    return csA == csB ? 0 : 1;
}
