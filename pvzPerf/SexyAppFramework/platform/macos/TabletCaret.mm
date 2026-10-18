#include "SexyAppFramework/platform/TabletCaret.h"
#include <stdexcept>

namespace Sexy {
// This API requests Windows TabletPC integration, not the game's drawn caret.
// Cocoa text input lives in PVZMetalView's NSTextInputClient instead.
void NativeTabletCaret::Begin(NativeWindowHandle)
{
    throw std::logic_error("Windows TabletPC caret integration is unavailable on macOS");
}
void NativeTabletCaret::Position(int, int)
{
    throw std::logic_error("Windows TabletPC caret integration is unavailable on macOS");
}
void NativeTabletCaret::Show(NativeWindowHandle)
{
    throw std::logic_error("Windows TabletPC caret integration is unavailable on macOS");
}
void NativeTabletCaret::End(NativeWindowHandle)
{
    throw std::logic_error("Windows TabletPC caret integration is unavailable on macOS");
}
}
