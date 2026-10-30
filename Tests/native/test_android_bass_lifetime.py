"""Run the production Android loader control flow against instrumented devices.

Run in an MSVC developer shell; the real Android/BASS counterpart is
AndroidBassLifetimeTests.cpp. No Android device or audio output is needed here.
"""
import pathlib
import subprocess
import tempfile


def main():
    root = pathlib.Path(__file__).resolve().parents[2]
    source = (root / 'pvzPerf/SexyAppFramework/sound/BassLoader.cpp').read_text()
    functions = []
    for name in ('LoadBassDLL', 'FreeBassDLL'):
        start = source.index('void Sexy::' + name + '()')
        end = source.index('\n}', start) + 2
        functions.append(source[start:end])
    harness = r'''
#include <cassert>
#include <cstdio>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>
#undef _WIN32
#define __ANDROID__ 1
using DWORD = unsigned int;
constexpr unsigned int BASSVERSION = 0x204;
bool decodeAlive = false, outputAlive = false, failOutput = false;
int unloads = 0;
thread_local DWORD currentDevice = ~0U;
std::vector<DWORD> freed;
struct BASS_INSTANCE
{
    void* mModule = this;
    explicit BASS_INSTANCE(const char*) {}
    ~BASS_INSTANCE()
    {
        // Models dlclose: no callback code may still belong to a live device.
        assert(!decodeAlive && !outputAlive);
        ++unloads;
    }
    unsigned int BASS_GetVersion() { return BASSVERSION << 16; }
    bool BASS_Init(int device, unsigned int, int, void*, void*)
    {
        if (device == -1 && failOutput) return false;
        if (device == 0) { assert(!decodeAlive); decodeAlive = true; }
        else { assert(device == -1 && !outputAlive); outputAlive = true; }
        currentDevice = device == 0 ? 0 : 7;
        return true;
    }
    DWORD BASS_GetDevice() { return currentDevice; }
    bool BASS_SetDevice(DWORD device)
    {
        assert((device == 0 && decodeAlive) || (device == 7 && outputAlive));
        currentDevice = device;
        return true;
    }
    bool BASS_Free()
    {
        freed.push_back(currentDevice);
        if (currentDevice == 7) { assert(outputAlive); outputAlive = false; }
        else { assert(currentDevice == 0 && decodeAlive); decodeAlive = false; }
        currentDevice = ~0U;
        return true;
    }
    int BASS_ErrorGetCode() { return 42; }
};
namespace Sexy
{
BASS_INSTANCE* gBass = nullptr;
void LoadBassDLL();
void FreeBassDLL();
}
using namespace Sexy;
int gBassLoadCount = 0;
std::mutex gBassMutex;
DWORD gBassOutputDevice = ~0U;
constexpr const char* NativeBassFilename = "mock-bass";
std::string ResolveBassPath() { return "mock-bass"; }
const char* dlerror() { return "mock error"; }
'''
    harness += '\n'.join(functions)
    harness += r'''
int main()
{
    for (int iteration = 0; iteration < 16; ++iteration)
    {
        LoadBassDLL();
        LoadBassDLL();
        FreeBassDLL();
        assert(gBass && decodeAlive && outputAlive && unloads == iteration);
        std::thread finalRelease([] {
            gBass->BASS_SetDevice(0);
            FreeBassDLL();
        });
        finalRelease.join();
        assert(!gBass && !decodeAlive && !outputAlive);
        assert(freed[freed.size() - 2] == 7 && freed.back() == 0);
        assert(gBassOutputDevice == ~0U && unloads == iteration + 1);
        FreeBassDLL();
    }
    failOutput = true;
    try { LoadBassDLL(); assert(false); }
    catch (const std::runtime_error& error)
    { assert(std::string(error.what()).find("42") != std::string::npos); }
    assert(!gBass && !decodeAlive && !outputAlive && gBassLoadCount == 0);
    failOutput = false;
    LoadBassDLL();
    FreeBassDLL();
    assert(!decodeAlive && !outputAlive);
    std::puts("PASS Android BASS: shared leases, cross-thread final release, "
              "playback-before-decode-before-unload, initialization failure and retry");
}
'''
    with tempfile.TemporaryDirectory(prefix='pvz-bass-lifetime-') as directory:
        folder = pathlib.Path(directory)
        cpp = folder / 'test.cpp'
        cpp.write_text(harness)
        exe = folder / 'test.exe'
        subprocess.run(['cl', '/nologo', '/std:c++latest', '/EHsc', '/Od',
                        str(cpp), '/Fe:' + str(exe), '/Fo:' + str(folder / 'test.obj')],
                       check=True)
        subprocess.run([str(exe)], check=True)


if __name__ == '__main__':
    main()
