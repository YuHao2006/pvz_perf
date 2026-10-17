// pvz1073_sampler.c —— 原版 1073 性能采样 DLL（32 位，注入目标进程）
// poor-man's 采样剖析器：每 ~1ms 挂起各线程取 EIP；exe 内按偏移精确直方图，
// 其余按模块聚合。心跳文件 C:\temp\pvz1073_hb.txt 记录进度（attach/sweeps/
// dump 状态），快照写 C:\temp\pvz1073_sample.csv（每 5s 覆盖）。
// exe 偏移离线经 reconstruction/1073/raw_decomp/functions.csv 翻译函数名。
#include <windows.h>
#include <tlhelp32.h>
#include <psapi.h>
#include <stdio.h>

#define HSIZE 65536u
struct Ent { unsigned off; unsigned n; };
static struct Ent gH[HSIZE];
static unsigned gTotal, gInExe;
static char gDumpPath[MAX_PATH];

struct ModRange { unsigned lo, hi; const char* name; };
static struct ModRange gMods[12];
static int gModCount;
static unsigned gModHits[12];
static volatile LONG gRun = 1;

static void Hb(const char* fmt, unsigned a, unsigned b)
{
    FILE* f = fopen("C:\\temp\\pvz1073_hb.txt", "a");
    if (f) { fprintf(f, fmt, a, b); fclose(f); }
}

static void TakeSnapshot(void)
{
    HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
    if (snap == INVALID_HANDLE_VALUE) return;
    THREADENTRY32 te; te.dwSize = sizeof(te);
    DWORD self = GetCurrentThreadId();
    if (Thread32First(snap, &te)) do {
        if (te.th32OwnerProcessID != GetCurrentProcessId()) continue;
        if (te.th32ThreadID == self) continue;
        HANDLE h = OpenThread(THREAD_SUSPEND_RESUME | THREAD_GET_CONTEXT, FALSE, te.th32ThreadID);
        if (!h) continue;
        if (SuspendThread(h) != (DWORD)-1) {
            CONTEXT c; ZeroMemory(&c, sizeof(c)); c.ContextFlags = CONTEXT_CONTROL;
            if (GetThreadContext(h, &c)) {
                unsigned eip = (unsigned)c.Eip;
                gTotal++;
                int cls = -1;
                for (int i = 0; i < gModCount; ++i)
                    if (eip >= gMods[i].lo && eip < gMods[i].hi) { cls = i; break; }
                if (cls == 0) {
                    gInExe++;
                    unsigned off = eip - gMods[0].lo;
                    unsigned i = (off >> 2) & (HSIZE - 1);
                    while (gH[i].n && gH[i].off != off) i = (i + 1) & (HSIZE - 1);
                    gH[i].off = off; gH[i].n++;
                } else if (cls > 0) {
                    gModHits[cls]++;
                }
            }
            ResumeThread(h);
        }
        CloseHandle(h);
    } while (Thread32Next(snap, &te));
    CloseHandle(snap);
}

static void Dump(void)
{
    FILE* f = fopen(gDumpPath, "w");
    if (!f) { Hb("dump open failed err=%lu total=%u\n", GetLastError(), 0); return; }
    fprintf(f, "TOTAL %u EXE %u", gTotal, gInExe);
    for (int i = 1; i < gModCount; ++i)
        fprintf(f, " %s=%u", gMods[i].name, gModHits[i]);
    fprintf(f, "\n");
    for (unsigned i = 0; i < HSIZE; ++i)
        if (gH[i].n) fprintf(f, "%x %u\n", gH[i].off, gH[i].n);
    fclose(f);
}

static DWORD WINAPI SamplerThread(LPVOID unused)
{
    (void)unused;
    unsigned sinceDump = 0, sweeps = 0;
    while (gRun) {
        TakeSnapshot();
        ++sweeps;
        if (sweeps % 200 == 0) Hb("alive sweeps=%u total=%u\n", sweeps, gTotal);
        if (++sinceDump >= 1000) { Dump(); Hb("dump sweeps=%u total=%u\n", sweeps, gTotal); sinceDump = 0; }
        Sleep(1);
    }
    Dump();
    return 0;
}

static void InitModules(void)
{
    HMODULE exe = GetModuleHandleA(NULL);
    MODULEINFO mi; GetModuleInformation(GetCurrentProcess(), exe, &mi, sizeof(mi));
    gMods[0].lo = (unsigned)(size_t)mi.lpBaseOfDll; gMods[0].hi = gMods[0].lo + mi.SizeOfImage;
    gMods[0].name = "exe"; gModCount = 1;
    const char* interesting[] = { "kernel32.dll", "ntdll.dll", "user32.dll", "gdi32.dll",
        "ddraw.dll", "ddrawcompat.dll", "bass.dll", "winmm.dll", "msvcrt.dll", "win32u.dll", nullptr };
    for (int k = 0; interesting[k] && gModCount < 12; ++k) {
        HMODULE m = GetModuleHandleA(interesting[k]);
        if (!m) continue;
        MODULEINFO mm; GetModuleInformation(GetCurrentProcess(), m, &mm, sizeof(mm));
        gMods[gModCount].lo = (unsigned)(size_t)mm.lpBaseOfDll;
        gMods[gModCount].hi = gMods[gModCount].lo + mm.SizeOfImage;
        gMods[gModCount].name = interesting[k];
        ++gModCount;
    }
}

BOOL APIENTRY DllMain(HINSTANCE h, DWORD reason, LPVOID)
{
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(h);
        lstrcpyA(gDumpPath, "C:\\temp\\pvz1073_sample.csv");
        InitModules();
        Hb("attach modules=%d base=%x\n", (unsigned)gModCount, gMods[0].lo);
        CreateThread(NULL, 0, SamplerThread, NULL, 0, NULL);
    }
    return TRUE;
}
