// Exercise the production converter and frozen input-only 10736/10737 ABIs.
#include "LevelSaveConverter.cpp"
#include <chrono>
#include <iostream>

namespace
{
using namespace PvzDat64;
void Require(bool condition, const char* reason)
{
    if (!condition) throw std::runtime_error(reason);
}
template<class Fn> void Reject(Fn operation, const char* reason)
{
    try { operation(); }
    catch (const std::runtime_error&) { return; }
    throw std::runtime_error(reason);
}
void PutSigned(std::span<Byte> bytes, std::size_t offset, std::int64_t value, std::size_t size)
{
    V7SaveSchema::Write(bytes, offset, static_cast<std::uint64_t>(value), size);
}
void CheckFields()
{
    for (const auto kind : {RecordKind::Zombie, RecordKind::Plant})
    {
        std::vector<Byte> old(MilliV33StateSize(kind), 0);
        PutSigned(old, 0, -123456, 4);
        PutSigned(old, 4, 987654, 4);
        PutSigned(old, 8, -9876543210123LL, 8);
        PutSigned(old, 16, 0x12345678, 4);
        PutSigned(old, 20, -1317, 4);
        PutSigned(old, 24, 1234567, 8);
        if (kind == RecordKind::Zombie) PutSigned(old, 32, -7654321, 8);
        const auto state = UpgradeMilliV33State(kind, old);
        V7SaveSchema::Validate(kind, UpgradeRelativeV33State(kind, state));
        Require(state.size() == RelativeV33StateSize(kind) &&
            V7SaveSchema::Float(state, 0) == float(-123456.0 / 1000) &&
            V7SaveSchema::Float(state, 4) == float(987654.0 / 1000) &&
            V7SaveSchema::Double(state, 8) == -9876543210123.0 / 1000 &&
            V7SaveSchema::Read(state, 16, 4) == 0x12345678 &&
            V7SaveSchema::Float(state, 20) == float(-1317.0 / 1000),
            "Actor fixed-point fields did not migrate to their normal float/double units");
        if (kind == RecordKind::Plant)
            Require(V7SaveSchema::Read(state, 24, 8) == 1234567, "Plant simulation remainder changed");
        else
            Require(std::all_of(state.begin() + 24, state.end(), [](Byte b) { return b == 0; }),
                "Old zombie velocity remainders were incorrectly bound as new velocity segments");
    }
    std::vector<Byte> oldGrid(MilliV33StateSize(RecordKind::GridItem), 0);
    for (std::size_t i = 0; i < 12; ++i)
    {
        V7SaveSchema::PutFloat(oldGrid, i * 16, 1.234567f);
        V7SaveSchema::PutFloat(oldGrid, i * 16 + 4, -5.987654f);
        PutSigned(oldGrid, i * 16 + 8, 987654321 + i, 8);
    }
    PutSigned(oldGrid, 192, -1234567, 4);
    PutSigned(oldGrid, 196, 9876543210123LL, 8);
    PutSigned(oldGrid, 204, 0x12340001, 4);
    PutSigned(oldGrid, 208, 0x98765432, 4);
    PutSigned(oldGrid, 212, -1, 4);
    PutSigned(oldGrid, 216, -7654321, 4);
    PutSigned(oldGrid, 220, 700000003, 8);
    PutSigned(oldGrid, 228, 1, 1);
    const auto grid = UpgradeMilliV33State(RecordKind::GridItem, oldGrid);
    V7SaveSchema::Validate(RecordKind::GridItem, grid);
    Require(std::equal(oldGrid.begin(), oldGrid.begin() + 192, grid.begin()) &&
        V7SaveSchema::Double(grid, 192) == -1234567.0 / 1000 &&
        V7SaveSchema::Double(grid, 200) == 9876543210123.0 / 1000 &&
        V7SaveSchema::Read(grid, 208, 4) == 0x12340001 &&
        V7SaveSchema::Read(grid, 212, 4) == 0x98765432 &&
        std::bit_cast<std::int32_t>(std::uint32_t(V7SaveSchema::Read(grid, 216, 4))) == -1 &&
        V7SaveSchema::Float(grid, 220) == float(-7654321.0 / 1000) &&
        V7SaveSchema::Read(grid, 224, 8) == 700000003 &&
        V7SaveSchema::Read(grid, 232, 1) == 1,
        "Grid root fields or exact trail snapshots changed during migration");
    const auto descriptor = std::find_if(ARRAY_DESCRIPTORS.begin(), ARRAY_DESCRIPTORS.end(),
        [](const auto& value) { return value.mKind == RecordKind::GridItem; });
    Require(descriptor != ARRAY_DESCRIPTORS.end(), "Grid pool descriptor is absent");
    const auto& layout = LevelSaveFormat::GetRecordLayout(RecordKind::GridItem);
    const auto fields = Dat64TimeSchema::GetFields(RecordKind::GridItem);
    const auto objectSize = Dat64TimeSchema::V2Size(layout.mDat64Size, fields);
    std::vector<Byte> slot(Dat64TimeSchema::V2Size(layout.mDat64ArraySlotSize, fields) + oldGrid.size(), 0);
    std::copy(oldGrid.begin(), oldGrid.end(), slot.begin() + objectSize);
    WriteU32At(slot, objectSize + oldGrid.size(), 1); // Dead slot points to the free-list sentinel.
    Writer pool;
    pool.U32(0);
    pool.U32(1);
    pool.U32(0);
    pool.SyncBytes(slot);
    Reader reader(pool.mData);
    reader.mMilliV33Source = true;
    const auto parsed = ReadArray(reader, Format::Dat64V33, *descriptor, BoardDialect::Canonical);
    Require(reader.Remaining() == 0 && parsed.mSlots.size() == 1 &&
        parsed.mSlots[0].mID == 1 && parsed.mSlots[0].mV7State == grid,
        "Frozen grid slot length or trailing ID offset was parsed with the current layout");
    Reader wrongDialect(pool.mData);
    Reject([&] { ReadArray(wrongDialect, Format::Dat64V33, *descriptor, BoardDialect::Canonical); },
        "Frozen grid slot length was accepted as current float-schema data");
    for (const auto kind : {RecordKind::Reanimation, RecordKind::ParticleSystem,
        RecordKind::ParticleEmitter, RecordKind::Particle})
    {
        std::vector<Byte> exact(MilliV33StateSize(kind));
        for (std::size_t i = 0; i < exact.size(); ++i) exact[i] = Byte(i * 37 + 11);
        Require(UpgradeMilliV33State(kind, exact) == exact,
            "Unaffected playback or particle exact state changed");
    }
    Reject([&] { UpgradeMilliV33State(RecordKind::Zombie, std::span(oldGrid)); },
        "Mismatched frozen state length was accepted");
}

void CheckClockBindings()
{
    constexpr std::int64_t now = 91'234'567'891;
    constexpr std::int64_t remaining = 217'123'456;
    SlotSnapshot plant;
    plant.mCanonicalRecord.resize(LevelSaveFormat::GetRecordLayout(RecordKind::Plant).mDat64Size);
    WriteU32At(plant.mCanonicalRecord, 48, int(SeedType::SEED_PEASHOOTER));
    plant.mV7State = UpgradeRelativeV33State(RecordKind::Plant, std::vector<Byte>(32));
    plant.mHistoricalLaunchRemainingNs = remaining;
    plant.mNeedsClockBinding = true;
    BindHistoricalClock(plant, RecordKind::Plant, now);
    Require(ReadU64At(plant.mV7State, 32) == now + remaining &&
        ReadU64At(plant.mV7State, 40) == now &&
        ReadU64At(plant.mV7State, 48) == now &&
        plant.mV7State.size() == 56,
        "Plant deadline lost exact nanoseconds or confused launch time with bowling count");
    const auto descriptor = std::find_if(ARRAY_DESCRIPTORS.begin(), ARRAY_DESCRIPTORS.end(),
        [](const auto& value) { return value.mKind == RecordKind::Plant; });
    const auto& layout = LevelSaveFormat::GetRecordLayout(RecordKind::Plant);
    const auto fields = Dat64TimeSchema::GetFields(RecordKind::Plant);
    std::vector<Byte> canonicalSlot(layout.mDat64ArraySlotSize);
    WriteU32At(canonicalSlot, layout.mDat64Size, 1); // One free slot.
    const auto launchOffset = Dat64TimeSchema::RecordField(RecordKind::Plant, 0x58, "").mOffset;
    const auto expanded = Dat64TimeSchema::Expand(canonicalSlot, fields,
        [&](const auto& field, std::uint32_t) {
            return field.mOffset == launchOffset ? std::uint64_t(remaining) : std::uint64_t(0);
        });
    const auto objectSize = Dat64TimeSchema::V2Size(layout.mDat64Size, fields);
    Writer stored;
    stored.Bytes(std::span(expanded).first(objectSize));
    stored.Bytes(std::vector<Byte>(32));
    stored.Bytes(std::span(expanded).subspan(objectSize));
    Writer pool;
    pool.U32(0); pool.U32(1); pool.U32(0); pool.SyncBytes(stored.mData);
    Reader reader(pool.mData);
    reader.mRelativeV33Source = true;
    auto parsed = ReadArray(reader, Format::Dat64V33, *descriptor, BoardDialect::Canonical);
    Require(reader.Remaining() == 0 &&
        parsed.mSlots[0].mHistoricalLaunchRemainingNs == remaining,
        "Old wire launch duration was rounded through its temporary canonical tick projection");
    BindHistoricalClock(parsed.mSlots[0], RecordKind::Plant, now);
    Require(ReadU64At(parsed.mSlots[0].mV7State, 32) == now + remaining,
        "Old relative wire launch duration did not reach its absolute deadline exactly");
    Reader wrongDialect(pool.mData);
    Reject([&] { ReadArray(wrongDialect, Format::Dat64V33, *descriptor, BoardDialect::Canonical); },
        "Old relative Plant32 tail was parsed as the new Plant56 tail");
    WriteU32At(plant.mCanonicalRecord, 48, int(SeedType::SEED_WALLNUT));
    plant.mHistoricalLaunchRemainingNs = 7 * 10'000'000;
    plant.mNeedsClockBinding = true;
    BindHistoricalClock(plant, RecordKind::Plant, now);
    Require(plant.mV7State.size() == 56,
        "Bowling migration invented an additional count field");
    std::vector<Byte> board(LevelSaveFormat::DAT64_BOARD_STATE_SIZE);
    plant.mID = DATA_ARRAY_KEY_MASK;
    WriteU32At(plant.mCanonicalRecord, 72, 28); // BOWLING_UP, row is target row.
    WriteU32At(plant.mCanonicalRecord, 28, 2);
    V7SaveSchema::PutFloat(plant.mV7State, 4, 340.125f);
    for (const auto background : {BackgroundType::BACKGROUND_1_DAY,
        BackgroundType::BACKGROUND_3_POOL, BackgroundType::BACKGROUND_5_ROOF})
    {
        WriteU32At(board, 21480, int(background));
        for (const bool highGround : {false, true})
        {
            WriteU32At(board, 4 + 2 * 4, highGround ? 4 : 1);
            const double target = background == BackgroundType::BACKGROUND_5_ROOF ? 340 :
                background == BackgroundType::BACKGROUND_3_POOL ? 250 : 280;
            const auto distance = std::abs(target - (highGround ? 30 : 0) - 340.125);
            MigrateBowlingClock(plant, now, board);
            Require(ReadU64At(plant.mV7State, 24) ==
                std::uint64_t(now + std::llround(distance * 5'000'000)),
                "Bowling row deadline did not reconstruct saved stage geometry and current Y");
        }
    }
    SlotSnapshot projectile;
    projectile.mV7State.resize(36);
    PutSigned(projectile.mV7State, 0, -217'123'456, 8);
    V7SaveSchema::PutFloat(projectile.mV7State, 16, 123.456789f);
    V7SaveSchema::PutFloat(projectile.mV7State, 20, -0.000123456789f);
    const auto origin = ReadU64At(projectile.mV7State, 16);
    projectile.mNeedsClockBinding = true;
    BindHistoricalClock(projectile, RecordKind::Projectile, now);
    Require(ReadU64At(projectile.mV7State, 0) == now - 217'123'456 &&
        ReadU64At(projectile.mV7State, 8) == now &&
        ReadU64At(projectile.mV7State, 16) == origin,
        "Projectile migration changed birth age or current position while binding its motion segment");
    for (float rate : {13.3072289f, -13.3072289f, 0.0f})
    {
        std::vector<Byte> relative(60);
        PutSigned(relative, 4, 12'345'678'901, 8);
        PutSigned(relative, 12, 333'123'456, 8);
        PutSigned(relative, 20, 1'900'000'003, 8);
        PutSigned(relative, 28, -3, 8);
        PutSigned(relative, 36, 123'456'789, 8);
        PutSigned(relative, 44, -4, 8);
        PutSigned(relative, 52, 1, 1);
        PutSigned(relative, 56, 0xfedcba98, 4);
        SlotSnapshot animation;
        animation.mCanonicalRecord.resize(LevelSaveFormat::GetRecordLayout(RecordKind::Reanimation).mDat64Size);
        V7SaveSchema::PutFloat(animation.mCanonicalRecord, 8, rate);
        animation.mV7State = UpgradeRelativeV33State(RecordKind::Reanimation, relative);
        animation.mNeedsClockBinding = true;
        BindHistoricalClock(animation, RecordKind::Reanimation, now);
        V7SaveSchema::Validate(RecordKind::Reanimation, animation.mV7State);
        Require(ReadU32At(animation.mV7State, 0) == 1 &&
            ReadU64At(animation.mV7State, 4) == now - 12'345'678'901 &&
            ReadU64At(animation.mV7State, 60) == now &&
            std::equal(relative.begin() + 12, relative.end(), animation.mV7State.begin() + 12),
            "Animation absolute binding changed its phase, cycles, history or generation");
    }
    plant.mNeedsClockBinding = true;
    plant.mHistoricalLaunchRemainingNs = 1;
    Reject([&] { BindHistoricalClock(plant, RecordKind::Plant, INT64_MAX); },
        "Overflowing migrated launch deadline was accepted");
}

void CheckOldProjectileWire()
{
    const auto descriptor = std::find_if(ARRAY_DESCRIPTORS.begin(), ARRAY_DESCRIPTORS.end(),
        [](const auto& value) { return value.mKind == RecordKind::Projectile; });
    const auto& layout = LevelSaveFormat::GetRecordLayout(RecordKind::Projectile);
    const auto fields = Dat64TimeSchema::GetFields(RecordKind::Projectile);
    std::vector<Byte> canonical(layout.mDat64ArraySlotSize);
    for (const auto [offset, value] : {std::pair{60U, 123.456789f}, std::pair{64U, 251.98765f},
        std::pair{68U, -90.125f}, std::pair{72U, 3.3372819f}, std::pair{80U, -1.7123456f},
        std::pair{88U, 251.125f}, std::pair{116U, 1.3372819f}})
        V7SaveSchema::PutFloat(canonical, offset, value);
    WriteU32At(canonical, 28, 2);
    WriteU32At(canonical, layout.mDat64Size, 0x10000);
    constexpr std::int64_t age = 217'123'456, now = 100'000'001;
    const auto expanded = Dat64TimeSchema::Expand(canonical, fields,
        [](const auto& field, std::uint32_t) {
            return field.mOffset == 108 ? std::uint64_t(age) : std::uint64_t(50'000'000);
        });
    Writer pool;
    pool.U32(1); pool.U32(1); pool.U32(1); pool.SyncBytes(expanded);
    for (const auto schema : {MILLI_V33_SCHEMA_ID, RELATIVE_V33_SCHEMA_ID, ACTOR_CLOCK_V33_SCHEMA_ID})
    {
        Reader reader(pool.mData);
        reader.mMilliV33Source = schema == MILLI_V33_SCHEMA_ID;
        reader.mRelativeV33Source = schema == RELATIVE_V33_SCHEMA_ID;
        reader.mActorClockV33Source = schema == ACTOR_CLOCK_V33_SCHEMA_ID;
        auto array = ReadArray(reader, Format::Dat64V33, *descriptor, BoardDialect::Canonical);
        Require(reader.Remaining() == 0 && array.mSlots.size() == 1,
            "Old projectile pool stride or object ID offset changed");
        auto& slot = array.mSlots.front();
        slot.mV7State = slot.mV7Migration;
        BindHistoricalClock(slot, RecordKind::Projectile, now);
        V7SaveSchema::Validate(RecordKind::Projectile, slot.mV7State);
        Require(std::bit_cast<std::int64_t>(ReadU64At(slot.mV7State, 0)) == now - age &&
            ReadU64At(slot.mV7State, 8) == now,
            "Old projectile wire lost its birth age or needed a positive birth timestamp");
        for (const auto [source, target] : {std::pair{60U, 16U}, std::pair{64U, 20U},
            std::pair{68U, 24U}, std::pair{116U, 28U}, std::pair{88U, 32U}})
            Require(ReadU32At(slot.mV7State, target) == ReadU32At(canonical, source),
                "Old projectile wire changed current position/rotation/shadow when establishing its motion segment");
        Require(ReadU32At(slot.mCanonicalRecord, 72) == ReadU32At(canonical, 72) &&
            ReadU32At(slot.mCanonicalRecord, 80) == ReadU32At(canonical, 80),
            "Old projectile wire changed its current segment velocity");
    }
}

void CheckParticleStepMigration()
{
    std::vector<Byte> system(12);
    PutSigned(system, 0, 7'654'321, 8);
    PutSigned(system, 8, 0xfedcba98U, 4);
    const auto rng = UpgradeParticleStepV33State(RecordKind::ParticleSystem, system);
    Require(rng.size() == 4 && ReadU32At(rng, 0) == 0xfedcba98U,
        "Particle system migration retained pending step time or lost its RNG");
    std::vector<Byte> particle(36);
    PutSigned(particle, 0, 987'654'321, 8); // Removed current sample must be ignored.
    PutSigned(particle, 8, -1, 8);
    PutSigned(particle, 16, 123'456'789'012LL, 8);
    PutSigned(particle, 24, 375'000'000'000LL, 8);
    PutSigned(particle, 32, 0x71234567U, 4);
    const auto migrated = UpgradeParticleStepV33State(RecordKind::Particle, particle);
    V7SaveSchema::Validate(RecordKind::Particle, migrated);
    Require(migrated.size() == 28 && ReadU64At(migrated, 0) == UINT64_MAX &&
        ReadU64At(migrated, 8) == 123'456'789'012LL &&
        ReadU64At(migrated, 16) == 375'000'000'000LL &&
        ReadU32At(migrated, 24) == 0x71234567U,
        "Particle migration shifted last/animation/anchor/seed into the removed current-sample slot");
    std::vector<Byte> emitter(40);
    PutSigned(emitter, 0, 125'000'000'000LL, 8);
    PutSigned(emitter, 8, 987'654'321, 8);
    PutSigned(emitter, 16, -1, 8);
    V7SaveSchema::PutFloat(emitter, 24, 12.345678f);
    V7SaveSchema::PutFloat(emitter, 32, -0.000123456789f);
    const auto emission = UpgradeParticleStepV33State(RecordKind::ParticleEmitter, emitter);
    V7SaveSchema::Validate(RecordKind::ParticleEmitter, emission);
    Require(ReadU64At(emission, 0) == 125'000'000'000LL &&
        ReadU64At(emission, 8) == 0 && ReadU64At(emission, 16) == UINT64_MAX &&
        std::equal(emitter.begin() + 24, emitter.end(), emission.begin() + 24),
        "Emitter migration lost spawn remainder, last-sample sentinel or external centers");
}

std::vector<Byte> AsTimestampState(RecordKind kind, std::span<const Byte> state)
{
    std::vector<Byte> old(TimestampV33StateSize(kind));
    if (kind == RecordKind::ParticleSystem)
    {
        PutSigned(old, 0, 7'654'321, 8);
        std::copy_n(state.begin(), 4, old.begin() + 8);
    }
    else if (kind == RecordKind::Particle)
    {
        PutSigned(old, 0, 987'654'321, 8);
        std::copy_n(state.begin(), 28, old.begin() + 8);
    }
    else
    {
        std::copy(state.begin(), state.end(), old.begin());
        if (kind == RecordKind::ParticleEmitter)
            PutSigned(old, 8, 987'654'321, 8);
    }
    return old;
}

std::vector<Byte> AsRelativeState(RecordKind kind, std::span<const Byte> state,
    std::int64_t now)
{
    std::vector<Byte> relative(state.begin(), state.begin() + RelativeV33StateSize(kind));
    if (kind == RecordKind::Reanimation)
    {
        const auto start = std::bit_cast<std::int64_t>(ReadU64At(state, 4));
        WriteU32At(relative, 0, 0);
        WriteU64At(relative, 4, static_cast<std::uint64_t>(CheckedClockAdd(now, -start)));
    }
    return relative;
}

std::vector<Byte> AsOldState(RecordKind kind, std::span<const Byte> state)
{
    if (kind != RecordKind::Zombie && kind != RecordKind::Plant && kind != RecordKind::GridItem)
        return {state.begin(), state.end()};
    std::vector<Byte> old(MilliV33StateSize(kind), 0);
    const auto putCoordinate = [&](std::size_t oldAt, double value, std::size_t size) {
        const auto milli = V7SaveSchema::Rounded(value * 1000);
        if (size == 4 && (milli < INT32_MIN || milli > INT32_MAX))
            throw std::runtime_error("Test coordinate cannot fit the frozen input ABI");
        PutSigned(old, oldAt, milli, size);
    };
    const auto copy = [&](std::size_t from, std::size_t to, std::size_t size) {
        std::copy_n(state.begin() + from, size, old.begin() + to);
    };
    if (kind == RecordKind::Zombie || kind == RecordKind::Plant)
    {
        putCoordinate(0, V7SaveSchema::Float(state, 0), 4);
        putCoordinate(4, V7SaveSchema::Float(state, 4), 4);
        putCoordinate(8, V7SaveSchema::Double(state, 8), 8);
        copy(16, 16, 4);
        putCoordinate(20, V7SaveSchema::Float(state, 20), 4);
        if (kind == RecordKind::Plant) copy(24, 24, 8);
    }
    else
    {
        copy(0, 0, 192);
        putCoordinate(192, V7SaveSchema::Double(state, 192), 4);
        putCoordinate(196, V7SaveSchema::Double(state, 200), 8);
        copy(208, 204, 12);
        putCoordinate(216, V7SaveSchema::Float(state, 220), 4);
        copy(224, 220, 8);
        copy(232, 228, 1);
    }
    return old;
}

std::vector<Byte> MakeOldWire(std::span<const Byte> current, Document& expected, std::uint32_t schema)
{
    const bool fixed = schema == MILLI_V33_SCHEMA_ID;
    const bool actorClock = schema == ACTOR_CLOCK_V33_SCHEMA_ID;
    const bool timestampClock = schema == TIMESTAMP_V33_SCHEMA_ID;
    const bool absoluteClock = actorClock || timestampClock;
    const auto now = SavedBattleClock(expected);
    const auto boardEnd = LevelSaveFormat::DAT64_HEADER_SIZE + 4 + ReadU32At(current, 48);
    Writer result;
    result.Bytes(current.first(boardEnd));
    std::size_t cursor = boardEnd;
    for (std::size_t arrayIndex = 0; arrayIndex < ARRAY_DESCRIPTORS.size(); ++arrayIndex)
    {
        auto& array = expected.mArrays[arrayIndex];
        const auto& layout = LevelSaveFormat::GetRecordLayout(array.mKind);
        const auto fields = Dat64TimeSchema::GetFields(array.mKind);
        const auto objectSize = Dat64TimeSchema::V2Size(layout.mDat64Size, fields);
        const auto slotSize = Dat64TimeSchema::V2Size(layout.mDat64ArraySlotSize, fields) +
            V7SaveSchema::Size(array.mKind);
        const auto blockSize = ReadU32At(current, cursor + 12);
        Require(blockSize == slotSize * array.mMaxUsedCount, "Test wire pool offsets differ from production");
        result.Bytes(current.subspan(cursor, 12));
        Writer block;
        for (std::size_t i = 0; i < array.mSlots.size(); ++i)
        {
            const auto wire = current.subspan(cursor + 16 + i * slotSize, slotSize);
            block.Bytes(wire.first(objectSize));
            const auto timestamp = AsTimestampState(array.mKind, array.mSlots[i].mV7State);
            const auto relative = timestampClock ? timestamp : actorClock ? std::vector<Byte>(
                timestamp.begin(), timestamp.begin() + ActorClockV33StateSize(array.mKind)) :
                AsRelativeState(array.mKind, timestamp, now);
            const auto old = fixed ? AsOldState(array.mKind, relative) : relative;
            block.Bytes(old);
            block.Bytes(wire.subspan(objectSize + V7SaveSchema::Size(array.mKind)));
            auto& slot = array.mSlots[i];
            if (array.mKind == RecordKind::Projectile && !timestampClock)
            {
                slot.mV7State = slot.mID & DATA_ARRAY_KEY_MASK ?
                    V7SaveSchema::FromHistorical(array.mKind, slot.mCanonicalRecord, wire.first(objectSize)) :
                    std::vector<Byte>(36);
                slot.mNeedsClockBinding = (slot.mID & DATA_ARRAY_KEY_MASK) != 0;
            }
            else
            {
                slot.mV7State = absoluteClock ? UpgradeParticleStepV33State(array.mKind, old) :
                    UpgradeRelativeV33State(array.mKind,
                    fixed ? UpgradeMilliV33State(array.mKind, old) : old);
                slot.mNeedsClockBinding = !absoluteClock;
            }
            BindHistoricalClock(slot, array.mKind, now, expected.mCanonicalBoard);
            if (actorClock && array.mKind == RecordKind::Plant)
                MigrateBowlingClock(slot, now, expected.mCanonicalBoard);
        }
        result.SyncBytes(block.mData);
        cursor += 16 + blockSize;
    }
    result.Bytes(current.subspan(cursor));
    WriteU32At(result.mData, 36, schema);
    WriteU64At(result.mData, 24, result.mData.size() - LevelSaveFormat::DAT64_HEADER_SIZE);
    return result.mData;
}

void CheckWire(const std::filesystem::path& fixture, std::uint32_t schema)
{
    const auto original = ReadFileFully(fixture);
    std::uint32_t echo = 0;
    auto document = Parse(original, Dat64Format(original), echo);
    const auto boardFields = Dat64TimeSchema::BoardFields();
    for (std::size_t i = 0; i < boardFields.size(); ++i)
        if (std::string_view(boardFields[i].mName) == "mMainCounter")
            document.mNanoseconds[i] += 123; // Exercise the exact saved Board clock.
    PrepareAppearanceOutput(document, Format::Dat64V33);
    PrepareV7Output(document, Format::Dat64V33);
    const auto current = WriteFileImage(document, Format::Dat64V33, echo);
    auto expected = Parse(current, Format::Dat64V33, echo);
    const auto old = MakeOldWire(current, expected, schema);
    Require(Dat64Format(old) == Format::Dat64V33 &&
        !LevelSaveFormat::IsCurrentDat64Header(old), "Frozen input dialect became a current runtime schema");
    const auto migrated = Parse(old, Format::Dat64V33, echo);
    Require(migrated == expected, "Frozen whole-file parsing changed canonical or exact state");
    const auto upgraded = WriteFileImage(migrated, Format::Dat64V33, echo);
    Require(ReadU32At(upgraded, 36) == 0x10740 &&
        LevelSaveFormat::IsCurrentDat64Header(upgraded) &&
        Parse(upgraded, Format::Dat64V33, echo) == expected,
        "Frozen input did not write current float schema with stable semantics");
    auto bad = old;
    WriteU32At(bad, 20, 1);
    Reject([&] { ParseDat64(bad, echo); }, "Frozen header with wrong flags was accepted");
    bad = old;
    WriteU32At(bad, 44, 1);
    Reject([&] { ParseDat64(bad, echo); }, "Frozen header with nonzero reserved bytes was accepted");
    const auto temporary = std::filesystem::temp_directory_path() /
        ("pvz-milli-v33-" + std::to_string(std::chrono::steady_clock::now().time_since_epoch().count()));
    std::filesystem::create_directory(temporary);
    const auto source = temporary / "input.dat64";
    {
        std::ofstream output(source, std::ios::binary);
        output.write(reinterpret_cast<const char*>(old.data()), static_cast<std::streamsize>(old.size()));
        Require(bool(output), "Cannot write temporary converter input");
    }
    const auto target = temporary / "upgraded.dat64";
    ConversionOptions options;
    options.mTargetFormat = Format::Dat64V33;
    ConvertFile(source, target, options);
    Require(ReadFileFully(target) == upgraded, "Public converter produced a different float-schema upgrade");
    for (const auto format : {Format::Legacy1073Dat, Format::Dat64V1, Format::Dat64V2, Format::Dat64V32})
    {
        options.mTargetFormat = format;
        options.mRoundTimeToNearestTick = true;
        const auto historical = temporary / (std::to_string(int(format)) + ".dat");
        ConvertFile(source, historical, options);
        options.mTargetFormat = Format::Dat64V33;
        const auto rebound = temporary / (std::to_string(int(format)) + "-absolute.dat64");
        ConvertFile(historical, rebound, options);
        const auto restored = Parse(ReadFileFully(rebound), Format::Dat64V33, echo);
        const auto now = SavedBattleClock(restored);
        for (const auto& array : restored.mArrays)
            for (const auto& slot : array.mSlots)
                if (slot.mID & DATA_ARRAY_KEY_MASK)
                {
                    if (array.mKind == RecordKind::Plant)
                        Require(std::bit_cast<std::int64_t>(ReadU64At(slot.mV7State, 32)) ==
                            CheckedClockAdd(now, slot.mHistoricalLaunchRemainingNs) &&
                            ReadU64At(slot.mV7State, 40) == std::uint64_t(now) &&
                            ReadU64At(slot.mV7State, 48) == std::uint64_t(now),
                            "Historical Plant draft was not bound to its saved Board clock");
                    else if (array.mKind == RecordKind::Reanimation)
                        Require(ReadU32At(slot.mV7State, 0) == 1 &&
                            ReadU64At(slot.mV7State, 4) == std::uint64_t(now) &&
                            ReadU64At(slot.mV7State, 60) == std::uint64_t(now),
                            "Historical animation draft was not bound to its saved Board clock");
                }
    }
}
}

int main(int argc, char** argv)
{
    try
    {
        Require(argc == 2, "Pass the historical benchmark save fixture");
        CheckFields();
        CheckClockBindings();
        CheckOldProjectileWire();
        CheckParticleStepMigration();
        CheckWire(argv[1], MILLI_V33_SCHEMA_ID);
        CheckWire(argv[1], RELATIVE_V33_SCHEMA_ID);
        CheckWire(argv[1], ACTOR_CLOCK_V33_SCHEMA_ID);
        CheckWire(argv[1], TIMESTAMP_V33_SCHEMA_ID);
        std::cout << "PASS input-only v3.3 10736/10737/10738/10739 migration, main-step particles, exact tails, and all output formats\n";
    }
    catch (const std::exception& error)
    {
        std::cerr << "FAIL v3.3 coordinate migration: " << error.what() << '\n';
        return 1;
    }
}
