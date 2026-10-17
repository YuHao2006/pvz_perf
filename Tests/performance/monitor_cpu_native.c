// monitor_cpu_native.c —— 进程 CPU 占用监控（原生轻量版）
// PowerShell 版实测自身 18.1% 单核（每秒 ~180ms 突发，足以污染被测对象）；
// 本版 OpenProcess 一次复用句柄，每秒 GetProcessTimes 一次，自身 <0.1ms。
// 用法: monitor_cpu_native.exe <exeName> <seconds> <outCsv>
#include <windows.h>
#include <tlhelp32.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    if (argc != 4) { fprintf(stderr, "usage: %s <exeName> <seconds> <out.csv>\n", argv[0]); return 2; }
    DWORD pid = 0;
    int matches = 0;
    HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PROCESSENTRY32 pe; pe.dwSize = sizeof(pe);
    if (Process32First(snap, &pe)) do {
        if (!_stricmp(pe.szExeFile, argv[1])) { pid = pe.th32ProcessID; ++matches; }
    } while (Process32Next(snap, &pe));
    CloseHandle(snap);
    if (!pid) { fprintf(stderr, "process %s not found\n", argv[1]); return 1; }
    if (matches != 1) { fprintf(stderr, "process name is ambiguous: %s\n", argv[1]); return 1; }
    HANDLE p = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    if (!p) { fprintf(stderr, "OpenProcess failed %lu\n", GetLastError()); return 1; }
    DWORD_PTR gameMask, systemMask, observerMask, observerSystemMask;
    if (!GetProcessAffinityMask(p, &gameMask, &systemMask) || gameMask != 0x4000 ||
        !GetProcessAffinityMask(GetCurrentProcess(), &observerMask, &observerSystemMask) ||
        !SetProcessAffinityMask(GetCurrentProcess(), observerMask & ~(DWORD_PTR)0x4000)) {
        fprintf(stderr, "Game must be pinned to LP14; observer must run outside LP14\n");
        CloseHandle(p); return 1;
    }

    FILE* out = fopen(argv[3], "w");
    if (!out) { fprintf(stderr, "cannot open %s\n", argv[3]); CloseHandle(p); return 1; }
    fprintf(out, "elapsed_s,cpu_seconds,cpu_percent\n");
    FILETIME prevCreation, prevExit, prevKernel, prevUser;
    if (!GetProcessTimes(p, &prevCreation, &prevExit, &prevKernel, &prevUser)) {
        fclose(out); CloseHandle(p); return 1;
    }
    ULARGE_INTEGER prev;
    prev.LowPart = prevKernel.dwLowDateTime; prev.HighPart = prevKernel.dwHighDateTime;
    ULARGE_INTEGER prevU; prevU.LowPart = prevUser.dwLowDateTime; prevU.HighPart = prevUser.dwHighDateTime;

    int seconds = atoi(argv[2]);
    LARGE_INTEGER frequency, begin, previousTime;
    if (seconds <= 0 || !QueryPerformanceFrequency(&frequency) ||
        !QueryPerformanceCounter(&begin)) {
        fclose(out); CloseHandle(p); return 1;
    }
    previousTime = begin;
    LONGLONG nextDeadline = begin.QuadPart + frequency.QuadPart;
    const LONGLONG endDeadline = begin.QuadPart + (LONGLONG)seconds * frequency.QuadPart;
    int status = 0;
    for (;;)
    {
        LARGE_INTEGER now;
        for (;;) {
            if (!QueryPerformanceCounter(&now)) { status = 1; break; }
            const LONGLONG remaining = nextDeadline - now.QuadPart;
            if (remaining <= 0) break;
            Sleep((DWORD)((remaining * 1000 + frequency.QuadPart - 1) / frequency.QuadPart));
        }
        if (status) break;
        FILETIME creation, exitT, kernel, user;
        DWORD exitCode;
        if (!GetProcessAffinityMask(p, &gameMask, &systemMask) || gameMask != 0x4000 ||
            !GetExitCodeProcess(p, &exitCode) || exitCode != STILL_ACTIVE ||
            !GetProcessTimes(p, &creation, &exitT, &kernel, &user) ||
            !QueryPerformanceCounter(&now))
        {
            fprintf(stderr, "measurement invalid: target exited, affinity changed, or query failed\n");
            status = 1;
            break;
        }
        ULARGE_INTEGER k, u;
        k.LowPart = kernel.dwLowDateTime; k.HighPart = kernel.dwHighDateTime;
        u.LowPart = user.dwLowDateTime; u.HighPart = user.dwHighDateTime;
        double delta = (double)(k.QuadPart - prev.QuadPart + u.QuadPart - prevU.QuadPart) * 1e-7;
        double interval = (double)(now.QuadPart - previousTime.QuadPart) / frequency.QuadPart;
        double elapsed = (double)(now.QuadPart - begin.QuadPart) / frequency.QuadPart;
        prev = k; prevU = u;
        previousTime = now;
        fprintf(out, "%.6f,%.6f,%.3f\n", elapsed, delta, delta / interval * 100.0);
        fflush(out);
        if (now.QuadPart >= endDeadline) break;
        if (!QueryPerformanceCounter(&now)) { status = 1; break; }
        nextDeadline = begin.QuadPart +
            ((now.QuadPart - begin.QuadPart) / frequency.QuadPart + 1) * frequency.QuadPart;
        if (nextDeadline > endDeadline) nextDeadline = endDeadline;
    }
    fclose(out);
    CloseHandle(p);
    printf("monitor-done -> %s\n", argv[3]);
    return status;
}
