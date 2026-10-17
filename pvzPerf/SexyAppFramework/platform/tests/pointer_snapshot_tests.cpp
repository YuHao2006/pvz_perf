#include "linux/PointerSnapshot.h"
#include "linux/LinuxInput.h"

#include <iostream>
#include <stdexcept>
#include <vector>

int main()
{
    try {
        using Kind = Sexy::NativeWindowEventKind;
        using Sexy::NativeInput::GameKeyFromXkb;
        if (GameKeyFromXkb('a') != 'A' || GameKeyFromXkb('A') != 'A' ||
            GameKeyFromXkb('!') != '1' || GameKeyFromXkb(0xff0d) != 0x0d ||
            GameKeyFromXkb(0xff8d) != 0x0d || GameKeyFromXkb(0xff51) != 0x25 ||
            GameKeyFromXkb(0xffe3) != 0x11 || GameKeyFromXkb(0xffea) != 0x12 ||
            GameKeyFromXkb(0xffbe) != 0x70 || GameKeyFromXkb(0xffd5) != 0x87 ||
            GameKeyFromXkb(0xffb0) != 0x60 || GameKeyFromXkb(0xffb9) != 0x69 ||
            GameKeyFromXkb(0x1001f642) != 0)
            throw std::runtime_error("XKB key mapping changed the game key domain");
        Sexy::NativeInput::InputClock clock;
        if (clock.Advance(0xfffffff0u) != 0xfffffff0ull ||
            clock.Advance(0x10u) != 0x100000010ull ||
            clock.Advance(0x10u) != 0x100000010ull ||
            clock.Advance(0x11u) != 0x100000011ull)
            throw std::runtime_error("Native input timestamp wrap changed event spacing");
        Sexy::NativeInput::PointerSnapshot pointer;
        std::vector<Sexy::NativeWindowEvent> events;
        pointer.Move(1.25, 2.5);
        events.push_back(pointer.Boundary(true));
        for (int i = 0; i < 100000; ++i)
            pointer.Move(i + 0.25, i + 0.5);
        if (events.size() != 1 || pointer.position.x != 99999.25 ||
            pointer.position.y != 99999.5 || !pointer.position.inside)
            throw std::runtime_error("Motion did not remain a latest-position snapshot");
        events.push_back(pointer.Button(0, true));
        Sexy::NativeWindowEvent key{};
        key.kind = Kind::Key;
        key.key = 'a';
        key.pressed = true;
        events.push_back(key);
        pointer.Move(-12.75, 34.5);
        events.push_back(pointer.Button(0, false));
        events.push_back(pointer.Boundary(false));
        pointer.Move(5.5, 6.5);
        events.push_back(pointer.Boundary(true));
        if (events.size() != 6 || events[0].kind != Kind::MouseEnter ||
            events[1].kind != Kind::MouseButton || !events[1].pressed ||
            events[1].x != 99999.25 || events[1].y != 99999.5 ||
            events[2].kind != Kind::Key ||
            events[3].kind != Kind::MouseButton || events[3].pressed ||
            events[3].x != -12.75 || events[3].y != 34.5 ||
            events[4].kind != Kind::MouseLeave ||
            events[4].x != -12.75 || events[4].y != 34.5 ||
            events[5].kind != Kind::MouseEnter || events[5].x != 5.5)
            throw std::runtime_error("Pointer snapshot changed discrete event data/order");
        std::cout << "motion-100000-latest-only=PASS button-snapshot=PASS "
                     "discrete-fifo=PASS enter-leave=PASS "
                     "xkb-game-key-map=PASS input-time-wrap=PASS\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
