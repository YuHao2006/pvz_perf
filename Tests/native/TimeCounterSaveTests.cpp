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
        const size_t width = [&] {
            if constexpr (std::is_same_v<T, Board>)
                if (offset == offsetof(Board, mLevelTimeNs)) return sizeof(std::uint64_t);
            return sizeof(Sexy::TimeCounter);
        }();
        Require(offset + width <= sizeof(T), "Native time member extends beyond object");
        nativeFields.emplace_back(offset, isUnsigned);
    });
    const auto fields = SaveTimeFields<T>();
    if constexpr (std::is_same_v<T, Projectile>)
    {
        Require(nativeFields.empty() && fields.size() == 4,
            "Projectile frozen timer projections were mistaken for native countdowns");
        return;
    }
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
    static_assert(std::is_same_v<decltype(Board::mLevelTimeNs), std::uint64_t>);
    static_assert(std::is_same_v<decltype(GameObject::mX), float>);
    static_assert(std::is_same_v<decltype(GameObject::mY), float>);
    static_assert(std::is_same_v<decltype(Plant::mZenProductionCountdown), Sexy::TimeCounter>);
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
        std::uint64_t battle = modulus - 1;
        battle += Sexy::gUpdateIntervalNs;
        Require(battle == modulus - 1 + Sexy::gUpdateIntervalNs,
            "Battle clock wrapped at the legacy unsigned 32-bit tick boundary");
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
    if constexpr (std::is_same_v<T, TodParticle>)
    {
        source.mParticleLastSampleAgeNs = 21'234'567;
        source.mAnimationElapsedNs = 123'456'789'012;
        source.mAnimationSampleIntegral = 987'654'321;
        source.mRandomSeed = 0x71234567U;
        source.mLinearOriginX = 1'048'576.015625;
        source.mLinearOriginY = -1'048'576.03125;
        source.mLinearElapsedNs = 1'250'001;
        source.mLinearVelocity = {.125f,-.25f};
        source.mLinearLastPosition = {1'048'576.f,-1'048'576.f};
        source.mLinearSpinOrigin = 1'048'576.015625;
        source.mLinearSpinRate = .125;
        source.mLinearLastSpin = 1'048'576.f;
        source.mLinearSpinActive = 1;
    }
    else if constexpr (std::is_same_v<T, TodParticleEmitter>)
    {
        source.mEmissionElapsedNs = 34'567'891;
        source.mSystemPositionOriginX = 1'048'576.015625;
        source.mSystemPositionOriginY = -1'048'576.03125;
        source.mSystemPositionBound = 1;
        source.mSpawnRemainder = 123'456'789'012;
        source.mExternalTarget = {12.25f, -31.5f};
        source.mExternalAppliedCenter = {-21.5f, 43.25f};
    }
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
    const auto tail = std::span(original).subspan(SaveV2Size<T>());
    if constexpr (std::is_same_v<T, TodParticleEmitter>)
        Require(tail.size() == 52 && V7SaveSchema::Read(tail,0,8) == 123'456'789'012LL &&
            V7SaveSchema::Read(tail,8,8) == 34'567'891 &&
            V7SaveSchema::Float(tail,16) == 12.25f && V7SaveSchema::Float(tail,20) == -31.5f &&
            V7SaveSchema::Float(tail,24) == -21.5f && V7SaveSchema::Float(tail,28) == 43.25f &&
            V7SaveSchema::Double(tail,32) == 1'048'576.015625 &&
            V7SaveSchema::Double(tail,40) == -1'048'576.03125 &&
            V7SaveSchema::Read(tail,48,4) == 1,
            "Emitter exact curve origin/external input fields differ from their frozen wire offsets");
    if constexpr (std::is_same_v<T, TodParticle>)
        Require(tail.size() == 92 && V7SaveSchema::Read(tail, 0, 8) == 21'234'567 &&
            V7SaveSchema::Read(tail, 8, 8) == 123'456'789'012LL &&
            V7SaveSchema::Read(tail, 16, 8) == 987'654'321 &&
            V7SaveSchema::Read(tail, 24, 4) == 0x71234567U &&
            V7SaveSchema::Double(tail,28)==1'048'576.015625 &&
            V7SaveSchema::Double(tail,36)==-1'048'576.03125 &&
            V7SaveSchema::Read(tail,44,8)==1'250'001 &&
            V7SaveSchema::Float(tail,52)==.125f &&
            V7SaveSchema::Float(tail,56)==-.25f &&
            V7SaveSchema::Float(tail,60)==1'048'576.f &&
            V7SaveSchema::Float(tail,64)==-1'048'576.f &&
            V7SaveSchema::Double(tail,68)==1'048'576.015625 &&
            V7SaveSchema::Double(tail,76)==.125 &&
            V7SaveSchema::Float(tail,84)==1'048'576.f &&
            V7SaveSchema::Read(tail,88,4)==1,
            "Native particle main-step tail retained a removed current sample or shifted its exact fields");
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
template<class T>
void CheckObjectCoordinateSave()
{
    static_assert(std::is_trivially_copyable_v<T>);
    auto source = std::bit_cast<T>(std::array<std::byte, sizeof(T)>{});
    source.mX = 123.75f;
    source.mY = -45.25f;
    if constexpr (std::is_same_v<T, SeedPacket>)
        source.mSlotMachineCountDown.mNanoseconds = 1'234'567'891;
    if constexpr (std::is_same_v<T, SeedBank>)
        for (int i = 0; i < 10; ++i)
        {
            source.mSeedPackets[i].mX = 20.0f + i;
            source.mSeedPackets[i].mY = -10.0f - i;
            source.mSeedPackets[i].mSlotMachineCountDown.mNanoseconds = 123'456'789 + i;
        }
    const auto bytes = WriteSaveRecord(source);
    const auto canonical = Dat64TimeSchema::Collapse(bytes, SaveTimeFields<T>(),
        [](const auto&, std::uint64_t) { return std::uint32_t(0); });
    Require(V7SaveSchema::Read(canonical, 16, 4) == 123 &&
        V7SaveSchema::Read(canonical, 20, 4) == std::uint32_t(-45),
        "Float GameObject coordinates were copied as raw bits into historical integer slots");
    auto restored = std::bit_cast<T>(std::array<std::byte, sizeof(T)>{});
    ReadSaveRecord(restored, bytes.data());
    constexpr bool exactActor = std::is_same_v<T, Plant> || std::is_same_v<T, Zombie>;
    Require(restored.mX == (exactActor ? 123.75f : 123.0f) &&
        restored.mY == (exactActor ? -45.25f : -45.0f),
        "GameObject integer projection or exact actor coordinate restoration failed");
    if constexpr (std::is_same_v<T, SeedBank>)
        for (int i = 0; i < 10; ++i)
            Require(restored.mSeedPackets[i].mX == source.mSeedPackets[i].mX &&
                restored.mSeedPackets[i].mY == source.mSeedPackets[i].mY &&
                restored.mSeedPackets[i].mSlotMachineCountDown.mNanoseconds ==
                    source.mSeedPackets[i].mSlotMachineCountDown.mNanoseconds,
                "Nested SeedPacket coordinates or slot phase did not survive SeedBank serialization");
    if constexpr (std::is_same_v<T, SeedPacket>)
        Require(restored.mSlotMachineCountDown.mNanoseconds == source.mSlotMachineCountDown.mNanoseconds,
            "Slot-machine integer nanosecond phase did not survive serialization");
    Require(WriteSaveRecord(restored) == bytes, "GameObject coordinate save was not stable after reload");
}

