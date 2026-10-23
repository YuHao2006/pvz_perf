#include "SexyAppBase.h"
#include "MacWindow.h"
#include "graphics/DDInterface.h"
#include "graphics/GpuBackend.h"
#include "graphics/GameViewport.h"
#include "graphics/RenderInterface.h"
#include "widget/WidgetManager.h"
#include "misc/KeyCodes.h"
#include "misc/StableTime.h"
#import <AppKit/AppKit.h>
#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <limits>
#include <stdexcept>
#include <vector>

using namespace Sexy;

namespace {
Sexy::Point LogicalMouse(SexyAppBase& app, double x, double y)
{
    int sceneX = -1, sceneY = -1;
    app.MapWindowMouse(x, y, sceneX, sceneY);
    return {sceneX, sceneY};
}

void RecordCommand(SexyAppBase& app, int command)
{
    app.WriteDemoTimingBlock();
    app.mDemoBuffer.WriteNumBits(0, 1);
    app.mDemoBuffer.WriteNumBits(command, 5);
}

void RecordMousePosition(SexyAppBase& app, double x, double y)
{
    if (!app.mRecordingDemoBuffer || app.mShutdown) return;
    const int ix = static_cast<int>(std::floor(x)), iy = static_cast<int>(std::floor(y));
    const int dx = ix - app.mLastDemoMouseX, dy = iy - app.mLastDemoMouseY;
    if (std::abs(dx) < 32 && std::abs(dy) < 32) {
        if (dx || dy) {
            app.WriteDemoTimingBlock();
            app.mDemoBuffer.WriteNumBits(1, 1);
            app.mDemoBuffer.WriteNumBits(0, 1);
            app.mDemoBuffer.WriteNumBits(dx, 6);
            app.mDemoBuffer.WriteNumBits(dy, 6);
        }
    } else {
        RecordCommand(app, DEMO_MOUSE_POSITION);
        app.mDemoBuffer.WriteNumBits(ix, 12);
        app.mDemoBuffer.WriteNumBits(iy, 12);
    }
    app.mLastDemoMouseX = ix;
    app.mLastDemoMouseY = iy;
}

void QueueEvent(void* context, const MacWindowEvent& event)
{
    auto& app = *static_cast<SexyAppBase*>(context);
    if (app.mShutdown || (!app.mDeferredMessages.empty() &&
        app.mDeferredMessages.back().kind == MacEventKind::Close)) return;
    app.mDeferredMessages.push_back(event);
}

void ApplyMousePosition(SexyAppBase& app, double x, double y, bool nativeInside)
{
    if (app.mSwitchingScreenMode) return;
    if (app.mNativeResizePending && !app.mPhysMinimized) app.UpdateWindowGeometry();
    const auto position = LogicalMouse(app, x, y);
    const auto& window = *app.mNativeWindow;
    const bool inside = nativeInside && x >= 0 && y >= 0 &&
        x < window.Width && y < window.Height &&
        app.mScreenBounds.Contains(position.mX, position.mY);
    const bool moved = position.mX != app.mWidgetManager->mLastMouseX ||
        position.mY != app.mWidgetManager->mLastMouseY || inside != app.mMouseIn;
    app.mMouseIn = inside;
    app.mDDInterface->mNextCursorX = app.mDDInterface->mCursorX = position.mX;
    app.mDDInterface->mNextCursorY = app.mDDInterface->mCursorY = position.mY;
    if (inside || app.mWidgetManager->mDownButtons)
        app.mWidgetManager->MouseMove(position.mX, position.mY);
    else {
        app.mWidgetManager->mLastMouseX = position.mX;
        app.mWidgetManager->mLastMouseY = position.mY;
    }
    if (!inside) app.mWidgetManager->MouseExit(position.mX, position.mY);
    if (moved) app.mLastUserInputTick = SexyGetTickCount();
}

void ApplyMouseButton(SexyAppBase& app, int button, bool pressed,
                      double x, double y, int clickCount)
{
    if (button < 0 || button > 2)
        throw std::invalid_argument("Unknown Cocoa mouse button");
    if (app.mSwitchingScreenMode) return;
    const unsigned mask = button == 0 ? 1u : button == 1 ? 2u : 4u;
    if (!pressed && !((app.mWidgetManager->mActualDownButtons |
                      app.mWidgetManager->mDownButtons) & mask)) return;
    // Button coordinates belong to the queued event, never the latest poll.
    app.NativeMouseMove(x, y);
    const auto position = LogicalMouse(app, x, y);
    const int baseCount = button == 1 ? -1 : button == 2 ? 3 : 1;
    int count = baseCount;
    if (pressed && button != 2 && clickCount > 0 && clickCount % 2 == 0) count *= 2;
    if (!app.mMouseIn) {
        if (!pressed) {
            RecordMousePosition(app, x, y);
            if (app.mRecordingDemoBuffer && !app.mShutdown) {
                app.WriteDemoTimingBlock();
                app.mDemoBuffer.WriteNumBits(1, 1);
                app.mDemoBuffer.WriteNumBits(1, 1);
                app.mDemoBuffer.WriteNumBits(0, 1);
                app.mDemoBuffer.WriteNumBits(baseCount, 3);
            }
            app.mWidgetManager->MouseUp(std::clamp(position.mX, 0, app.mWidth - 1),
                std::clamp(position.mY, 0, app.mHeight - 1), baseCount);
            app.mWidgetManager->CancelMouseDownState();
        }
        return;
    }
    RecordMousePosition(app, x, y);
    if (app.mRecordingDemoBuffer && !app.mShutdown) {
        app.WriteDemoTimingBlock();
        app.mDemoBuffer.WriteNumBits(1, 1);
        app.mDemoBuffer.WriteNumBits(1, 1);
        app.mDemoBuffer.WriteNumBits(pressed ? 1 : 0, 1);
        app.mDemoBuffer.WriteNumBits(count, 3);
    }
    // AppKit delivers the matching mouse-up to this view after an outside drag.
    if (pressed) app.mWidgetManager->MouseDown(position.mX, position.mY, count);
    else app.mWidgetManager->MouseUp(position.mX, position.mY, count);
}
}

