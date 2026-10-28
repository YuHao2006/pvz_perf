#include "SexyAppFramework/platform/WindowGeometry.h"
#include "SexyAppFramework/platform/NativeWindow.h"
#if defined(__ANDROID__)
#include <android/native_window.h>

namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window) {
    return {ANativeWindow_getWidth(window), ANativeWindow_getHeight(window)};
}
}
#else

namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window) {
    return {window->Width, window->Height};
}
}
#endif
