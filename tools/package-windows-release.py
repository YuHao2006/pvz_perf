"""Package an existing Windows build without profiles, settings or debug output."""

import argparse
import hashlib
import json
from pathlib import Path
import zipfile


def package(args):
    root = Path(__file__).resolve().parents[1]
    release = args.release.resolve()
    files = {}

    def include(path, name):
        if not path.is_file():
            raise FileNotFoundError(path)
        files[name] = path

    for name in ("pvz_perf.exe", "main.pak64", "bass.dll", "dxcompiler.dll", "dxil.dll",
                 "start-lp14.cmd"):
        include(release / name, name)
    include(release / "data/pvz_dat64_converter.exe", "data/pvz_dat64_converter.exe")
    include(root / "scale.json", "scale.json")
    include(root / "LICENSE", "LICENSE")
    include(root / "effects/README.md", "effects/README.md")
    include(root / "pvzPerf/SexyAppFramework/PopCap Framework License.txt",
            "licenses/PopCap-Framework.txt")
    for folder, extensions in (("shaders", {".dxil"}), ("effects", {".hlsl", ".hlsli", ".dds"})):
        for path in sorted((release / folder).rglob("*")):
            if path.is_file() and path.suffix.lower() in extensions:
                include(path, path.relative_to(release).as_posix())
    if not any(n.startswith("shaders/") for n in files):
        raise ValueError("No compiled DXIL shaders found")
    for path in sorted(args.notices.iterdir()):
        if path.is_file():
            include(path, "licenses/" + path.name)
    forbidden = [name for name in files
                 if Path(name).suffix.lower() in {".dat", ".dat64", ".pdb", ".log"}
                 or Path(name).name.lower() in {"users.dat", "settings.json"}]
    if forbidden:
        raise ValueError(f"Personal or debug files in package: {forbidden}")
    records = {
        name: {"bytes": path.stat().st_size,
               "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
        for name, path in sorted(files.items())
    }
    readme = (
        f"pvz_perf {args.version} - Windows x64 / Win32 / DirectX 12\n\n"
        "Extract the entire archive into a writable directory, then run pvz_perf.exe.\n"
        "This package contains no player profiles, saves, or personal settings.\n"
        "The game creates its settings and profiles on first use.\n"
        "The DAT/DAT64 converter is in data/pvz_dat64_converter.exe.\n"
        "The game and converter use the installed Microsoft Visual C++ x64 runtime (/MD).\n"
        "External scaling effects are configured in scale.json; see effects/README.md.\n"
        "Requires Windows with DirectX 12 and a GPU supporting the game's bindless path.\n\n"
        "This product includes portions of the PopCap Games Framework, "
        "(c) 2005-2009 PopCap Games, Inc. All rights reserved. "
        "(http://popcapframework.sourceforge.net/).\n"
        "Third-party components and game resources retain their respective rights "
        "and licenses; see licenses/.\n"
    )
    manifest = {
        "version": args.version, "platform": "x64-win32-dx12",
        "source_commit": args.commit, "personal_saves": False,
        "msvc_runtime": "installed x64 runtime (/MD), not bundled", "files": records,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(args.output, "x", compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        prefix = f"pvz_perf-{args.version}-windows-x64-dx12/"
        for name, path in sorted(files.items()):
            archive.write(path, prefix + name)
        archive.writestr(prefix + "README.txt", readme)
        archive.writestr(prefix + "manifest.json", json.dumps(manifest, indent=2) + "\n")
    with zipfile.ZipFile(args.output) as archive:
        failed = archive.testzip()
        if failed:
            raise ValueError(f"Archive CRC failure: {failed}")
    print(json.dumps({"archive": str(args.output.resolve()),
                      "bytes": args.output.stat().st_size,
                      "sha256": hashlib.sha256(args.output.read_bytes()).hexdigest(),
                      "files": len(files), "personal_saves": False}, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--release", type=Path, required=True)
    parser.add_argument("--notices", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--version", default="v1.0")
    parser.add_argument("--commit", required=True)
    package(parser.parse_args())
