#include "Lawn/Board.h"
#include "Lawn/Zombie.h"
#include "Lawn/CatapultState.h"
#include "Lawn/Plant.h"
#include "Lawn/Projectile.h"
#include "Lawn/Coin.h"
#include "Lawn/LawnMower.h"
#include "Lawn/GridItem.h"
#include "Lawn/Challenge.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/CursorObject.h"
#include "Lawn/MessageWidget.h"
#include "Lawn/System/Music.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Lawn/System/TimeCounterFields.h"
#include "Lawn/System/LevelSaveFormat.h"
#include "misc/FrameTiming.h"
#include <array>
#include <bit>
#include <cmath>
#include <iostream>
#include <stdexcept>
#include <vector>

#include "Lawn/System/SaveRecordMapping.h"
using namespace SaveRecordMapping;

namespace
{
void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

void Configure(unsigned int fps)
{
    Sexy::gUpdateIntervalNs = Sexy::FrameTiming::FromTargetFps(fps).mIntervalNs;
    Sexy::gUpdateTicks = static_cast<double>(Sexy::gUpdateIntervalNs) / Sexy::FrameTiming::LegacyTickNs;
    Sexy::gStepsPerLegacyTick = 1.0 / Sexy::gUpdateTicks;
    Sexy::gLegacyTickPhaseNs = 0;
}

template<class T>
void CheckRecord()
{
    std::vector<std::pair<size_t, bool>> nativeFields;
    VisitTimeCounterOffsets<T>([&](size_t offset, bool isUnsigned) {
        Require(offset + sizeof(Sexy::TimeCounter) <= sizeof(T), "Native time member extends beyond object");
        nativeFields.emplace_back(offset, isUnsigned);
    });
    const auto fields = SaveTimeFields<T>();
    Require(nativeFields.size() == fields.size(), "Schema and native time inventory disagree");
    for (const auto& field : fields)
    {
        const auto offset = NativeTimeOffset<T>(field);
        const auto found = std::find(nativeFields.begin(), nativeFields.end(),
            std::pair<size_t, bool>{offset, field.mUnsigned});
        if (found == nativeFields.end())
            throw std::runtime_error(std::string(field.mName) + ": wire time has no matching native 64-bit member");
        nativeFields.erase(found);
    }
    Require(nativeFields.empty(), "A native timer is omitted from the wire schema");
}

void CheckRuntime()
{
    static_assert(sizeof(Sexy::TimeCounter::Nanoseconds) == 8);
    static_assert(sizeof(Sexy::UnsignedTimeCounter::Nanoseconds) == 8);
    static_assert(sizeof(Sexy::MillisecondCounter::Nanoseconds) == 8);
    static_assert(sizeof(Sexy::SecondCounter::Nanoseconds) == 8);
    for (const unsigned fps : {60u, 100u, 144u, 240u, 250u, 1000u})
    {
        Configure(fps);
        const auto interval = static_cast<std::int64_t>(Sexy::gUpdateIntervalNs);
        Sexy::TimeCounter elapsed = 0;
        for (unsigned step = 1; step <= fps; ++step)
        {
            ++elapsed;
            Require(elapsed.mNanoseconds == interval * step,
                "Increment rounded the configured update interval");
        }
        Sexy::TimeCounter remaining = 3;
        for (unsigned step = 0; step < fps && remaining > 0; ++step) --remaining;
        Require(remaining.mNanoseconds == 0, "Countdown skipped exact expiry");
        Sexy::TimeCounter reversible = 100;
        const auto initial = reversible.mNanoseconds;
        ++reversible;
        Require(reversible.mNanoseconds == initial + interval, "Increment lost nanoseconds");
        --reversible;
        Require(reversible.mNanoseconds == initial, "Increment/decrement did not reverse exactly");
        Sexy::TimeCounter longRunning{};
        longRunning.mNanoseconds = 123'456'789'123'456'789LL;
        longRunning.mPreviousNanoseconds = longRunning.mNanoseconds;
        const auto longInitial = longRunning.mNanoseconds;
        ++longRunning;
        Require(longRunning.mNanoseconds == longInitial + interval,
            "Long-running signed counter lost integer nanosecond precision");
        --longRunning;
        Require(longRunning.mNanoseconds == longInitial,
            "Long-running signed counter did not reverse exactly");
        Sexy::TimeCounter sentinel = -1;
        Require(sentinel.mNanoseconds == -10'000'000 && sentinel == -1,
            "Negative sentinel was not represented exactly");
        for (const int threshold : {1, 3, 7, 25, 50})
        {
            Sexy::TimeCounter increasing = 0;
            Sexy::TimeCounter decreasing = 100;
            unsigned upHits = 0;
            unsigned downHits = 0;
            for (unsigned step = 0; step < fps + 1; ++step)
            {
                ++increasing;
                --decreasing;
                if (increasing == threshold) ++upHits;
                if (decreasing == threshold) ++downHits;
            }
            Require(upHits == 1 && downHits == 1,
                "Threshold equality skipped a crossed boundary or fired twice");
        }
        // Periodic scheduling tests a crossed boundary; an integer conversion
        // of a sub-tick counter would fire repeatedly inside the same tick.
        Sexy::TimeCounter periodic = 0;
        unsigned firings = 0;
        for (unsigned step = 0; step < fps; ++step)
        {
            ++periodic;
            if (periodic % 7 == 0) ++firings;
        }
        const auto expected = static_cast<unsigned>(periodic.mNanoseconds / 70'000'000);
        Require(firings == expected, "Periodic event fired multiple times per crossed boundary");
        Sexy::TimeCounter periodicDown = 100;
        unsigned downFirings = 0;
        for (unsigned step = 0; step < fps && periodicDown > 0; ++step)
        {
            --periodicDown;
            if (periodicDown % 7 == 0) ++downFirings;
        }
        const auto remainingPeriods = static_cast<unsigned>(
            (periodicDown.mNanoseconds + 69'999'999) / 70'000'000);
        Require(downFirings == 15 - remainingPeriods,
            "Decreasing periodic event missed a boundary or fired twice");
        Sexy::TimeCounter longPeriodic{};
        longPeriodic.mNanoseconds = 123'456'789'123'456'789LL;
        longPeriodic.mPreviousNanoseconds = longPeriodic.mNanoseconds;
        const auto firstPeriod = longPeriodic.mNanoseconds / 70'000'000;
        unsigned longFirings = 0;
        for (unsigned step = 0; step < fps; ++step)
        {
            ++longPeriodic;
            if (longPeriodic % 7 == 0) ++longFirings;
        }
        Require(longFirings == static_cast<unsigned>(
            longPeriodic.mNanoseconds / 70'000'000 - firstPeriod),
            "Long-running periodic scheduling lost integer precision");
        constexpr std::int64_t farBoundary = 70'000'000LL * 1'000'000'000;
        Sexy::TimeCounter nearBoundary{};
        nearBoundary.mPreviousNanoseconds = farBoundary - 2;
        nearBoundary.mNanoseconds = farBoundary - 1;
        Require(nearBoundary % 7 != 0, "One-nanosecond-distance periodic test fired before boundary");
        nearBoundary.mPreviousNanoseconds = farBoundary - 1;
        nearBoundary.mNanoseconds = farBoundary;
        Require(nearBoundary % 7 == 0, "Exact large periodic boundary was missed");
        Sexy::UnsignedTimeCounter wrapped = 0;
        --wrapped;
        constexpr std::uint64_t modulus = 4294967296ULL * 10'000'000ULL;
        Require(wrapped.mNanoseconds == modulus - Sexy::gUpdateIntervalNs,
            "Unsigned counter lost its legacy wrap period");
        ++wrapped;
        Require(wrapped.mNanoseconds == 0, "Unsigned counter failed to wrap to zero");
        Sexy::SecondCounter seconds = 3;
        Sexy::MillisecondCounter milliseconds = 3;
        Require(seconds.mNanoseconds == 3'000'000'000LL &&
            milliseconds.mNanoseconds == 3'000'000LL, "Non-tick field units were confused");
        // Switching FPS changes future advancement only. Values are not scaled
        // when imported/exported or when changing the update cadence.
        Sexy::TimeCounter precise{};
        precise.mNanoseconds = 123'456'789;
        precise.mPreviousNanoseconds = precise.mNanoseconds;
        for (const unsigned destination : {60u, 100u, 144u, 240u, 250u, 1000u})
        {
            Configure(destination);
            Require(precise.mNanoseconds == 123'456'789, "Changing FPS changed stored time");
        }
    }
}

template<class T>
void CheckLiveSave()
{
    // These two particle record types have ordinary aggregate lifetimes, so
    // their actual save functions can run without constructing game/UI objects.
    T source{};
    const auto fields = SaveTimeFields<T>();
    std::uint64_t ordinal = 0;
    for (const auto& field : fields)
    {
        const std::uint64_t ns = 123'456'789 + ordinal++ * 987'654'321;
        const auto offset = NativeTimeOffset<T>(field);
        std::memcpy(ObjectBytes(source) + offset, &ns, 8);
        std::memcpy(ObjectBytes(source) + offset + 8, &ns, 8);
    }
    const auto original = WriteSaveRecord(source);
    for (const unsigned fps : {60u, 100u, 144u, 240u, 250u, 1000u})
    {
        Configure(fps);
        T restored{};
        ReadSaveRecord(restored, original.data());
        Require(WriteSaveRecord(restored) == original,
            "Real native v2 save/load lost sub-tick nanoseconds across FPS");
        for (const auto& field : fields)
        {
            const auto offset = NativeTimeOffset<T>(field);
            std::uint64_t current;
            std::uint64_t previous;
            std::memcpy(&current, ObjectBytes(restored) + offset, 8);
            std::memcpy(&previous, ObjectBytes(restored) + offset + 8, 8);
            Require(current == previous, "Load retained stale threshold history");
        }
    }
}
}