void CheckPlantDeadlineSave()
{
    static_assert(std::is_trivially_copyable_v<Plant>);
    auto source = std::bit_cast<Plant>(std::array<std::byte, sizeof(Plant)>{});
    source.mSeedType = SeedType::SEED_PEASHOOTER;
    source.mState = PlantState::STATE_READY;
    source.mLaunchWindowStartNs = 91'234'567'891;
    source.mNextLaunchTimeNs = source.mLaunchWindowStartNs + 217'123'456;
    source.mZenProductionCountdown.mNanoseconds = 333'333'333;
    source.mMagnetElapsedNs = 31'234'567;
    for (auto& item : source.mMagnetItems)
    {
        item.mPosX = 321.25f;
        item.mPosY = -12.125f;
        item.mOriginDeltaX = 512.75f;
        item.mOriginDeltaY = -125.5f;
        item.mCaptureFactor = 0.0375f;
        item.mCenterDurationNs = 812'345'678;
    }
    const auto wire = WriteSaveRecord(source);
    Require(wire.size() == SaveV2Size<Plant>() + 156 &&
        V7SaveSchema::Time(wire, LevelSaveFormat::RecordKind::Plant, 100) == 217'123'456,
        "Battle launch compatibility projection lost exact remaining nanoseconds");
    const auto tail = std::span(wire).subspan(SaveV2Size<Plant>());
    Require(V7SaveSchema::Read(tail, 32, 8) == std::uint64_t(source.mNextLaunchTimeNs) &&
        V7SaveSchema::Read(tail, 40, 8) == std::uint64_t(source.mLaunchWindowStartNs) &&
        tail.size() == 156,
        "Native Plant deadline/cursor fields or compact tail differ from the frozen wire");
    auto restored = std::bit_cast<Plant>(std::array<std::byte, sizeof(Plant)>{});
    ReadSaveRecord(restored, wire.data());
    Require(restored.mNextLaunchTimeNs == source.mNextLaunchTimeNs &&
        restored.mLaunchWindowStartNs == source.mLaunchWindowStartNs &&
        restored.mMagnetElapsedNs == source.mMagnetElapsedNs &&
        restored.mMagnetItems[4].mPosX == source.mMagnetItems[4].mPosX &&
        restored.mMagnetItems[4].mCenterDurationNs == source.mMagnetItems[4].mCenterDurationNs &&
        WriteSaveRecord(restored) == wire,
        "Real Plant record save/load changed absolute deadline or event cursor");
    source.mState = PlantState::STATE_BOWLING_UP;
    source.mZenProductionCountdown = 7;
    const auto bowling = WriteSaveRecord(source);
    Require(V7SaveSchema::Time(bowling, LevelSaveFormat::RecordKind::Plant, 100) == 70'000'000,
        "Bowling compatibility projection serialized the launch deadline as its collision count");
    ReadSaveRecord(restored, bowling.data());
    Require(static_cast<int>(restored.mZenProductionCountdown) == 7,
        "Bowling auxiliary count did not survive native save/load");
    source.mState = PlantState::STATE_READY;
    source.mNextLaunchTimeNs = source.mLaunchWindowStartNs - 123'456'789;
    const auto overdue = WriteSaveRecord(source);
    ReadSaveRecord(restored, overdue.data());
    Require(restored.mNextLaunchTimeNs == source.mNextLaunchTimeNs &&
        std::bit_cast<std::int64_t>(V7SaveSchema::Time(
            overdue, LevelSaveFormat::RecordKind::Plant, 100)) == -123'456'789,
        "Overdue launch deadline was clamped or wrapped during native save");
}

