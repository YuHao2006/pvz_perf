#include "SexyAppFramework/platform/NativeWindow.h"
#include "PointerSnapshot.h"
#include "LinuxInput.h"

#include <wayland-client.h>
#include <wayland-cursor.h>
#include <libdecor.h>
#include <xkbcommon/xkbcommon.h>

#include <algorithm>
#include <array>
#include <cerrno>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <deque>
#include <exception>
#include <limits>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <utility>

#include <linux/input-event-codes.h>
#include <sys/mman.h>
#include <unistd.h>

namespace Sexy {
namespace {

struct FileDescriptor {
    explicit FileDescriptor(int value) : value(value) {}
    ~FileDescriptor() { if (value >= 0) ::close(value); }
    int value;
};

struct Mapping {
    Mapping(int fd, size_t size) : size(size) {
        data = ::mmap(nullptr, size, PROT_READ, MAP_PRIVATE, fd, 0);
        if (data == MAP_FAILED)
            throw std::runtime_error("Wayland: unable to map the keyboard keymap");
    }
    ~Mapping() { ::munmap(data, size); }
    void* data;
    size_t size;
};

[[noreturn]] void DisplayError(wl_display* display, const char* operation) {
    const int error = wl_display_get_error(display);
    throw std::runtime_error(std::string("Wayland: ") + operation + ": " +
                             std::strerror(error ? error : (errno ? errno : EIO)));
}

template<class T>
T* Require(T* object, const char* description) {
    if (!object)
        throw std::runtime_error(std::string("Wayland: unable to create ") + description);
    return object;
}

void CheckListener(int result) {
    if (result < 0)
        throw std::runtime_error("Wayland: unable to install a protocol listener");
}

} // namespace

struct NativeWindow::Impl {
    using Clock = std::chrono::steady_clock;

    NativeWindow& owner;
    wl_display* display = nullptr;
    wl_registry* registry = nullptr;
    wl_compositor* compositor = nullptr;
    wl_seat* seat = nullptr;
    wl_pointer* pointer = nullptr;
    wl_keyboard* keyboard = nullptr;
    wl_surface* surface = nullptr;
    wl_shm* shm = nullptr;
    wl_surface* cursorSurface = nullptr;
    wl_cursor_theme* cursorTheme = nullptr;
    std::array<wl_cursor*, 10> cursorShapes{};
    NativeCursor cursor = NativeCursor::Arrow;
    unsigned int pointerSerial = 0;
    unsigned long long lastPointerTime = 0;
    NativeInput::InputClock inputClock;
    libdecor* decoration = nullptr;
    libdecor_frame* frame = nullptr;
    wl_callback* contentFrame = nullptr;
    xkb_context* xkbContext = nullptr;
    xkb_keymap* keymap = nullptr;
    xkb_state* keyState = nullptr;

    uint32_t compositorName = 0, seatName = 0;
    int requestedWidth = 0, requestedHeight = 0;
    bool configured = false, activated = false;
    bool configuring = false;
    bool pumping = false;
    NativeInput::PointerSnapshot pointerState;
    double axisX = 0, axisY = 0;
    double discreteX = 0, discreteY = 0;
    bool hasDiscreteX = false, hasDiscreteY = false;
    bool buttons[3]{};
    std::unordered_map<uint32_t, xkb_keysym_t> heldKeys;
    int repeatRate = 0, repeatDelay = 0;
    bool repeating = false;
    uint32_t repeatKey = 0;
    Clock::time_point nextRepeat{};
    std::exception_ptr callbackException;
    std::deque<NativeWindowEvent> events;
    NativeWindowEventCallback callback = nullptr;
    void* callbackContext = nullptr;

