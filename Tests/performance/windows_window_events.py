"""Record native activation/capture events without injecting hooks into the game."""

import ctypes
from ctypes import wintypes
import json
from pathlib import Path
import threading
import time


class WindowEvents:
    NAMES = {
        0x0003: "foreground",
        0x0008: "capture-start",
        0x0009: "capture-end",
        0x000A: "move-size-start",
        0x000B: "move-size-end",
        0x0016: "minimize-start",
        0x0017: "minimize-end",
        0x8002: "show",
        0x8003: "hide",
        0x8005: "focus",
    }

    def __init__(self, pid, output):
        self.pid = pid
        self.output = Path(output)
        self.ready = threading.Event()
        self.error = None
        self.thread_id = None
        self.thread = threading.Thread(target=self._run, name="window-events", daemon=True)
        self.user = ctypes.WinDLL("user32", use_last_error=True)
        self.kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        self.kernel.GetCurrentThreadId.restype = wintypes.DWORD
        self.user.PostThreadMessageW.argtypes = (
            wintypes.DWORD, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM)
        self.user.PostThreadMessageW.restype = wintypes.BOOL

    def start(self):
        self.thread.start()
        self.ready.wait()
        self._check_error()

    def stop(self):
        if self.thread.is_alive():
            if not self.user.PostThreadMessageW(self.thread_id, 0x0012, 0, 0):
                raise ctypes.WinError(ctypes.get_last_error())
            self.thread.join()
        self._check_error()

    def _check_error(self):
        if self.error is not None:
            raise RuntimeError("Native window event observation failed") from self.error

    def _run(self):
        callback_type = ctypes.WINFUNCTYPE(
            None, wintypes.HANDLE, wintypes.DWORD, wintypes.HWND,
            wintypes.LONG, wintypes.LONG, wintypes.DWORD, wintypes.DWORD)
        self.user.GetWindowThreadProcessId.argtypes = (
            wintypes.HWND, ctypes.POINTER(wintypes.DWORD))
        self.user.GetWindowThreadProcessId.restype = wintypes.DWORD
        self.user.GetForegroundWindow.restype = wintypes.HWND
        self.user.GetClassNameW.argtypes = (wintypes.HWND, wintypes.LPWSTR, ctypes.c_int)
        self.user.GetClassNameW.restype = ctypes.c_int
        self.user.SetWinEventHook.argtypes = (
            wintypes.DWORD, wintypes.DWORD, wintypes.HMODULE,
            callback_type, wintypes.DWORD, wintypes.DWORD, wintypes.DWORD)
        self.user.SetWinEventHook.restype = wintypes.HANDLE
        self.user.UnhookWinEvent.argtypes = (wintypes.HANDLE,)
        self.user.UnhookWinEvent.restype = wintypes.BOOL
        self.user.PeekMessageW.argtypes = (
            ctypes.POINTER(wintypes.MSG), wintypes.HWND,
            wintypes.UINT, wintypes.UINT, wintypes.UINT)
        self.user.GetMessageW.argtypes = (
            ctypes.POINTER(wintypes.MSG), wintypes.HWND, wintypes.UINT, wintypes.UINT)
        self.user.GetMessageW.restype = wintypes.BOOL
        self.kernel.OpenProcess.argtypes = (wintypes.DWORD, wintypes.BOOL, wintypes.DWORD)
        self.kernel.OpenProcess.restype = wintypes.HANDLE
        self.kernel.QueryFullProcessImageNameW.argtypes = (
            wintypes.HANDLE, wintypes.DWORD, wintypes.LPWSTR,
            ctypes.POINTER(wintypes.DWORD))
        self.kernel.QueryFullProcessImageNameW.restype = wintypes.BOOL
        self.kernel.CloseHandle.argtypes = (wintypes.HANDLE,)
        hooks = []
        process_paths = {}
        started = time.perf_counter()

        def window_info(window):
            pid = wintypes.DWORD()
            thread_id = self.user.GetWindowThreadProcessId(window, ctypes.byref(pid))
            name = ctypes.create_unicode_buffer(256)
            self.user.GetClassNameW(window, name, len(name))
            if pid.value and pid.value not in process_paths:
                process = self.kernel.OpenProcess(0x1000, False, pid.value)
                if process:
                    try:
                        path = ctypes.create_unicode_buffer(32768)
                        size = wintypes.DWORD(len(path))
                        if self.kernel.QueryFullProcessImageNameW(
                                process, 0, path, ctypes.byref(size)):
                            process_paths[pid.value] = path.value
                    finally:
                        self.kernel.CloseHandle(process)
            return {"hwnd": window or 0, "pid": pid.value, "thread": thread_id,
                    "class": name.value, "process": process_paths.get(pid.value)}

        try:
            self.thread_id = self.kernel.GetCurrentThreadId()
            message = wintypes.MSG()
            self.user.PeekMessageW(ctypes.byref(message), None, 0, 0, 0)
            with self.output.open("w", encoding="utf-8") as stream:
                def record(event, window, object_id=0, child_id=0, native_ms=None):
                    info = window_info(window)
                    if event not in ("initial", "final", "foreground") and info["pid"] != self.pid:
                        return
                    stream.write(json.dumps({
                        "elapsed_s": time.perf_counter() - started,
                        "event": event, "window": info,
                        "foreground": window_info(self.user.GetForegroundWindow()),
                        "object": object_id, "child": child_id,
                        "native_event_ms": native_ms,
                    }) + "\n")
                    stream.flush()

                @callback_type
                def callback(hook, event, window, object_id, child_id, thread_id, native_ms):
                    try:
                        record(self.NAMES[event], window, object_id, child_id, native_ms)
                    except BaseException as error:
                        self.error = error
                        self.user.PostThreadMessageW(self.thread_id, 0x0012, 0, 0)

                for event in self.NAMES:
                    # OUTOFCONTEXT callbacks run on this observer thread, never in the game.
                    hook = self.user.SetWinEventHook(event, event, None, callback, 0, 0, 2)
                    if not hook:
                        raise ctypes.WinError(ctypes.get_last_error())
                    hooks.append(hook)
                record("initial", self.user.GetForegroundWindow())
                self.ready.set()
                while True:
                    result = self.user.GetMessageW(ctypes.byref(message), None, 0, 0)
                    if result == -1:
                        raise ctypes.WinError(ctypes.get_last_error())
                    if result == 0:
                        break
                record("final", self.user.GetForegroundWindow())
        except BaseException as error:
            self.error = error
        finally:
            for hook in hooks:
                self.user.UnhookWinEvent(hook)
            self.ready.set()