namespace
{
void CheckBlendRegionSave()
{
    static_assert(sizeof(ReanimatorTransform) == 72);
    static_assert(offsetof(ReanimatorTransform, mImageRegion) == 32);
    static_assert(std::is_trivially_copyable_v<ReanimatorTrackInstance>);
    // Construct zeroed native records without the gameplay track constructor.
    auto source = std::bit_cast<ReanimatorTrackInstance>(
        std::array<std::byte, sizeof(ReanimatorTrackInstance)>{});
    const auto withoutRegion = WriteSaveRecord(source);
    source.mBlendTransform.mImageRegion = {2, 2, 16, 8, 1, 1};
    Require(WriteSaveRecord(source) == withoutRegion,
        "Definition atlas geometry leaked into DAT64");
    auto restored = source;
    ReadSaveRecord(restored, withoutRegion.data());
    Require(restored.mBlendTransform.mImageRegion.mWidth == 0,
        "Loading DAT64 retained definition atlas geometry");
}

void CheckCatapultCycle()
{
    using enum CatapultLoadState;
    Require(SaveV2Size<Zombie>() == 436 && Dat64Layout<Zombie>::SlotSize() == 444,
        "Catapult presentation changed the DAT64 v2 record");
    Require(CatapultCycle::Resolve(true, true, CatapultCycle::ProjectileEvent) == Loaded,
        "Projectile creation incorrectly released the carried ball early");
    Require(CatapultCycle::Resolve(true, true, 17.0f / 31.0f) == Released,
        "Catapult release boundary lost");
    Require(CatapultCycle::Resolve(true, true, 1.0f) == Loaded,
        "Catapult did not reload at completion");
    for (int fps : {60, 100, 144, 240, 250, 1000})
        for (float rate : {0.0f, 12.0f, 24.0f}) // Immobilized, chilled and normal.
        {
            float progress = 0.0f;
            const float step = rate / (32.0f * fps);
            for (int update = 0; update < fps * 3; ++update)
            {
                // Independent reference: the launch clip is 25..56. The
                // historic discrete pose carries a ball outside frames 42..55.
                const int frame = int(std::floor(25.0f + progress * 31.0f));
                const auto expected = frame < 42 || frame >= 56 ? Loaded : Released;
                Require(CatapultCycle::Resolve(true, true, progress) == expected,
                    "Catapult pose changed across FPS/chill/freeze");
                Require(CatapultCycle::Resolve(true, false, progress) == Empty,
                    "Catapult displayed ammunition after exhaustion");
                Require(CatapultCycle::Resolve(false, true, progress) == Loaded,
                    "Normal/reloading/death state retained the firing pose");
                // Loading derives the same state using only saved phase,
                // ammunition and numeric progress; no transient event history.
                const float savedProgress = progress;
                Require(CatapultCycle::Resolve(true, true, savedProgress) == expected,
                    "Catapult load recovery changed the carried ball");
                if (step == 0.0f) break;
                progress = std::min(1.0f, progress + step);
            }
        }
}
}

int main()
{
    try
    {
        CheckRecord<Board>();
        CheckRecord<Zombie>();
        CheckRecord<Plant>();
        CheckRecord<Projectile>();
        CheckRecord<Coin>();
        CheckRecord<LawnMower>();
        CheckRecord<GridItem>();
        CheckRecord<TodParticle>();
        CheckRecord<TodParticleEmitter>();
        CheckRecord<ReanimatorTrackInstance>();
        CheckRecord<CursorObject>();
        CheckRecord<MessageWidget>();
        CheckRecord<SeedPacket>();
        CheckRecord<SeedBank>();
        CheckRecord<Challenge>();
        CheckRecord<Music>();
        CheckRecord<CursorPreview>();
        CheckRecord<TodParticleSystem>();
        CheckRecord<Reanimation>();
        CheckRecord<Attachment>();
        CheckRuntime();
        CheckBlendRegionSave();
        CheckCatapultCycle();
        CheckLiveSave<TodParticle>();
        CheckLiveSave<TodParticleEmitter>();
        Configure(100);
        std::cout << "PASS: 20 native save types, 134 exact 64-bit mappings; catapult cycle/recovery; six FPS settings, "
            "nanosecond advancement, countdown expiry, periodic events, sentinels and unsigned wrap\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
