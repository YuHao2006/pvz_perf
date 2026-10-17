#pragma once
#ifdef _WIN32
#include <Windows.h>

namespace Sexy {
// Failure is reported via GetLastError, never a successful fallback.
bool WriteCurrentProcessMinidump(const char* path, EXCEPTION_POINTERS* exception);
}
#endif
