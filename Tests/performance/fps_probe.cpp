// fps_probe: desktop-change sampling via DXGI Desktop Duplication.
//
// Samples the composed desktop at vsync; hashes the target window's rectangle
// into 16x16 block means; a frame counts as "presented" when the hash set
// changes. These are changed frames and desktop present events, not exact game
// FPS or update counts. The target must stay foreground and pinned to LP14.
//
// Usage: fps_probe.exe <window_title_substring> [seconds] [out_csv]
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <d3d11.h>
#include <dxgi1_2.h>
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>

#pragma comment(lib, "d3d11.lib")
#pragma comment(lib, "dxgi.lib")
#pragma comment(lib, "user32.lib")

static HWND FindByTitle(const char* needle) {
    struct Ctx { const char* n; HWND h; } ctx{needle, nullptr};
    EnumWindows([](HWND h, LPARAM lp) -> BOOL {
        auto* c = reinterpret_cast<Ctx*>(lp);
        char title[256];
        if (GetWindowTextA(h, title, sizeof(title)) > 0 && strstr(title, c->n))
            { c->h = h; return FALSE; }
        return TRUE;
    }, reinterpret_cast<LPARAM>(&ctx));
    return ctx.h;
}

int main(int argc, char** argv) {
    if (argc < 2) { fprintf(stderr, "usage: fps_probe <title-substring> [seconds] [out_csv] [min_changed_permille]\n"); return 2; }
    const std::string title = argv[1];
    const int seconds = argc > 2 ? atoi(argv[2]) : 60;
    const char* csvPath = argc > 3 ? argv[3] : nullptr;
    // 判帧阈值：变化的块数 ≥ ‰（默认 15‰ ≈1.5%，过滤纯光标噪声；0=任意变化）
    const int minPermille = argc > 4 ? atoi(argv[4]) : 15;
    FILE* csv = csvPath ? fopen(csvPath, "w") : nullptr;
    if (csv) fprintf(csv, "t_s,changed_frames,vsync_samples,window_w,window_h\n");

    SetProcessDPIAware();  // physical pixels for rect->desktop mapping

    HWND hwnd = FindByTitle(title.c_str());
    if (!hwnd) { fprintf(stderr, "window not found: %s\n", title.c_str()); return 1; }
    DWORD pid = 0;
    GetWindowThreadProcessId(hwnd, &pid);
    HANDLE process = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, FALSE, pid);
    DWORD_PTR gameMask = 0, systemMask = 0, observerMask = 0, observerSystemMask = 0;
    if (!process || !GetProcessAffinityMask(process, &gameMask, &systemMask) ||
        gameMask != 0x4000 ||
        !GetProcessAffinityMask(GetCurrentProcess(), &observerMask, &observerSystemMask) ||
        !SetProcessAffinityMask(GetCurrentProcess(), observerMask & ~DWORD_PTR(0x4000))) {
        fprintf(stderr, "target must be pinned to LP14; observer must run outside LP14\n");
        if (process) CloseHandle(process);
        return 1;
    }
    CloseHandle(process);

    ID3D11Device* dev = nullptr; ID3D11DeviceContext* ctx = nullptr;
    IDXGIOutputDuplication* dup = nullptr; IDXGIOutput1* out1 = nullptr;
    D3D_FEATURE_LEVEL fl{};
    HRESULT hr = D3D11CreateDevice(nullptr, D3D_DRIVER_TYPE_HARDWARE, nullptr, 0, nullptr, 0, D3D11_SDK_VERSION, &dev, &fl, &ctx);
    if (FAILED(hr)) { fprintf(stderr, "D3D11 create failed 0x%lX\n", hr); return 1; }
    IDXGIDevice* dxgiDev = nullptr; IDXGIAdapter* ad = nullptr; IDXGIOutput* out = nullptr;
    dev->QueryInterface(__uuidof(IDXGIDevice), (void**)&dxgiDev);
    dxgiDev->GetAdapter(&ad); ad->EnumOutputs(0, &out);
    DXGI_OUTPUT_DESC od{}; out->GetDesc(&od);
    hr = out->QueryInterface(__uuidof(IDXGIOutput1), (void**)&out1);
    hr = out1->DuplicateOutput(dev, &dup);
    if (FAILED(hr)) { fprintf(stderr, "DuplicateOutput failed 0x%lX (headless/RDP?)\n", hr); return 1; }

    UINT w = 0, h = 0;
    std::vector<uint64_t> prevHash;
    bool havePrev = false;
    int changedThisSec = 0, vsyncThisSec = 0;
    ULONGLONG t0 = GetTickCount64();
    int lastReportSec = -1;

    // staging texture (re)created on first frame; map NO_WAIT via CPU read of copy
    ID3D11Texture2D* staging = nullptr; UINT texW = 0, texH = 0;

    while (true) {
        DWORD foregroundPid = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foregroundPid);
        if (!IsWindow(hwnd) || IsIconic(hwnd) || foregroundPid != pid) {
            fprintf(stderr, "capture invalid: target left the foreground\n");
            return 1;
        }
        const ULONGLONG now = GetTickCount64();
        const int sec = int((now - t0) / 1000);
        if (sec != lastReportSec) {
            if (csv && lastReportSec >= 0)
                fprintf(csv, "%d,%d,%d,%u,%u\n", lastReportSec, changedThisSec, vsyncThisSec, w, h), fflush(csv);
            fprintf(stdout, "t=%ds changed_frames=%d desktop_present_events=%d win=%ux%u%s\n",
                lastReportSec, changedThisSec, vsyncThisSec, w, h, w ? "" : " [NO WINDOW CAPTURE]");
            fflush(stdout);
            changedThisSec = vsyncThisSec = 0;
            lastReportSec = sec;
            if (sec >= seconds) break;
        }

        DXGI_OUTDUPL_FRAME_INFO info{};
        IDXGIResource* res = nullptr;
        hr = dup->AcquireNextFrame(200, &info, &res);
        if (hr == DXGI_ERROR_WAIT_TIMEOUT) continue;
        if (FAILED(hr)) { // access lost (mode change) — rebuild once
            if (staging) { staging->Release(); staging = nullptr; }
            dup->ReleaseFrame();
            dup->Release(); dup = nullptr;
            if (FAILED(out1->DuplicateOutput(dev, &dup))) { fprintf(stderr, "re-dup failed\n"); break; }
            havePrev = false;
            continue;
        }
        // 只认真实上屏（LastPresentTime≠0）；纯指针/元数据更新不计数
        if (info.LastPresentTime.QuadPart != 0) vsyncThisSec++;

        RECT wr; GetWindowRect(hwnd, &wr);
        // map window rect (virtual-screen coords) into duplication texture coords
        LONG vx = od.DesktopCoordinates.left, vy = od.DesktopCoordinates.top;
        LONG rx = wr.left - vx, ry = wr.top - vy;
        LONG rw = wr.right - wr.left, rh = wr.bottom - wr.top;

        ID3D11Texture2D* frameTex = nullptr;
        if (res) res->QueryInterface(__uuidof(ID3D11Texture2D), (void**)&frameTex);
        if (frameTex && rw > 0 && rh > 0) {
            D3D11_TEXTURE2D_DESC fd{}; frameTex->GetDesc(&fd);
            if (!staging || fd.Width != texW || fd.Height != texH) {
                if (staging) staging->Release();
                D3D11_TEXTURE2D_DESC sd = fd;
                sd.Usage = D3D11_USAGE_STAGING; sd.BindFlags = 0; sd.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
                sd.MiscFlags = 0; sd.SampleDesc.Count = 1; sd.SampleDesc.Quality = 0;
                if (SUCCEEDED(dev->CreateTexture2D(&sd, nullptr, &staging))) { texW = fd.Width; texH = fd.Height; }
            }
            if (staging) {
                // clamp to desktop bounds
                LONG x0 = rx < 0 ? 0 : rx, y0 = ry < 0 ? 0 : ry;
                LONG x1 = (rx + rw) > (LONG)fd.Width ? fd.Width : (rx + rw);
                LONG y1 = (ry + rh) > (LONG)fd.Height ? fd.Height : (ry + rh);
                if (x1 > x0 && y1 > y0) {
                    D3D11_BOX box{}; box.left = UINT(x0); box.top = UINT(y0);
                    box.right = UINT(x1); box.bottom = UINT(y1); box.back = 1;
                    ctx->CopySubresourceRegion(staging, 0, 0, 0, 0, frameTex, 0, &box);
                    w = UINT(x1 - x0); h = UINT(y1 - y0);
                    D3D11_MAPPED_SUBRESOURCE m{};
                    if (SUCCEEDED(ctx->Map(staging, 0, D3D11_MAP_READ, 0, &m))) {
                        // 16px block means (RGB luma), FNV-fold
                        std::vector<uint64_t> hash;
                        const UINT bs = 16;
                        for (UINT by = 0; by + bs <= h; by += bs)
                            for (UINT bx = 0; bx + bs <= w; bx += bs) {
                                uint64_t acc = 1469598103934665603ull;
                                for (UINT y = 0; y < bs; y += 4) {
                                    const uint8_t* row = (const uint8_t*)m.pData + (size_t)(by + y) * m.RowPitch + (size_t)bx * 4;
                                    for (UINT x = 0; x < bs; x += 4) {
                                        const uint32_t p = *(const uint32_t*)(row + (size_t)x * 4);
                                        const uint32_t lum = ((p >> 16 & 0xFF) * 3 + (p >> 8 & 0xFF) * 6 + (p & 0xFF)) / 10;
                                        acc = (acc ^ lum) * 1099511628211ull;
                                    }
                                }
                                hash.push_back(acc);
                            }
                        ctx->Unmap(staging, 0);
                        if (havePrev && hash.size() == prevHash.size()) {
                            UINT diff = 0;
                            for (size_t i = 0; i < hash.size(); ++i)
                                if (hash[i] != prevHash[i]) ++diff;
                            // 变化块数达到阈值判为一帧上屏
                            if (minPermille == 0 ? diff > 0
                                : (long long)diff * 1000 >= (long long)hash.size() * minPermille)
                                changedThisSec++;
                        }
                        prevHash.swap(hash);
                        havePrev = true;
                    }
                }
            }
        }
        if (frameTex) frameTex->Release();
        if (res) res->Release();
        dup->ReleaseFrame();
    }
    if (csv) fclose(csv);
    fprintf(stdout, "fps_probe done (%ds)\n", seconds);
    return 0;
}
