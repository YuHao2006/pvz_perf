#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <algorithm>
#include <cstdio>
#include <cstring>
#include <stdexcept>
#include <vector>
#include <string>
#include <random>

#ifndef PVZ_RETAIL_MACHINE_CODE
#include "LawnApp.h"
#include "Lawn/Plant.h"
#include "Lawn/Widget/StoreScreen.h"
#include "Lawn/Widget/ZombatarColors.h"
#include "Lawn/System/PlayerInfo.h"
#include "SexyAppFramework/misc/ResourceManager.h"
#include "SexyAppFramework/paklib/PakInterface.h"
bool (*gAppCloseRequest)();
#endif

namespace {
constexpr int Count = 2000000;
unsigned int inputs[Count];
volatile unsigned long long sink;
FILE* values;

#ifdef PVZ_RETAIL_MACHINE_CODE
unsigned char* image;
alignas(16) unsigned char plant[0x28]{};
alignas(16) unsigned char app[0x1000]{};
alignas(16) unsigned char profile[0x1000]{};
alignas(16) unsigned char board[0x6000]{};
alignas(16) unsigned char zombiePool[1024][0x168]{};
alignas(16) unsigned char plantPool[48][0x14c]{};
int cellX[Count], cellY[Count];
unsigned int cellSlots[6][9][4]{};
alignas(16) unsigned char colors[0x100]{};

void Initialize(const char* executable)
{
    MEMORY_BASIC_INFORMATION reserved{};
    VirtualQuery(reinterpret_cast<void*>(0x400000), &reserved, sizeof(reserved));
    if (reserved.State != MEM_RESERVE || reserved.RegionSize < 0x500000 || reserved.AllocationBase != reinterpret_cast<void*>(0x400000))
        throw std::runtime_error("Retail address reservation missing");
    if (!VirtualFree(reinterpret_cast<void*>(0x400000), 0, MEM_RELEASE)) throw std::runtime_error("Cannot release reserved retail range");
    HANDLE file = CreateFileA(executable, GENERIC_READ, FILE_SHARE_READ, nullptr, OPEN_EXISTING, 0, nullptr);
    if (file == INVALID_HANDLE_VALUE) throw std::runtime_error("Cannot open retail EXE");
    HANDLE mapping = CreateFileMappingW(file, nullptr, PAGE_READONLY | SEC_IMAGE, 0, 0, nullptr);
    CloseHandle(file);
    if (!mapping) throw std::runtime_error("Cannot create retail image mapping");
    image = static_cast<unsigned char*>(MapViewOfFileEx(mapping, FILE_MAP_READ, 0, 0, 0, reinterpret_cast<void*>(0x400000)));
    CloseHandle(mapping);
    if (!image) { std::fprintf(stderr, "MapView error=%lu\n", GetLastError()); throw std::runtime_error("Cannot map retail EXE at reserved preferred base"); }
    const unsigned char signature[] = {0x8b, 0x40, 0x24, 0x83, 0xf8, 0x1a};
    if (std::memcmp(image + 0x62440, signature, sizeof(signature))) throw std::runtime_error("Wrong retail executable signature");
    DWORD previous;
    if (!VirtualProtect(image + 0x329000, 0x1000, PAGE_READWRITE, &previous)) throw std::runtime_error("Cannot bind retail app globals");
    *reinterpret_cast<void**>(image + 0x329670) = app;
    *reinterpret_cast<void**>(image + 0x3296fc) = app;
    *reinterpret_cast<void**>(app + 0x94c) = profile;
    for (int i = 0; i < 32; ++i) *reinterpret_cast<int*>(profile + 0x1e8 + i * 4) = i % 4;
}

__declspec(noinline) unsigned int Damage(unsigned int input)
{
    const int seed = input % 53;
    const int weapon = (input >> 16) & 1;
    *reinterpret_cast<int*>(plant + 0x24) = seed;
    void* target = image + 0x62440;
    void* object = plant;
    unsigned int result;
    __asm {
        mov eax, object
        push weapon
        call target
        mov result, eax
    }
    return result;
}
__declspec(noinline) unsigned int Pot(unsigned int input)
{
    int seed = input % 53;
    float scale = ((input >> 8) & 255) * (1.0f / 128.0f) + 0.25f;
    void* target = image + 0x68940;
    float result;
    __asm {
        mov eax, seed
        push scale
        call target
        add esp, 4
        fstp result
    }
    unsigned int bits;
    std::memcpy(&bits, &result, sizeof(bits));
    return bits;
}
__declspec(noinline) unsigned int Cost(unsigned int input)
{
    int seed = 56 + input % 19;
    void* target = image + 0x6b5c0;
    unsigned int result;
    __asm {
        mov eax, seed
        mov edx, -1
        call target
        mov result, eax
    }
    return result;
}
__declspec(noinline) unsigned int Store(unsigned int input)
{
    // Only priced items: retail's undefined return for Chocolate/PvZ is not an oracle.
    int item = input % 29;
    if (item >= 26) ++item;
    void* target = image + 0x97220;
    unsigned int result;
    __asm {
        mov ecx, item
        call target
        mov result, eax
    }
    return result;
}
__declspec(noinline) unsigned int Palette(unsigned int input)
{
    const int mode = input % 5;
    int selected = input % 40;
    *reinterpret_cast<int*>(colors + 0xd8) = mode;
    void* object = colors;
    void* target = image + 0x12d3b0;
    __asm {
        mov eax, object
        lea ecx, selected
        call target
    }
    return (*reinterpret_cast<int*>(colors + 0xcc) + 1) * 1024 + *reinterpret_cast<int*>(colors + 0xac) * 64 + *reinterpret_cast<int*>(colors + 0xd4);
}
__declspec(noinline) unsigned int ZombiePool(unsigned int)
{
    void* iterator = nullptr;
    void* object = board;
    void* target = image + 0x1f6b0;
    unsigned int count = 0;
    __asm {
        lea esi, iterator
        mov edx, object
    again:
        call target
        test al, al
        jz finished
        mov eax, iterator
        cmp dword ptr [eax + 0x1c], 3
        jne again
        inc count
        jmp again
    finished:
    }
    return count;
}
__declspec(noinline) unsigned int PlantCell(unsigned int input)
{
    void* output[4]{};
    void* object = board;
    void* target = image + 0xfca0;
    int x = cellX[input], y = cellY[input];
    __asm {
        mov edx, object
        lea ebx, output
        push y
        push x
        call target
    }
    unsigned int hash = 0;
    for (int index : {0, 3, 1, 2}) {
        auto* pointer = static_cast<unsigned char*>(output[index]);
        hash = hash * 257 + (pointer ? static_cast<unsigned int>((pointer - &plantPool[0][0]) / 0x14c) + 1 : 0);
    }
    return hash;
}
void PrepareWorld()
{
    *reinterpret_cast<void**>(board + 0xa4) = app;
    *reinterpret_cast<void**>(board + 0xa8) = zombiePool;
    *reinterpret_cast<unsigned int*>(board + 0xac) = 1024;
    *reinterpret_cast<unsigned int*>(board + 0xb0) = 1024;
    *reinterpret_cast<unsigned int*>(board + 0xb4) = 1024;
    *reinterpret_cast<unsigned int*>(board + 0xb8) = 1024;
    *reinterpret_cast<unsigned int*>(board + 0xbc) = 1025;
    *reinterpret_cast<void**>(board + 0xc4) = plantPool;
    *reinterpret_cast<unsigned int*>(board + 0xc8) = 48;
    *reinterpret_cast<unsigned int*>(board + 0xcc) = 48;
    *reinterpret_cast<unsigned int*>(board + 0xd0) = 48;
    *reinterpret_cast<unsigned int*>(board + 0xd4) = 48;
    *reinterpret_cast<unsigned int*>(board + 0xd8) = 49;
    *reinterpret_cast<void**>(app + 0x868) = board;
    *reinterpret_cast<int*>(app + 0x918) = 13;
    for (unsigned int i = 0; i < 1024; ++i) {
        *reinterpret_cast<int*>(zombiePool[i] + 0x1c) = i % 6;
        *reinterpret_cast<unsigned int*>(zombiePool[i] + 0x164) = ((i + 1) << 16) | i;
    }
    if (ZombiePool(0) != 171) throw std::runtime_error("Retail zombie iterator layout mismatch");
    std::mt19937 rng(20261003);
    int count = 0;
    auto place = [&](int type) {
        for (;;) {
            const int x = rng() % 9, y = rng() % 6;
            const int layer = type == 1 ? 0 : type == 2 ? 2 : type == 3 ? 3 : 1;
            if (cellSlots[y][x][layer]) continue;
            if (type == 4 && (x + 1 >= 9 || cellSlots[y][x+1][1])) continue;
            const int types[]{0, 33, 30, 35, 47};
            auto* record = plantPool[count];
            *reinterpret_cast<void**>(record) = app;
            *reinterpret_cast<void**>(record + 4) = board;
            *reinterpret_cast<int*>(record + 0x1c) = y;
            *reinterpret_cast<int*>(record + 0x24) = types[type];
            *reinterpret_cast<int*>(record + 0x28) = x;
            *reinterpret_cast<int*>(record + 0x138) = -1;
            record[0x144] = 1;
            *reinterpret_cast<unsigned int*>(record + 0x148) = ((count + 1) << 16) | count;
            cellSlots[y][x][layer] = ++count;
            if (type == 4) cellSlots[y][x+1][1] = count;
            return;
        }
    };
    for (int i = 0; i < 40; ++i) place(0);
    for (int type : {4,1,2,3}) for (int i = 0; i < 2; ++i) place(type);
    for (int i = 0; i < Count; ++i) { cellX[i] = rng() % 9; cellY[i] = rng() % 6; }
    for (int i = 0; i < 4096; ++i) {
        unsigned int expected = 0;
        for (int layer = 0; layer < 4; ++layer) expected = expected * 257 + cellSlots[cellY[i]][cellX[i]][layer];
        if (PlantCell(i) != expected) throw std::runtime_error("Retail plant cell output differs from independent placement oracle");
    }
}
#else
LawnApp* application;
Plant* plant;
ZombatarColors* colors;
void Initialize(const char* pak)
{
    application = new LawnApp;
    gLawnApp = application;
    application->mGameMode = GameMode::GAMEMODE_ADVENTURE;
    application->mPlayerInfo = new PlayerInfo;
    for (int i = 0; i < 32; ++i) application->mPlayerInfo->mPurchases[i] = i % 4;
    plant = new Plant;
    colors = new ZombatarColors(application);
    if (std::strcmp(pak, "unused") != 0) {
        if (!gPakInterface->AddPakFile(pak) || !application->mResourceManager->ParseResourcesFile("compiled/resources.compiled"))
            throw std::runtime_error("Production resource contract does not match paired PAK64");
        std::fprintf(stderr, "PASS paired production NRSC4 resource contract\n");
    }
}
__declspec(noinline) unsigned int Damage(unsigned int input)
{
    plant->mSeedType = static_cast<SeedType>(input % 53);
    return plant->GetDamageRangeFlags(static_cast<PlantWeapon>((input >> 16) & 1));
}
__declspec(noinline) unsigned int Pot(unsigned int input)
{
    float result = PlantFlowerPotHeightOffset(static_cast<SeedType>(input % 53), ((input >> 8) & 255) * (1.0f / 128.0f) + 0.25f);
    unsigned int bits;
    std::memcpy(&bits, &result, sizeof(bits));
    return bits;
}
__declspec(noinline) unsigned int Cost(unsigned int input)
{
    return Plant::GetCost(static_cast<SeedType>(56 + input % 19), SeedType::SEED_NONE);
}
__declspec(noinline) unsigned int Store(unsigned int input)
{
    unsigned int item = input % 29;
    if (item >= 26) ++item;
    return StoreScreen::GetItemCost(static_cast<StoreItem>(item));
}
__declspec(noinline) unsigned int Palette(unsigned int input)
{
    colors->SetColorMode(static_cast<ZombatarColorMode>(input % 5), input % 40);
    return (colors->mPaletteStart + 1) * 1024 + colors->mColorCount * 64 + colors->mSelectedColor;
}
#endif

using Kernel = unsigned int (*)(unsigned int);
void Measure(const char* name, Kernel kernel, int count = Count)
{
    std::vector<unsigned int> exhaustive;
    if (std::strcmp(name, "damage_range") == 0) {
        for (unsigned int weapon = 0; weapon < 2; ++weapon) for (unsigned int seed = 0; seed < 53; ++seed) {
            const unsigned int base = weapon << 16;
            exhaustive.push_back(base + (seed + 53 - base % 53) % 53);
        }
    } else if (std::strcmp(name, "flower_pot_height") == 0) {
        for (unsigned int scale = 0; scale < 256; ++scale) for (unsigned int seed = 0; seed < 53; ++seed) {
            const unsigned int base = scale << 8;
            exhaustive.push_back(base + (seed + 53 - base % 53) % 53);
        }
    } else {
        const unsigned int count = std::strcmp(name, "seed_cost_tail") == 0 ? 19 : std::strcmp(name, "zombatar_palette") == 0 ? 40 : 29;
        for (unsigned int i = 0; i < count; ++i) exhaustive.push_back(i);
    }
    for (auto input : exhaustive) std::fprintf(values, "%s,%u,%u\n", name, input, kernel(input));
    for (int i = 0; i < 4096; ++i) std::fprintf(values, "%s,%u,%u\n", name, inputs[i], kernel(inputs[i]));
    unsigned long long expected = 0;
    for (int i = 0; i < count; ++i) expected += kernel(inputs[i]);
    LARGE_INTEGER frequency, begin, end;
    QueryPerformanceFrequency(&frequency);
    for (int round = 0; round < 5; ++round) {
        unsigned long long checksum = 0;
        QueryPerformanceCounter(&begin);
        for (int i = 0; i < count; ++i) checksum += kernel(inputs[i]);
        QueryPerformanceCounter(&end);
        sink = checksum;
        if (checksum != expected) throw std::runtime_error("Repeated kernel checksum mismatch");
        std::printf("%s,%d,%d,%.6f,%llu\n", name, round, count,
            (end.QuadPart - begin.QuadPart) * 1e9 / frequency.QuadPart / count, checksum);
    }
    std::fflush(stdout);
}
}

