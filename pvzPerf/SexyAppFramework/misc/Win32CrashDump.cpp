#ifdef _WIN32
#include "Win32CrashDump.h"
#include <DbgHelp.h>
#include <cstddef>

// Separate TU from the historical <imagehlp.h> declarations. The SDK packs
// this structure to 4 bytes even in a 64-bit process.
static_assert(offsetof(MINIDUMP_EXCEPTION_INFORMATION, ExceptionPointers) == 4);

bool Sexy::WriteCurrentProcessMinidump(const char* path, EXCEPTION_POINTERS* exception)
{
    HMODULE library = LoadLibraryExW(L"dbghelp.dll", nullptr, LOAD_LIBRARY_SEARCH_SYSTEM32);
    if (!library) return false;
    auto write = reinterpret_cast<decltype(&MiniDumpWriteDump)>(
        GetProcAddress(library, "MiniDumpWriteDump"));
    if (!write) {
        const DWORD error = GetLastError();
        FreeLibrary(library);
        SetLastError(error);
        return false;
    }
    HANDLE file = CreateFileA(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (file == INVALID_HANDLE_VALUE) {
        const DWORD error = GetLastError();
        FreeLibrary(library);
        SetLastError(error);
        return false;
    }
    MINIDUMP_EXCEPTION_INFORMATION info{};
    info.ThreadId = GetCurrentThreadId();
    info.ExceptionPointers = exception;
    info.ClientPointers = FALSE;
    const BOOL success = write(GetCurrentProcess(), GetCurrentProcessId(), file,
        MiniDumpNormal, &info, nullptr, nullptr);
    const DWORD error = success ? ERROR_SUCCESS : GetLastError();
    CloseHandle(file);
    FreeLibrary(library);
    SetLastError(error);
    return success != FALSE;
}
#endif
