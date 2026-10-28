"""Read existing game counters externally; no injection or game-memory writes."""

import argparse
import ctypes as c
from ctypes import wintypes as w
import csv
import hashlib
import json
from pathlib import Path
import statistics
import struct
import time
import msvcrt

kernel = c.WinDLL("kernel32", use_last_error=True)
user = c.WinDLL("user32", use_last_error=True)
dbg = c.WinDLL("dbghelp", use_last_error=True)
SIZE = c.c_size_t
kernel.OpenProcess.argtypes = (w.DWORD, w.BOOL, w.DWORD)
kernel.OpenProcess.restype = w.HANDLE
kernel.ReadProcessMemory.argtypes = (w.HANDLE, c.c_void_p, c.c_void_p, SIZE, c.POINTER(SIZE))
kernel.ReadProcessMemory.restype = w.BOOL
kernel.CloseHandle.argtypes = (w.HANDLE,)
kernel.GetProcessTimes.argtypes = (w.HANDLE,) + (c.POINTER(w.FILETIME),) * 4
kernel.GetProcessAffinityMask.argtypes = (w.HANDLE, c.POINTER(SIZE), c.POINTER(SIZE))
kernel.GetCurrentProcess.restype = w.HANDLE
kernel.SetProcessAffinityMask.argtypes = (w.HANDLE, SIZE)
kernel.GetExitCodeProcess.argtypes = (w.HANDLE, c.POINTER(w.DWORD))
kernel.WaitForSingleObject.argtypes = (w.HANDLE, w.DWORD)
user.GetForegroundWindow.restype = w.HWND
user.GetWindowThreadProcessId.argtypes = (w.HWND, c.POINTER(w.DWORD))
user.PostMessageW.argtypes = (w.HWND, w.UINT, SIZE, c.c_ssize_t)


class Module(c.Structure):
    _fields_ = [
        ("dwSize", w.DWORD), ("th32ModuleID", w.DWORD), ("th32ProcessID", w.DWORD),
        ("GlblcntUsage", w.DWORD), ("ProccntUsage", w.DWORD),
        ("modBaseAddr", c.c_void_p), ("modBaseSize", w.DWORD), ("hModule", w.HMODULE),
        ("szModule", w.WCHAR * 256), ("szExePath", w.WCHAR * 260),
    ]


kernel.CreateToolhelp32Snapshot.argtypes = (w.DWORD, w.DWORD)
kernel.CreateToolhelp32Snapshot.restype = w.HANDLE
kernel.Module32FirstW.argtypes = (w.HANDLE, c.POINTER(Module))


class Symbol(c.Structure):
    _fields_ = [
        ("SizeOfStruct", w.ULONG), ("TypeIndex", w.ULONG), ("Reserved", c.c_ulonglong * 2),
        ("Index", w.ULONG), ("Size", w.ULONG), ("ModBase", c.c_ulonglong),
        ("Flags", w.ULONG), ("Value", c.c_ulonglong), ("Address", c.c_ulonglong),
        ("Register", w.ULONG), ("Scope", w.ULONG), ("Tag", w.ULONG),
        ("NameLen", w.ULONG), ("MaxNameLen", w.ULONG), ("Name", c.c_char * 1024),
    ]


dbg.SymInitializeW.argtypes = (w.HANDLE, w.LPCWSTR, w.BOOL)
dbg.SymLoadModuleExW.argtypes = (
    w.HANDLE, w.HANDLE, w.LPCWSTR, w.LPCWSTR, c.c_ulonglong, w.DWORD, c.c_void_p, w.DWORD)
dbg.SymLoadModuleExW.restype = c.c_ulonglong
dbg.SymFromName.argtypes = (w.HANDLE, w.LPCSTR, c.POINTER(Symbol))
dbg.SymCleanup.argtypes = (w.HANDLE,)


def checked(value):
    if not value:
        raise c.WinError(c.get_last_error())
    return value


def symbol_rva(executable):
    handle = kernel.GetCurrentProcess()
    checked(dbg.SymInitializeW(handle, str(executable.parent), False))
    try:
        base = checked(dbg.SymLoadModuleExW(
            handle, None, str(executable), "pvz_perf", 0x10000000, 0, None, 0))
        symbol = Symbol()
        symbol.SizeOfStruct = Symbol.Name.offset + 4
        symbol.MaxNameLen = 1024
        checked(dbg.SymFromName(handle, b"pvz_perf!gLawnApp", c.byref(symbol)))
        return symbol.Address - base
    finally:
        dbg.SymCleanup(handle)