    Impl(NativeWindow& window, const NativeWindowConfig& config)
        : owner(window),
          requestedWidth(config.width), requestedHeight(config.height),
          callback(config.callback), callbackContext(config.callbackContext) {
        if (config.width <= 0 || config.height <= 0)
            throw std::invalid_argument("Wayland: window dimensions must be positive");
        try {
            display = Require(wl_display_connect(nullptr), "display connection");
            xkbContext = Require(xkb_context_new(XKB_CONTEXT_NO_FLAGS), "XKB context");
            registry = Require(wl_display_get_registry(display), "registry");
            CheckListener(wl_registry_add_listener(registry, &RegistryListener(), this));
            Roundtrip();
            if (!compositor)
                throw std::runtime_error("Wayland: compositor is required");
            // Receive seat capabilities and repeat information before creating the role.
            Roundtrip();
            PrepareCursors();
            surface = Require(wl_compositor_create_surface(compositor), "surface");
            CheckListener(wl_surface_add_listener(surface, &CoreSurfaceListener(), this));
            decoration = Require(libdecor_new(display, &DecorationInterface()), "libdecor context");
            frame = Require(libdecor_decorate(decoration, surface, &FrameInterface(), this),
                            "libdecor frame");
            libdecor_frame_set_title(frame, config.title.c_str());
            libdecor_frame_set_app_id(frame, "pvz_perf");
            libdecor_frame_unset_capabilities(frame, LIBDECOR_ACTION_RESIZE);
            ConstrainSize(config.width, config.height);

            // Even visible=false needs this bufferless commit to obtain a configure.
            // Wayland has no portable hidden-window flag: this adapter never attaches
            // a buffer, so the window stays unmapped until the renderer supplies one.
            // A caller needing it to stay hidden must refrain from presenting buffers.
            libdecor_frame_map(frame);
            while (!configured)
                DispatchDecoration(-1);
        } catch (...) {
            Destroy();
            throw;
        }
    }

    ~Impl() { Destroy(); }

    void Destroy() noexcept {
        if (keyboard) {
            if (wl_keyboard_get_version(keyboard) >= WL_KEYBOARD_RELEASE_SINCE_VERSION)
                wl_keyboard_release(keyboard);
            else
                wl_keyboard_destroy(keyboard);
            keyboard = nullptr;
        }
        if (pointer) {
            if (wl_pointer_get_version(pointer) >= WL_POINTER_RELEASE_SINCE_VERSION)
                wl_pointer_release(pointer);
            else
                wl_pointer_destroy(pointer);
            pointer = nullptr;
        }
        if (cursorSurface) { wl_surface_destroy(cursorSurface); cursorSurface = nullptr; }
        if (cursorTheme) { wl_cursor_theme_destroy(cursorTheme); cursorTheme = nullptr; }
        if (shm) { wl_shm_destroy(shm); shm = nullptr; }
        if (contentFrame) { wl_callback_destroy(contentFrame); contentFrame = nullptr; }
        if (frame) { libdecor_frame_unref(frame); frame = nullptr; }
        if (decoration) { libdecor_unref(decoration); decoration = nullptr; }
        if (surface) { wl_surface_destroy(surface); surface = nullptr; }
        if (seat) {
            if (wl_seat_get_version(seat) >= WL_SEAT_RELEASE_SINCE_VERSION)
                wl_seat_release(seat);
            else
                wl_seat_destroy(seat);
            seat = nullptr;
        }
        if (compositor) { wl_compositor_destroy(compositor); compositor = nullptr; }
        if (registry) { wl_registry_destroy(registry); registry = nullptr; }
        if (display) { wl_display_disconnect(display); display = nullptr; }
        if (keyState) { xkb_state_unref(keyState); keyState = nullptr; }
        if (keymap) { xkb_keymap_unref(keymap); keymap = nullptr; }
        if (xkbContext) { xkb_context_unref(xkbContext); xkbContext = nullptr; }
    }

    template<class Function>
    static void Guard(void* data, Function&& function) noexcept {
        auto& self = *static_cast<Impl*>(data);
        if (self.callbackException)
            return;
        try {
            function(self);
        } catch (...) {
            self.callbackException = std::current_exception();
        }
    }

    void RethrowCallbackException() {
        if (callbackException) {
            auto error = std::exchange(callbackException, {});
            std::rethrow_exception(error);
        }
    }

    void Roundtrip() {
        const int result = wl_display_roundtrip(display);
        RethrowCallbackException();
        if (result < 0)
            DisplayError(display, "initialization roundtrip failed");
    }

    void DispatchDecoration(int timeout) {
        const int result = libdecor_dispatch(decoration, timeout);
        RethrowCallbackException();
        if (wl_display_get_error(display))
            DisplayError(display, "libdecor dispatch failed");
        if (result < 0 && result != -EINTR)
            throw std::runtime_error("Wayland: libdecor dispatch failed: " +
                                     std::string(std::strerror(-result)));
    }

