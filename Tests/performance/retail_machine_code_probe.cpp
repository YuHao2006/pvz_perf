#include <windows.h>
#include <cstdio>
#include <cstring>
#include <algorithm>

// Retail English 1.2.0.1073 only. Does not start the game or touch saves.
// ABI: EAX = Plant*, [ESP+4] = weapon, EAX = result, RET 4.
__declspec(noinline) int CallRetail(void* entry, void* plant, int weapon)
{
    int result;
    __asm {
        mov eax, plant
        push weapon
        call entry
        mov result, eax
    }
    return result;
}
int Reference(int seed, int weapon)
{
    switch (seed) {
    case 26: return weapon == 1 ? 1 : 2;
    case 2: case 20: case 47: case 15: return 127;
    case 39: case 32: case 34: case 44: case 17: return 13;
    case 4: return 77;
    case 8: case 24: case 10: case 42: case 6: return 9;
    case 43: return 11;
    case 19: return 5;
    case 50: return 17;
    default: return 1;
    }
}
int main(int argc, char** argv)
{
    if (argc != 2) return 2;
    HMODULE image = LoadLibraryExA(argv[1], nullptr, DONT_RESOLVE_DLL_REFERENCES);
    if (!image) { std::printf("map_error=%lu\n", GetLastError()); return 3; }
    auto base = reinterpret_cast<unsigned char*>(image);
    // This leaf uses only registers, stack, and relative branches: no imports or absolute addresses.
    auto entry = base + 0x62440;
    const unsigned char signature[] = {0x8b,0x40,0x24,0x83,0xf8,0x1a,0x75,0x0e};
    if (std::memcmp(entry, signature, sizeof(signature))) return 5;
    MEMORY_BASIC_INFORMATION info{};
    VirtualQuery(entry, &info, sizeof(info));
    std::printf("mapped_base=%p entry=%p protection=0x%lx\n", base, entry, info.Protect);
    DWORD previous;
    if (!VirtualProtect(entry, 0xb3, PAGE_EXECUTE_READ, &previous)) return 6;
    alignas(16) unsigned char plant[0x28]{};
    int verified = 0;
    for (int seed = 0; seed < 53; ++seed) {
        std::memcpy(plant + 0x24, &seed, sizeof(seed));
        for (int weapon = 0; weapon < 2; ++weapon) {
            int actual = CallRetail(entry, plant, weapon);
            if (actual != Reference(seed, weapon)) {
                std::printf("mismatch seed=%d weapon=%d actual=%d\n", seed, weapon, actual);
                return 7;
            }
            ++verified;
        }
    }
    if (!SetThreadAffinityMask(GetCurrentThread(), 0x4000)) return 8;
    LARGE_INTEGER frequency, begin, end;
    QueryPerformanceFrequency(&frequency);
    const int count = 2000000;
    double best = 1e100;
    unsigned long long checksum = 0;
    for (int trial = 0; trial < 6; ++trial) {
        unsigned long long sum = 0;
        QueryPerformanceCounter(&begin);
        for (int i = 0; i < count; ++i) {
            int seed = i % 53;
            std::memcpy(plant + 0x24, &seed, sizeof(seed));
            sum += CallRetail(entry, plant, i & 1);
        }
        QueryPerformanceCounter(&end);
        if (trial) best = (std::min)(best, (end.QuadPart - begin.QuadPart) * 1e9 / frequency.QuadPart / count);
        if (trial && sum != checksum) return 9;
        checksum = sum;
    }
    std::printf("verified_cases=%d calls_per_trial=%d trials=5 warmups=1 affinity=0x4000 checksum=%llu best_ns_per_call=%.3f\n", verified, count, checksum, best);
    std::printf("Scope: retail machine code + ABI adapter + input generation + checksum; not a paired optimization result.\n");
    FreeLibrary(image);
    return 0;
}