int main(int argc, char** argv)
{
#ifdef PVZ_RETAIL_MACHINE_CODE
    if (argc == 3 && !GetEnvironmentVariableA("PVZ_RETAIL_IMAGE_RESERVED", nullptr, 0)) {
        char executable[MAX_PATH];
        GetModuleFileNameA(nullptr, executable, MAX_PATH);
        std::string command = std::string("\"") + executable + "\" \"" + argv[1] + "\" \"" + argv[2] + "\"";
        SetEnvironmentVariableA("PVZ_RETAIL_IMAGE_RESERVED", "1");
        STARTUPINFOA startup{}; startup.cb = sizeof(startup);
        startup.dwFlags = STARTF_USESTDHANDLES;
        startup.hStdInput = GetStdHandle(STD_INPUT_HANDLE);
        startup.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE);
        startup.hStdError = GetStdHandle(STD_ERROR_HANDLE);
        PROCESS_INFORMATION child{};
        if (!CreateProcessA(executable, command.data(), nullptr, nullptr, TRUE, CREATE_SUSPENDED | CREATE_NO_WINDOW, nullptr, nullptr, &startup, &child)) return 20;
        if (!VirtualAllocEx(child.hProcess, reinterpret_cast<void*>(0x400000), 0x500000, MEM_RESERVE, PAGE_NOACCESS)) {
            TerminateProcess(child.hProcess, 21); CloseHandle(child.hThread); CloseHandle(child.hProcess); return 21;
        }
        if (!SetProcessAffinityMask(child.hProcess, 0x4000) || ResumeThread(child.hThread) == DWORD(-1)) {
            TerminateProcess(child.hProcess, 24); CloseHandle(child.hThread); CloseHandle(child.hProcess); return 24;
        }
        if (WaitForSingleObject(child.hProcess, 120000) != WAIT_OBJECT_0) {
            TerminateProcess(child.hProcess, 22);
            WaitForSingleObject(child.hProcess, 5000);
        }
        DWORD result = 23; GetExitCodeProcess(child.hProcess, &result);
        CloseHandle(child.hThread); CloseHandle(child.hProcess);
        return static_cast<int>(result);
    }
