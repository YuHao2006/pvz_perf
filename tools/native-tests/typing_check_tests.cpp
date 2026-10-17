#include "Lawn/System/TypingCheck.h"
#include <iostream>
#include <stdexcept>
#include <string>

namespace {
void Require(bool ok) {
    if (!ok) throw std::runtime_error("Numeric typing differs from byte-string reference");
}
void Compare(std::initializer_list<unsigned char> bytes) {
    TypingCheck actual(bytes);
    std::string phrase(bytes.begin(), bytes.end()), recent;
    unsigned state = 0x1073;
    for (unsigned i = 0; i < 10000; ++i) {
        state = state * 1664525u + 1013904223u;
        const unsigned char key = i % 37 < bytes.size() ? phrase[i % 37] : state >> 24;
        recent.push_back(static_cast<char>(key));
        bool expected = false;
        if (!phrase.empty()) {
            if (recent.size() > phrase.size()) recent = recent.substr(1, phrase.size());
            if (recent == phrase) {
                expected = true;
                recent.clear();
            }
        }
        Require(actual.Check(static_cast<Sexy::KeyCode>(key)) == expected);
    }
}
}
int main() {
    try {
        Compare({});
        Compare({0x41});
        Compare({0x41, 0x41, 0x42});
        Compare({0x00, 0xFF, 0x80});
        Compare({0x4D, 0x55, 0x53, 0x54, 0x41, 0x43, 0x48, 0x45});
        Compare({0x4D, 0x4F, 0x55, 0x53, 0x54, 0x41, 0x43, 0x48, 0x45});
        Compare({0x54, 0x52, 0x49, 0x43, 0x4B, 0x45, 0x44, 0x4F, 0x55, 0x54});
        Compare({0x54, 0x52, 0x49, 0x43, 0x4B, 0x45, 0x44, 0x20, 0x4F, 0x55, 0x54});
        Compare({0x46, 0x55, 0x54, 0x55, 0x52, 0x45});
        Compare({0x50, 0x49, 0x4E, 0x41, 0x54, 0x41});
        Compare({0x44, 0x41, 0x4E, 0x43, 0x45});
        Compare({0x44, 0x41, 0x49, 0x53, 0x49, 0x45, 0x53});
        Compare({0x53, 0x55, 0x4B, 0x48, 0x42, 0x49, 0x52});
        Compare({0x26, 0x26, 0x28, 0x28, 0x25, 0x27, 0x25, 0x27, 0x42, 0x41});
        TypingCheck wrap({0x41});
        Require(wrap.Check(static_cast<Sexy::KeyCode>(0x141)));
        Require(!wrap.Check(static_cast<Sexy::KeyCode>(0)));
        std::cout << "PASS 140000 byte-reference steps, nine phrases, Konami, empty, overlap, byte truncation\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