void SexyAppBase::RequestNativeClose()
{
    MacWindowEvent event{};
    event.kind = MacEventKind::Close;
    QueueEvent(this, event);
}

void SexyAppBase::ProcessMacWindowEvent(const MacWindowEvent& event)
{
    switch (event.kind) {
    case MacEventKind::Close:
        if (mRecordingDemoBuffer && !mShutdown) RecordCommand(*this, DEMO_CLOSE);
        CloseRequestAsync();
        mManualShutdown = true;
        Shutdown();
        return;
    case MacEventKind::Resize:
        mNativeResizePending = true;
        mPhysMinimized = event.minimized;
        mGpuContext->surfaceSuspended = event.minimized;
        if (mMinimized != event.minimized) {
            mMinimized = event.minimized;
            if (mMuteOnLostFocus) {
                if (event.minimized) Mute(true); else Unmute(true);
            }
            if (!event.minimized) mWidgetManager->MarkAllDirty();
        }
        RehupFocus();
        if (mRecordingDemoBuffer && !mShutdown) {
            RecordCommand(*this, DEMO_SIZE);
            mDemoBuffer.WriteBoolean(event.minimized);
        }
        return;
    case MacEventKind::Focus:
        NativeFocusChanged(event.focused);
        if (mRecordingDemoBuffer && !mShutdown) {
            RecordCommand(*this, DEMO_ACTIVATE_APP);
            mDemoBuffer.WriteNumBits(event.focused ? 1 : 0, 1);
        }
        return;
    default: break;
    }
    if (mPlayingDemoBuffer) return;
    mLastUserInputTick = SexyGetTickCount();
    switch (event.kind) {
    case MacEventKind::MouseButton:
        if (!mSEHOccured)
            ApplyMouseButton(*this, event.button, event.pressed, event.x, event.y, event.clickCount);
        break;
    case MacEventKind::MouseWheel: {
        mNativeWheelRemainder += event.y;
        const int steps = static_cast<int>(mNativeWheelRemainder);
        mNativeWheelRemainder -= steps;
        if (steps) {
            if (mRecordingDemoBuffer && !mShutdown) {
                RecordCommand(*this, DEMO_MOUSE_WHEEL);
                mDemoBuffer.WriteNumBits(steps, 8);
            }
            mWidgetManager->MouseWheel(steps);
        }
        break;
    }
    case MacEventKind::Key: {
        if (!event.key) break;
        const auto key = static_cast<KeyCode>(event.key);
        if (key == KEYCODE_CONTROL) mCtrlDown = event.pressed;
        if (key == KEYCODE_MENU) mAltDown = event.pressed;
        if (key == KEYCODE_RETURN && event.pressed && mAltDown) {
            if (!mAltEnterDown) {
                mAltEnterDown = true;
                RequestScreenMode(!mIsWindowed, mUseCustomScale);
            }
            break;
        }
        if (key == KEYCODE_RETURN && !event.pressed && mAltEnterDown) {
            mAltEnterDown = false;
            break;
        }
        if (mRecordingDemoBuffer && !mShutdown) {
            RecordCommand(*this, event.pressed ? DEMO_KEY_DOWN : DEMO_KEY_UP);
            mDemoBuffer.WriteNumBits(event.key, 8);
        }
        if (event.pressed) DispatchKeyDown(static_cast<int>(event.key));
        else mWidgetManager->KeyUp(key);
        break;
    }
    case MacEventKind::Text:
        if (mAltEnterDown || event.text > static_cast<unsigned>(std::numeric_limits<SexyChar>::max()))
            break;
        if constexpr (sizeof(SexyChar) == 1)
            if (event.text >= 128) break;
        if (mRecordingDemoBuffer && !mShutdown) {
            RecordCommand(*this, DEMO_KEY_CHAR);
            mDemoBuffer.WriteNumBits(sizeof(SexyChar) == 2, 1);
            mDemoBuffer.WriteNumBits(event.text, sizeof(SexyChar) * 8);
        }
        mWidgetManager->KeyChar(static_cast<SexyChar>(event.text));
        break;
    case MacEventKind::Close: case MacEventKind::Resize: case MacEventKind::Focus:
        break;
    }
}