    void CommitContentSize(int width, int height, libdecor_configuration* configuration) {
        auto* state = Require(libdecor_state_new(width, height), "libdecor content state");
        libdecor_frame_commit(frame, state, configuration);
        libdecor_state_free(state);
    }

    void ConstrainSize(int width, int height) {
        // Clear the previous minimum so shrinking cannot conflict with it.
        libdecor_frame_set_min_content_size(frame, 0, 0);
        libdecor_frame_set_max_content_size(frame, width, height);
        libdecor_frame_set_min_content_size(frame, width, height);
    }

    void WaitForContentCommit() {
        if (contentFrame)
            wl_callback_destroy(contentFrame);
        contentFrame = Require(wl_surface_frame(surface), "content frame callback");
        static const wl_callback_listener listener{
            [](void* data, wl_callback* callback, uint32_t) {
                wl_callback_destroy(callback);
                static_cast<Impl*>(data)->contentFrame = nullptr;
            }
        };
        CheckListener(wl_callback_add_listener(contentFrame, &listener, this));
    }

    void Emit(const NativeWindowEvent& event) {
        if (callback)
            events.push_back(event);
    }

    void DeliverEvents() {
        while (!events.empty()) {
            auto event = events.front();
            events.pop_front();
            Guard(this, [&](Impl& self) { self.callback(self.callbackContext, event); });
            RethrowCallbackException();
        }
    }

    void SetFocus(bool value) {
        if (owner.Focused == value)
            return;
        owner.Focused = value;
        if (!value)
            ReleaseKeys();
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Focus;
        event.focused = value;
        Emit(event);
    }

    void ReleaseKeys() {
        repeating = false;
        for (const auto& entry : heldKeys) {
            NativeWindowEvent event{};
            event.kind = NativeWindowEventKind::Key;
            event.scanCode = entry.first;
            event.key = entry.second;
            Emit(event);
        }
        heldKeys.clear();
    }

    void PointerLeave() {
        if (!pointerState.position.inside)
            return;
        pointerState.position.inside = false;
        ClearAxes();
        for (int index = 0; index < 3; ++index) {
            if (buttons[index]) {
                buttons[index] = false;
                auto event = pointerState.Button(index, false);
                event.timeMs = lastPointerTime;
                Emit(event);
            }
        }
        Emit(pointerState.Boundary(false));
    }

    void PrepareCursors() {
        if (!shm) throw std::runtime_error("Wayland cursor requires wl_shm");
        const char* configuredTheme = std::getenv("XCURSOR_THEME");
        const char* themeName = configuredTheme && *configuredTheme ? configuredTheme : "default";
        cursorTheme = wl_cursor_theme_load(themeName, 24, shm);
        if (!cursorTheme)
            throw std::runtime_error(std::string("Wayland: unable to load cursor theme '") +
                                     themeName + "' at size 24");
        cursorSurface = Require(wl_compositor_create_surface(compositor), "cursor surface");
        CheckListener(wl_surface_add_listener(cursorSurface, &CoreSurfaceListener(), this));
        static constexpr const char* names[]{
            "left_ptr", "hand2", "xterm", "fleur", "not-allowed",
            "sb_h_double_arrow", "sb_v_double_arrow", "fd_double_arrow",
            "bd_double_arrow", "watch"
        };
        for (unsigned int index = 0; index < cursorShapes.size(); ++index) {
            cursorShapes[index] = wl_cursor_theme_get_cursor(cursorTheme, names[index]);
            if (!cursorShapes[index])
                throw std::runtime_error(std::string("Wayland: cursor theme '") + themeName +
                    "' has no shape '" + names[index] + "' (NativeCursor index " +
                    std::to_string(index) + ")");
            if (!wl_cursor_image_get_buffer(cursorShapes[index]->images[0]))
                throw std::runtime_error(std::string("Wayland: cursor theme '") + themeName +
                    "' cannot create buffer for shape '" + names[index] + "'");
        }
    }

