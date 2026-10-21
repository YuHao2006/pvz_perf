#include "Lawn/System/Dat64TimeSchema.h"
#include <array>
#include <iostream>
#include <stdexcept>
#include <string_view>

namespace
{
using namespace Dat64TimeSchema;

void Require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

template<class Fn>
void Reject(Fn&& operation, const char* message)
{
    try { operation(); }
    catch (const std::runtime_error&) { return; }
    throw std::runtime_error(message);
}

void Set32(std::vector<std::uint8_t>& bytes, std::size_t at, std::uint32_t value)
{
    for (unsigned i = 0; i < 4; ++i) bytes.at(at + i) = static_cast<std::uint8_t>(value >> (8 * i));
}

void CheckEditableHeader()
{
    using namespace LevelSaveFormat;
    for (const bool current : {false, true})
    {
        std::vector<std::uint8_t> file(DAT64_HEADER_SIZE + 16, 0);
        std::copy(DAT64_MAGIC.begin(), DAT64_MAGIC.end(), file.begin());
        Set32(file, 8, current ? DAT64_VERSION : DAT64_V1_VERSION);
        Set32(file, 12, DAT64_HEADER_SIZE);
        Set32(file, 16, DAT64_AUTHORITY_BUILD);
        Set32(file, 20, current ? DAT64_FLAGS : DAT64_V1_FLAGS);
        Set32(file, 24, 16);
        Set32(file, 36, current ? DAT64_SCHEMA_ID : DAT64_V1_SCHEMA_ID);
        Require(IsSupportedDat64Header(file), "Game/converter header rejected a supported version");
        Require(IsCurrentDat64Header(file) == current, "Runtime must accept only DAT64 v2");
        // Neither the payload nor the former CRC field participates in the header decision.
        Set32(file, 32, 0xdeadbeef);
        file[DAT64_HEADER_SIZE + 3] ^= 0x37;
        Require(IsSupportedDat64Header(file), "Payload edit required updating the former CRC");
        Require(IsCurrentDat64Header(file) == current, "Edited payload changed runtime version policy");
        auto bad = file;
        Set32(bad, 8, 3);
        Require(!IsSupportedDat64Header(bad), "Unknown version accepted");
        bad = file;
        Set32(bad, 36, 0x12345678);
        Require(!IsSupportedDat64Header(bad), "Unknown schema accepted");
        bad = file;
        Set32(bad, 24, 15);
        Require(!IsSupportedDat64Header(bad), "Incorrect file length accepted");
        file.resize(47);
        Require(!IsSupportedDat64Header(file), "Truncated header accepted");
    }
}

void CheckRecord(std::size_t size, Fields fields)
{
    std::size_t previousEnd = 0;
    for (const auto& field : fields)
    {
        Require(field.mOffset >= previousEnd && field.mOffset + 4 <= size,
            "Schema fields overlap, are unordered, or exceed the v1 record");
        Require(field.mTickNs > 0, "Time scale must be positive");
        previousEnd = field.mOffset + 4;
    }
    // Distinct surrounding bytes expose moves, omissions, and accidental writes
    // to object IDs, frame indexes, padding, and arbitrary other record state.
    std::vector<std::uint8_t> original(size);
    for (std::size_t i = 0; i < size; ++i)
        original[i] = static_cast<std::uint8_t>(i * 73 + (i >> 8) * 19 + 41);
    constexpr std::array<std::uint32_t, 8> values = {
        0, 1, 25, 0xffffffffU, 0x80000000U, 0x7fffffffU, 1729, 0xfffffffeU
    };
    for (const auto value : values)
    {
        auto v1 = original;
        for (const auto& field : fields) Set32(v1, field.mOffset, value);
        const auto v2 = Expand(v1, fields, LegacyToNanoseconds);
        Require(v2.size() == size + fields.size() * 4, "Wrong expanded record length");
        for (const auto& field : fields)
            Require(Read(v2, V2Offset(field.mOffset, fields), 8) == LegacyToNanoseconds(field, value),
                "Expanded time differs from its signedness or unit");
        const auto restored = Collapse(v2, fields,
            [](const Field& field, std::uint64_t ns) { return QuantizeNanoseconds(field, ns); });
        Require(restored == v1, "v1/v2 roundtrip changed record bytes");
    }
    // Runtime saves can contain times finer than one legacy tick. Preserve those
    // nanoseconds exactly in v2 even though a strict legacy export must reject.
    const auto precise = Expand(original, fields,
        [](const Field&, std::uint32_t) { return std::uint64_t(123'456'789); });
    for (const auto& field : fields)
    {
        const auto ns = Read(precise, V2Offset(field.mOffset, fields), 8);
        Require(ns == 123'456'789, "v2 lost fractional legacy time");
        Reject([&] { QuantizeNanoseconds(field, ns); }, "Strict export accepted fractional legacy time");
    }
}

const Field& Find(Fields fields, std::string_view name)
{
    for (const auto& field : fields) if (field.mName == name) return field;
    throw std::runtime_error("Missing audited time field");
}

void CheckInventory()
{
    using enum LevelSaveFormat::RecordKind;
    // Independent expected counts catch accidental removal of duration fields.
    constexpr std::array<std::size_t, 18> counts = {
        17, 13, 4, 3, 4, 2, 0, 3, 3, 0, 0, 1, 0, 3, 3, 9, 4, 2
    };
    for (std::size_t i = 0; i < counts.size(); ++i)
    {
        const auto kind = static_cast<LevelSaveFormat::RecordKind>(i);
        const auto fields = GetFields(kind);
        Require(fields.size() == counts[i], "Record time inventory changed");
        CheckRecord(LevelSaveFormat::GetRecordLayout(kind).mDat64Size, fields);
    }
    Require(BoardFields().size() == 32 && SeedBankFields().size() == 31,
        "Board or SeedBank time inventory changed");
    CheckRecord(LevelSaveFormat::DAT64_BOARD_STATE_SIZE, BoardFields());
    CheckRecord(LevelSaveFormat::DAT64_SEED_BANK_SIZE, SeedBankFields());
    Require(Find(GetFields(Zombie), "mAnimTicksPerFrame").mOffset == 0x4c,
        "Zombie frame duration mapping is wrong");
    Require(Find(GetFields(Projectile), "mAnimTicksPerFrame").mOffset == 0x60,
        "Projectile frame duration mapping is wrong");
    Require(Find(GetFields(Particle), "mCrossFadeDuration").mOffset == 0x3c,
        "Particle crossfade duration mapping is wrong");
    const auto& start = Find(BoardFields(), "mZombieCountDownStart");
    Require(start.mOffset == 0x543c && start.mTickNs == 10'000'000,
        "Wave countdown initial duration mapping is wrong");
    const auto& active = Find(BoardFields(), "mPlayTimeActiveLevel");
    Require(active.mOffset == 0x561c && active.mTickNs == 1'000'000'000 && !active.mUnsigned,
        "Playtime must be interpreted as signed seconds");
    const auto& draw = Find(BoardFields(), "mStartDrawTime");
    Require(draw.mOffset == 0x5628 && draw.mTickNs == 1'000'000 && draw.mUnsigned,
        "Draw timestamp must be interpreted as unsigned milliseconds");
    Require(Find(BoardFields(), "mPreloadTime").mOffset == 0x5638,
        "GOTY Board tail offset is wrong");
    Require(SeedBankFields()[0].mOffset == 104 && SeedBankFields()[29].mOffset == 992 &&
        SeedBankFields()[30].mOffset == 1020, "Nested SeedBank packet offsets are wrong");
}

void CheckQuantization()
{
    const Field signedTicks{0, false, "signed"};
    const Field unsignedTicks{0, true, "unsigned"};
    Require(QuantizeNanoseconds(signedTicks, 15'000'000, true) == 2,
        "Positive halfway value must round away from zero");
    Require(QuantizeNanoseconds(signedTicks, std::bit_cast<std::uint64_t>(std::int64_t(-15'000'000)), true) ==
        0xfffffffeU, "Negative halfway value must round away from zero");
    Require(QuantizeNanoseconds(signedTicks, std::bit_cast<std::uint64_t>(std::int64_t(-10'000'000))) ==
        0xffffffffU, "Negative sentinel was not preserved");
    Reject([&] { QuantizeNanoseconds(signedTicks, 2147483648ULL * 10'000'000); },
        "Signed overflow accepted");
    Reject([&] { QuantizeNanoseconds(unsignedTicks, 4294967296ULL * 10'000'000); },
        "Unsigned overflow accepted");
    Reject([&] { QuantizeNanoseconds(signedTicks, 2147483647ULL * 10'000'000 + 5'000'000, true); },
        "Rounding overflow accepted");
    Reject([&] { QuantizeNanoseconds(signedTicks,
        std::bit_cast<std::uint64_t>(std::numeric_limits<std::int64_t>::min())); },
        "Extreme negative nanoseconds accepted");
}
}

int main()
{
    try
    {
        CheckInventory();
        CheckQuantization();
        CheckEditableHeader();
        std::cout << "PASS: 18 record layouts, Board, nested SeedBank, 134 time fields; "
            "signed bounds, sentinels, units, fractional ns, editable headers and strict/rounded export\n";
        return 0;
    }
    catch (const std::exception& error)
    {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
