#include "Lawn/System/V7SaveSchema.h"
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <iostream>
#include <limits>
#include <span>
#include <stdexcept>
#include <utility>
#include <vector>

namespace
{
using Byte = unsigned char;
using Kind = LevelSaveFormat::RecordKind;
using Bytes = std::vector<Byte>;

void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}
template<class Fn> void Reject(Fn&& operation, const char* message)
{
    try { operation(); }
    catch (const std::runtime_error&) { return; }
    throw std::runtime_error(message);
}
// Independent frozen-wire helpers: expected values never use the schema's
// own Read/Write or time expansion functions.
void Set(Bytes& bytes, std::size_t at, std::uint64_t value, std::size_t width = 8)
{
    for (std::size_t i = 0; i < width; ++i) bytes.at(at + i) = Byte(value >> (8 * i));
}
std::uint64_t Get(std::span<const Byte> bytes, std::size_t at, std::size_t width = 8)
{
    std::uint64_t value = 0;
    for (std::size_t i = 0; i < width; ++i) value |= std::uint64_t(bytes[at + i]) << (8 * i);
    return value;
}
std::int64_t Signed(std::span<const Byte> bytes, std::size_t at)
{
    return std::bit_cast<std::int64_t>(Get(bytes, at));
}
std::int32_t Integer(std::span<const Byte> bytes, std::size_t at)
{
    return std::bit_cast<std::int32_t>(static_cast<std::uint32_t>(Get(bytes, at, 4)));
}
void Float(Bytes& bytes, std::size_t at, float value)
{
    Set(bytes, at, std::bit_cast<std::uint32_t>(value), 4);
}
Bytes FrozenExpanded(const Bytes& canonical,
                     std::span<const std::pair<std::size_t, std::int64_t>> fields)
{
    Bytes expanded;
    std::size_t previous = 0;
    for (const auto& [offset, ns] : fields)
    {
        expanded.insert(expanded.end(), canonical.begin() + previous, canonical.begin() + offset);
        const auto at = expanded.size();
        expanded.resize(at + 8);
        Set(expanded, at, static_cast<std::uint64_t>(ns));
        previous = offset + 4;
    }
    expanded.insert(expanded.end(), canonical.begin() + previous, canonical.end());
    return expanded;
}