ORIGINAL_SHA256 = "5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251"
ORIGINAL_LAYOUT = {
    "pointerBytes": 4, "mDrawCount": 0x4E0, "mUpdateCount": 0x4E4,
    "mGameScene": 0x91C, "mGameMode": 0x918, "mBoard": 0x868,
    "mCreditScreen": 0x87C, "mGameSelector": 0x870, "mTitleScreen": 0x86C,
    "mPlayerInfo": 0x94C, "mHWnd": 0x374, "mAwardScreen": 0x878,
    "mDialogMap": 0x324,
    "selector": {"options": 0xB4, "survival": 0xCC},
    "widget": {"x": 0x40, "y": 0x44, "width": 0x48, "height": 0x4C, "parent": 0x24},
    "continueButton": 0x184, "creditsButton": 0x188, "awardStart": 0xA0,
    # Verified against the exact English 1073 executable above: three distinct
    # contiguous grid arrays match the canonical save at Board+0x17C.
    # The reference decompilation's Board offsets are 0x18 bytes earlier.
    "boardCounterBytes": 4,
    "board": {"paused": 0x17C, "counter": 0x5580, "wave": 0x5594,
              "waves": 0x557C, "sun": 0x5578},
}


class Game:
    def __init__(self, pid, kind, layout=None):
        self.pid = pid
        self.handle = checked(kernel.OpenProcess(0x1000 | 0x10 | 0x100000, False, pid))
        snapshot = kernel.CreateToolhelp32Snapshot(0x8 | 0x10, pid)
        if snapshot == c.c_void_p(-1).value:
            self.close()
            raise c.WinError(c.get_last_error())
        try:
            module = Module()
            module.dwSize = c.sizeof(Module)
            checked(kernel.Module32FirstW(snapshot, c.byref(module)))
            self.base = module.modBaseAddr
            self.executable = Path(module.szExePath)
        finally:
            kernel.CloseHandle(snapshot)
        self.sha256 = hashlib.sha256(self.executable.read_bytes()).hexdigest()
        self.kind = kind
        if kind == "original":
            if self.sha256.lower() != ORIGINAL_SHA256:
                self.close()
                raise ValueError("Original offsets require the verified retail 1073 executable")
            self.layout = ORIGINAL_LAYOUT
            self.app_address = self.base + 0x329670
        else:
            self.layout = json.loads(Path(layout).read_text(encoding="utf-8-sig"))
            if self.layout["executable_sha256"] != self.sha256:
                self.close()
                raise ValueError("Layout does not describe this exact executable")
            self.app_address = self.base + symbol_rva(self.executable)

    def close(self):
        if self.handle:
            kernel.CloseHandle(self.handle)
            self.handle = None

    def read(self, address, code):
        size = struct.calcsize(code)
        buffer = c.create_string_buffer(size)
        count = SIZE()
        checked(kernel.ReadProcessMemory(
            self.handle, address, buffer, size, c.byref(count)))
        if count.value != size:
            raise RuntimeError("Incomplete process-memory read")
        return struct.unpack(code, buffer.raw)[0]

    def pointer(self, address):
        return self.read(address, "<Q" if self.layout["pointerBytes"] == 8 else "<I")

    def affinity(self):
        allowed, system = SIZE(), SIZE()
        checked(kernel.GetProcessAffinityMask(self.handle, c.byref(allowed), c.byref(system)))
        return allowed.value

    def snapshot(self):
        app = self.pointer(self.app_address)
        if not app:
            raise RuntimeError("Application is not constructed")
        result = {"pid": self.pid, "app": app}
        for field in ("mDrawCount", "mUpdateCount", "mGameScene", "mGameMode"):
            result[field] = self.read(app + self.layout[field], "<I")
        for field in ("mHWnd", "mBoard", "mCreditScreen", "mGameSelector", "mTitleScreen",
                      "mPlayerInfo", "mAwardScreen"):
            result[field] = self.pointer(app + self.layout[field])
        if result["mGameScene"] > 7:
            raise RuntimeError("Scene value contradicts the verified layout")
        board = result["mBoard"]
        if board:
            result["board"] = {
                name: self.read(board + offset, "<?" if name == "paused" else
                                "<Q" if name == "counter" and
                                self.layout.get("boardCounterBytes", 4) == 8 else "<I")
                for name, offset in self.layout["board"].items()
            }
        return result

    def cpu_seconds(self):
        values = [w.FILETIME() for _ in range(4)]
        checked(kernel.GetProcessTimes(self.handle, *(c.byref(v) for v in values)))
        return sum((v.dwHighDateTime << 32) | v.dwLowDateTime for v in values[2:]) / 1e7

    def alive(self):
        code = w.DWORD()
        checked(kernel.GetExitCodeProcess(self.handle, c.byref(code)))
        return code.value == 259

