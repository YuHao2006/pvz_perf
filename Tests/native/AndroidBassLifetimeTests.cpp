#include "SexyAppFramework/sound/BassLoader.h"

#include <cstdio>
#include <cstdlib>
#include <dlfcn.h>
#include <stdexcept>
#include <thread>

namespace
{
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
}

int main()
{
    try
    {
        const char* library = std::getenv("PVZ_BASS_LIBRARY");
        Require(library != nullptr, "Set PVZ_BASS_LIBRARY to the Android BASS library");
        // Keep a separate reference so device ownership can be inspected after
        // the production loader unloads its reference, without stale pointers.
        void* observer = dlopen(library, RTLD_NOW | RTLD_LOCAL);
        Require(observer != nullptr, "Cannot open BASS for device inspection");
        auto getInfo = reinterpret_cast<BASSBOOL (*)(DWORD, BASS_DEVICEINFO*)>(
            dlsym(observer, "BASS_GetDeviceInfo"));
        Require(getInfo != nullptr, "BASS_GetDeviceInfo is missing");
        for (int iteration = 0; iteration < 8; ++iteration)
        {
            Sexy::LoadBassDLL();
            const DWORD output = Sexy::gBass->BASS_GetDevice();
            Require(output != 0 && output != ~0U, "Playback output was not initialized");
            Sexy::LoadBassDLL();
            Sexy::FreeBassDLL();
            BASS_DEVICEINFO info{};
            Require(getInfo(output, &info) && (info.flags & BASS_DEVICE_INIT),
                "An outstanding lease must keep playback alive");
            std::thread release([]
            {
                // Teardown must not depend on this thread's selected device.
                Sexy::gBass->BASS_SetDevice(0);
                Sexy::FreeBassDLL();
            });
            release.join();
            Require(Sexy::gBass == nullptr, "Last lease did not release the loader");
            Require(getInfo(output, &info) && !(info.flags & BASS_DEVICE_INIT),
                "Playback callbacks survive final loader release");
            Require(getInfo(0, &info) && !(info.flags & BASS_DEVICE_INIT),
                "Decode device survives final loader release");
            Sexy::FreeBassDLL(); // Empty release must remain harmless.
        }
        dlclose(observer);
        std::puts("PASS Android BASS device lifetime: 8 load/release cycles");
        return 0;
    }
    catch (const std::exception& error)
    {
        std::fprintf(stderr, "FAIL: %s\n", error.what());
        return 1;
    }
}