void ReanimationMigration()
{
    // Canonical v1 offsets and the original float32 bits are frozen facts,
    // independent of the live Reanimation class or its current clock layout.
    Bytes canonical(176);
    Set(canonical, 36, 47, 4);
    Set(canonical, 104, 7, 4);
    Set(canonical, 8, 0x4154EA69, 4); // 13.3072289 authored => 13.307229042053223f.
    Float(canonical, 4, .25f);
    Float(canonical, 168, .75f);
    const auto original = canonical;
    auto state = V7SaveSchema::FromHistorical(Kind::Reanimation, canonical, canonical);
    Require(state.size() == 68 && Get(state, 0, 4) == 0 && Signed(state, 60) == 0,
            "Reanimation absolute-clock draft domain/sample differs");
    // Exact float32 rate is 13953641/1048576. Integer long division gives
    // floor(47*1e9*1048576/13953641) = 3531914860, without milli quantization.
    Require(Signed(state, 20) == 3'531'914'860LL, "Historical float rate was quantized");
    Require(Signed(state, 4) == 0 && Signed(state, 12) == 882'978'715,
            "Historical origin/start draft migration differs");
    Require(Signed(state, 28) == 7 && Signed(state, 36) == 2'648'936'145LL &&
            Signed(state, 44) == 6 && Get(state, 52, 1) == 1,
            "Forward wrap did not retain previous event boundary");
    Require(canonical == original, "Migration modified frozen float rate/source record");
    V7SaveSchema::Validate(Kind::Reanimation, state);

    Set(canonical, 8, 0xC154EA69, 4);
    Float(canonical, 4, .75f);
    Float(canonical, 168, .25f);
    state = V7SaveSchema::FromHistorical(Kind::Reanimation, canonical, canonical);
    Require(Signed(state, 20) == 3'531'914'860LL &&
            Signed(state, 12) == 2'648'936'145LL &&
            Signed(state, 28) == -7 && Signed(state, 36) == 882'978'715 &&
            Signed(state, 44) == -6, "Reverse wrap changed period or direction");
    V7SaveSchema::Validate(Kind::Reanimation, state);

    Float(canonical, 8, 0);
    Float(canonical, 4, .5f);
    Float(canonical, 168, -1);
    state = V7SaveSchema::FromHistorical(Kind::Reanimation, canonical, canonical);
    Require(Signed(state, 20) == 47'000'000'000LL &&
            Signed(state, 12) == 23'500'000'000LL && Get(state, 52, 1) == 0 &&
            Signed(state, 36) == 0, "Paused/no-history migration lost its phase");
    V7SaveSchema::Validate(Kind::Reanimation, state);

    Float(canonical, 8, std::numeric_limits<float>::infinity());
    Reject([&] { V7SaveSchema::FromHistorical(Kind::Reanimation, canonical, canonical); },
           "Nonfinite historical animation rate accepted");
}

void ActorMigration()
{
    Bytes zombie(368);
    Float(zombie, 56, 12.345f);
    Float(zombie, 60, -9.876f);
    auto state = V7SaveSchema::FromHistorical(Kind::Zombie, zombie, zombie);
    Require(state.size() == 105 && Get(state, 0, 4) == Get(zombie, 56, 4) &&
            Get(state, 4, 4) == Get(zombie, 60, 4),
            "Zombie float coordinate migration changed its bits");
    Require(std::all_of(state.begin() + 8, state.end(), [](Byte v) { return v == 0; }),
            "Historical zombie invented a root binding or velocity segment");
    Float(zombie, 56, -.0005f);
    Float(zombie, 60, .0005f);
    state = V7SaveSchema::FromHistorical(Kind::Zombie, zombie, zombie);
    Require(Get(state, 0, 4) == Get(zombie, 56, 4) &&
            Get(state, 4, 4) == Get(zombie, 60, 4),
            "Historical sub-millipixel coordinate was quantized");
    Float(zombie, 56, 2'147'484.0f);
    state = V7SaveSchema::FromHistorical(Kind::Zombie, zombie, zombie);
    Require(Get(state, 0, 4) == Get(zombie, 56, 4),
            "Historical float coordinate retained the old fixed-point limit");
    Float(zombie, 56, std::numeric_limits<float>::infinity());
    Reject([&] { V7SaveSchema::FromHistorical(Kind::Zombie, zombie, zombie); },
           "Nonfinite historical float coordinate accepted");

    Bytes plant(344);
    Set(plant, 16, static_cast<std::uint32_t>(-23), 4);
    Set(plant, 20, 2'147'483, 4);
    state = V7SaveSchema::FromHistorical(Kind::Plant, plant, plant);
    Require(state.size() == 156 &&
            std::bit_cast<float>(std::uint32_t(Get(state, 0, 4))) == -23.0f &&
            std::bit_cast<float>(std::uint32_t(Get(state, 4, 4))) == 2'147'483.0f,
            "Plant integer coordinate was not converted to normal float units");
    Require(std::all_of(state.begin() + 32, state.end(), [](Byte v) { return v == 0; }),
            "Historical plant invented an absolute deadline before Board-clock binding");
    Set(plant, 20, 2'147'484, 4);
    state = V7SaveSchema::FromHistorical(Kind::Plant, plant, plant);
    Require(std::bit_cast<float>(std::uint32_t(Get(state, 4, 4))) == 2'147'484.0f,
            "Plant coordinate retained the old fixed-point limit");
}

void ParticleMigration()
{
    Bytes emitter(208);
    Float(emitter, 48, .125f);
    Float(emitter, 52, 12.5f);
    Float(emitter, 56, -2.25f);
    Float(emitter, 72, .5f);
    Float(emitter, 76, -1);
    const std::array<std::pair<std::size_t, std::int64_t>, 3> emitterTimes{{
        {64, 100'000'003}, {68, 900'000'004}, {124, 30'000'009}}};
    auto expanded = FrozenExpanded(emitter, emitterTimes);
    Require(expanded.size() == 220 && Get(expanded, 72) == 900'000'004,
            "Independent emitter fixture expansion differs");
    auto state = V7SaveSchema::FromHistorical(Kind::ParticleEmitter, emitter, expanded);
    Require(state.size() == 52 && Signed(state, 0) == 125'000'000'000LL &&
            Signed(state, 8) == 0 &&
            std::all_of(state.begin()+32, state.end(), [](Byte value) { return value == 0; }),
            "Emitter migration invented a bound curve origin or lost its spawn remainder");
    Require(Get(state, 16) == Get(emitter, 52) && Get(state, 24) == Get(emitter, 52),
            "Emitter pending/applied external centers differ at migration");
    V7SaveSchema::Validate(Kind::ParticleEmitter, state);

    Bytes particle(160);
    Float(particle, 16, .5f);
    Float(particle, 20, -1);
    Float(particle, 24, .375f);
    const std::array<std::pair<std::size_t, std::int64_t>, 3> particleTimes{{
        {8, 110'000'004}, {12, 50'000'002}, {60, 30'000'009}}};
    expanded = FrozenExpanded(particle, particleTimes);
    Require(expanded.size() == 172 && Get(expanded, 8) == 110'000'004 &&
            Get(expanded, 16) == 50'000'002, "Independent particle time fixture differs");
    state = V7SaveSchema::FromHistorical(Kind::Particle, particle, expanded);
    Require(state.size() == 92 && Signed(state, 0) == -1 &&
            Signed(state, 8) == 0 && Signed(state, 16) == 375'000'000'000LL &&
            Get(state, 24, 4) == 0x9E3779B9U,
            "Particle migration changed phase, sentinel or deterministic seed");
    Require(Signed(state,44)==-1 &&
        std::all_of(state.begin()+28,state.begin()+44,[](Byte value){return value==0;}) &&
        std::all_of(state.begin()+52,state.end(),[](Byte value){return value==0;}),
        "Historical particle invented a bound linear segment");
    V7SaveSchema::Validate(Kind::Particle, state);
    Bytes system(72);
    state = V7SaveSchema::FromHistorical(Kind::ParticleSystem, system, system);
    Require(state.size() == 4 && Get(state, 0, 4) == 0x6D2B79F5U,
            "Historical system RNG initialization differs");
    V7SaveSchema::Validate(Kind::ParticleSystem, state);
}

void ProjectileMigration()
{
    Bytes canonical(160);
    for (const auto [at, value] : {
        std::pair{60U, 123.456789f}, std::pair{64U, -12.345678f},
        std::pair{68U, -90.125f}, std::pair{116U, 1.3372819f}, std::pair{88U, 251.125f}})
        Float(canonical, at, value);
    const std::array<std::pair<std::size_t, std::int64_t>, 4> times{{
        {56, 9'876'543}, {96, 50'000'000}, {108, 217'123'456}, {112, 10'000'000}}};
    const auto expanded = FrozenExpanded(canonical, times);
    const auto state = V7SaveSchema::FromHistorical(Kind::Projectile, canonical, expanded);
    Require(state.size() == 36 && Signed(state, 0) == -217'123'456 &&
        Signed(state, 8) == 0, "Historical projectile birth age lost exact nanoseconds");
    for (const auto [source, target] : {std::pair{60U, 16U}, std::pair{64U, 20U},
        std::pair{68U, 24U}, std::pair{116U, 28U}, std::pair{88U, 32U}})
        Require(Get(state, target, 4) == Get(canonical, source, 4),
            "Historical projectile segment origin did not preserve current float bits");
    V7SaveSchema::Validate(Kind::Projectile, state);
}

void TrailMigration()
{
    Bytes grid(240);
    for (unsigned i = 0; i < 12; ++i)
    {
        Float(grid, 92 + i * 12, float(i) + .25f);
        Float(grid, 96 + i * 12, -float(i) - .5f);
        Float(grid, 100 + i * 12, float(i) / 16);
    }
    const auto state = V7SaveSchema::FromHistorical(Kind::GridItem, grid, grid);
    Require(state.size() == 240, "Grid floating root/trail tail changed size");
    for (unsigned i = 0; i < 12; ++i)
    {
        Require(Get(state, i * 16) == Get(grid, 92 + i * 12),
                "Trail coordinate bits were converted instead of copied");
        Require(Signed(state, i * 16 + 8) == std::int64_t(i) * 62'500'000LL,
                "Trail normalized phase migration rounded early");
    }
    Require(std::all_of(state.begin() + 192, state.end(), [](Byte v) { return v == 0; }),
            "Historical trail invented an active root binding");
    V7SaveSchema::Validate(Kind::GridItem, state);
}

void ExactStateValidation()
{
    const auto rejectField = [](Kind kind, const Bytes& good, std::size_t offset,
                                std::uint64_t value, const char* message, std::size_t width = 8) {
        auto bad = good;
        Set(bad, offset, value, width);
        Reject([&] { V7SaveSchema::Validate(kind, bad); }, message);
    };
    static_assert(LevelSaveFormat::DAT64_SCHEMA_ID == 0x10740);
    Bytes animation(68);
    Set(animation, 0, 1, 4);
    Set(animation, 4, static_cast<std::uint64_t>(-987'654'321LL));
    Set(animation, 60, 12'345'678'901LL);
    Set(animation, 12, 50); Set(animation, 20, 100); Set(animation, 36, 25);
    Set(animation, 52, 1, 1);
    V7SaveSchema::Validate(Kind::Reanimation, animation);
    rejectField(Kind::Reanimation, animation, 20, 0, "Zero period accepted");
    rejectField(Kind::Reanimation, animation, 20, UINT64_MAX, "Negative period accepted");
    rejectField(Kind::Reanimation, animation, 12, UINT64_MAX, "Negative origin accepted");
    rejectField(Kind::Reanimation, animation, 12, 101, "Origin beyond period accepted");
    rejectField(Kind::Reanimation, animation, 36, 101, "Previous time beyond period accepted");
    rejectField(Kind::Reanimation, animation, 52, 2, "Invalid animation bool accepted", 1);
    rejectField(Kind::Reanimation, animation, 0, 2, "Invalid animation clock domain accepted", 4);
    rejectField(Kind::Reanimation, animation, 60, UINT64_MAX, "Negative animation clock snapshot accepted");
    rejectField(Kind::Reanimation, animation, 4, 12'345'678'902LL,
        "Animation start after its saved clock snapshot accepted");
    rejectField(Kind::Reanimation, animation, 4, std::uint64_t(INT64_MIN),
        "Animation elapsed interval beyond signed nanosecond range accepted");
    Require(V7SaveSchema::Read(animation, 0, 4) == 1 &&
        std::bit_cast<std::int64_t>(V7SaveSchema::Read(animation, 4, 8)) == -987'654'321LL &&
        V7SaveSchema::Read(animation, 60, 8) == 12'345'678'901LL,
        "Absolute animation start/domain/snapshot offsets differ from the frozen wire");
    Reject([&] { V7SaveSchema::Validate(Kind::Reanimation, Bytes(60)); },
        "Old relative-clock animation tail was accepted as current");

    Bytes system(4), plant(156), zombie(105), emitter(52), particle(92), grid(240);
    Set(system, 0, 0xfedcba98U, 4); V7SaveSchema::Validate(Kind::ParticleSystem, system);
    Reject([&] { V7SaveSchema::Validate(Kind::ParticleSystem, Bytes(12)); },
        "Old particle system pending-step state accepted as current");
    Set(plant, 24, 91'234'567'891LL); V7SaveSchema::Validate(Kind::Plant, plant);
    Set(plant, 32, 91'451'691'347LL);
    Set(plant, 40, 91'230'000'003LL);
    V7SaveSchema::Validate(Kind::Plant, plant);
    Require(V7SaveSchema::Read(plant, 32, 8) == 91'451'691'347LL &&
        V7SaveSchema::Read(plant, 40, 8) == 91'230'000'003LL &&
        plant.size() == 156,
        "Plant deadline, event cursor or compact tail changed");
    Reject([&] { V7SaveSchema::Validate(Kind::Plant, Bytes(32)); },
        "Old relative-clock Plant tail was accepted as current");
    rejectField(Kind::Plant, plant, 24, UINT64_MAX, "Negative bowling row arrival time accepted");
    Float(zombie, 40, 1.3372289f);
    Set(zombie, 32, 9'999'999);
    Set(zombie, 48, 1, 1);
    V7SaveSchema::Validate(Kind::Zombie, zombie);
    rejectField(Kind::Zombie, zombie, 48, 2, "Invalid velocity binding bool accepted", 1);
    rejectField(Kind::Zombie, zombie, 40, 0x7f800000U, "Nonfinite velocity accepted", 4);
    rejectField(Kind::Zombie, zombie, 8, 0x7ff0000000000000ULL, "Nonfinite root origin accepted");
    rejectField(Kind::Plant, plant, 0, 0x7fc00000U, "NaN actor coordinate accepted", 4);
    Set(emitter, 0, 999'999'999'999LL); Set(emitter, 8, 123'456'789);
    V7SaveSchema::Validate(Kind::ParticleEmitter, emitter);
    rejectField(Kind::ParticleEmitter, emitter, 0, 1'000'000'000'000LL, "Spawn remainder at unit accepted");
    rejectField(Kind::ParticleEmitter, emitter, 8, UINT64_MAX, "Negative emission elapsed time accepted");
    Set(particle, 0, UINT64_MAX); Set(particle, 8, 0); Set(particle, 16, 999'999'999'999LL);
    V7SaveSchema::Validate(Kind::Particle, particle);
    rejectField(Kind::Particle, particle, 0, static_cast<std::uint64_t>(-2LL), "Invalid particle sentinel accepted");
    rejectField(Kind::Particle, particle, 8, UINT64_MAX, "Negative particle animation elapsed accepted");
    rejectField(Kind::Particle, particle, 16, 1'000'000'000'000LL, "Animation anchor at period accepted");
    rejectField(Kind::Particle, particle, 16, UINT64_MAX, "Negative animation anchor accepted");
    V7SaveSchema::Validate(Kind::GridItem, grid);
    rejectField(Kind::GridItem, grid, 232, 2, "Invalid root chocolate bool accepted", 1);
    Reject([&] { V7SaveSchema::Validate(Kind::Particle, Bytes(91)); }, "Short exact tail accepted");
    Reject([&] { V7SaveSchema::Validate(Kind::Particle, Bytes(93)); }, "Long exact tail accepted");
    Bytes projectile(36);
    Set(projectile, 0, static_cast<std::uint64_t>(-123'456'789LL));
    Set(projectile, 8, 91'234'567'891LL);
    Float(projectile, 16, .000123456789f);
    V7SaveSchema::Validate(Kind::Projectile, projectile);
    rejectField(Kind::Projectile, projectile, 0, 91'234'567'892LL,
        "Projectile birth after motion epoch accepted");
    rejectField(Kind::Projectile, projectile, 8, UINT64_MAX,
        "Negative projectile motion epoch accepted");
    rejectField(Kind::Projectile, projectile, 0, std::uint64_t(INT64_MIN),
        "Projectile age beyond signed nanosecond range accepted");
    rejectField(Kind::Projectile, projectile, 32, 0x7fc00000, "NaN projectile shadow origin accepted", 4);
    Reject([&] { V7SaveSchema::Validate(Kind::Projectile, {}); },
        "Old projectile with no timestamp tail accepted as current");
}
}

int main()
{
    try
    {
        ReanimationMigration();
        ActorMigration();
        ParticleMigration();
        ProjectileMigration();
        TrailMigration();
        ExactStateValidation();
        std::cout << "PASS frozen historical float rates/coords, exact ns migration, "
                     "absolute animation/deadline fields, particle RNG/anchors, trail phases, "
                     "and invalid exact-state rejection\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL V7 save schema: " << error.what() << '\n';
        return 1;
    }
}
