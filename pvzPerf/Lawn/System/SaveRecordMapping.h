#include "SaveClockProjection.h"
#pragma once
#include "NativeSaveFields.h"
#include "Dat64TimeSchema.h"
#include "V7SaveSchema.h"
#include <span>
#include <cstring>

namespace SaveRecordMapping
{
using LegacyByte = unsigned char;
template<class T> LegacyByte* ObjectBytes(T& value)
{
    return reinterpret_cast<LegacyByte*>(&value);
}
template<class T> const LegacyByte* ObjectBytes(const T& value)
{
    return reinterpret_cast<const LegacyByte*>(&value);
}
template<class T> void ClearNativeObject(T& value)
{
    std::memset(ObjectBytes(value), 0, sizeof(T));
}

// These mappings retain frozen wire coordinates before nanosecond expansion,
// with v3.2 reanimation additions/compaction and v3.3 exact-state tails.
// Every field is addressed by name; padding and native pointers are never copied.
template<class T> struct SaveRecordKind;
#define SAVE_KIND(Type, Kind) template<> struct SaveRecordKind<Type> { \
    static constexpr auto value = LevelSaveFormat::RecordKind::Kind; };
SAVE_KIND(Zombie, Zombie)
SAVE_KIND(Plant, Plant)
SAVE_KIND(Projectile, Projectile)
SAVE_KIND(Coin, Coin)
SAVE_KIND(LawnMower, LawnMower)
SAVE_KIND(GridItem, GridItem)
SAVE_KIND(TodParticleSystem, ParticleSystem)
SAVE_KIND(TodParticleEmitter, ParticleEmitter)
SAVE_KIND(TodParticle, Particle)
SAVE_KIND(Reanimation, Reanimation)
SAVE_KIND(Attachment, Attachment)
SAVE_KIND(CursorObject, CursorObject)
SAVE_KIND(CursorPreview, CursorPreview)
SAVE_KIND(MessageWidget, MessageWidget)
SAVE_KIND(SeedPacket, SeedPacket)
SAVE_KIND(Challenge, Challenge)
SAVE_KIND(Music, Music)
SAVE_KIND(ReanimatorTrackInstance, ReanimatorTrackInstance)
#undef SAVE_KIND

template<class T> Dat64TimeSchema::Fields SaveTimeFields()
{
    if constexpr (std::is_same_v<T, Board>) return Dat64TimeSchema::BoardFields();
    else if constexpr (std::is_same_v<T, SeedBank>) return Dat64TimeSchema::SeedBankFields();
    else return Dat64TimeSchema::GetFields(SaveRecordKind<T>::value);
}
template<class T, class Fn> void VisitSaveMembers(Fn&& visit)
{
    constexpr size_t base = std::is_same_v<T, Board> ? 528 : 0;
    VisitNativeSaveFields<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (wire < base) return;
        if constexpr (std::is_same_v<T, SeedBank>)
            if (wire == 56) return; // Packet array is mapped recursively below.
        visit(native, wire - base, oldSize, newSize);
    });
    if constexpr (std::is_base_of_v<GameObject, T>)
        visit(offsetof(T, mX), 16, 28, 28);
    if constexpr (std::is_same_v<T, SeedBank>)
        for (size_t i = 0; i < 10; ++i)
            VisitSaveMembers<SeedPacket>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
                visit(offsetof(SeedBank, mSeedPackets) + i * sizeof(SeedPacket) + native,
                    56 + i * 96 + wire, oldSize, newSize);
            });
}
template<class T, class Fn> void VisitSaveSegments(Fn&& visit)
{
    if constexpr (std::is_same_v<T, Board>)
    {
        visit(size_t(0), size_t(0), size_t(22076));
        visit(size_t(22080), size_t(22076), size_t(8));
        visit(size_t(22088), size_t(22080), size_t(28));
    }
    else if constexpr (std::is_same_v<T, SeedBank>)
    {
        visit(size_t(16), size_t(8), size_t(28));
        visit(size_t(48), size_t(36), size_t(4));
        for (size_t i = 0; i < 10; ++i)
            VisitSaveSegments<SeedPacket>([&](size_t wire, size_t legacy, size_t size) {
                visit(56 + i * 96 + wire, 40 + i * 80 + legacy, size);
            });
        visit(size_t(1016), size_t(840), size_t(8));
    }
    else
    {
        const auto& layout = LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value);
        for (size_t i = 0; i < layout.mSegmentCount; ++i)
        {
            const auto& segment = layout.mSegments[i];
            size_t wire = segment.mDat64Offset;
            if constexpr (std::is_same_v<T, ReanimatorTrackInstance>)
                if (wire >= 88) wire -= 8;
            visit(wire, segment.mLegacyOffset, segment.mSize);
        }
        if constexpr (std::is_same_v<T, Reanimation>)
            visit(size_t(12), size_t(12), size_t(4));
        if constexpr (std::is_same_v<T, TodParticleSystem>)
            visit(size_t(4), size_t(4), size_t(4));
    }
}
template<class T> size_t SaveV1Size()
{
    if constexpr (std::is_same_v<T, Board>) return 22120;
    else if constexpr (std::is_same_v<T, SeedBank>) return 1024;
    else if constexpr (std::is_same_v<T, ReanimatorTrackInstance>) return 104;
    else return LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value).mDat64Size;
}
template<class T> size_t SaveV2Size()
{
    return Dat64TimeSchema::V2Size(SaveV1Size<T>(), SaveTimeFields<T>());
}

