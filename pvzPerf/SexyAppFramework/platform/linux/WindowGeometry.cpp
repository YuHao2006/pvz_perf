#include "SexyAppFramework/platform/WindowGeometry.h"
#include "SexyAppFramework/platform/NativeWindow.h"
#if defined(__OHOS__)
namespace Sexy {
NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window) {
    int width = 0, height = 0;
    if (window) OH_NativeWindow_NativeWindowHandleOpt(window, GET_BUFFER_GEOMETRY, &height, &width);
    return {width, height};
}
}
#elif defined(__ANDROID__)
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
