#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Resources.h"
#include "Lawn/Board.h"
#include "Lawn/Plant.h"
#include "Lawn/Zombie.h"
#include "Lawn/System/PlayerInfo.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/Font.h"
#include "SexyAppFramework/graphics/Image.h"
#include <bit>
#include <cstdio>
#include <cstring>
#include <random>
#include <stdexcept>

bool (*gAppCloseRequest)();
namespace {
volatile unsigned long long sink;
volatile unsigned int callbacks;
class FixtureFont final : public Sexy::_Font {
public:
    _Font* Duplicate() override { return new FixtureFont(*this); }
};
void Require(bool condition, const char* message) { if (!condition) throw std::runtime_error(message); }
template<class F> __declspec(noinline) unsigned long long Invoke(void* context)
{
    return (*static_cast<F*>(context))();
}
template<class F> void Measure(const char* name, int count, F function)
{
    const auto expected = function();
    using Query = unsigned long long (*)(void*);
    Query volatile selected = &Invoke<F>; // Keep pure read-only queries inside every timed iteration under LTCG.
    LARGE_INTEGER frequency, begin, end;
    QueryPerformanceFrequency(&frequency);
    for (int round = 0; round < 5; ++round) {
        unsigned long long checksum = 0;
        QueryPerformanceCounter(&begin);
        for (int i = 0; i < count; ++i) checksum += selected(&function);
        QueryPerformanceCounter(&end);
        sink = checksum;
        Require(checksum == expected * count, "Structure benchmark result changed");
        std::printf("%s,%d,%d,%.6f,%llu\n", name, round, count,
            (end.QuadPart - begin.QuadPart) * 1e9 / frequency.QuadPart / count, checksum);
    }
    std::fflush(stdout);
}
// The downstream work is identical in both selection algorithms and observable
// under LTCG. This is a selection benchmark, not complete attachment simulation.
__declspec(noinline) void AttachmentHook(unsigned int) { callbacks = callbacks + 1; }
__declspec(noinline) void AttacherHook(unsigned int) { callbacks = callbacks + 1; }
constexpr int Reanims = 250, Tracks = 30;
ReanimatorTrackInstance tracks[Reanims][Tracks];
unsigned long long active[Reanims];
unsigned int groups[Reanims];
constexpr unsigned long long Attachers = (1ULL << 3) | (1ULL << 7);
void SeedTracks(bool populated)
{
    for (int r = 0; r < Reanims; ++r) {
        active[r] = 0;
        groups[r] = 0;
        for (int t = 0; t < Tracks; ++t) {
            auto& track = tracks[r][t];
            track.mBlendCounter = 0;
            track.mAttachmentID = AttachmentID::ATTACHMENTID_NULL;
            track.mShakeOverride = 0;
            track.mRenderGroup = t < 25 ? 0 : 2 + 2 * ((t - 25) % 3);
            track.mBlendTransform.mTransX = static_cast<float>(r + t);
            track.mBlendTransform.mTransY = static_cast<float>(r - t);
            groups[r] |= 1U << track.mRenderGroup;
            if (populated && ((r * 31 + t * 7) % 1000) < 50) {
                track.mAttachmentID = static_cast<AttachmentID>(0x10000 | t);
                active[r] |= 1ULL << t;
            }
        }
    }
}
unsigned long long Visit(int r, unsigned int t)
{
    auto& track = tracks[r][t];
    unsigned long long result = 0;
    if (track.mBlendCounter > 0) { --track.mBlendCounter; ++result; }
    if (track.mShakeOverride != 0) { track.mShakeX = 1; ++result; }
    if (track.mAttachmentID != AttachmentID::ATTACHMENTID_NULL) { AttachmentHook(static_cast<unsigned int>(track.mAttachmentID)); ++result; }
    if (t == 3 || t == 7) AttacherHook(t);
    return result;
}
__declspec(noinline) unsigned long long ScanTracks()
{
    unsigned long long result = 0;
    for (int r = 0; r < Reanims; ++r) for (unsigned int t = 0; t < Tracks; ++t) result += Visit(r, t);
    return result;
}
__declspec(noinline) unsigned long long MaskTracks()
{
    unsigned long long result = 0;
    for (int r = 0; r < Reanims; ++r) {
        auto mask = active[r] | Attachers;
        while (mask) { const unsigned int t = static_cast<unsigned int>(std::countr_zero(mask)); mask &= mask - 1; result += Visit(r, t); }
    }
    return result;
}
unsigned long long ColdMarker(const ReanimatorTrackInstance& track)
{
    unsigned long long bits;
    std::memcpy(&bits, &track.mBlendTransform.mTransX, sizeof(bits));
    return bits + track.mBlendTime.mNanoseconds;
}
__declspec(noinline) unsigned long long AllGroups()
{
    unsigned long long result = 0;
    for (int r = 0; r < Reanims; ++r) for (int group = 0; group < 18; ++group)
        for (int t = 0; t < Tracks; ++t) if (tracks[r][t].mRenderGroup == group) result += ColdMarker(tracks[r][t]);
    return result;
}
__declspec(noinline) unsigned long long OccupiedGroups()
{
    unsigned long long result = 0;
    for (int r = 0; r < Reanims; ++r) {
        auto mask = groups[r];
        while (mask) {
            const unsigned int group = static_cast<unsigned int>(std::countr_zero(mask)); mask &= mask - 1;
            for (int t = 0; t < Tracks; ++t) if (static_cast<unsigned int>(tracks[r][t].mRenderGroup) == group) result += ColdMarker(tracks[r][t]);
        }
    }
    return result;
}
void PoolPlants(Board& board, int x, int y, PlantsOnLawn& output)
{
    output = {};
    Plant* plant = nullptr;
    while (board.IteratePlants(plant)) {
        const SeedType type = plant->mSeedType;
        if (plant->mRow != y) continue;
        if (type == SEED_COBCANNON) { if (plant->mPlantCol < x - 1 || plant->mPlantCol > x) continue; }
        else if (plant->mPlantCol != x) continue;
        if (plant->NotOnGround()) continue;
        if (Plant::IsFlying(type)) output.mFlyingPlant = plant;
        else if (type == SEED_FLOWERPOT || type == SEED_LILYPAD) output.mUnderPlant = plant;
        else if (type == SEED_PUMPKINSHELL) output.mPumpkinPlant = plant;
        else output.mNormalPlant = plant;
    }
}
unsigned long long CellHash(Board& board, const PlantsOnLawn& value)
{
    unsigned long long result = 0;
    for (Plant* item : {value.mUnderPlant, value.mNormalPlant, value.mPumpkinPlant, value.mFlyingPlant})
        result = result * 257 + (item ? board.PlantSlotOf(item) + 1 : 0);
    return result;
}
}
int main()
{
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    try {
        Require(SetProcessAffinityMask(GetCurrentProcess(), 0x4000), "Cannot pin LP14");
        std::printf("# actual sizes: Zombie=%zu Plant=%zu ReanimatorTrackInstance=%zu TodParticle=%zu\n", sizeof(Zombie), sizeof(Plant), sizeof(ReanimatorTrackInstance), sizeof(TodParticle));
        std::printf("kernel,round,calls,ns_per_call,checksum\n");
        for (bool populated : {false, true}) {
            SeedTracks(populated);
            callbacks = 0; const auto scan = ScanTracks(); const auto before = callbacks;
            callbacks = 0; const auto masked = MaskTracks();
            Require(scan == masked && before == callbacks, "Activity selection changes downstream calls");
            Measure(populated ? "tracks_scan_5pct" : "tracks_scan_0pct", 2000, ScanTracks);
            Measure(populated ? "tracks_mask_5pct" : "tracks_mask_0pct", 2000, MaskTracks);
        }
        Require(AllGroups() == OccupiedGroups(), "Render-group selection changes selected records");
        Measure("groups_all_18", 2000, AllGroups);
        Measure("groups_occupied", 2000, OccupiedGroups);
        LawnApp app;
        gLawnApp = &app;
        PlayerInfo profile;
        profile.mLevel = 11;
        app.mPlayerInfo = &profile;
        app.mGameMode = GAMEMODE_SURVIVAL_ENDLESS_STAGE_3;
        FixtureFont font;
        Sexy::FONT_TINYBOLD = &font;
        app.mDDInterface = new Sexy::DDInterface(&app);
        Sexy::Image bank(&app); bank.mWidth = 446; bank.mHeight = 87; Sexy::IMAGE_SEEDBANK = &bank;
        app.mEffectSystem = new EffectSystem;
        app.mEffectSystem->EffectSystemInitialize();
        auto* board = new Board(&app);
        for (int i = 0; i < 1024; ++i) {
            auto* zombie = board->mZombies.DataArrayAlloc();
            zombie->mRow = i % 6; zombie->mZombieType = ZOMBIE_NORMAL; zombie->mDead = false;
        }
        board->RebuildZombieRowBucket();
        auto pool = [&] {
            unsigned long long hit = 0; Zombie* zombie = nullptr;
            while (board->IterateZombies(zombie)) if (zombie->mRow == 3) ++hit;
            return hit;
        };
        auto row = [&] {
            unsigned long long hit = 0; Zombie* zombie = nullptr;
            while (board->IterateZombiesInRowOnly(3, zombie)) if (zombie->mRow == 3) ++hit;
            return hit;
        };
        Require(pool() == 171 && pool() == row(), "Row candidates differ");
        Measure("zombies_actual_pool_1024", 200000, pool);
        Measure("zombies_actual_row_171", 200000, row);
        bool occupied[6][9][4]{};
        std::mt19937 rng(20261003);
        auto place = [&](int type) {
            for (;;) {
                const int x = rng() % 9, y = rng() % 6;
                const int layer = type == 1 ? 0 : type == 2 ? 2 : type == 3 ? 3 : 1;
                if (occupied[y][x][layer]) continue;
                if (type == 4 && (x + 1 >= 9 || occupied[y][x+1][1])) continue;
                auto* plant = board->mPlants.DataArrayAlloc();
                plant->mRow = y; plant->mPlantCol = x;
                const SeedType seeds[]{SEED_PEASHOOTER, SEED_FLOWERPOT, SEED_PUMPKINSHELL, SEED_INSTANT_COFFEE, SEED_COBCANNON};
                plant->mSeedType = seeds[type]; plant->mImitaterType = SEED_NONE; plant->mIsOnBoard = true;
                board->RegisterPlantCellBucket(plant);
                occupied[y][x][layer] = true;
                if (type == 4) occupied[y][x+1][1] = true;
                return;
            }
        };
        for (int i = 0; i < 40; ++i) place(0);
        for (int type : {4,1,2,3}) for (int i = 0; i < 2; ++i) place(type);
        for (int y = 0; y < 6; ++y) for (int x = 0; x < 9; ++x) {
            PlantsOnLawn a{}, b{}; PoolPlants(*board, x, y, a); board->GetPlantsOnLawn(x, y, &b);
            Require(CellHash(*board, a) == CellHash(*board, b), "Cell selection differs");
        }
        // Keep the historical 2M uniformly generated cell queries in the same order.
        constexpr int Queries = 2000000;
        static int xs[Queries], ys[Queries];
        for (int i = 0; i < Queries; ++i) { xs[i] = rng() % 9; ys[i] = rng() % 6; }
        LARGE_INTEGER frequency, begin, end; QueryPerformanceFrequency(&frequency);
        unsigned long long expected = 0;
        for (int i = 0; i < Queries; ++i) { PlantsOnLawn result{}; PoolPlants(*board, xs[i], ys[i], result); expected += CellHash(*board, result); }
        for (bool indexed : {false,true}) for (int round = 0; round < 5; ++round) {
            unsigned long long hash = 0; QueryPerformanceCounter(&begin);
            for (int i = 0; i < Queries; ++i) {
                PlantsOnLawn result{};
                if (indexed) board->GetPlantsOnLawn(xs[i], ys[i], &result); else PoolPlants(*board, xs[i], ys[i], result);
                hash += CellHash(*board, result);
            }
            QueryPerformanceCounter(&end); sink = hash;
            Require(hash == expected, "Timed cell checksum differs");
            std::printf("%s,%d,%d,%.6f,%llu\n", indexed ? "plants_actual_bucket_48" : "plants_actual_pool_48", round, Queries,
                (end.QuadPart - begin.QuadPart) * 1e9 / frequency.QuadPart / Queries, hash);
        }
        delete board;
        app.mBoard = nullptr;
        app.mPlayerInfo = nullptr;
        Sexy::IMAGE_SEEDBANK = nullptr;
        Sexy::FONT_TINYBOLD = nullptr;
        return 0;
    } catch (const std::exception& error) { std::fprintf(stderr, "FAIL: %s\n", error.what()); return 1; }
}