    void ApplyPointerCursor() {
        if (!pointer || !pointerState.position.inside)
            return;
        if (cursor == NativeCursor::Hidden) {
            wl_pointer_set_cursor(pointer, pointerSerial, nullptr, 0, 0);
        } else {
            auto* shape = cursorShapes[static_cast<size_t>(cursor)];
            auto* image = shape->images[0];
            auto* buffer = Require(wl_cursor_image_get_buffer(image), "cursor image buffer");
            wl_pointer_set_cursor(pointer, pointerSerial, cursorSurface,
                                  image->hotspot_x, image->hotspot_y);
            wl_surface_attach(cursorSurface, buffer, 0, 0);
            wl_surface_damage(cursorSurface, 0, 0, image->width, image->height);
            wl_surface_commit(cursorSurface);
        }
        if (wl_display_flush(display) < 0 && errno != EAGAIN)
            DisplayError(display, "cursor flush failed");
    }

    void ClearAxes() {
        axisX = axisY = 0;
        discreteX = discreteY = 0;
        hasDiscreteX = hasDiscreteY = false;
    }

    void EmitAxes() {
        // Report wheel steps, positive Y toward the top and positive X to the
        // right. Older seats and smooth scrolling use the usual 10-unit step.
        const double x = hasDiscreteX ? discreteX : axisX / 10.0;
        const double y = -(hasDiscreteY ? discreteY : axisY / 10.0);
        ClearAxes();
        if (!pointerState.position.inside || (x == 0 && y == 0))
            return;
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::MouseWheel;
        event.x = x;
        event.y = y;
        Emit(event);
    }

    void EmitKey(uint32_t key, bool pressed, bool repeat) {
        if (!keyState || key > std::numeric_limits<xkb_keycode_t>::max() - 8)
            return;
        const xkb_keycode_t code = key + 8;
        const xkb_keysym_t symbol = xkb_state_key_get_one_sym(keyState, code);
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Key;
        event.scanCode = key; // Raw Wayland/evdev code; XKB uses an offset of 8.
        event.key = symbol;
        event.pressed = pressed;
        event.repeat = repeat;
        if (pressed && !repeat)
            heldKeys[key] = symbol;
        if (!pressed) {
            const auto held = heldKeys.find(key);
            if (held != heldKeys.end()) {
                event.key = held->second;
                heldKeys.erase(held);
            }
        }
        Emit(event);
        if (pressed) {
            const uint32_t text = xkb_state_key_get_utf32(keyState, code);
            if (text && text <= 0x10ffff && !(text >= 0xd800 && text <= 0xdfff)) {
                event.kind = NativeWindowEventKind::Text;
                event.text = text;
                Emit(event);
            }
        }
    }

    void RepeatKeys() {
        if (!repeating || !owner.Focused || !keyState || repeatRate <= 0)
            return;
        const auto now = Clock::now();
        const auto interval = std::chrono::nanoseconds(
            std::max<int64_t>(1, 1000000000LL / repeatRate));
        // Bound catch-up after a stalled frame; never let repeat starve the loop.
        for (int count = 0; count < 32 && nextRepeat <= now; ++count) {
            EmitKey(repeatKey, true, true);
            nextRepeat += interval;
        }
        if (nextRepeat <= now)
            nextRepeat = now + interval;
    }

    void PumpEvents() {
        if (pumping)
            throw std::logic_error("Wayland: recursive PumpEvents is unsupported");
        pumping = true;
        struct PumpGuard {
            bool& pumping;
            ~PumpGuard() { pumping = false; }
        } pumpGuard{pumping};
        RethrowCallbackException();
        if (wl_display_get_error(display))
            DisplayError(display, "display connection failed");

        // Plugins may own additional event sources (e.g. GTK). Let libdecor
        // dispatch them together with our content input on the shared display.
        DispatchDecoration(0);
        // Flush configure acknowledgements and pongs generated by dispatch.
        if (wl_display_flush(display) < 0 && errno != EAGAIN)
            DisplayError(display, "response flush failed");
        RepeatKeys();
        DeliverEvents();
    }

