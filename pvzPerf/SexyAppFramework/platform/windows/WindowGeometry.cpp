#include "SexyAppFramework/platform/WindowGeometry.h"
#include <windows.h>
#include <stdexcept>
#include <string>

namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window) {
    RECT client{};
    if (!GetClientRect(window, &client))
        throw std::runtime_error("GetClientRect failed: " + std::to_string(GetLastError()));
    return {client.right - client.left, client.bottom - client.top};
}
}
