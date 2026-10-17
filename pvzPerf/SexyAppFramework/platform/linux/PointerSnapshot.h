#pragma once

#include "SexyAppFramework/platform/NativeWindow.h"

namespace Sexy::NativeInput {

// Protocol motion changes only this snapshot, never the discrete event queue.
struct PointerSnapshot {
    NativePointerState position;

    void Move(double x, double y)
    {
        position.x = x;
        position.y = y;
    }

    NativeWindowEvent Boundary(bool inside)
    {
        position.inside = inside;
        NativeWindowEvent event{};
        event.kind = inside ? NativeWindowEventKind::MouseEnter :
                              NativeWindowEventKind::MouseLeave;
        event.x = position.x;
        event.y = position.y;
        return event;
    }

    NativeWindowEvent Button(int button, bool pressed) const
    {
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::MouseButton;
        event.x = position.x;
        event.y = position.y;
        event.button = button;
        event.pressed = pressed;
        return event;
    }
};

} // namespace Sexy::NativeInput