#endif
    SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX | SEM_NOOPENFILEERRORBOX);
    try {
        if (argc != 3) throw std::runtime_error("Pass retail EXE (or unused placeholder) and validation CSV");
        if (!SetProcessAffinityMask(GetCurrentProcess(), 0x4000)) throw std::runtime_error("Cannot pin LP14");
        Initialize(argv[1]);
        values = std::fopen(argv[2], "wb");
        if (!values) throw std::runtime_error("Cannot open validation CSV");
        std::fprintf(values, "kernel,input,result_bits\n");
        unsigned int seed = 0x12345678;
        for (auto& input : inputs) { seed ^= seed << 13; seed ^= seed >> 17; seed ^= seed << 5; input = seed ? seed : 0x9e3779b9; }
        std::printf("kernel,round,calls,ns_per_call,checksum\n");
        Measure("damage_range", Damage);
        Measure("flower_pot_height", Pot);
        Measure("seed_cost_tail", Cost);
        Measure("store_priced_items", Store);
        seed = 0x9e3779b9;
        for (auto& input : inputs) { seed ^= seed << 13; seed ^= seed >> 17; seed ^= seed << 5; input = seed; }
        Measure("zombatar_palette", Palette);
#ifdef PVZ_RETAIL_MACHINE_CODE
        PrepareWorld();
        Measure("zombies_actual_pool_1024", ZombiePool, 200000);
        for (unsigned int i = 0; i < Count; ++i) inputs[i] = i;
        Measure("plants_actual_pool_48", PlantCell);
#endif
        std::fclose(values);
        #ifdef PVZ_RETAIL_MACHINE_CODE
        UnmapViewOfFile(image);
#else
        delete plant;
        delete colors;
        delete application->mPlayerInfo;
        application->mPlayerInfo = nullptr;
        delete application;
#endif
        return 0;
    } catch (const std::exception& error) {
        std::fprintf(stderr, "%s\n", error.what());
        return 1;
    }
}