void SexyAppBase::MapWindowMouse(double x, double y, int& sceneX, int& sceneY) const
{
    const auto& window = *mNativeWindow;
    if (window.Width <= 0 || window.Height <= 0 ||
        window.DrawableWidth <= 0 || window.DrawableHeight <= 0) {
        sceneX = sceneY = -1;
        return;
    }
    const auto rect = mDDInterface->mRenderInterface->mRenderer->PresentRect(
        window.DrawableWidth, window.DrawableHeight);
    const auto point = WindowPointToScene(x, y, window.Width, window.Height,
        window.DrawableWidth, window.DrawableHeight, rect,
        mScreenBounds.mWidth, mScreenBounds.mHeight);
    sceneX = point.x + mScreenBounds.mX;
    sceneY = point.y + mScreenBounds.mY;
}

void SexyAppBase::RegisterWindowClasses()
{
    // Cocoa has no class registration. Establish the real process application.
    if (![NSThread isMainThread])
        throw std::logic_error("Cocoa application must start on the main thread");
    [NSApplication sharedApplication];
    mIsWideWindow = sizeof(SexyChar) == sizeof(wchar_t);
}

void SexyAppBase::MakeWindow()
{
    if (mNativeWindow || mGpuContext)
        throw std::logic_error("Cocoa game window already exists");
    RegisterWindowClasses();
    // HDR metadata/EDR policy must be supplied by the renderer before enabling it.
    if (mScaleHDREnabled)
        throw std::logic_error("Cocoa HDR display policy is not implemented");
    MacWindowConfig config;
    config.title = mTitle;
    config.width = GameViewport::MaximumWidth;
    config.height = mHeight;
    config.callback = QueueEvent;
    config.callbackContext = this;
    mNativeWindow = std::make_unique<MacWindow>(config);
    mHWnd = mNativeWindow.get();
    mGpuContext = std::make_unique<GpuContext>(mHWnd,
        std::getenv("PVZ_METAL_VALIDATION") != nullptr, mScaleHDREnabled);
    mUseExternalHWND = false;
    mExternalHWND = nullptr;
    mIsPhysWindowed = true;
    mDDInterface = new DDInterface(this);
    if (InitDDInterface() != DDInterface::RESULT_OK)
        throw std::runtime_error("Cocoa Metal display initialization failed");
    ReInitImages();
    mWidgetManager->mImage = mDDInterface->mScreenImage;
    mWidgetManager->MarkAllDirty();
    mActive = mNativeWindow->Focused;
    mPhysMinimized = mMinimized = false;
    mNativeWindowReady = true;
    RehupFocus();
    EnforceCursor();
}

void SexyAppBase::PumpWindowEvents()
{
    mNativeWindow->PumpEvents();
    const auto now = SexyGetTickCount();
    if (now - mLastTimerTime > 500) mLastBigDelayTime = now;
    mLastTimerTime = now;
}

bool SexyAppBase::ProcessDeferredMessages(bool singleMessage)
{
    while (!mShutdown && !mDeferredMessages.empty()) {
        const auto event = mDeferredMessages.front();
        mDeferredMessages.pop_front();
        ProcessMacWindowEvent(event);
        if (singleMessage) break;
    }
    if (!mShutdown && mNativeResizePending && !mPhysMinimized &&
        !mSwitchingScreenMode && (mDeferredMessages.empty() || !singleMessage))
        UpdateWindowGeometry();
    return !mDeferredMessages.empty();
}

