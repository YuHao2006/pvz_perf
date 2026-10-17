#include "SexyAppFramework/platform/WindowGeometry.h"
#include "SexyAppFramework/platform/NativeWindow.h"

namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window) {
    return {window->Width, window->Height};
}
}
