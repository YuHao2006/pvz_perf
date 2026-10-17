#pragma once

namespace Sexy::NativeInput {
static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);

// XKB keysyms to the framework's stable KeyCode numbers. Character input stays
// on the separate Text path, so shifted punctuation does not become a key code.
constexpr unsigned int GameKeyFromXkb(unsigned int symbol)
{
    if (symbol >= 'a' && symbol <= 'z')
        return symbol - 'a' + 'A';
    if ((symbol >= 'A' && symbol <= 'Z') || (symbol >= '0' && symbol <= '9'))
        return symbol;
    if (symbol >= 0xffbe && symbol <= 0xffd5) // F1..F24.
        return 0x70 + symbol - 0xffbe;
    if (symbol >= 0xffb0 && symbol <= 0xffb9) // KP_0..KP_9.
        return 0x60 + symbol - 0xffb0;
    switch (symbol) {
    case 0xff08: return 0x08; // BackSpace.
    case 0xff09: case 0xfe20: return 0x09; // Tab, ISO_Left_Tab.
    case 0xff0b: return 0x0c; // Clear.
    case 0xff0d: case 0xff8d: return 0x0d; // Return, KP_Enter.
    case 0xffe1: case 0xffe2: return 0x10; // Shift.
    case 0xffe3: case 0xffe4: return 0x11; // Control.
    case 0xffe9: case 0xffea: return 0x12; // Alt.
    case 0xff13: return 0x13; // Pause.
    case 0xffe5: return 0x14; // Caps_Lock.
    case 0xff1b: return 0x1b; // Escape.
    case 0x20: case 0xff80: return 0x20; // Space, KP_Space.
    case 0xff55: case 0xff9a: return 0x21;
    case 0xff56: case 0xff9b: return 0x22;
    case 0xff57: case 0xff9c: return 0x23;
    case 0xff50: case 0xff95: return 0x24;
    case 0xff51: case 0xff96: return 0x25;
    case 0xff52: case 0xff97: return 0x26;
    case 0xff53: case 0xff98: return 0x27;
    case 0xff54: case 0xff99: return 0x28;
    case 0xff61: return 0x2c; // Print.
    case 0xff63: case 0xff9e: return 0x2d;
    case 0xffff: case 0xff9f: return 0x2e;
    case 0xff6a: return 0x2f; // Help.
    case 0xffeb: return 0x5b; // Super_L.
    case 0xffec: return 0x5c; // Super_R.
    case 0xff67: return 0x5d; // Menu.
    case 0xffaa: return 0x6a;
    case 0xffab: return 0x6b;
    case 0xffac: return 0x6c;
    case 0xffad: return 0x6d;
    case 0xffae: return 0x6e;
    case 0xffaf: return 0x6f;
    case 0xff7f: return 0x90; // Num_Lock.
    case 0xff14: return 0x91; // Scroll_Lock.
    case ';': case ':': return 0xba;
    case '=': case '+': return 0xbb;
    case ',': case '<': return 0xbc;
    case '-': case '_': return 0xbd;
    case '.': case '>': return 0xbe;
    case '/': case '?': return 0xbf;
    case '`': case '~': return 0xc0;
    case '[': case '{': return 0xdb;
    case '\\': case '|': return 0xdc;
    case ']': case '}': return 0xdd;
    case '\'': case '"': return 0xde;
    case '!': return '1';
    case '@': return '2';
    case '#': return '3';
    case '$': return '4';
    case '%': return '5';
    case '^': return '6';
    case '&': return '7';
    case '*': return '8';
    case '(': return '9';
    case ')': return '0';
    default: return 0;
    }
}

// Input timestamps belong to one server clock, which is independent of the
// process's steady_clock epoch. Extend wrapping values without using drain time.
struct InputClock {
    unsigned int previous = 0;
    unsigned long long elapsed = 0;
    bool started = false;

    unsigned long long Advance(unsigned int timeMs)
    {
        if (!started) {
            elapsed = timeMs;
            started = true;
        } else {
            elapsed += static_cast<unsigned int>(timeMs - previous);
        }
        previous = timeMs;
        return elapsed;
    }
};

} // namespace Sexy::NativeInput
