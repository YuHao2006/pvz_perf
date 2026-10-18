#include "SexyAppFramework/platform/WindowGeometry.h"
#include "MacWindow.h"
#include <stdexcept>

namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window)
{
    if (!window) throw std::invalid_argument("Cannot query a null Cocoa window");
    return {window->DrawableWidth, window->DrawableHeight};
}
}
