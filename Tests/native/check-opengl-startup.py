"""Exercise the real executable's loading completion without input injection."""
import argparse
import ctypes
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "performance"))
from windows_game_probe import Game, user

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("executable", type=Path)
parser.add_argument("layout_tool", type=Path)
parser.add_argument("output", type=Path)
parser.add_argument("--backend", choices=("opengl", "vulkan", "d3d9", "d3d12"), default="opengl")
parser.add_argument("--timeout", type=int, default=120)
parser.add_argument("--scale-config", type=Path)
args = parser.parse_args()
executable = args.executable.resolve()
output = args.output.resolve()
output.mkdir(parents=True, exist_ok=True)
(output / "data").mkdir(exist_ok=True)
(output / "logs").mkdir(exist_ok=True)
layout = json.loads(subprocess.check_output([str(args.layout_tool.resolve())], text=True))
layout["executable_sha256"] = hashlib.sha256(executable.read_bytes()).hexdigest()
layout_path = output / "layout.json"
layout_path.write_text(json.dumps(layout))
# Graphics startup validation only. These settings do not affect render microbenchmarks.
settings = {"musicVolume": 0, "sfxVolume": 0, "muted": 1, "screenMode": "windowed",
            "preferredX": -1, "preferredY": -1, "customCursors": 0,
            "waitForVSync": 0, "customScale": 0}
settings_path = output / "settings.json"
settings_path.write_text(json.dumps(settings))
environment = os.environ.copy()
environment.update(PVZ_APPDATA_DIR=str(output / "data"),
                   PVZ_LOG_DIR=str(output / "logs"), PVZ_SETTINGS_FILE=str(settings_path),
                   PVZ_SCALE_CONFIG_FILE=str(args.scale_config.resolve() if args.scale_config
                                             else executable.parent / "scale.json"))
for name in ("PVZ_GL_ATLAS_SIZE", "PVZ_D3D9_ATLAS_SIZE",
             "PVZ_VULKAN_VALIDATION", "PVZ_OPENGL_VALIDATION"):
    environment.pop(name, None)
if args.backend == "opengl":
    environment["PVZ_OPENGL_VALIDATION"] = "1"
elif args.backend == "vulkan":
    environment["PVZ_VULKAN_VALIDATION"] = "1"
startup = subprocess.STARTUPINFO()
startup.dwFlags |= subprocess.STARTF_USESHOWWINDOW
startup.wShowWindow = 0
process = subprocess.Popen([str(executable)], cwd=executable.parent, env=environment,
                           startupinfo=startup)
game = None
result = {"pid": process.pid, "status": "failed"}
try:
    deadline = time.monotonic() + args.timeout
    first_loaded = None
    while time.monotonic() < deadline:
        if process.poll() is not None:
            raise RuntimeError(f"Game exited during startup: {process.returncode}")
        try:
            if game is None:
                game = Game(process.pid, "project", layout_path)
            snapshot = game.snapshot()
            loaded = game.read(snapshot["app"] + layout["mLoaded"], "<?")
            cache_ready = game.read(snapshot["app"] + layout["mCacheFramesPrebuilt"], "<?")
        except (OSError, RuntimeError):
            time.sleep(0.2)
            continue
        if loaded and cache_ready:
            if first_loaded is None:
                first_loaded = snapshot["mUpdateCount"]
            if snapshot["mUpdateCount"] - first_loaded >= 50 and snapshot["mDrawCount"] > 0:
                result.update(status="loaded-and-updating", snapshot=snapshot)
                break
        time.sleep(0.2)
    if result["status"] != "loaded-and-updating":
        raise RuntimeError(f"Loading did not complete and resume updates within {args.timeout} seconds")
    owner = user.GetWindowThreadProcessId(snapshot["mHWnd"], None)
    user.PostThreadMessageW.argtypes = (ctypes.c_ulong, ctypes.c_uint,
                                       ctypes.c_size_t, ctypes.c_ssize_t)
    if not user.PostThreadMessageW(owner, 0x0012, 0, 0):
        raise ctypes.WinError(ctypes.get_last_error())
    result["exit_code"] = process.wait(timeout=15)
    if result["exit_code"] != 0:
        raise RuntimeError(f"Game shutdown failed: {result['exit_code']}")
finally:
    if game is not None:
        game.close()
    if process.poll() is None:
        process.kill()
        process.wait(timeout=10)
    (output / "result.json").write_text(json.dumps(result, indent=2))
print(json.dumps(result, indent=2))
