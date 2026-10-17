#include <X11/Xlib.h>
#include <X11/Xatom.h>
#include <pulse/pulseaudio.h>
#include <pulse/simple.h>
#include <algorithm>
#include <array>
#include <cstdio>
#include <cstdlib>
#include <cstring>

namespace {
void Windows(Display* display, Window parent, bool close)
{
    Window root, owner, *children = nullptr;
    unsigned int count = 0;
    if (!XQueryTree(display, parent, &root, &owner, &children, &count))
        return;
    for (unsigned int i = 0; i < count; ++i) {
        char* name = nullptr;
        XFetchName(display, children[i], &name);
        if (name && *name) {
            XWindowAttributes attributes{};
            XGetWindowAttributes(display, children[i], &attributes);
            std::printf("X11 window=0x%lx mapped=%d title=%s\n",
                children[i], attributes.map_state == IsViewable, name);
            if (close && std::strstr(name, "Plants vs. Zombies")) {
                XEvent event{};
                event.xclient.type = ClientMessage;
                event.xclient.window = children[i];
                event.xclient.message_type = XInternAtom(display, "WM_PROTOCOLS", False);
                event.xclient.format = 32;
                event.xclient.data.l[0] = XInternAtom(display, "WM_DELETE_WINDOW", False);
                event.xclient.data.l[1] = CurrentTime;
                XSendEvent(display, children[i], False, NoEventMask, &event);
                std::printf("Sent WM_DELETE_WINDOW to 0x%lx\n", children[i]);
            }
        }
        if (name) XFree(name);
        Windows(display, children[i], close);
    }
    if (children) XFree(children);
}

void Server(pa_context*, const pa_server_info* info, void*)
{
    if (info)
        std::printf("Pulse server=%s defaultSink=%s\n",
            info->server_name, info->default_sink_name);
}
void Sink(pa_context*, const pa_sink_info* info, int, void*)
{
    if (info)
        std::printf("Pulse sink=%u name=%s mute=%d state=%d volume=%u monitor=%s\n",
            info->index, info->name, info->mute, info->state,
            pa_cvolume_avg(&info->volume), info->monitor_source_name);
}
void Input(pa_context*, const pa_sink_input_info* info, int, void*)
{
    if (info) {
        const char* pid = pa_proplist_gets(info->proplist, PA_PROP_APPLICATION_PROCESS_ID);
        std::printf("Pulse input=%u sink=%u name=%s pid=%s mute=%d corked=%d volume=%u\n",
            info->index, info->sink, info->name, pid ? pid : "?",
            info->mute, info->corked, pa_cvolume_avg(&info->volume));
    }
}
void Wait(pa_mainloop* loop, pa_operation* operation)
{
    if (!operation) std::exit(2);
    while (pa_operation_get_state(operation) == PA_OPERATION_RUNNING)
        pa_mainloop_iterate(loop, 1, nullptr);
    pa_operation_unref(operation);
}
}

int main(int argc, char** argv)
{
    Display* display = XOpenDisplay(nullptr);
    if (display) {
        Windows(display, DefaultRootWindow(display),
            argc == 2 && std::strcmp(argv[1], "--close-game") == 0);
        XSync(display, False);
        XCloseDisplay(display);
    }
    pa_mainloop* loop = pa_mainloop_new();
    pa_context* context = pa_context_new(pa_mainloop_get_api(loop), "PVZ runtime observer");
    if (pa_context_connect(context, nullptr, PA_CONTEXT_NOFLAGS, nullptr) < 0)
        return 2;
    while (pa_context_get_state(context) != PA_CONTEXT_READY) {
        if (!PA_CONTEXT_IS_GOOD(pa_context_get_state(context)))
            return 3;
        pa_mainloop_iterate(loop, 1, nullptr);
    }
    Wait(loop, pa_context_get_server_info(context, Server, nullptr));
    Wait(loop, pa_context_get_sink_info_list(context, Sink, nullptr));
    Wait(loop, pa_context_get_sink_input_info_list(context, Input, nullptr));
    pa_context_disconnect(context);
    pa_context_unref(context);
    pa_mainloop_free(loop);
    if (argc == 2 && std::strcmp(argv[1], "--monitor") == 0) {
        const pa_sample_spec format{PA_SAMPLE_S16LE, 44100, 2};
        int error = 0;
        pa_simple* monitor = pa_simple_new(nullptr, "PVZ game output observer",
            PA_STREAM_RECORD, "@DEFAULT_MONITOR@", "game-loopback",
            &format, nullptr, nullptr, &error);
        if (!monitor) return 4;
        std::array<short, 44100 * 2 * 2> captured{};
        if (pa_simple_read(monitor, captured.data(), sizeof(captured), &error) < 0)
            return 4;
        int peak = 0;
        for (const auto value : captured)
            peak = std::max(peak, std::abs(static_cast<int>(value)));
        std::printf("Game Pulse monitorPeak=%d\n", peak);
        pa_simple_free(monitor);
        return peak > 0 ? 0 : 5;
    }
}