    static const wl_registry_listener& RegistryListener() {
        static const wl_registry_listener listener{
            [](void* data, wl_registry* registry, uint32_t name,
               const char* interface, uint32_t version) {
                Guard(data, [&](Impl& self) {
                    if (std::strcmp(interface, wl_compositor_interface.name) == 0 && !self.compositor) {
                        self.compositor = Require(static_cast<wl_compositor*>(
                            wl_registry_bind(registry, name, &wl_compositor_interface,
                                             std::min(version, 4u))), "compositor");
                        self.compositorName = name;
                    } else if (std::strcmp(interface, wl_shm_interface.name) == 0 && !self.shm) {
                        self.shm = Require(static_cast<wl_shm*>(
                            wl_registry_bind(registry, name, &wl_shm_interface, 1)), "shm");
                        static const wl_shm_listener listener{
                            [](void* data, wl_shm*, uint32_t) { Guard(data, [](Impl&) {}); }
                        };
                        CheckListener(wl_shm_add_listener(self.shm, &listener, &self));
                    } else if (std::strcmp(interface, wl_seat_interface.name) == 0 && !self.seat) {
                        self.seat = Require(static_cast<wl_seat*>(
                            wl_registry_bind(registry, name, &wl_seat_interface,
                                             std::min(version, 5u))), "seat");
                        self.seatName = name;
                        CheckListener(wl_seat_add_listener(self.seat, &SeatListener(), &self));
                    }
                });
            },
            [](void* data, wl_registry*, uint32_t name) {
                Guard(data, [&](Impl& self) {
                    if (name == self.seatName) {
                        self.RemoveKeyboard();
                        self.RemovePointer();
                        if (wl_seat_get_version(self.seat) >= WL_SEAT_RELEASE_SINCE_VERSION)
                            wl_seat_release(self.seat);
                        else
                            wl_seat_destroy(self.seat);
                        self.seat = nullptr;
                        self.seatName = 0;
                        self.SetFocus(self.activated);
                    } else if (name == self.compositorName) {
                        NativeWindowEvent event{};
                        event.kind = NativeWindowEventKind::Close;
                        self.Emit(event);
                    }
                });
            }
        };
        return listener;
    }

    static const wl_surface_listener& CoreSurfaceListener() {
        static const wl_surface_listener listener = [] {
            wl_surface_listener result{};
            result.enter = [](void* data, wl_surface*, wl_output*) {
                Guard(data, [](Impl&) {});
            };
            result.leave = [](void* data, wl_surface*, wl_output*) {
                Guard(data, [](Impl&) {});
            };
            // Compositor v4 creates v4 surfaces; newer scale/transform events
            // cannot be sent. Geometry and pointer coordinates remain logical.
            return result;
        }();
        return listener;
    }

    static libdecor_interface& DecorationInterface() {
        static libdecor_interface interface = [] {
            libdecor_interface result{};
            result.error = [](libdecor*, libdecor_error, const char* message) {
                std::fprintf(stderr, "Wayland libdecor: %s\n", message);
            };
            return result;
        }();
        return interface;
    }

    static libdecor_frame_interface& FrameInterface() {
        static libdecor_frame_interface interface = [] {
            libdecor_frame_interface result{};
            result.configure = [](libdecor_frame*, libdecor_configuration* configuration, void* data) {
                Guard(data, [&](Impl& self) {
                    int newWidth = self.requestedWidth, newHeight = self.requestedHeight;
                    if (!libdecor_configuration_get_content_size(configuration, self.frame,
                                                                 &newWidth, &newHeight)) {
                        newWidth = self.requestedWidth;
                        newHeight = self.requestedHeight;
                    }
                    if (newWidth <= 0 || newHeight <= 0)
                        throw std::runtime_error("Wayland: invalid configured content dimensions");
                    libdecor_window_state state{};
                    if (libdecor_configuration_get_window_state(configuration, &state))
                        self.activated = (state & LIBDECOR_WINDOW_STATE_ACTIVE) != 0;
                    const bool changed = !self.configured || newWidth != self.owner.Width || newHeight != self.owner.Height;
                    if (changed)
                        self.WaitForContentCommit();
                    self.configuring = true;
                    self.CommitContentSize(newWidth, newHeight, configuration);
                    self.configuring = false;
                    self.owner.Width = newWidth;
                    self.owner.Height = newHeight;
                    // Only Resize changes the requested floating size; a
                    // fullscreen configure must not replace its fixed bounds.
                    self.configured = true;
                    if (changed) {
                        NativeWindowEvent event{};
                        event.kind = NativeWindowEventKind::Resize;
                        event.width = newWidth;
                        event.height = newHeight;
                        self.Emit(event);
                    }
                    if (!self.keyboard)
                        self.SetFocus(self.activated);
                    // Leave geometry pending for the renderer's buffer commit.
                    // Committing here could pair the new size with an old buffer.
                });
            };
            result.close = [](libdecor_frame*, void* data) {
                Guard(data, [&](Impl& self) {
                    NativeWindowEvent event{};
                    event.kind = NativeWindowEventKind::Close;
                    self.Emit(event);
                });
            };
            result.commit = [](libdecor_frame*, void* data) {
                Guard(data, [](Impl& self) {
                    // Hover/button decoration updates need a parent commit.
                    // A size configure waits for the renderer's resized buffer.
                    if (!self.configuring && !self.contentFrame)
                        wl_surface_commit(self.surface);
                });
            };
            result.dismiss_popup = [](libdecor_frame*, const char*, void*) {};
            return result;
        }();
        return interface;
    }

