#pragma once
#include <array>
#include <cstdint>
#include <fstream>
#include <limits>
#include <list>
#include <string>
#include <utility>
#include <vector>

namespace Sexy::DemoTools {

// The original v1/v2 container, not Portable's later replay protocol.
// Parse into temporary ownership; never publish a partial marker list or seed.
struct DemoContainer {
    std::uint32_t seed = 0;
    std::uint32_t duration = 0;
    std::list<std::pair<std::string, std::uint32_t>> markers;
    std::vector<unsigned char> commands;
};

inline constexpr std::uint64_t MaxDemoCommandBytes =
    (static_cast<std::uint64_t>((std::numeric_limits<int>::max)()) - 7) / 8;

// Buffer uses signed int bit positions, including (mDataBitSize + 7).
inline constexpr bool DemoCommandSizeFits(std::uint64_t size) {
    return size > 0 && size <= MaxDemoCommandBytes;
}

class DemoFileInput {
public:
    std::ifstream stream;
    std::uint64_t remaining = 0;

    explicit DemoFileInput(const std::string& path)
        : stream(path, std::ios::binary | std::ios::ate) {}

    bool Measure() {
        const auto size = stream.tellg();
        if (size < 0) return false;
        remaining = static_cast<std::uint64_t>(size);
        stream.seekg(0, std::ios::beg);
        return bool(stream);
    }

    bool Bytes(void* destination, std::size_t count) {
        if (count > remaining ||
            count > static_cast<std::uint64_t>((std::numeric_limits<std::streamsize>::max)()))
            return false;
        if (count && !stream.read(static_cast<char*>(destination), static_cast<std::streamsize>(count)))
            return false;
        remaining -= count;
        return true;
    }

    bool Word(std::uint32_t& value, unsigned width = 4) {
        std::array<unsigned char, 4> bytes{};
        if (width > bytes.size() || !Bytes(bytes.data(), width)) return false;
        value = 0;
        for (unsigned i = 0; i < width; ++i)
            value |= static_cast<std::uint32_t>(bytes[i]) << (i * 8);
        return true;
    }
};

inline bool ReadDemoContainer(const std::string& path, const std::string& expectedProduct,
                              DemoContainer& output, std::string& error) {
    error = "Invalid demo file.";
    DemoFileInput input(path);
    if (!input.stream) {
        error = "Demo file not found: " + path;
        return false;
    }
    if (!input.Measure()) return false;
    std::uint32_t magic = 0, version = 0, productLength = 0;
    DemoContainer parsed;
    if (!input.Word(magic) || magic != 0x42beef78 || !input.Word(version)) return false;
    if (version != 1 && version != 2) {
        error = "Unsupported demo file version: " + std::to_string(version);
        return false;
    }
    if (!input.Word(parsed.seed) || !input.Word(productLength, 2) ||
        productLength > input.remaining) return false;
    std::string product(productLength, '\0');
    if (!input.Bytes(product.data(), product.size())) return false;
    if (product != expectedProduct) {
        error = "This demo file appears to be for '" + product + "'";
        return false;
    }

    if (version == 2) {
        std::uint32_t markerSize = 0, count = 0;
        // Four bytes for duration and at least one command byte must remain.
        if (!input.Word(markerSize) || markerSize < 4 || input.remaining < 5 ||
            markerSize > input.remaining - 5 || !input.Word(count)) return false;
        std::uint64_t markerRemaining = markerSize - 4;
        // Each original Buffer::WriteString marker needs >= 2+0+4 bytes.
        // Also rejects negative counts without a huge allocation or loop.
        if (count > markerRemaining / 6) return false;
        for (std::uint32_t i = 0; i < count; ++i) {
            std::uint32_t length = 0, tick = 0;
            if (markerRemaining < 6 || !input.Word(length, 2)) return false;
            markerRemaining -= 2;
            // Original marker lengths are signed 16-bit, unlike the unsigned
            // product-version length above. Never treat a negative name as empty.
            if (length > 0x7fff || length > markerRemaining - 4) return false;
            std::string name(length, '\0');
            if (!input.Bytes(name.data(), name.size()) || !input.Word(tick)) return false;
            markerRemaining -= length + 4;
            parsed.markers.emplace_back(std::move(name), tick);
        }
        if (markerRemaining != 0) return false;
    }

    if (!input.Word(parsed.duration) || !DemoCommandSizeFits(input.remaining)) return false;
    parsed.commands.resize(static_cast<std::size_t>(input.remaining));
    if (!input.Bytes(parsed.commands.data(), parsed.commands.size())) return false;
    // This validates the container and marker framing, not every bit-packed
    // command's payload/dispatch timing. Those need a separate replay audit.
    output = std::move(parsed);
    error.clear();
    return true;
}

} // namespace Sexy::DemoTools
