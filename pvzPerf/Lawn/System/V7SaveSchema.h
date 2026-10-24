#pragma once
#include "LevelSaveFormat.h"
#include "Dat64TimeSchema.h"
#include <bit>
#include <cmath>
#include <cstring>
#include <limits>
#include <span>
#include <stdexcept>
#include <utility>
#include <vector>

// v3.3 retains the frozen canonical records for offline conversion, followed by
// these exact v7 state fields before the DataArray ID. Never copy native padding.
namespace V7SaveSchema
{
using Kind = LevelSaveFormat::RecordKind;
using Byte = unsigned char;
inline constexpr std::int64_t Frame = 1'000'000'000'000LL;
inline constexpr std::int64_t SourceFrame = 1'000'000'000LL;
constexpr std::size_t Size(Kind kind)
{
    switch (kind)
    {
    case Kind::Zombie: return 105;
    case Kind::Plant: return 156;
    case Kind::Projectile: return 36;
    case Kind::Coin: return 20;
    case Kind::LawnMower: return 40;
    case Kind::Reanimation: return 68;
    case Kind::ParticleSystem: return 4;
    case Kind::ParticleEmitter: return 40;
    case Kind::Particle: return 92;
    case Kind::GridItem: return 240;
    default: return 0;
    }
}
inline std::uint64_t Read(std::span<const Byte> bytes, std::size_t offset, std::size_t width)
{
    if (offset > bytes.size() || width > bytes.size() - offset)
        throw std::runtime_error("v7 save field exceeds record");
    std::uint64_t value = 0;
    for (std::size_t i = 0; i < width; ++i) value |= std::uint64_t(bytes[offset + i]) << (i * 8);
    return value;
}
inline void Write(std::span<Byte> bytes, std::size_t offset, std::uint64_t value, std::size_t width)
{
    if (offset > bytes.size() || width > bytes.size() - offset)
        throw std::runtime_error("v7 save field exceeds record");
    for (std::size_t i = 0; i < width; ++i) bytes[offset + i] = Byte(value >> (i * 8));
}
inline float Float(std::span<const Byte> bytes, std::size_t offset)
{
    return std::bit_cast<float>(std::uint32_t(Read(bytes, offset, 4)));
}
inline void PutFloat(std::span<Byte> bytes, std::size_t offset, float value)
{
    Write(bytes, offset, std::bit_cast<std::uint32_t>(value), 4);
}
inline double Double(std::span<const Byte> bytes, std::size_t offset)
{
    return std::bit_cast<double>(Read(bytes, offset, 8));
}
inline void PutDouble(std::span<Byte> bytes, std::size_t offset, double value)
{
    Write(bytes, offset, std::bit_cast<std::uint64_t>(value), 8);
}
inline std::int64_t Rounded(double value)
{
    if (!std::isfinite(value) ||
        value < -9'223'372'036'854'775'808.0 || value >= 9'223'372'036'854'775'808.0)
        throw std::runtime_error("historical animation value exceeds v7 integer range");
    return std::llround(value);
}
inline void Validate(Kind kind, std::span<const Byte> state)
{
    if (state.size() != Size(kind)) throw std::runtime_error("v7 state length differs from schema");
    const auto Signed = [&](std::size_t at) { return std::bit_cast<std::int64_t>(Read(state, at, 8)); };
    const auto Require = [](bool valid, const char* message) {
        if (!valid) throw std::runtime_error(message);
    };
    if (kind == Kind::Projectile)
    {
        Require(Signed(8) >= 0, "projectile motion origin time is negative");
        Require(Signed(0) <= Signed(8), "projectile creation time follows its motion origin");
        Require(std::uint64_t(Signed(8)) - std::uint64_t(Signed(0)) <= std::uint64_t(INT64_MAX),
            "projectile age exceeds signed nanosecond range");
        for (const std::size_t at : {16U, 20U, 24U, 28U, 32U})
            Require(std::isfinite(Float(state, at)), "projectile motion origin is not finite");
    }
    else if (kind == Kind::Reanimation)
    {
        Require(Read(state, 0, 4) <= 1, "animation time domain is invalid");
        const auto period = Signed(20);
        Require(period > 0, "animation period must be positive");
        Require(Signed(12) >= 0 && Signed(12) <= period, "animation origin is outside its period");
        Require(Read(state, 52, 1) <= 1, "animation history flag is not boolean");
        if (Read(state, 52, 1))
            Require(Signed(36) >= 0 && Signed(36) <= period, "previous animation time is outside its period");
        Require(Signed(60) >= 0, "animation clock sample is negative");
        Require(Signed(4) <= Signed(60) &&
            std::uint64_t(Signed(60)) - std::uint64_t(Signed(4)) <= std::uint64_t(INT64_MAX),
            "animation start is outside its clock range");
    }
    else if (kind == Kind::ParticleEmitter)
    {
        Require(Signed(0) > -Frame && Signed(0) < Frame, "particle spawn remainder exceeds its unit");
        Require(Signed(8) >= 0, "particle emission elapsed time is negative");
        Require(Signed(16) >= -1, "particle system previous sample time is invalid");
    }
    else if (kind == Kind::Particle)
    {
        Require(Signed(0) >= -1, "particle previous sample time is invalid");
        Require(Signed(8) >= 0, "particle animation time is negative");
        Require(Signed(16) >= 0 && Signed(16) < Frame, "particle animation anchor exceeds its period");
    }
    else if (kind == Kind::Plant || kind == Kind::Zombie)
    {
        Require(std::isfinite(Float(state, 0)) && std::isfinite(Float(state, 4)) &&
            std::isfinite(Double(state, 8)) && std::isfinite(Float(state, 20)),
            "actor coordinate or motion anchor is not finite");
        if (kind == Kind::Plant)
        {
            Require(Signed(24) >= 0, "bowling row arrival time is negative");
        }
        else
            for (const std::size_t at : {24U, 52U})
            {
                Require(std::isfinite(Double(state, at)) &&
                    std::isfinite(Float(state, at + 16)) && std::isfinite(Float(state, at + 20)),
                    "zombie velocity segment is not finite");
                Require(Read(state, at + 24, 1) <= 1, "zombie velocity binding is not boolean");
            }
    }
    else if (kind == Kind::GridItem)
    {
        Require(std::isfinite(Double(state, 192)) && std::isfinite(Double(state, 200)) &&
            std::isfinite(Float(state, 220)), "root-motion coordinate is not finite");
        Require(Read(state, 232, 1) <= 1, "root-motion chocolate flag is not boolean");
    }
}
inline std::uint64_t Time(std::span<const Byte> expanded, Kind kind, std::size_t canonicalOffset)
{
    const auto fields = Dat64TimeSchema::GetFields(kind);
    std::size_t offset = canonicalOffset;
    for (const auto& field : fields)
        if (field.mOffset < canonicalOffset) offset += 4;
    return Read(expanded, offset, 8);
}

// Migration is deliberately explicit. Historical float precision cannot be
// recovered; preserve its value once, then future saves retain exact state.
inline std::vector<Byte> FromHistorical(Kind kind, std::span<const Byte> canonical,
    std::span<const Byte> expanded)
{
    std::vector<Byte> state(Size(kind), 0);
    const auto Put = [&](std::size_t offset, std::int64_t value, std::size_t width = 8) {
        Write(state, offset, static_cast<std::uint64_t>(value), width);
    };
    if (kind == Kind::Zombie || kind == Kind::Plant)
    {
        const auto coordinate = [&](std::size_t axis) {
            const float value = kind == Kind::Zombie
                ? Float(canonical, 56 + axis * 4)
                : static_cast<float>(std::int32_t(Read(canonical, 16 + axis * 4, 4)));
            if (!std::isfinite(value))
                throw std::runtime_error("historical coordinate is not finite");
            return value;
        };
        PutFloat(state, 0, coordinate(0));
        PutFloat(state, 4, coordinate(1));
    }
    else if (kind == Kind::Projectile)
    {
        const auto age = std::bit_cast<std::int64_t>(Time(expanded, kind, 108));
        if (age < 0) throw std::runtime_error("historical projectile age is negative");
        Put(0, -age); // Relative draft; converter binds both timestamps to Board now.
        Put(8, 0);
        for (const auto [source, target] : {
            std::pair{60U, 16U}, std::pair{64U, 20U}, std::pair{68U, 24U},
            std::pair{116U, 28U}, std::pair{88U, 32U}})
            PutFloat(state, target, Float(canonical, source));
    }
    else if (kind == Kind::Reanimation)
    {
        const auto count = std::int32_t(Read(canonical, 36, 4));
        const auto loops = std::int32_t(Read(canonical, 104, 4));
        const double rate = Float(canonical, 8);
        const double phase = Float(canonical, 4);
        const double last = Float(canonical, 168);
        Put(4, 0);
        const auto periodNs = count > 0 && rate != 0
            ? Rounded(std::floor(double(count) * 1'000'000'000.0 / std::abs(rate)))
            : std::int64_t(std::max(count, 1)) * 1'000'000'000LL;
        if (periodNs <= 0) throw std::runtime_error("historical animation period is below one nanosecond");
        Put(12, Rounded(phase * periodNs));
        Put(20, periodNs);
        Put(28, rate < 0 ? -std::int64_t(loops) : std::int64_t(loops));
        Put(36, last >= 0 ? Rounded(last * periodNs) : 0);
        const std::int64_t cycles = rate < 0 ? -std::int64_t(loops) : std::int64_t(loops);
        const bool wrapped = last >= 0 && (rate >= 0 ? phase < last : phase > last);
        Put(44, cycles - (wrapped ? (rate < 0 ? -1 : 1) : 0));
        Put(52, last >= 0, 1);
    }
    else if (kind == Kind::ParticleEmitter)
    {
        const auto duration = Time(expanded, kind, 68);
        const auto phaseAge = [&](std::size_t offset) {
            const double phase = Float(canonical, offset);
            return phase < 0 ? std::int64_t(-1) :
                Rounded(phase * (duration > 10'000'000 ? double(duration - 10'000'000) : 0.0));
        };
        Put(0, Rounded(double(Float(canonical, 48)) * Frame));
        Put(8, 0); // Effective emission integral starts at the migrated current state.
        Put(16, phaseAge(76));
        for (std::size_t vector = 0; vector < 2; ++vector)
            std::memcpy(state.data() + 24 + vector * 8, canonical.data() + 52, 8);
    }
    else if (kind == Kind::Particle)
    {
        const auto duration = Time(expanded, kind, 8);
        const double lastPhase = Float(canonical, 20);
        // Decode only the frozen historical previous-phase projection. Native
        // current age/lifetime remain untouched and use the full new duration.
        Put(0, lastPhase < 0 ? -1 :
            Rounded(lastPhase * (duration > 10'000'000 ? double(duration - 10'000'000) : 0.0)));
        Put(8, 0);
        Put(16, Rounded(double(Float(canonical, 24)) * Frame));
        Put(24, 0x9E3779B9U, 4);
        // No historical motion anchor exists: bind lazily to the migrated
        // public position on its first positive step.
        Put(44, -1);
    }
    else if (kind == Kind::ParticleSystem)
    {
        Put(0, 0x6D2B79F5U, 4);
    }
    else if (kind == Kind::GridItem)
    {
        // Motion-trail phases are normalized legacy values. The exact frame
        // count is resolved by the converter's reanimation catalog later.
        for (std::size_t i = 0; i < 12; ++i)
        {
            std::memcpy(state.data() + i * 16, canonical.data() + 92 + i * 12, 8);
            Put(i * 16 + 8, Rounded(double(Float(canonical, 100 + i * 12)) * SourceFrame));
        }
    }
    return state;
}
}
