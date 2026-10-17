// pvz1073_inject.c —— 32 位注入器：按进程名找 pid，CreateRemoteThread+LoadLibraryA
#include <windows.h>
#include <tlhelp32.h>
#include <stdio.h>

int main(int argc, char** argv)
{
    if (argc != 3) { fprintf(stderr, "usage: %s <exeName> <dllPath>\n", argv[0]); return 2; }
    DWORD pid = 0;
    HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PROCESSENTRY32 pe; pe.dwSize = sizeof(pe);
    if (Process32First(snap, &pe)) do {
        if (!_stricmp(pe.szExeFile, argv[1])) { pid = pe.th32ProcessID; break; }
    } while (Process32Next(snap, &pe));
    CloseHandle(snap);
    if (!pid) { fprintf(stderr, "process %s not found\n", argv[1]); return 1; }

    HANDLE p = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);
    if (!p) { fprintf(stderr, "OpenProcess failed %lu\n", GetLastError()); return 1; }
    size_t len = strlen(argv[2]) + 1;
    void* remote = VirtualAllocEx(p, NULL, len, MEM_COMMIT, PAGE_READWRITE);
    if (!remote) { fprintf(stderr, "VirtualAllocEx failed\n"); return 1; }
    if (!WriteProcessMemory(p, remote, argv[2], len, NULL)) { fprintf(stderr, "WriteProcessMemory failed\n"); return 1; }
    FARPROC load = GetProcAddress(GetModuleHandleA("kernel32.dll"), "LoadLibraryA");
    HANDLE t = CreateRemoteThread(p, NULL, 0, (LPTHREAD_START_ROUTINE)load, remote, 0, NULL);
    if (!t) { fprintf(stderr, "CreateRemoteThread failed %lu\n", GetLastError()); return 1; }
    WaitForSingleObject(t, 10000);
    CloseHandle(t); CloseHandle(p);
    printf("injected into pid=%lu\n", pid);
    return 0;
}
