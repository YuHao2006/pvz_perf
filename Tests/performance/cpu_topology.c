/* cpu_topology [--watch <seconds>]: LP -> core -> efficiency class -> freq.
 * Plain mode: one-shot table incl. per-LP MaxMhz/CurMhz (CallNtPowerInformation).
 * --watch N: sample every second; per LP print usage% (from
 * NtQuerySystemInformation SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION deltas)
 * and live CurMhz — for checking whether pinned cores saturate their cap.
 */
#include <windows.h>
#include <powerbase.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _PROCESSOR_POWER_INFORMATION {
    ULONG Number;
    ULONG MaxMhz;
    ULONG CurrentMhz;
    ULONG MhzLimit;
    ULONG MaxIdleState;
    ULONG CurrentIdleState;
} PROCESSOR_POWER_INFORMATION;

typedef struct _SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION {
    LARGE_INTEGER IdleTime, KernelTime, UserTime;
    LARGE_INTEGER DpcTime, InterruptTime;
    ULONG InterruptCount;
} SPPI;

typedef LONG (WINAPI *PFN_CallNtPowerInformation)(ULONG, PVOID, ULONG, PVOID, ULONG);
typedef LONG (WINAPI *PFN_NtQSI)(ULONG, PVOID, ULONG, PULONG);

int main(int argc, char **argv)
{
    int watchSeconds = 0;
    if (argc == 3 && strcmp(argv[1], "--watch") == 0)
        watchSeconds = atoi(argv[2]);

    PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX buff = NULL;
    DWORD bytes = 0;
    if (GetLogicalProcessorInformationEx(RelationProcessorCore, NULL, &bytes) ||
        GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
        fprintf(stderr, "size query failed\n");
        return 1;
    }
    buff = malloc(bytes);
    if (!GetLogicalProcessorInformationEx(RelationProcessorCore, buff, &bytes)) {
        fprintf(stderr, "query failed\n");
        return 1;
    }

    DWORD lpCount = GetActiveProcessorCount(ALL_PROCESSOR_GROUPS);
    PROCESSOR_POWER_INFORMATION *power = calloc(lpCount, sizeof(*power));
    HMODULE powr = LoadLibraryA("powrprof.dll");
    PFN_CallNtPowerInformation callNt =
        (PFN_CallNtPowerInformation)GetProcAddress(powr, "CallNtPowerInformation");
    if (callNt)
        callNt(ProcessorInformation, NULL, 0, power,
               (ULONG)(lpCount * sizeof(*power)));

    SPPI *sppi = calloc(lpCount, sizeof(*sppi));
    HMODULE nt = GetModuleHandleW(L"ntdll.dll");
    PFN_NtQSI NtQSI = (PFN_NtQSI)GetProcAddress(nt, "NtQuerySystemInformation");
    /* SystemProcessorPerformanceInformation = 8 */
    NtQSI(8, sppi, (ULONG)(lpCount * sizeof(SPPI)), NULL);

    if (watchSeconds <= 0) {
        printf("LP  Group Core(firstLP) EffClass MaxMhz CurMhz\n");
        BYTE *p = (BYTE *)buff;
        BYTE *end = p + bytes;
        while (p < end) {
            PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX rel =
                (PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX)p;
            if (rel->Relationship == RelationProcessorCore) {
                for (WORD g = 0; g < rel->Processor.GroupCount; ++g) {
                    GROUP_AFFINITY ga = rel->Processor.GroupMask[g];
                    for (int bit = 0; bit < 64; ++bit) {
                        if (ga.Mask & ((KAFFINITY)1 << bit)) {
                            DWORD lp = bit;
                            ULONG maxMhz = 0, curMhz = 0;
                            if (lp < lpCount) {
                                maxMhz = power[lp].MaxMhz;
                                curMhz = power[lp].CurrentMhz;
                            }
                            printf("%-3u %-5u %-14u %-8u %-6u %-6u\n",
                                   lp, ga.Group,
                                   (unsigned)(ga.Mask & (~(KAFFINITY)(ga.Mask - 1))),
                                   rel->Processor.EfficiencyClass, maxMhz, curMhz);
                        }
                    }
                }
            }
            p += rel->Size;
        }
        printf("total LPs=%lu\n", lpCount);
        return 0;
    }

    printf("t   LP  use%%  CurMhz MaxMhz\n");
    for (int t = 1; t <= watchSeconds; ++t) {
        Sleep(1000);
        if (callNt)
            callNt(ProcessorInformation, NULL, 0, power,
                   (ULONG)(lpCount * sizeof(*power)));
        SPPI *sppi2 = calloc(lpCount, sizeof(*sppi2));
        NtQSI(8, sppi2, (ULONG)(lpCount * sizeof(SPPI)), NULL);
        for (DWORD lp = 0; lp < lpCount; ++lp) {
            double kd = (double)(sppi2[lp].KernelTime.QuadPart - sppi[lp].KernelTime.QuadPart);
            double ud = (double)(sppi2[lp].UserTime.QuadPart - sppi[lp].UserTime.QuadPart);
            double id = (double)(sppi2[lp].IdleTime.QuadPart - sppi[lp].IdleTime.QuadPart);
            double busy = kd + ud - id;
            double total = kd + ud;
            double use = total > 0 ? 100.0 * busy / total : 0;
            printf("%-3d %-3u %-5.0f %-6u %-6u\n", t, lp, use,
                   power[lp].CurrentMhz, power[lp].MaxMhz);
        }
        memcpy(sppi, sppi2, lpCount * sizeof(SPPI));
        free(sppi2);
    }
    return 0;
}
