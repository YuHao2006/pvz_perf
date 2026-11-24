#pragma once
#include <array>
#include <cstddef>
#include <cstdint>

namespace Sexy {
namespace crc_detail {
consteval std::array<std::uint32_t, 256> GenerateCRCTable()
{
    std::array<std::uint32_t, 256> table{};
    for (std::uint32_t i = 0; i < table.size(); ++i)
    {
        std::uint32_t remainder = i << 24;
        for (unsigned bit = 0; bit < 8; ++bit)
            remainder = (remainder & 0x80000000u)
                ? (remainder << 1) ^ 0x04C11DB7u : remainder << 1;
        table[i] = remainder;
    }
    return table;
}

// No runtime "ready" flag, partially filled table, allocation or first-use lock.
inline constexpr auto crc_table = GenerateCRCTable();

}
inline std::uint32_t UpdateCRC(std::uint32_t remainder, const unsigned char* bytes, std::size_t length)
{
    // Keep the framework's non-reflected, caller-seeded CRC without final XOR.
    for (size_t i = 0; i < length; ++i)
        remainder = (remainder << 8) ^ crc_detail::crc_table[(remainder >> 24) ^ bytes[i]];
    return remainder;
}
}