def percentile(values, fraction):
    return sorted(values)[min(len(values) - 1, int((len(values) - 1) * fraction))]


def measure(game, seconds, scene, multiplier, output, preroll=0, interactive=False, until_exit=False):
    output = Path(output)
    output.mkdir(parents=True)
    observer, system = SIZE(), SIZE()
    checked(kernel.GetProcessAffinityMask(
        kernel.GetCurrentProcess(), c.byref(observer), c.byref(system)))
    checked(kernel.SetProcessAffinityMask(
        kernel.GetCurrentProcess(), observer.value & ~0x4000))
    expected_scene = 6 if scene == "credits" else 3
    metadata = {
        "schema": 1, "pid": game.pid, "kind": game.kind, "scene": scene,
        "core": "LP14", "affinity": "0x4000", "multiplier": multiplier,
        "executable": str(game.executable), "executable_sha256": game.sha256,
        "clock": time.get_clock_info("perf_counter").implementation,
        "frame_metric": "existing application mDrawCount, produced draw frames per second",
        "cpu_basis": "process user+kernel time / actual QPC interval; one core = 100%",
        "clock_policy": "Observer does not change CPU/GPU clocks or power policy.",
        "preroll_seconds": preroll,
        "status": "running",
    }
    rows = []
    try:
        previous = game.snapshot()
        previous_cpu = game.cpu_seconds()
        begin = last = time.perf_counter()
        next_deadline = begin + 1
        end = begin + seconds if seconds else float("inf")
        previous_foreground = False
        reason = "time-limit"
        metadata["initial_state"] = previous
        with (output / "samples.csv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=(
                "elapsed_s", "interval_s", "draw_fps", "update_hz", "cpu_percent",
                "draw_count", "update_count", "scene", "wave", "board_counter",
                "foreground", "valid", "segment", "cpu_ms_per_draw_frame"))
            writer.writeheader()
            if interactive or until_exit:
                print("t=0 s  Observation started. At t=3 s click the game start button.",
                      flush=True)
            while last < end:
                if not game.alive():
                    reason = "game-exited"
                    break
                if interactive and not until_exit and msvcrt.kbhit():
                    key = msvcrt.getwch()
                    if key in ("\r", "\n"):
                        reason = "enter"
                        break
                remaining = next_deadline - time.perf_counter()
                if remaining > 0:
                    time.sleep(min(.05, remaining))
                    continue
                try:
                    current = game.snapshot()
                except (OSError, RuntimeError):
                    if kernel.WaitForSingleObject(game.handle, 1000) == 0:
                        reason = "game-exited"
                        break
                    raise
                cpu = game.cpu_seconds()
                now = time.perf_counter()
                if game.affinity() != 0x4000:
                    raise RuntimeError("Game affinity changed")
                foreground = w.DWORD()
                user.GetWindowThreadProcessId(user.GetForegroundWindow(), c.byref(foreground))
                focused = foreground.value == game.pid
                correct_scene = current["mGameScene"] == expected_scene
                paused = scene == "endless" and current.get("board", {}).get("paused", True)
                segment = ("preroll" if now - begin <= preroll else
                           "background" if not focused or not previous_foreground else
                           "other-scene" if not correct_scene else
                           "paused" if paused else "game")
                valid = segment == "game"
                interval = now - last
                row = dict(
                    elapsed_s=now - begin, interval_s=interval,
                    draw_fps=((current["mDrawCount"] - previous["mDrawCount"]) & 0xFFFFFFFF) / interval,
                    update_hz=((current["mUpdateCount"] - previous["mUpdateCount"]) & 0xFFFFFFFF) / interval,
                    cpu_percent=(cpu - previous_cpu) / interval * 100,
                    draw_count=current["mDrawCount"], update_count=current["mUpdateCount"],
                    scene=current["mGameScene"], wave=current.get("board", {}).get("wave", ""),
                    board_counter=current.get("board", {}).get("counter", ""),
                    foreground=int(focused), valid=int(valid), segment=segment)
                row["cpu_ms_per_draw_frame"] = (
                    row["cpu_percent"] * 10 / row["draw_fps"]
                    if valid and row["draw_fps"] > 0 else "")
                writer.writerow(row)
                stream.flush()
                rows.append(row)
                previous, previous_cpu, last = current, cpu, now
                previous_foreground = focused
                next_deadline = min(begin + int(time.perf_counter() - begin) + 1, end)
                if interactive or until_exit:
                    cost = row["cpu_ms_per_draw_frame"]
                    cost_text = f"{cost:.3f} ms" if cost != "" else "n/a"
                    print(f"t={now-begin:7.1f}s | FPS={row['draw_fps']:6.1f} "
                          f"| CPU={row['cpu_percent']:6.1f}% | CPU/frame={cost_text} | {segment} "
                          + ("| game exit = stop" if until_exit else "| Enter / game exit = stop"), flush=True)
        valid_rows = [r for r in rows if r["valid"]]
        total = sum(r["interval_s"] for r in valid_rows)
        metadata.update(
            status="complete" if valid_rows else "no-valid-game-samples",
            stop_reason=reason, recorded_seconds=last - begin,
            seconds=total, samples=len(rows), valid_samples=len(valid_rows),
            final_state=previous)
        if valid_rows:
            frames = sum(r["draw_fps"] * r["interval_s"] for r in valid_rows)
            cpu_time = sum(r["cpu_percent"] * r["interval_s"] / 100 for r in valid_rows)
            metadata.update(
                draw_frames=round(frames),
                cpu_seconds=cpu_time,
                cpu_ms_per_draw_frame=cpu_time * 1000 / frames if frames > 0 else None,
                fps_mean=sum(r["draw_fps"] * r["interval_s"] for r in valid_rows) / total,
                fps_median=statistics.median(r["draw_fps"] for r in valid_rows),
                fps_p10=percentile([r["draw_fps"] for r in valid_rows], .1),
                cpu_percent=sum(r["cpu_percent"] * r["interval_s"] for r in valid_rows) / total)
    except BaseException as error:
        metadata.update(status="failed", error=str(error))
        raise
    finally:
        (output / "measurement.json").write_text(json.dumps(metadata, indent=2) + "\n")
    return metadata


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("pid", type=int)
    parser.add_argument("--kind", choices=("original", "project"), required=True)
    parser.add_argument("--layout")
    parser.add_argument("--seconds", type=int)
    parser.add_argument("--scene", choices=("credits", "endless"))
    parser.add_argument("--multiplier", choices=("11x", "25x"))
    parser.add_argument("--output", type=Path)
    parser.add_argument("--interactive", action="store_true")
    parser.add_argument("--until-exit", action="store_true",
                        help="observe until the game exits; Enter does not stop observation")
    parser.add_argument("--verify-original-endless", action="store_true",
                        help="check retail offsets against the known paused canonical save before observing")
    parser.add_argument("--preroll", type=int, default=3)
    args = parser.parse_args()
    if args.until_exit and args.seconds:
        parser.error("--until-exit cannot be combined with --seconds")
    game = Game(args.pid, args.kind, args.layout)
    try:
        if args.verify_original_endless:
            state = game.snapshot()
            expected = dict(paused=True, counter=229196, wave=0, waves=20, sun=9990)
            if args.kind != "original" or state["mGameScene"] != 3 or state["mGameMode"] != 13 or state.get("board") != expected:
                raise RuntimeError(f"Retail checkpoint/layout verification failed; expected {expected}, got {state}")
        result = (measure(game, args.seconds, args.scene, args.multiplier, args.output,
                          args.preroll, args.interactive, args.until_exit)
                  if args.seconds or args.interactive or args.until_exit else game.snapshot())
        print(json.dumps(result, indent=2))
    finally:
        game.close()


if __name__ == "__main__":
    main()
