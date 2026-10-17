/* threads_dump <pid>: enumerate process threads with module-resolved start
 * addresses (toolhelp32 snapshot + NtQueryInformationThread start address +
 * module range mapping). For attributing app vs DLL/driver threads. */
#include <windows.h>
#include <tlhelp32.h>
#include <dbghelp.h>
#include <stdio.h>
#include <stdlib.h>

typedef LONG NTSTATUS;
typedef NTSTATUS (WINAPI *PFN_NtQIT)(HANDLE, ULONG, PVOID, ULONG, PULONG);

static HMODULE gExe = NULL;

static void PrintWithSymbol(ULONG64 addr, char *module, ULONG64 modBase)
{
    char sym[512] = "";
    SYMBOL_INFOW *si = (SYMBOL_INFOW *)calloc(sizeof(SYMBOL_INFOW) + 512 * sizeof(WCHAR), 1);
    si->SizeOfStruct = sizeof(SYMBOL_INFOW);
    si->MaxNameLen = 511;
    DWORD64 disp = 0;
    if (gExe && modBase == (ULONG64)(ULONG_PTR)gExe &&
        SymFromAddrW(GetCurrentProcess(), addr, &disp, si)) {
        WideCharToMultiByte(CP_UTF8, 0, si->Name, -1, sym, 512, NULL, NULL);
        printf("%s+0x%llx  %s+0x%llx", module,
               (unsigned long long)(addr - modBase), sym,
               (unsigned long long)disp);
        free(si);
        return;
    }
    free(si);
    printf("%s+0x%llx", module, (unsigned long long)(addr - modBase));
}

int main(int argc, char **argv)
{
    if (argc < 2) { fprintf(stderr, "usage: threads_dump <pid>\n"); return 1; }
    DWORD pid = (DWORD)strtoul(argv[1], NULL, 0);

    HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
    if (snap == INVALID_HANDLE_VALUE) { fprintf(stderr, "snap failed\n"); return 1; }

    /* module ranges via toolhelp module snapshot of the target process */
    HANDLE msnap = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE | TH32CS_SNAPMODULE32, pid);
    struct Range { ULONG64 base, end; char name[64]; } mods[512];
    int nmods = 0;
    if (msnap != INVALID_HANDLE_VALUE) {
        MODULEENTRY32W me = { .dwSize = sizeof(me) };
        if (Module32FirstW(msnap, &me)) {
            do {
                if (nmods < 512) {
                    mods[nmods].base = (ULONG64)(ULONG_PTR)me.modBaseAddr;
                    mods[nmods].end = mods[nmods].base + me.modBaseSize;
                    WideCharToMultiByte(CP_UTF8, 0, me.szModule, -1,
                                        mods[nmods].name, 64, NULL, NULL);
                    nmods++;
                }
            } while (Module32NextW(msnap, &me));
        }
        CloseHandle(msnap);
    }

    HMODULE ntdll = GetModuleHandleW(L"ntdll.dll");
    PFN_NtQIT NtQIT = (PFN_NtQIT)GetProcAddress(ntdll, "NtQueryInformationThread");
    SymSetOptions(SYMOPT_UNDNAME | SYMOPT_DEFERRED_LOADS | SYMOPT_LOAD_LINES);
    gExe = GetModuleHandleW(NULL);

    THREADENTRY32 te = { .dwSize = sizeof(te) };
    int count = 0;
    if (Thread32First(snap, &te)) {
        do {
            if (te.th32OwnerProcessID != pid) continue;
            printf("tid=%-6lu ", te.th32ThreadID);
            HANDLE th = OpenThread(THREAD_QUERY_INFORMATION, FALSE, te.th32ThreadID);
            if (th && NtQIT) {
                ULONG64 start = 0;
                if (NtQIT(th, 9 /*ThreadQuerySetWin32StartAddress*/,
                          &start, sizeof(start), NULL) == 0 && start) {
                    int hit = 0;
                    for (int i = 0; i < nmods; i++)
                        if (start >= mods[i].base && start < mods[i].end) {
                            PrintWithSymbol(start, mods[i].name, mods[i].base);
                            hit = 1;
                            break;
                        }
                    if (!hit) printf("unmapped 0x%llx", (unsigned long long)start);
                } else printf("start=? ");
                if (th) CloseHandle(th);
            } else printf("open-failed ");
            printf("\n");
            count++;
        } while (Thread32Next(snap, &te));
    }
    CloseHandle(snap);
    printf("total=%d\n", count);
    return 0;
}
