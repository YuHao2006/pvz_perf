"""Link a dedicated benchmark against the existing Release game objects; do not alter the game EXE."""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import hashlib


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build", type=Path, required=True)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--ninja", type=Path, default=Path("C:/UserProgram/DevTools/ninja/ninja.exe"))
    parser.add_argument("--vs-root", type=Path, default=Path("C:/UserProgram/Visual Studuio/2026/Community"))
    parser.add_argument("--bass-dll", type=Path,
                        help="Explicit x64 BASS runtime when the paired Release has not staged it")
    args = parser.parse_args()
    project = Path(__file__).resolve().parents[2]
    build = args.build.resolve()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    bass = args.bass_dll.resolve() if args.bass_dll else build / "Release/bass.dll"
    if not bass.is_file():
        raise RuntimeError(f"Missing paired audio runtime: {bass}; stage it or pass --bass-dll before running")
    bass_bytes = bass.read_bytes()
    pe_offset = int.from_bytes(bass_bytes[0x3c:0x40], "little")
    if bass_bytes[pe_offset:pe_offset + 6] != b"PE\0\0\x64\x86":
        raise RuntimeError(f"Expected an x64 PE BASS runtime: {bass}")
    database = json.loads(subprocess.check_output([str(args.ninja), "-C", str(build), "-t", "compdb", "-x"]))
    mains = [entry["command"] for entry in database if re.search(r"/FoSexyAppFramework[\\/]CMakeFiles[\\/]LawnProject.dir[\\/]__[\\/]main.cpp.obj", entry["command"])]
    links = [entry["command"] for entry in database if "vs_link_exe" in entry["command"] and "pvz_perf.exe" in entry["command"]]
    if len(mains) != 1 or len(links) != 1:
        raise RuntimeError("Expected one existing game main compile and executable link command")
    source = args.source.resolve()
    obj = output / "benchmark.obj"
    executable = output / "benchmark.exe"
    compile_command = mains[0].replace(str(project / "pvzPerf/main.cpp"), str(source)).replace((project / "pvzPerf/main.cpp").as_posix(), str(source))
    compile_command = re.sub(r"/Fo\S+", lambda _: '/Fo"' + str(obj) + '"', compile_command)
    compile_command = re.sub(r"/Fd\S+", lambda _: '/Fd"' + str(output / "compile.pdb") + '"', compile_command)
    link = links[0].split(" -- ", 1)[1].split(" && ", 1)[0]
    link = link.replace("SexyAppFramework\\CMakeFiles\\LawnProject.dir\\__\\main.cpp.obj", '"' + str(obj) + '"')
    for key, filename in [("out", "benchmark.exe"), ("pdb", "benchmark.pdb"), ("implib", "benchmark.lib")]:
        link = re.sub(r"/" + key + r":\S+", lambda _: '/' + key + ':"' + str(output / filename) + '"', link, flags=re.I)
    link = re.sub(r"/subsystem:windows", "/subsystem:console", link, flags=re.I)
    match = re.match(r'"[^"]+link.exe"|\S*link.exe', link, re.I)
    if not match:
        raise RuntimeError("Cannot find linker executable")
    response = output / "link.rsp"
    response.write_text(link[match.end():], encoding="utf-8")
    vc = args.vs_root / "VC/Tools/MSVC/14.51.36231"
    commands = ["@echo off", 'call "' + str(args.vs_root / "Common7/Tools/VsDevCmd.bat") + '" -arch=x64 -no_logo',
                'set "PATH=' + str(vc / "bin/Hostx64/x64") + ';%PATH%"',
                'set "INCLUDE=' + str(vc / "include") + ';%INCLUDE%"',
                'set "LIB=' + str(vc / "lib/x64") + ';%LIB%"',
                compile_command, "if errorlevel 1 exit /b 1", match.group() + ' @"' + str(response) + '"', "exit /b %errorlevel%"]
    batch = output / "build.cmd"
    batch.write_text("\n".join(commands), encoding="utf-8")
    result = subprocess.run([os.environ["COMSPEC"], "/d", "/c", str(batch)], cwd=build, capture_output=True)
    (output / "build.txt").write_bytes(result.stdout + result.stderr)
    if result.returncode:
        print((result.stdout + result.stderr).decode("utf-8", errors="replace")[-5000:])
        raise RuntimeError("Production benchmark build failed")
    for dll in (build / "Release").glob("*.dll"):
        shutil.copy2(dll, output / dll.name)
    shutil.copy2(bass, output / "bass.dll")
    shaders = build / "Release/shaders"
    if shaders.is_dir():
        shutil.copytree(shaders, output / "shaders", dirs_exist_ok=True)
    metadata = {
        "source": str(source),
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "executable_sha256": hashlib.sha256(executable.read_bytes()).hexdigest(),
        "game_executable_sha256": hashlib.sha256((build / "Release/pvz_perf.exe").read_bytes()).hexdigest(),
        "compile_command": compile_command,
        "link_response_sha256": hashlib.sha256(response.read_bytes()).hexdigest(),
        "lto_compile": "/GL" in compile_command,
        "lto_link": "/LTCG" in link.upper(),
        "bass_sha256": hashlib.sha256(bass_bytes).hexdigest(),
    }
    (output / "build-manifest.json").write_text(json.dumps(metadata, ensure_ascii=False, indent=2), encoding="utf-8")
    print(executable, flush=True)


if __name__ == "__main__":
    main()