void SexyAppBase::ResizeWindowClient(int width, int height)
{
    if (mNativeFullscreen) throw std::logic_error("Cannot resize a fullscreen Cocoa client");
    mNativeWindow->Resize(width, height);
    mNativeResizePending = true;
}
void SexyAppBase::SetWindowFullscreen(bool fullscreen)
{
    if (fullscreen == mNativeFullscreen) return;
    mNativeWindow->SetFullscreen(fullscreen);
    mNativeFullscreen = fullscreen;
    mNativeResizePending = true;
}
void SexyAppBase::PrepareFullscreenScaleForMonitor()
{
    if (!mModernScalePrepared || !mNativeFullscreen) return;
    const int width = mNativeWindow->DrawableWidth, height = mNativeWindow->DrawableHeight;
    if (width == mModernScaleTargetW && height == mModernScaleTargetH) return;
    std::vector<ScaleEffectRuntimeDesc*> effects;
    std::vector<ScaleEffectScaling> scaling;
    if (mScaleFullscreenConfig.mDeclared && !BuildScalePipelineForMode(false, effects, scaling))
        throw std::runtime_error("Cannot resolve Cocoa fullscreen scale pipeline");
    std::vector<GpuScaleStep> steps;
    for (size_t i = 0; i < effects.size(); ++i) steps.push_back({effects[i], scaling[i]});
    auto& renderer = *mDDInterface->mRenderInterface->mRenderer;
    renderer.PrepareScale(true, steps, width, height);
    renderer.WarmScale(true);
    mModernScaleTargetW = width;
    mModernScaleTargetH = height;
}
void SexyAppBase::UpdateWindowGeometry()
{
    mNativeResizePending = true;
    auto& render = *mDDInterface->mRenderInterface;
    if (render.mSceneBegun) render.Flush();
    const int prepared = mDDInterface->PrepareScreenMode(mHWnd, mIsWindowed);
    if (prepared == DDInterface::RESULT_DEFERRED) return;
    if (prepared != DDInterface::RESULT_OK)
        throw NativeDisplayError(NativeDisplayOperation::PrepareScreenMode, prepared);
    PrepareFullscreenScaleForMonitor();
    const int resized = mDDInterface->ResizePreparedPresent();
    if (resized == DDInterface::RESULT_DEFERRED) return;
    if (resized != DDInterface::RESULT_OK)
        throw NativeDisplayError(NativeDisplayOperation::ResizePreparedPresent, resized);
    mNativeResizePending = false;
    mWidgetManager->Resize(mScreenBounds, mDDInterface->mVisibleGameRect);
    mWidgetManager->MarkAllDirty();
}
void SexyAppBase::UpdateMonitorState()
{
    UpdateWindowGeometry();
    mNativeTopologyPending = false;
    ClearUpdateBacklog(false);
}
void SexyAppBase::UpdateHdrDisplay()
{
    if (mScaleHDREnabled)
        throw std::logic_error("Cocoa HDR display policy is not implemented");
}
void SexyAppBase::SwitchScreenMode(bool windowed, bool force)
{
    if (mSwitchingScreenMode) return;
    if (mForceWindowed) windowed = true;
    else if (mForceFullscreen) windowed = false;
    if (mIsWindowed == windowed && !force) return;
    mSwitchingScreenMode = true;
    struct Reset { bool& flag; ~Reset() { flag = false; } } reset{mSwitchingScreenMode};
    mWidgetManager->CancelMouseDownState();
    ClearKeysDown();
    auto& render = *mDDInterface->mRenderInterface;
    render.Flush();
    SetWindowFullscreen(!windowed);
    if (windowed) {
        const auto scaled = render.mRenderer->ScaleOutput(false);
        ResizeWindowClient(IsScalePresentActiveForMode(true) ? static_cast<int>(scaled.width) : render.mRenderer->sceneWidth,
                           IsScalePresentActiveForMode(true) ? static_cast<int>(scaled.height) : render.mRenderer->sceneHeight);
    }
    mIsWindowed = windowed;
    mIsPhysWindowed = true;
    render.mRenderer->SetScaleMode(IsScalePresentActiveForMode(windowed), !windowed);
    UpdateWindowGeometry();
    render.PresentRetainedFrame();
    ClearUpdateBacklog(false);
}