    void RemovePointer() {
        PointerLeave();
        if (!pointer)
            return;
        if (wl_pointer_get_version(pointer) >= WL_POINTER_RELEASE_SINCE_VERSION)
            wl_pointer_release(pointer);
        else
            wl_pointer_destroy(pointer);
        pointer = nullptr;
    }

    void RemoveKeyboard() {
        if (!keyboard && !keyState && !keymap)
            return;
        ReleaseKeys();
        if (keyboard) {
            if (wl_keyboard_get_version(keyboard) >= WL_KEYBOARD_RELEASE_SINCE_VERSION)
                wl_keyboard_release(keyboard);
            else
                wl_keyboard_destroy(keyboard);
            keyboard = nullptr;
        }
        if (keyState) { xkb_state_unref(keyState); keyState = nullptr; }
        if (keymap) { xkb_keymap_unref(keymap); keymap = nullptr; }
        repeatRate = repeatDelay = 0;
        SetFocus(false);
    }

    static const wl_seat_listener& SeatListener() {
        static const wl_seat_listener listener{
            [](void* data, wl_seat* seat, uint32_t capabilities) {
                Guard(data, [&](Impl& self) {
                    if (capabilities & WL_SEAT_CAPABILITY_POINTER) {
                        if (!self.pointer) {
                            self.pointer = Require(wl_seat_get_pointer(seat), "pointer");
                            CheckListener(wl_pointer_add_listener(self.pointer, &PointerListener(), &self));
                        }
                    } else {
                        self.RemovePointer();
                    }
                    if (capabilities & WL_SEAT_CAPABILITY_KEYBOARD) {
                        if (!self.keyboard) {
                            self.keyboard = Require(wl_seat_get_keyboard(seat), "keyboard");
                            CheckListener(wl_keyboard_add_listener(self.keyboard, &KeyboardListener(), &self));
                            self.SetFocus(false);
                        }
                    } else {
                        self.RemoveKeyboard();
                        self.SetFocus(self.activated);
                    }
                });
            },
            [](void* data, wl_seat*, const char*) { Guard(data, [](Impl&) {}); }
        };
        return listener;
    }

