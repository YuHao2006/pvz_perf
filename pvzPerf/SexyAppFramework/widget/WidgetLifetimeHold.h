#pragma once
#include "Widget.h"

namespace Sexy {
// A stack-scoped lifetime, not a modal/global cleanup lock. Other queued
// widgets can still be deleted. No allocation and no ownership transfer.
class WidgetLifetimeHold final {
    Widget& mWidget;
public:
    explicit WidgetLifetimeHold(Widget& widget) noexcept : mWidget(widget) {
        ++mWidget.mDeferredDeleteHolds;
    }
    ~WidgetLifetimeHold() { --mWidget.mDeferredDeleteHolds; }
    WidgetLifetimeHold(const WidgetLifetimeHold&) = delete;
    WidgetLifetimeHold& operator=(const WidgetLifetimeHold&) = delete;
};
}
