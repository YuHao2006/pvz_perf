#pragma once

#ifdef _WIN32
#include "windows/NativeHandles.h"
#elif defined(__linux__)
namespace Sexy {
class NativeWindow;
struct NativeMonitor;
}
using NativeWindowHandle = Sexy::NativeWindow*;
// Opaque identity only. Linux HDR monitor metadata is not implemented.
using NativeMonitorHandle = Sexy::NativeMonitor*;
#else
#error Unsupported native window platform
#endif
