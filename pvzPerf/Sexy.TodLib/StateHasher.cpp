#include "StateHasher.h"

#include <cstring>
#include <iomanip>
#include <sstream>

namespace pvz::determinism {
namespace {

constexpr std::uint64_t kFnvPrime = 1099511628211ULL;

enum class ValueTag : std::uint8_t {
    boolean = 0x01,
    unsigned_8 = 0x10,
    unsigned_16 = 0x11,
    unsigned_32 = 0x12,
    unsigned_64 = 0x13,
    signed_8 = 0x20,
    signed_16 = 0x21,
    signed_32 = 0x22,
    signed_64 = 0x23,
    float_32 = 0x30,
    float_64 = 0x31,
    string = 0x40,
    bytes = 0x41,
    sequence_size = 0x50,
};

} // namespace

std::string StateDigest::hex() const
{
    std::ostringstream output;
    output << std::hex << std::setfill('0') << std::setw(16) << value;
    return output.str();
}

void StateHasher::add(const bool value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::boolean));
    add_raw_byte(value ? 1 : 0);
}

void StateHasher::add(const std::uint8_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::unsigned_8));
    add_raw_byte(value);
}

void StateHasher::add(const std::uint16_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::unsigned_16));
    add_raw_little_endian(value, 2);
}

void StateHasher::add(const std::uint32_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::unsigned_32));
    add_raw_little_endian(value, 4);
}

void StateHasher::add(const std::uint64_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::unsigned_64));
    add_raw_little_endian(value, 8);
}

void StateHasher::add(const std::int8_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::signed_8));
    add_raw_byte(static_cast<std::uint8_t>(value));
}

void StateHasher::add(const std::int16_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::signed_16));
    add_raw_little_endian(static_cast<std::uint16_t>(value), 2);
}

void StateHasher::add(const std::int32_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::signed_32));
    add_raw_little_endian(static_cast<std::uint32_t>(value), 4);
}

void StateHasher::add(const std::int64_t value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::signed_64));
    add_raw_little_endian(static_cast<std::uint64_t>(value), 8);
}

void StateHasher::add(const float value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::float_32));
    std::uint32_t bits = 0;
    static_assert(sizeof(bits) == sizeof(value));
    std::memcpy(&bits, &value, sizeof(bits));
    add_raw_little_endian(bits, 4);
}

void StateHasher::add(const double value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::float_64));
    std::uint64_t bits = 0;
    static_assert(sizeof(bits) == sizeof(value));
    std::memcpy(&bits, &value, sizeof(bits));
    add_raw_little_endian(bits, 8);
}

void StateHasher::add_string(const std::string_view value) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::string));
    add_raw_little_endian(static_cast<std::uint64_t>(value.size()), 8);
    for (const char character : value)
        add_raw_byte(static_cast<std::uint8_t>(character));
}

void StateHasher::add_bytes(const std::uint8_t* const data, const std::size_t size) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::bytes));
    add_raw_little_endian(static_cast<std::uint64_t>(size), 8);
    for (std::size_t index = 0; index < size; ++index)
        add_raw_byte(data[index]);
}

void StateHasher::add_sequence_size(const std::uint64_t size) noexcept
{
    add_tag(static_cast<std::uint8_t>(ValueTag::sequence_size));
    add_raw_little_endian(size, 8);
}

StateDigest StateHasher::finish() const noexcept
{
    return {hash_};
}

void StateHasher::add_tag(const std::uint8_t tag) noexcept
{
    add_raw_byte(tag);
}

void StateHasher::add_raw_byte(const std::uint8_t value) noexcept
{
    hash_ ^= value;
    hash_ *= kFnvPrime;
}

void StateHasher::add_raw_little_endian(std::uint64_t value, const std::uint8_t byte_count) noexcept
{
    for (std::uint8_t index = 0; index < byte_count; ++index) {
        add_raw_byte(static_cast<std::uint8_t>(value & 0xFF));
        value >>= 8;
    }
}

} // namespace pvz::determinism
