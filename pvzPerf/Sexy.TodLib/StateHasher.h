#pragma once
// Board-state trace utility; independent of window and graphics backends.

#include <array>
#include <cstddef>
#include <cstdint>
#include <string>
#include <string_view>
#include <type_traits>

namespace pvz::determinism {

struct StateDigest {
    std::uint64_t value{0};

    [[nodiscard]] std::string hex() const;
    [[nodiscard]] bool operator==(const StateDigest& other) const noexcept { return value == other.value; }
    [[nodiscard]] bool operator!=(const StateDigest& other) const noexcept { return !(*this == other); }
};

class StateHasher {
public:
    StateHasher() = default;

    void add(bool value) noexcept;
    void add(std::uint8_t value) noexcept;
    void add(std::uint16_t value) noexcept;
    void add(std::uint32_t value) noexcept;
    void add(std::uint64_t value) noexcept;
    void add(std::int8_t value) noexcept;
    void add(std::int16_t value) noexcept;
    void add(std::int32_t value) noexcept;
    void add(std::int64_t value) noexcept;
    void add(float value) noexcept;
    void add(double value) noexcept;
    void add_string(std::string_view value) noexcept;
    void add_bytes(const std::uint8_t* data, std::size_t size) noexcept;

    template <std::size_t Size>
    void add_bytes(const std::array<std::uint8_t, Size>& value) noexcept
    {
        add_bytes(value.data(), value.size());
    }

    void add_sequence_size(std::uint64_t size) noexcept;

    template <typename Enum, typename std::enable_if<std::is_enum<Enum>::value, int>::type = 0>
    void add_enum(const Enum value) noexcept
    {
        using Underlying = typename std::underlying_type<Enum>::type;
        add(static_cast<Underlying>(value));
    }

    [[nodiscard]] StateDigest finish() const noexcept;

private:
    void add_tag(std::uint8_t tag) noexcept;
    void add_raw_byte(std::uint8_t value) noexcept;
    void add_raw_little_endian(std::uint64_t value, std::uint8_t byte_count) noexcept;

    std::uint64_t hash_{14695981039346656037ULL};
};

} // namespace pvz::determinism
