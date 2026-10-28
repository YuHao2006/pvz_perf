#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string>
#include <cstdio>

// Start suspended so even initialization/warmup runs on the requested processor.
int wmain(int argc, wchar_t** argv)
{
    if (argc < 2) return 2;
    std::wstring command;
    for (int i = 1; i < argc; ++i) {
        if (i != 1) command += L' ';
        command += L'"';
        unsigned int slashes = 0;
        for (const wchar_t* cursor = argv[i]; ; ++cursor) {
            if (*cursor == L'\\') { ++slashes; continue; }
            if (*cursor == L'"' || *cursor == L'\0') {
                command.append(slashes * 2, L'\\');
                if (*cursor == L'"') command += L'\\';
            } else {
                command.append(slashes, L'\\');
            }
            slashes = 0;
            if (*cursor == L'\0') break;
            command += *cursor;
        }
        command += L'"';
    }
    STARTUPINFOW startup{};
    startup.cb = sizeof(startup);
    startup.dwFlags = STARTF_USESTDHANDLES;
    startup.hStdInput = GetStdHandle(STD_INPUT_HANDLE);
    startup.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE);
    startup.hStdError = GetStdHandle(STD_ERROR_HANDLE);
    PROCESS_INFORMATION process{};
    if (!CreateProcessW(argv[1], command.data(), nullptr, nullptr, TRUE,
        CREATE_SUSPENDED | CREATE_NO_WINDOW, nullptr, nullptr, &startup, &process)) {
        std::fprintf(stderr, "CreateProcess failed: %lu\n", GetLastError());
        return 3;
    }
    if (!SetProcessAffinityMask(process.hProcess, 0x4000)) {
        std::fprintf(stderr, "SetProcessAffinityMask failed: %lu\n", GetLastError());
        TerminateProcess(process.hProcess, 4);
        CloseHandle(process.hThread);
        CloseHandle(process.hProcess);
        return 4;
    }
    if (ResumeThread(process.hThread) == static_cast<DWORD>(-1)) {
        TerminateProcess(process.hProcess, 5);
        CloseHandle(process.hThread);
        CloseHandle(process.hProcess);
        return 5;
    }
    // A broken fixture must not leave an orphan benchmark consuming the measured core.
    if (WaitForSingleObject(process.hProcess, 600000) != WAIT_OBJECT_0) {
        TerminateProcess(process.hProcess, 6);
        WaitForSingleObject(process.hProcess, INFINITE);
    }
    DWORD code = 7;
    GetExitCodeProcess(process.hProcess, &code);
    CloseHandle(process.hThread);
    CloseHandle(process.hProcess);
    return static_cast<int>(code);
}
