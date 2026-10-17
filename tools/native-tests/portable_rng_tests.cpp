#include "SexyAppFramework/misc/MTRand.h"
#include <array>
#include <cstdio>
#include <random>

int main() {
    static_assert(sizeof(unsigned int) == 4);
    static_assert(sizeof(unsigned long long) == 8);
    unsigned int checked = 0;
    for (unsigned int seed : {0u, 1u, 0x1073u, 0xffffffffu}) {
        Sexy::MTRand actual(seed);
        std::mt19937 expected(seed ? seed : 4357u);
        for (unsigned int n = 0; n < 10000; ++n) {
            const unsigned int value = actual.NextNoAssert();
            const unsigned int oracle = static_cast<unsigned int>(expected()) & 0x7fffffffu;
            if (value != oracle) {
                std::fprintf(stderr, "RNG mismatch: seed=%u sample=%u actual=%u expected=%u\n",
                    seed, n, value, oracle);
                return 1;
            }
            ++checked;
        }
        std::array<unsigned int, 624> state{};
        int index = 0;
        actual.GetState(state.data(), index);
        if (index < 0 || index > 624 || actual.Serialize().size() != 624 * 4) {
            std::fputs("RNG wire state is not 624 32-bit words\n", stderr);
            return 1;
        }
    }
    std::printf("rng-oracle=%u samples state-wire=2496 bytes passed\n", checked);
}