template<class T> size_t NativeTimeOffset(const Dat64TimeSchema::Field& field)
{
    if constexpr (std::is_same_v<T, Board>)
        if (field.mOffset == 22036 - 528) return offsetof(Board, mLevelTimeNs);
    size_t result = SIZE_MAX;
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (field.mOffset >= wire && field.mOffset + 4 <= wire + oldSize)
        {
            if (newSize != oldSize * 4 && newSize != oldSize * 2)
                throw std::runtime_error(std::string(field.mName) + ": native time member is not 64 bit");
            result = native + (field.mOffset - wire) * (newSize / oldSize);
        }
    });
    if (result == SIZE_MAX) throw std::runtime_error("time field is missing its native mapping");
    return result;
}
template<class T, class Fn> void VisitV7Members(Fn&& visit)
{
    if constexpr (std::is_same_v<T, Plant> || std::is_same_v<T, Zombie>)
    {
        visit(offsetof(T, mX), 0, 4);
        visit(offsetof(T, mY), 4, 4);
        visit(offsetof(T, mRootOriginX), 8, 8);
        visit(offsetof(T, mRootBindingGeneration), 16, 4);
        visit(offsetof(T, mRootScale), 20, 4);
        if constexpr (std::is_same_v<T, Plant>)
        {
            visit(offsetof(T, mBowlingRowArrivalTimeNs), 24, 8);
            visit(offsetof(T, mNextLaunchTimeNs), 32, 8);
            visit(offsetof(T, mLaunchWindowStartNs), 40, 8);
            visit(offsetof(T, mMagnetStartTimeNs), 48, 8);
            for (size_t i = 0; i < MAX_MAGNET_ITEMS; ++i)
            {
                const size_t native = offsetof(T, mMagnetItems) + i * sizeof(MagnetItem);
                const size_t wire = 56 + i * 20;
                visit(native + offsetof(MagnetItem, mVelocityX), wire, 4);
                visit(native + offsetof(MagnetItem, mVelocityY), wire + 4, 4);
            }
        }
        else
        {
            const auto segment = [&](size_t native, size_t wire) {
                visit(native + offsetof(TimedLinearMotion, origin), wire, 8);
                visit(native + offsetof(TimedLinearMotion, startTimeNs), wire + 8, 8);
                visit(native + offsetof(TimedLinearMotion, rate), wire + 16, 4);
                visit(native + offsetof(TimedLinearMotion, bound), wire + 20, 1);
            };
            segment(offsetof(T, mVelocityX), 24);
            segment(offsetof(T, mVelocityY), 52);
            segment(offsetof(T, mAltitudeMotion), 80);
        }
    }
    else if constexpr (std::is_same_v<T, Projectile>)
    {
        visit(offsetof(T, mCreationTimeNs), 0, 8);
    }
    else if constexpr (std::is_same_v<T, Reanimation>)
    {
        visit(offsetof(T, mTimeDomain), 0, 4);
        visit(offsetof(T, mStartTimeNs), 4, 8);
        visit(offsetof(T, mCurrentFrame), 12, 4);
        visit(offsetof(T, mFramePeriodNs), 16, 8);
        visit(offsetof(T, mPeriodNs), 24, 8);
        visit(offsetof(T, mCycleCrossings), 32, 8);
        visit(offsetof(T, mLastFrameNs), 40, 8);
        visit(offsetof(T, mRootDisplacement), 48, 8);
        visit(offsetof(T, mHasLastFrame), 56, 1);
        visit(offsetof(T, mPlaybackGeneration), 60, 4);
        visit(offsetof(T, mLastUpdateTimeNs), 64, 8);
    }
    else if constexpr (std::is_same_v<T, TodParticleSystem>)
    {
        visit(offsetof(T, mRandomState), 0, 4);
    }
    else if constexpr (std::is_same_v<T, TodParticleEmitter>)
    {
        visit(offsetof(T, mSpawnRemainder), 0, 8);
        // Frozen wire bytes 8..23 are reserved zeros: SystemMove applies input directly.
        visit(offsetof(T, mSystemPositionOriginX), 24, 8);
        visit(offsetof(T, mSystemPositionOriginY), 32, 8);
        visit(offsetof(T, mSystemPositionBound), 40, 4);
    }
    else if constexpr (std::is_same_v<T, TodParticle>)
    {
        visit(offsetof(T, mAnimationBirthTimeNs), 0, 8);
        visit(offsetof(T, mAnimationSampleIntegral), 8, 8);
        visit(offsetof(T, mRandomSeed), 16, 4);
    }
    else if constexpr (std::is_same_v<T, GridItem>)
    {
        for (size_t i = 0; i < NUM_MOTION_TRAIL_FRAMES; ++i)
        {
            const size_t native = offsetof(T, mMotionTrailFrames) + i * sizeof(MotionTrailFrame);
            visit(native + offsetof(MotionTrailFrame, mPosX), i * 16, 4);
            visit(native + offsetof(MotionTrailFrame, mPosY), i * 16 + 4, 4);
            visit(native + offsetof(MotionTrailFrame, mAnimClock), i * 16 + 8, 8);
        }
        visit(offsetof(T, mRootWorldX), 192, 8);
        visit(offsetof(T, mRootSample), 200, 8);
        visit(offsetof(T, mRootReanimID), 208, 4);
        visit(offsetof(T, mRootGeneration), 212, 4);
        visit(offsetof(T, mRootDirection), 216, 4);
        visit(offsetof(T, mRootLastOutputX), 220, 4);
        visit(offsetof(T, mRootPeriodNs), 224, 8);
        visit(offsetof(T, mRootChocolate), 232, 1);
    }
}
template<class T> void WriteHistoricalProjection(const T& value, std::span<LegacyByte> bytes)
{
    using V7SaveSchema::PutFloat;
    if constexpr (std::is_base_of_v<GameObject, T>)
    {
        const auto pixel = [](float position) {
            if (!std::isfinite(position) || double(position) < INT32_MIN ||
                double(position) >= 2147483648.0)
                throw std::runtime_error("actor coordinate exceeds historical pixel range");
            return static_cast<std::uint32_t>(static_cast<std::int32_t>(position));
        };
        V7SaveSchema::Write(bytes, 16, pixel(value.mX), 4);
        V7SaveSchema::Write(bytes, 20, pixel(value.mY), 4);
        if constexpr (std::is_same_v<T, SeedBank>)
            for (size_t i = 0; i < 10; ++i)
            {
                V7SaveSchema::Write(bytes, 56 + i * 96 + 16, pixel(value.mSeedPackets[i].mX), 4);
                V7SaveSchema::Write(bytes, 56 + i * 96 + 20, pixel(value.mSeedPackets[i].mY), 4);
                PutFloat(bytes, 56 + i * 96 + 80, value.mSeedPackets[i].mSlotMachiningPosition);
            }
        if constexpr (std::is_same_v<T, SeedPacket>)
            PutFloat(bytes, 80, value.mSlotMachiningPosition);
        if constexpr (std::is_same_v<T, Zombie>)
        {
            PutFloat(bytes, 56, value.mX);
            PutFloat(bytes, 60, value.mY);
        }
    }
    if constexpr (std::is_same_v<T, Reanimation>)
    {
        const auto position = value.SamplePlayback();
        PutFloat(bytes, 4, value.mFrameCount > 0
            ? float(double(position.phaseNs) / value.mPeriodNs) : 0.0f);
        PutFloat(bytes, 8, value.mAnimRate);
        PutFloat(bytes, 168, value.mHasLastFrame && value.mPeriodNs > 0
            ? float(double(value.mLastFrameNs) / value.mPeriodNs) : -1.0f);
    }
    else if constexpr (std::is_same_v<T, TodParticleEmitter>)
    {
        const auto duration = value.mSystemDurationNs;
        const auto phase = [&](std::int64_t age) {
            // Frozen legacy phase projection only; current runtime evaluates
            // its actual age against the full duration without this endpoint.
            return age < 0 ? -1.0f : duration > 10'000'000
                ? float(double(age) / (duration - 10'000'000)) : 0.0f;
        };
        PutFloat(bytes, 48, float(double(value.mSpawnRemainder) / V7SaveSchema::Frame));
        PutFloat(bytes, 72, phase(ParticleLifeAgeAt(value.mParticleSystem ? value.mParticleSystem->mLastUpdateTimeNs : 0, value.mBirthTimeNs, value.mSystemDurationNs)));
        PutFloat(bytes, 76, phase(ParticleLifeAgeAt(value.mParticleSystem ? value.mParticleSystem->mLastUpdateTimeNs : 0, value.mBirthTimeNs, value.mSystemDurationNs)));
    }
    else if constexpr (std::is_same_v<T, TodParticle>)
    {
        const auto duration = value.mParticleDurationNs;
        const auto phase = [&](std::int64_t age) {
            return age < 0 ? -1.0f : duration > 10'000'000
                ? float(double(age) / (duration - 10'000'000)) : 0.0f;
        };
        PutFloat(bytes, 16, phase(ParticleLifeAgeAt(value.mParticleEmitter && value.mParticleEmitter->mParticleSystem ? value.mParticleEmitter->mParticleSystem->mLastUpdateTimeNs : 0, value.mBirthTimeNs, value.mParticleDurationNs)));
        PutFloat(bytes, 20, phase(ParticleLifeAgeAt(value.mParticleEmitter && value.mParticleEmitter->mParticleSystem ? value.mParticleEmitter->mParticleSystem->mLastUpdateTimeNs : 0, value.mBirthTimeNs, value.mParticleDurationNs)));
        // Preserve the sampled legacy image phase for explicit downgrades.
        // The current format still restores its exact elapsed time and anchor.
        auto animationPhase = value.mAnimationSampleIntegral;
        if (value.mParticleEmitter && value.mParticleEmitter->mEmitterDef)
        {
            const auto& track = value.mParticleEmitter->mEmitterDef->mAnimationRate;
            animationPhase = TodParticleAnimationPhase(value, track);
        }
        if (animationPhase < 0) animationPhase += V7SaveSchema::Frame;
        PutFloat(bytes, 24, float(double(animationPhase) / V7SaveSchema::Frame));
    }
    else if constexpr (std::is_same_v<T, GridItem>)
    {
        const Reanimation* animation = value.mApp
            ? value.mApp->ReanimationTryToGet(value.mGridItemReanimID) : nullptr;
        const double period = double(animation ? animation->mFrameCount : 1) * V7SaveSchema::SourceFrame;
        for (size_t i = 0; i < NUM_MOTION_TRAIL_FRAMES; ++i)
        {
            const auto& trail = value.mMotionTrailFrames[i];
            PutFloat(bytes, 92 + i * 12, trail.mPosX);
            PutFloat(bytes, 96 + i * 12, trail.mPosY);
            PutFloat(bytes, 100 + i * 12, period > 0 ? float(trail.mAnimClock / period) : 0.0f);
        }
    }
}
template<class T> std::vector<LegacyByte> WriteSaveRecord(const T& value)
{
    std::vector<LegacyByte> bytes(SaveV1Size<T>(), 0);
    const auto fields = SaveTimeFields<T>();
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (oldSize != newSize) return;
        VisitSaveSegments<T>([&](size_t start, size_t, size_t length) {
            const size_t first = std::max(wire, start);
            const size_t last = std::min(wire + oldSize, start + length);
            if (first < last) std::memcpy(bytes.data() + first,
                ObjectBytes(value) + native + first - wire, last - first);
        });
    });
    const auto ReadNs = [&](const Dat64TimeSchema::Field& field) {
        if constexpr (std::is_same_v<T, Projectile>)
        {
            if (field.mOffset != 108) return std::uint64_t(0);
            const auto now = value.mBoard ? static_cast<std::int64_t>(value.mBoard->mLevelTimeNs)
                : value.mCreationTimeNs;
            return static_cast<std::uint64_t>(ReanimClock::Subtract(now, value.mCreationTimeNs));
        }
        else
        {
            if constexpr (std::is_same_v<T, TodParticle>)
                if (field.mOffset == 12)
                    return static_cast<std::uint64_t>(ParticleLifeAgeAt(
                        value.mParticleEmitter && value.mParticleEmitter->mParticleSystem
                            ? value.mParticleEmitter->mParticleSystem->mLastUpdateTimeNs : 0,
                        value.mBirthTimeNs, value.mParticleDurationNs));
            if constexpr (std::is_same_v<T, TodParticleEmitter>)
                if (field.mOffset == 124)
                    return static_cast<std::uint64_t>(value.mCrossFadeEndTimeNs == 0 ? 0 :
                        std::max<std::int64_t>(0, ReanimClock::Subtract(value.mCrossFadeEndTimeNs,
                            value.mParticleSystem ? value.mParticleSystem->mLastUpdateTimeNs : 0)));
            if constexpr (std::is_same_v<T, TodParticleEmitter>)
                if (field.mOffset == 64)
                    return static_cast<std::uint64_t>(ParticleLifeAgeAt(
                        value.mParticleSystem ? value.mParticleSystem->mLastUpdateTimeNs : 0,
                        value.mBirthTimeNs, value.mSystemDurationNs));
            if constexpr (std::is_same_v<T, Plant>)
                if (field.mOffset == 100)
                {
                    if (value.mApp && value.mApp->mGameMode == GameMode::GAMEMODE_LIMBO_ZEN_GARDEN)
                        return static_cast<std::uint64_t>(value.mZenProductionCountdown.mNanoseconds);
                    if (value.mState == PlantState::STATE_BOWLING_UP ||
                        value.mState == PlantState::STATE_BOWLING_DOWN)
                        return static_cast<std::uint64_t>(value.mZenProductionCountdown.mNanoseconds);
                    const auto now = value.mBoard ? static_cast<std::int64_t>(value.mBoard->mLevelTimeNs)
                        : value.mLaunchWindowStartNs;
                    return static_cast<std::uint64_t>(
                        ReanimClock::Subtract(value.mNextLaunchTimeNs, now));
                }
            std::uint64_t result;
            const auto native = NativeTimeOffset<T>(field);
            std::memcpy(&result, ObjectBytes(value) + native, 8);
            if constexpr (SaveClockProjection::Supported<T>)
                result = static_cast<std::uint64_t>(SaveClockProjection::Encode(value, native, static_cast<std::int64_t>(result)));
            return result;
        }
    };
    WriteHistoricalProjection(value, bytes);
    auto expanded = Dat64TimeSchema::Expand(bytes, fields,
        [&](const auto& field, std::uint32_t) { return ReadNs(field); });
    if constexpr (!std::is_same_v<T, Board> && !std::is_same_v<T, SeedBank>)
    {
        const size_t offset = expanded.size();
        expanded.resize(offset + V7SaveSchema::Size(SaveRecordKind<T>::value), 0);
        VisitV7Members<T>([&](size_t native, size_t wire, size_t width) {
            if constexpr (SaveClockProjection::Supported<T>)
                if (width == 8 && SaveClockProjection::IsRawTime(value, native))
                {
                    std::int64_t raw; std::memcpy(&raw, ObjectBytes(value) + native, 8);
                    raw = SaveClockProjection::Encode(value, native, raw);
                    std::memcpy(expanded.data() + offset + wire, &raw, 8);
                    return;
                }
            std::memcpy(expanded.data() + offset + wire, ObjectBytes(value) + native, width);
        });
        if constexpr (std::is_same_v<T, TodParticle>)
        {
            const auto now = value.mParticleEmitter && value.mParticleEmitter->mParticleSystem
                ? value.mParticleEmitter->mParticleSystem->mLastUpdateTimeNs : 0;
            V7SaveSchema::Write(expanded, offset, static_cast<std::uint64_t>(
                ReanimClock::Subtract(now, value.mAnimationBirthTimeNs)), 8);
        }
        if constexpr (std::is_same_v<T, Reanimation>)
        {
            const auto* holder = value.mReanimationHolder;
            const auto nowNs = holder ? (value.mTimeDomain == ReanimTimeDomain::Battle
                ? holder->mBattleTimeNs : holder->mVisualTimeNs) : value.mLastUpdateTimeNs;
            if (value.mAnimRate == 0)
            {
                const auto frozenStart = ReanimClock::Add(value.mStartTimeNs,
                    ReanimClock::Subtract(nowNs, value.mLastUpdateTimeNs));
                V7SaveSchema::Write(expanded, offset + 4, static_cast<std::uint64_t>(frozenStart), 8);
            }
            V7SaveSchema::Write(expanded, offset + 64, static_cast<std::uint64_t>(nowNs), 8);
        }
    }
    return expanded;
}
template<class T> void ReadSaveRecord(T& value, const LegacyByte* source)
{
    if constexpr (!std::is_same_v<T, Board> && !std::is_same_v<T, SeedBank>)
    {
        const auto kind = SaveRecordKind<T>::value;
        V7SaveSchema::Validate(kind, std::span(source + SaveV2Size<T>(), V7SaveSchema::Size(kind)));
    }
    const auto fields = SaveTimeFields<T>();
    std::vector<std::pair<size_t, std::uint64_t>> times;
    const auto bytes = Dat64TimeSchema::Collapse(std::span(source, SaveV2Size<T>()), fields,
        [&](const auto& field, std::uint64_t ns) {
            if constexpr (!std::is_same_v<T, Projectile>)
                times.emplace_back(NativeTimeOffset<T>(field), ns);
            return std::uint32_t(0);
        });
    if constexpr (std::is_same_v<T, Board>)
        std::memset(ObjectBytes(value) + offsetof(Board, mPaused), 0,
            sizeof(Board) - offsetof(Board, mPaused));
    else ClearNativeObject(value);
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (oldSize != newSize) return;
        VisitSaveSegments<T>([&](size_t start, size_t, size_t length) {
            const size_t first = std::max(wire, start);
            const size_t last = std::min(wire + oldSize, start + length);
            if (first < last) std::memcpy(ObjectBytes(value) + native + first - wire,
                bytes.data() + first, last - first);
        });
    });
    for (const auto& [offset, ns] : times)
    {
        auto decoded = ns;
        if constexpr (SaveClockProjection::Supported<T>)
            decoded = static_cast<std::uint64_t>(SaveClockProjection::Decode(value, offset, static_cast<std::int64_t>(ns)));
        std::memcpy(ObjectBytes(value) + offset, &decoded, 8);
        if constexpr (std::is_same_v<T, Board>)
        {
            if (offset != offsetof(Board, mLevelTimeNs))
                std::memcpy(ObjectBytes(value) + offset + 8, &ns, 8);
        }
        else if constexpr (!std::is_same_v<T, TodParticle> && !std::is_same_v<T, TodParticleEmitter>)
        {
            if constexpr (SaveClockProjection::Supported<T>)
                if (SaveClockProjection::IsRawTime(value, offset)) continue;
            std::memcpy(ObjectBytes(value) + offset + 8, &ns, 8);
        }
    }
    if constexpr (std::is_base_of_v<GameObject, T>)
    {
        const auto pixel = [&](size_t offset) {
            return static_cast<float>(std::bit_cast<std::int32_t>(
                static_cast<std::uint32_t>(V7SaveSchema::Read(bytes, offset, 4))));
        };
        value.mX = pixel(16);
        value.mY = pixel(20);
        if constexpr (std::is_same_v<T, SeedBank>)
            for (size_t i = 0; i < 10; ++i)
            {
                value.mSeedPackets[i].mX = pixel(56 + i * 96 + 16);
                value.mSeedPackets[i].mY = pixel(56 + i * 96 + 20);
            }
    }
    if constexpr (!std::is_same_v<T, Board> && !std::is_same_v<T, SeedBank>)
        VisitV7Members<T>([&](size_t native, size_t wire, size_t width) {
            if constexpr (SaveClockProjection::Supported<T>)
                if (width == 8 && SaveClockProjection::IsRawTime(value, native))
                {
                    std::int64_t raw; std::memcpy(&raw, source + SaveV2Size<T>() + wire, 8);
                    raw = SaveClockProjection::Decode(value, native, raw);
                    std::memcpy(ObjectBytes(value) + native, &raw, 8);
                    return;
                }
            std::memcpy(ObjectBytes(value) + native, source + SaveV2Size<T>() + wire, width);
        });
    if constexpr (std::is_same_v<T, Reanimation>)
    {
        const bool fullFrame = value.mLoopType == REANIM_LOOP_FULL_LAST_FRAME ||
            value.mLoopType == REANIM_PLAY_ONCE_FULL_LAST_FRAME ||
            value.mLoopType == REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD;
        const int intervals = std::max(1, fullFrame ? value.mFrameCount : value.mFrameCount - 1);
        if (value.mPeriodNs / value.mFramePeriodNs != intervals || value.mCurrentFrame > intervals)
            throw std::runtime_error("saved frame cursor differs from its animation action");
        const bool full = value.mLoopType == REANIM_LOOP_FULL_LAST_FRAME ||
            value.mLoopType == REANIM_PLAY_ONCE_FULL_LAST_FRAME ||
            value.mLoopType == REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD;
        value.mRootFrameScale = full ? 1.0 : double(value.mFrameCount) / std::max(1, value.mFrameCount - 1);
    }
    if constexpr (std::is_same_v<T, TodParticle> || std::is_same_v<T, TodParticleEmitter>)
        value.mBirthTimeNs = ReanimClock::Subtract(0, value.mBirthTimeNs);
    if constexpr (std::is_same_v<T, TodParticle>)
        value.mAnimationBirthTimeNs = ReanimClock::Subtract(0, value.mAnimationBirthTimeNs);
}

template<class T> struct Dat64Layout
{
    static size_t Size()
    {
        if constexpr (std::is_same_v<T, Board> || std::is_same_v<T, SeedBank>)
            return SaveV2Size<T>();
        else return SaveV2Size<T>() + V7SaveSchema::Size(SaveRecordKind<T>::value);
    }
    static size_t SlotSize()
    {
        const auto& layout = LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value);
        return layout.mDat64ArraySlotSize + 4 * SaveTimeFields<T>().size()
            + V7SaveSchema::Size(SaveRecordKind<T>::value);
    }
    static void Read(T& value, const LegacyByte* bytes)
    {
        if constexpr (std::is_same_v<T, Music>)
        {
            const bool disabled = value.IsMusicDisabled();
            ReadSaveRecord(value, bytes); value.SetMusicDisabled(disabled);
        }
        else ReadSaveRecord(value, bytes);
    }
    static void Write(LegacyByte* bytes, const T& value)
    {
        const auto result = WriteSaveRecord(value);
        std::memcpy(bytes, result.data(), result.size());
    }
};
}
