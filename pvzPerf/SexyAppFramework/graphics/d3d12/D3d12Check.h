#pragma once

#include <cstdint>
#include <iomanip>
#include <sstream>
#include <stdexcept>
#include <string>

namespace Sexy {

// HRESULT values stay SDK-free at the renderer/context boundary.
class D3d12CallError : public std::runtime_error {
public:
    D3d12CallError(std::int32_t result, const char* operation,
                   std::int32_t deviceRemovedReason = 0)
        : std::runtime_error(Message(result, operation, deviceRemovedReason)),
          result(result), deviceRemovedReason(deviceRemovedReason) {}

    std::int32_t result;
    std::int32_t deviceRemovedReason;

private:
    static std::string Message(std::int32_t result, const char* operation,
                               std::int32_t deviceRemovedReason) {
        std::ostringstream message;
        message << (operation ? operation : "D3D12 call")
                << " failed (HRESULT 0x" << std::hex << std::uppercase
                << std::setfill('0') << std::setw(8)
                << static_cast<std::uint32_t>(result);
        if (deviceRemovedReason < 0) {
            message << ", device removal reason 0x" << std::setw(8)
                    << static_cast<std::uint32_t>(deviceRemovedReason);
        }
        message << ')';
        return message.str();
    }
};

inline void D3d12Check(std::int32_t result, const char* operation,
                       std::int32_t deviceRemovedReason = 0) {
    if (result < 0)
        throw D3d12CallError(result, operation, deviceRemovedReason);
}

} // namespace Sexy