void CheckMusicFloatSave()
{
    static_assert(LevelSaveFormat::DAT64_VERSION == 3 && LevelSaveFormat::DAT64_MINOR_VERSION == 3);
    static_assert(std::is_same_v<decltype(Music::mBaseBPM), float>);
    static_assert(std::is_same_v<decltype(Music::mBaseModSpeed), float>);
    static_assert(std::is_trivially_copyable_v<Music>);
    auto source = std::bit_cast<Music>(std::array<std::byte, sizeof(Music)>{});
    source.mBaseBPM = 120.5f;
    source.mBaseModSpeed = 3.25f;
    source.mBurstStateCounter.mNanoseconds = 123'456'789;
    const auto wire = WriteSaveRecord(source);
    float bpm = 0, speed = 0;
    std::memcpy(&bpm, wire.data() + 36, sizeof(bpm));
    std::memcpy(&speed, wire.data() + 40, sizeof(speed));
    Require(bpm == source.mBaseBPM && speed == source.mBaseModSpeed,
        "Music save truncated floating-point attributes or changed their wire offsets");
    auto restored = std::bit_cast<Music>(std::array<std::byte, sizeof(Music)>{});
    ReadSaveRecord(restored, wire.data());
    Require(restored.mBaseBPM == 120.5f && restored.mBaseModSpeed == 3.25f &&
        restored.mBurstStateCounter.mNanoseconds == 123'456'789 &&
        WriteSaveRecord(restored) == wire,
        "Music float attributes did not round-trip with exact nanosecond timers");
}

void CheckBlendRegionSave()
{
    static_assert(sizeof(ReanimatorTransform) == 56);
    static_assert(offsetof(ReanimatorTransform, mImageSlot) == 32);
    static_assert(std::is_trivially_copyable_v<ReanimatorTrackInstance>);
    // Construct zeroed native records without the gameplay track constructor.
    auto source = std::bit_cast<ReanimatorTrackInstance>(
        std::array<std::byte, sizeof(ReanimatorTrackInstance)>{});
    const auto withoutRegion = WriteSaveRecord(source);
    Require(withoutRegion.size() == 112,
        "Current DAT64 retained the removed eight-byte track image pointer gap");
    source.mBlendTransform.mImageSlot = 123;
    Require(WriteSaveRecord(source) == withoutRegion,
        "Definition image slot leaked into DAT64 blend state");
    auto restored = source;
    ReadSaveRecord(restored, withoutRegion.data());
    Require(restored.mBlendTransform.mImageSlot == 0,
        "Loading DAT64 retained a derived definition image slot");
}

void CheckCatapultCycle()
{
    using enum CatapultLoadState;
    Require(SaveV2Size<Zombie>() == 436 &&
        Dat64Layout<Zombie>::SlotSize() == 444 + V7SaveSchema::Size(LevelSaveFormat::RecordKind::Zombie),
        "Catapult presentation changed the frozen prefix or v3.3 motion tail");
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
        CheckObjectCoordinateSave<Plant>();
        CheckObjectCoordinateSave<CursorObject>();
        CheckObjectCoordinateSave<CursorPreview>();
        CheckObjectCoordinateSave<SeedPacket>();
        CheckObjectCoordinateSave<SeedBank>();
        CheckPlantDeadlineSave();
        CheckMusicFloatSave();
        CheckBlendRegionSave();
        CheckCatapultCycle();
        CheckLiveSave<TodParticle>();
        CheckLiveSave<TodParticleEmitter>();
        Configure(100);
        std::cout << "PASS: 20 native save types, frozen wire timer inventory with Projectile projections; float music attributes; catapult cycle/recovery; six FPS settings, "
            "nanosecond advancement, countdown expiry, periodic events, sentinels, legacy unsigned wrap "
            "and monotonic battle time beyond 2^32 ticks\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
