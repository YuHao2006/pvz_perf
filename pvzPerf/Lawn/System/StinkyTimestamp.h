#pragma once
#include <cstdint>

namespace StinkyTimestamp {
// The compatible profile stores Unix seconds in four bytes. Decode the bits
// before widening: sign-extending an int32_t makes dates after 2038 negative.
// This unsigned epoch ends in 2106; the wire format carries no epoch number.
constexpr std::int64_t DecodeTime(std::int32_t stored) noexcept {
    return static_cast<std::uint32_t>(stored);
}

// The compatible profile field stores the low 32 bits, with zero reserved
// for "not purchased". This does not change the clock or extend its range.
constexpr std::int32_t EncodeWakeTime(std::int64_t seconds) noexcept {
    const auto encoded=static_cast<std::int32_t>(seconds);
    return encoded==0?1:encoded;
}
}