POINT SexyAppBase::ReadNativeMousePosition()
{
    const auto pointer = mNativeWindow->SamplePointer();
    return {static_cast<LONG>(std::floor(pointer.x)), static_cast<LONG>(std::floor(pointer.y))};
}
void SexyAppBase::SampleNativeMousePosition()
{
    // Called once by UpdateFrames, the existing 100 Hz logical heartbeat.
    if (mPlayingDemoBuffer || !mActive || mPhysMinimized || mSwitchingScreenMode) return;
    if (!mNativeWindowShown) return;
    if (!mNativeWindow->BeginMouseSample(mUpdateCount)) return;
    const auto pointer = mNativeWindow->SamplePointer();
    RecordMousePosition(*this, pointer.x, pointer.y);
    ApplyMousePosition(*this, pointer.x, pointer.y, pointer.inside);
    EnforceCursor();
}
void SexyAppBase::NativeMouseMove(double x, double y)
{
    ApplyMousePosition(*this, x, y, true);
    EnforceCursor();
}
void SexyAppBase::NativeMouseLeave()
{
    mMouseIn = false;
    mWidgetManager->MouseExit(mWidgetManager->mLastMouseX, mWidgetManager->mLastMouseY);
    EnforceCursor();
}
void SexyAppBase::NativeMouseButton(int button, bool pressed, double x, double y, double time)
{
    if (button < 0 || button > 2) throw std::invalid_argument("Unknown Cocoa mouse button");
    int clicks = 1;
    // Synthetic/probe entry only; real events use AppKit's clickCount directly.
    if (pressed) {
        if (button != 2 && time >= mNativeLastClickTime[button] &&
            time - mNativeLastClickTime[button] <= NSEvent.doubleClickInterval &&
            std::abs(x - mNativeLastClickX[button]) <= 4 &&
            std::abs(y - mNativeLastClickY[button]) <= 4) {
            clicks = 2;
            mNativeLastClickTime[button] = -1000;
        } else mNativeLastClickTime[button] = time;
        mNativeLastClickX[button] = x;
        mNativeLastClickY[button] = y;
    }
    ApplyMouseButton(*this, button, pressed, x, y, clicks);
}
void SexyAppBase::NativeMouseWheel(int delta)
{
    MacWindowEvent event{};
    event.kind = MacEventKind::MouseWheel;
    event.y = delta / 120.0;
    ProcessMacWindowEvent(event);
}
void SexyAppBase::NativeFocusChanged(bool focused)
{
    mActive = focused;
    if (!focused) {
        mAltEnterDown = false;
        mCtrlDown = mAltDown = false;
        mWidgetManager->CancelMouseDownState();
        mNativeLastClickTime.fill(-1000);
        ClearKeysDown();
        NativeMouseLeave();
    }
    RehupFocus();
}
void SexyAppBase::EnforceCursor() { UpdateNativeCursorSelection(); }
void SexyAppBase::UpdateNativeCursorSelection()
{
    if (!mNativeWindow) return;
    if (mOverrideCursor)
        throw std::logic_error("Cocoa cursor overrides require an owned native cursor API");
    MacCursor cursor = MacCursor::Arrow;
    const int selected = mSEHOccured || !mMouseIn ? CURSOR_POINTER : mCursorNum;
    switch (selected) {
    case CURSOR_POINTER: break;
    case CURSOR_HAND: cursor = MacCursor::Hand; break;
    case CURSOR_TEXT: cursor = MacCursor::Text; break;
    case CURSOR_DRAGGING: case CURSOR_SIZEALL: cursor = MacCursor::Move; break;
    case CURSOR_CIRCLE_SLASH: cursor = MacCursor::Forbidden; break;
    case CURSOR_SIZEWE: cursor = MacCursor::ResizeHorizontal; break;
    case CURSOR_SIZENS: cursor = MacCursor::ResizeVertical; break;
    case CURSOR_SIZENESW: cursor = MacCursor::ResizeNorthEast; break;
    case CURSOR_SIZENWSE: cursor = MacCursor::ResizeNorthWest; break;
    case CURSOR_WAIT: cursor = MacCursor::Wait; break;
    case CURSOR_NONE: case CURSOR_CUSTOM: cursor = MacCursor::Hidden; break;
    default: throw std::invalid_argument("Unknown game cursor");
    }
    mNativeWindow->ApplyCursor(cursor);
    mNativeCursorIndex = static_cast<int>(cursor);
    mSysCursor = cursor != MacCursor::Hidden;
}
void SexyAppBase::DestroyGameWindow()
{
    mNativeWindowReady = mNativeWindowShown = false;
    if (mGpuContext) mGpuContext->WaitIdle();
    mGpuContext.reset();
    mHWnd = nullptr;
    mNativeWindow.reset();
    mDeferredMessages.clear();
}