    static const wl_pointer_listener& PointerListener() {
        static const wl_pointer_listener listener = [] {
            wl_pointer_listener result{};
            result.enter = [](void* data, wl_pointer*, uint32_t serial, wl_surface* surface,
                              wl_fixed_t x, wl_fixed_t y) {
                Guard(data, [&](Impl& self) {
                    if (surface != self.surface)
                        return;
                    self.pointerState.Move(wl_fixed_to_double(x), wl_fixed_to_double(y));
                    self.pointerSerial = serial;
                    self.Emit(self.pointerState.Boundary(true));
                    self.ApplyPointerCursor();
                });
            };
            result.leave = [](void* data, wl_pointer*, uint32_t, wl_surface* surface) {
                Guard(data, [&](Impl& self) {
                    if (surface == self.surface)
                        self.PointerLeave();
                });
            };
            result.motion = [](void* data, wl_pointer*, uint32_t, wl_fixed_t x, wl_fixed_t y) {
                Guard(data, [&](Impl& self) {
                    if (!self.pointerState.position.inside)
                        return;
                    self.pointerState.Move(wl_fixed_to_double(x), wl_fixed_to_double(y));
                });
            };
            result.button = [](void* data, wl_pointer*, uint32_t, uint32_t time,
                               uint32_t button, uint32_t state) {
                Guard(data, [&](Impl& self) {
                    const int index = button == BTN_LEFT ? 0 :
                        button == BTN_RIGHT ? 1 : button == BTN_MIDDLE ? 2 : -1;
                    if (!self.pointerState.position.inside || index < 0)
                        return;
                    self.buttons[index] = state == WL_POINTER_BUTTON_STATE_PRESSED;
                    auto event = self.pointerState.Button(index, self.buttons[index]);
                    event.timeMs = self.inputClock.Advance(time);
                    self.lastPointerTime = event.timeMs;
                    self.Emit(event);
                });
            };
            result.axis = [](void* data, wl_pointer* pointer, uint32_t,
                             uint32_t axis, wl_fixed_t value) {
                Guard(data, [&](Impl& self) {
                    if (!self.pointerState.position.inside)
                        return;
                    if (axis == WL_POINTER_AXIS_HORIZONTAL_SCROLL)
                        self.axisX += wl_fixed_to_double(value);
                    else if (axis == WL_POINTER_AXIS_VERTICAL_SCROLL)
                        self.axisY += wl_fixed_to_double(value);
                    if (wl_pointer_get_version(pointer) < WL_POINTER_FRAME_SINCE_VERSION)
                        self.EmitAxes();
                });
            };
            result.frame = [](void* data, wl_pointer*) {
                Guard(data, [](Impl& self) { self.EmitAxes(); });
            };
            result.axis_source = [](void* data, wl_pointer*, uint32_t) {
                Guard(data, [](Impl&) {});
            };
            result.axis_stop = [](void* data, wl_pointer*, uint32_t, uint32_t) {
                Guard(data, [](Impl&) {});
            };
            result.axis_discrete = [](void* data, wl_pointer*, uint32_t axis, int32_t discrete) {
                Guard(data, [&](Impl& self) {
                    if (!self.pointerState.position.inside)
                        return;
                    if (axis == WL_POINTER_AXIS_HORIZONTAL_SCROLL) {
                        self.hasDiscreteX = true;
                        self.discreteX += discrete;
                    } else if (axis == WL_POINTER_AXIS_VERTICAL_SCROLL) {
                        self.hasDiscreteY = true;
                        self.discreteY += discrete;
                    }
                });
            };
            // Seat v5 caps pointer version at v5: no value120/direction events.
            return result;
        }();
        return listener;
    }

