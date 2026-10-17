#define WIN32_LEAN_AND_MEAN
#include <windows.h>

int main()
{
    if (GetPriorityClass(GetCurrentProcess()) != NORMAL_PRIORITY_CLASS ||
        GetThreadPriority(GetCurrentThread()) != THREAD_PRIORITY_NORMAL)
        return 1;
    if (!SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_ABOVE_NORMAL))
        return 2;
    Sleep(150);
    if (!SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_NORMAL))
        return 3;
    Sleep(100);
    return 0;
}