    static const wl_keyboard_listener& KeyboardListener() {
        static const wl_keyboard_listener listener{
            [](void* data, wl_keyboard*, uint32_t format, int32_t fd, uint32_t size) {
                // The descriptor must be closed even after an earlier callback failed.
                FileDescriptor descriptor(fd);
                Guard(data, [&](Impl& self) {
                    self.ReleaseKeys();
                    if (format != WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 || fd < 0 || size < 2)
                        throw std::runtime_error("Wayland: unsupported or empty keyboard keymap");
                    Mapping mapping(fd, size);
                    const auto* text = static_cast<const char*>(mapping.data);
                    if (text[size - 1] != '\0')
                        throw std::runtime_error("Wayland: keyboard keymap is not terminated");
                    auto* newKeymap = Require(xkb_keymap_new_from_buffer(
                        self.xkbContext, text, size - 1, XKB_KEYMAP_FORMAT_TEXT_V1,
                        XKB_KEYMAP_COMPILE_NO_FLAGS), "XKB keymap");
                    auto* newState = xkb_state_new(newKeymap);
                    if (!newState) {
                        xkb_keymap_unref(newKeymap);
                        throw std::runtime_error("Wayland: unable to create XKB keyboard state");
                    }
                    if (self.keyState) xkb_state_unref(self.keyState);
                    if (self.keymap) xkb_keymap_unref(self.keymap);
                    self.keymap = newKeymap;
                    self.keyState = newState;
                });
            },
            [](void* data, wl_keyboard*, uint32_t, wl_surface* surface, wl_array*) {
                Guard(data, [&](Impl& self) {
                    if (surface == self.surface)
                        self.SetFocus(true);
                    // Enter's held-key array is not a new press or text input.
                });
            },
            [](void* data, wl_keyboard*, uint32_t, wl_surface* surface) {
                Guard(data, [&](Impl& self) {
                    if (surface == self.surface)
                        self.SetFocus(false);
                });
            },
            [](void* data, wl_keyboard*, uint32_t, uint32_t, uint32_t key, uint32_t state) {
                Guard(data, [&](Impl& self) {
                    if (!self.owner.Focused || !self.keyState)
                        return;
                    const bool pressed = state == WL_KEYBOARD_KEY_STATE_PRESSED;
                    if (pressed && self.heldKeys.count(key))
                        return;
                    self.EmitKey(key, pressed, false);
                    if (!pressed && self.repeating && key == self.repeatKey)
                        self.repeating = false;
                    if (pressed && self.repeatRate > 0 &&
                        key <= std::numeric_limits<xkb_keycode_t>::max() - 8 &&
                        xkb_keymap_key_repeats(self.keymap, key + 8)) {
                        self.repeatKey = key;
                        self.repeating = true;
                        self.nextRepeat = Clock::now() + std::chrono::milliseconds(self.repeatDelay);
                    }
                });
            },
            [](void* data, wl_keyboard*, uint32_t, uint32_t depressed,
               uint32_t latched, uint32_t locked, uint32_t group) {
                Guard(data, [&](Impl& self) {
                    if (self.keyState)
                        xkb_state_update_mask(self.keyState, depressed, latched, locked, 0, 0, group);
                });
            },
            [](void* data, wl_keyboard*, int32_t rate, int32_t delay) {
                Guard(data, [&](Impl& self) {
                    if (rate < 0 || delay < 0)
                        throw std::runtime_error("Wayland: invalid keyboard repeat settings");
                    self.repeatRate = rate;
                    self.repeatDelay = delay;
                    if (rate == 0)
                        self.repeating = false;
                    else if (self.repeating)
                        self.nextRepeat = Clock::now() + std::chrono::milliseconds(delay);
                });
            }
        };
        return listener;
    }
};

NativeWindow::NativeWindow(const NativeWindowConfig& config)
    : Width(config.width), Height(config.height), Focused(false), Visible(config.visible),
      impl_(std::make_unique<Impl>(*this, config)) {}

NativeWindow::~NativeWindow() = default;

void NativeWindow::PumpEvents() { impl_->PumpEvents(); }

NativePointerState NativeWindow::SamplePointer() {
    return impl_->pointerState.position;
}

void NativeWindow::Show() {
    // A role is configured already. Only a renderer buffer commit can map it.
    Visible = true;
}

void NativeWindow::ApplyCursor(NativeCursor cursor) {
    if (cursor >= NativeCursor::Count)
        throw std::invalid_argument("Invalid Wayland cursor");
    if (impl_->cursor == cursor) return;
    impl_->cursor = cursor;
    impl_->ApplyPointerCursor();
}

void NativeWindow::SetTitle(const std::string& title) {
    libdecor_frame_set_title(impl_->frame, title.c_str());
}

void NativeWindow::SetFullscreen(bool fullscreen) {
    if (fullscreen)
        libdecor_frame_set_fullscreen(impl_->frame, nullptr);
    else
        libdecor_frame_unset_fullscreen(impl_->frame);
}

void NativeWindow::Resize(int width, int height) {
    if (width <= 0 || height <= 0)
        throw std::invalid_argument("Wayland: window dimensions must be positive");
    impl_->requestedWidth = width;
    impl_->requestedHeight = height;
    impl_->ConstrainSize(width, height);
    // Fullscreen/maximized/tiled sizes remain compositor-controlled. Remember
    // the requested floating content size for the transition back to windowed.
    if (!libdecor_frame_is_floating(impl_->frame))
        return;
    if (Width != width || Height != height)
        impl_->WaitForContentCommit();
    impl_->CommitContentSize(width, height, nullptr);
    if (Width != width || Height != height) {
        Width = width;
        Height = height;
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Resize;
        event.width = width;
        event.height = height;
        impl_->Emit(event);
    }
}

// Stable xdg-shell v1 has no reliable minimized/occluded-state notification.
bool NativeWindow::Minimized() const {
    throw std::logic_error("Wayland xdg-shell cannot report minimized state");
}
NativeWindowBackend NativeWindow::Backend() const { return NativeWindowBackend::Wayland; }
NativeSurfaceHandles NativeWindow::SurfaceHandles() const {
    return {impl_->display, impl_->surface, 0};
}

} // namespace Sexy
