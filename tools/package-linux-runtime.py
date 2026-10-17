#!/usr/bin/env python3
"""Offline, trusted-build-only glibc ELF closure packager. Run on Linux."""

from __future__ import annotations

import argparse
from collections import deque
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile


LIMITS = [
    "ELF DT_NEEDED closure only; not a complete portable Linux runtime.",
    "OpenAL/BASS audio backends loaded with dlopen, ALSA plugins/configuration, "
    "PulseAudio/PipeWire clients and servers, HRTF data are not automatically bundled.",
    "libdecor plugins (including GTK/Cairo dependencies), themes, fonts, fontconfig "
    "caches, XKB keymap data and Wayland/X11 services are not automatically bundled.",
    "GPU ICDs, DRI/VA/VDPAU drivers, Vulkan layers, vendor libraries and device "
    "access must come from the target host; compatibility with bundled glibc is untested.",
    "glibc NSS/gconv/locale modules, DNS configuration, certificates, timezone "
    "data and other non-ELF data are not automatically bundled.",
    "Kernel, CPU ISA, host-driver ABI and distribution compatibility need target testing.",
    "Current project builds use -march=native; this tool cannot reduce their CPU ISA "
    "requirements and does not promise compatibility with every x86-64 CPU.",
]
LICENSE_NOTICE = """Linux runtime component licenses and sources

runtime-manifest.json records file hashes, paths, package ownership and versions.
Available Debian/RPM package license files are copied into runtime-licenses/.
Preserve each component's original license and source attribution when sharing
this package. Missing package metadata/license text is recorded in the manifest.
For build-provided libraries such as BASS and DXC/DXIL, retain the original
vendor/distribution license files alongside the game resources.
"""


class PackageError(RuntimeError):
    pass


def require(condition: bool, message: str) -> None:
    if not condition:
        raise PackageError(message)


def run(args: list[str], *, check: bool = True) -> str:
    env = os.environ.copy()
    for key in tuple(env):
        if key.startswith("LD_") or key in ("GLIBC_TUNABLES", "LANGUAGE"):
            env.pop(key, None)
    env["LC_ALL"] = "C"
    result = subprocess.run(args, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE, env=env, timeout=90)
    if check and result.returncode:
        raise PackageError(f"{shlex.join(args)}: {result.stderr or result.stdout}")
    return result.stdout


def elf(path: Path) -> bool:
    with path.open("rb") as stream:
        return stream.read(4) == b"\x7fELF"


def digest(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def gpu_driver(path: Path) -> bool:
    name = path.name.lower()
    return (any(part.lower() in ("dri", "vulkan", "glvnd", "icd.d", "explicit_layer.d",
                                "implicit_layer.d") for part in path.parts)
            or bool(re.search(
                r"(_dri\.so|libvulkan_.+\.so|libegl_mesa|libglx_mesa|"
                r"lib.*nvidia|libcuda|libamdvlk|libvulkan_radeon|"
                r"libva-.+driver|.+_drv_video\.so|libvdpau_.+\.so)", name)))


def elf_info(path: Path) -> dict:
    header = run(["readelf", "-hW", str(path)])
    dynamic = run(["readelf", "-dW", str(path)])
    program = run(["readelf", "-lW", str(path)])
    machine = re.search(r"^\s*Machine:\s*(.+)$", header, re.M)
    elf_class = re.search(r"^\s*Class:\s*(.+)$", header, re.M)
    interpreter = re.search(r"Requesting program interpreter: ([^\]]+)", program)
    soname = re.search(r"\(SONAME\).*\[([^\]]+)\]", dynamic)
    return {
        "abi": [elf_class.group(1).strip(), machine.group(1).strip()],
        "needed": re.findall(r"\(NEEDED\).*\[([^\]]+)\]", dynamic),
        "soname": soname.group(1) if soname else None,
        "interpreter": interpreter.group(1) if interpreter else None,
        "rpaths": re.findall(r"\((?:RPATH|RUNPATH)\).*\[([^\]]*)\]", dynamic),
    }


def owners(path: Path) -> list[dict]:
    candidates = {str(path), str(path.resolve())}
    if str(path).startswith("/usr/"):
        candidates.add(str(path)[4:])
    found = {}
    if shutil.which("dpkg-query"):
        for candidate in sorted(candidates):
            for line in run(["dpkg-query", "-S", candidate], check=False).splitlines():
                if ": " not in line:
                    continue
                package, _ = line.rsplit(": ", 1)
                metadata = run(["dpkg-query", "-W",
                                "-f=${binary:Package}\\t${Version}\\t${source:Package}\\t"
                                "${source:Version}", package], check=False)
                fields = metadata.split("\t")
                if len(fields) == 4:
                    found[fields[0]] = dict(zip(
                        ("package", "version", "source_package", "source_version"), fields),
                        manager="dpkg")
    elif shutil.which("rpm"):
        metadata = run(["rpm", "-qf", "--qf",
                        "%{NAME}\\t%{VERSION}-%{RELEASE}\\t%{SOURCERPM}", str(path)],
                       check=False).split("\t")
        if len(metadata) == 3:
            found[metadata[0]] = dict(zip(
                ("package", "version", "source_package"), metadata), manager="rpm")
    return list(found.values())


def listed(loader: Path, target: Path, library_path: str, *, inhibit: bool = True) -> dict[str, Path]:
    text = run([str(loader)] + (["--inhibit-rpath", ""] if inhibit else []) + ["--library-path",
                library_path, "--list", str(target)])
    require("not found" not in text, f"Unresolved dependency in {target}:\n{text}")
    result = {}
    for line in text.splitlines():
        match = re.match(r"\s*(\S+)\s+=>\s+(.+?)\s+\(0x[0-9a-fA-F]+\)", line)
        if match:
            name = match.group(1)
            resolved = Path(match.group(2)).resolve(strict=True)
            if Path(name).name.startswith("ld-linux"):
                result[Path(name).name] = loader.resolve(strict=True)
            else:
                result[name] = resolved
        else:
            direct = re.match(r"\s*(/\S+)\s+\(0x[0-9a-fA-F]+\)", line)
            if direct:
                path = Path(direct.group(1)).resolve(strict=True)
                # A direct ld-linux line names the active loader, even when its
                # printed interpreter path is the original executable's PT_INTERP.
                if path.name.startswith("ld-linux"):
                    result[path.name] = loader.resolve(strict=True)
    return result


def collect(source: Path, executable: Path) -> tuple[Path, dict, dict, dict]:
    roots = []
    for path in sorted(source.rglob("*")):
        require(not gpu_driver(path), f"GPU driver/ICD path in input: {path}")
        if path.is_symlink():
            resolved = path.resolve(strict=True)
            require(resolved.is_relative_to(source), f"External resource symlink: {path}")
            require(not path.is_dir(), f"Directory symlinks are unsupported: {path}")
        require(path.is_dir() or path.is_file(), f"Special file in input: {path}")
        if path.is_file() and elf(path):
            roots.append(path)
    main = elf_info(executable)
    require(main["interpreter"] is not None, "Main executable must use a glibc interpreter")
    loader = Path(main["interpreter"]).resolve(strict=True)
    require(loader.name.startswith("ld-linux"), f"Unsupported interpreter: {loader}")
    require(not gpu_driver(loader), f"Unexpected GPU loader: {loader}")
    library_path = ":".join(map(str, sorted({p.parent for p in roots})))
    require(all(":" not in str(p.parent) for p in roots),
            "ELF directories containing ':' are unsupported")
    queue = deque(roots + [loader])
    infos, aliases, provenance = {}, {}, {}

    def bind(name: str, path: Path) -> None:
        require(Path(name).name == name and name not in ("", ".", ".."),
                f"Unsafe library name: {name}")
        if name in aliases:
            require(digest(aliases[name]) == digest(path),
                    f"Conflicting library basename/SONAME: {name}")
        else:
            aliases[name] = path

    while queue:
        path = queue.popleft().resolve(strict=True)
        if path in infos:
            continue
        require(not gpu_driver(path), f"Refusing host GPU driver: {path}")
        info = elf_info(path)
        require(info["abi"] == main["abi"], f"ELF ABI mismatch: {path}")
        require(all("/" not in name for name in info["needed"]),
                f"DT_NEEDED paths cannot be relocated safely: {path}")
        infos[path] = info
        provenance[path] = owners(path)
        if path != executable.resolve():
            bind(path.name, path)
            if info["soname"]:
                bind(info["soname"], path)
        mapping = listed(loader, path, library_path, inhibit=False)
        for name in info["needed"]:
            require(name in mapping, f"Loader did not resolve {name} for {path}")
            bind(name, mapping[name])
            queue.append(mapping[name])
    require("libc.so.6" in aliases, "No glibc libc.so.6 in closure")
    libc = aliases["libc.so.6"]
    loader_owners = {(p["manager"], p["package"], p["version"]) for p in provenance[loader]}
    libc_owners = {(p["manager"], p["package"], p["version"]) for p in provenance[libc]}
    require(bool(loader_owners & libc_owners),
            "Cannot prove loader/libc share the same installed package/version; "
            "use an intact dpkg/rpm glibc installation")
    return loader, infos, aliases, provenance


def copy_licenses(output: Path, provenance: dict) -> list[dict]:
    packages = { (p["manager"], p["package"]): p
                 for group in provenance.values() for p in group }
    reports = []
    for (manager, package), metadata in sorted(packages.items()):
        files = []
        if manager == "dpkg":
            directory = Path("/usr/share/doc") / package.split(":")[0]
            if directory.exists():
                files = [p for p in directory.iterdir()
                         if p.is_file() and re.search(r"copyright|licen[cs]e|copying", p.name, re.I)]
        else:
            files = [Path(p) for p in run(["rpm", "-q", "--licensefiles", package],
                                         check=False).splitlines() if Path(p).is_file()]
        copied = []
        for index, path in enumerate(sorted(files)):
            dest = output / "runtime-licenses" / package / f"{index}-{path.name}"
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, dest)
            copied.append({"path": str(dest.relative_to(output)), "source": str(path),
                           "sha256": digest(dest)})
        reports.append(dict(metadata, files=copied,
                            missing_license_text=not bool(copied)))
    return reports


def package(args: argparse.Namespace) -> dict:
    require(sys.platform == "linux", "Run this tool on Linux")
    require(sys.version_info >= (3, 11), "Python 3.11+ is required")
    for command in ("readelf",):
        require(shutil.which(command) is not None, f"Missing tool: {command}")
    source = args.release.resolve(strict=True)
    output = args.output.absolute()
    require(source.is_dir(), "Release must be a directory")
    require(not os.path.lexists(output), f"Output must be brand new: {output}")
    require(output.parent.is_dir(), f"Missing output parent: {output.parent}")
    output = output.parent.resolve() / output.name
    require(not output.is_relative_to(source) and not source.is_relative_to(output),
            "Release and output must be disjoint (no nested output)")
    require(not any(c in str(output) for c in (":", "\n", "\r")),
            "Output path may not contain ':', CR or LF")
    for name in ("env", "start", "runtime-manifest.json", "runtime-audit.json",
                 "runtime-licenses", "RUNTIME-LICENSE-OBLIGATIONS.txt"):
        require(not os.path.lexists(source / name), f"Reserved package path in Release: {name}")
    relative_exe = Path(args.executable)
    require(not relative_exe.is_absolute() and ".." not in relative_exe.parts,
            "--executable must be a Release-relative file")
    executable = source / relative_exe
    require(executable.is_file() and elf(executable), f"Missing ELF executable: {executable}")
    require((source / "libbass.so").is_file() and elf(source / "libbass.so"),
            "Release must already contain dynamic libbass.so")
    require((source / "main.pak64").is_file() and (source / "shaders").is_dir(),
            "Release must contain main.pak64 and shaders/ for loader-relative resource paths")
    source_hashes = {str(p.relative_to(source)): digest(p)
                     for p in source.rglob("*") if p.is_file()}
    loader, infos, aliases, provenance = collect(source, executable)
    dependency_hashes = {p: digest(p) for p in infos}
    # Stage beside the final destination; failures never leave a plausible final package.
    with tempfile.TemporaryDirectory(prefix=".linux-runtime-", dir=output.parent) as temporary:
        stage = Path(temporary) / "package"
        shutil.copytree(source, stage, symlinks=False)
        (stage / "env").mkdir()
        file_sources = {str(p.relative_to(stage)): str(source / p.relative_to(stage))
                        for p in stage.rglob("*") if p.is_file()}
        for name, path in sorted(aliases.items()):
            target = stage / "env" / name
            shutil.copy2(path, target)
            target.chmod(target.stat().st_mode | stat.S_IXUSR)
            file_sources[str(target.relative_to(stage))] = str(path)
        for relative, expected in source_hashes.items():
            require(digest(stage / relative) == expected,
                    f"Release changed while copying: {relative}; wait for builds to finish")
        if (stage / "start.cmd").is_file():
            (stage / "start.cmd").unlink()
        # Explicit loader execution makes /proc/self/exe point at env/ld-linux.
        # Common.cpp consumers therefore look for shaders beside that loader.
        (stage / "env" / "shaders").symlink_to("../shaders", target_is_directory=True)
        for name, original in aliases.items():
            require(digest(stage / "env" / name) == dependency_hashes[original],
                    f"Dependency changed while copying: {original}")
        loader_name = loader.name
        script = """#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$(readlink -f -- "$0")")" && pwd -P)
cd -- "$root"
unset LD_LIBRARY_PATH LD_PRELOAD LD_AUDIT LD_DEBUG LD_DEBUG_OUTPUT LD_PROFILE
unset LD_TRACE_LOADED_OBJECTS LD_ASSUME_KERNEL LD_HWCAP_MASK LD_ORIGIN_PATH GLIBC_TUNABLES
exec "$root/env/LOADER" --inhibit-cache --inhibit-rpath '' --library-path "$root/env" "$root"/EXECUTABLE "$@"
""".replace("LOADER", loader_name).replace("EXECUTABLE", shlex.quote(str(relative_exe)))
        (stage / "start").write_text(script, encoding="utf-8")
        (stage / "start").chmod(0o755)
        (stage / relative_exe).chmod((stage / relative_exe).stat().st_mode | 0o111)
        # The loader is only asked to list dependencies; no game entry point runs.
        verified = []
        for original in infos:
            target = (stage / original.relative_to(source) if original.is_relative_to(source)
                      else stage / "env" / original.name)
            mapping = listed(stage / "env" / loader_name, target, str(stage / "env"))
            for name in infos[original]["needed"]:
                require(name in mapping and mapping[name].is_relative_to(stage),
                        f"Closure verification escaped package: {target}: {name}")
            verified.append(str(target.relative_to(stage)))
        audit = {"scope": "ELF closure only", "complete_runtime": False,
                 "uncovered": LIMITS,
                 "dynamic_library_string_hints": {}}
        for path in infos:
            hints = sorted({v.decode("ascii") for v in re.findall(
                rb"lib[A-Za-z0-9_+.-]+\.so(?:\.[0-9]+)*", path.read_bytes())})
            audit["dynamic_library_string_hints"][str(path)] = hints
        audit["hint_warning"] = "String hints are not proof of loads or an exhaustive dlopen audit."
        license_report = copy_licenses(stage, provenance)
        (stage / "RUNTIME-LICENSE-OBLIGATIONS.txt").write_text(LICENSE_NOTICE, encoding="utf-8")
        (stage / "runtime-audit.json").write_text(json.dumps(audit, indent=2) + "\n",
                                                encoding="utf-8")
        records = []
        for path in sorted(stage.rglob("*")):
            if path.is_file():
                relative = str(path.relative_to(stage))
                original = file_sources.get(relative)
                records.append({"path": relative, "bytes": path.stat().st_size,
                                "mode": oct(stat.S_IMODE(path.stat().st_mode)),
                                "sha256": digest(path), "source": original or "generated",
                                "owners": provenance.get(Path(original).resolve(), [])
                                if original else []})
        manifest = {
            "schema": 1, "scope": "ELF DT_NEEDED closure, not a complete Linux runtime",
            "complete_runtime": False,
            "source_release": str(source), "executable": str(relative_exe),
            "loader": f"env/{loader_name}", "host": platform.platform(),
            "os_release": Path("/etc/os-release").read_text() if Path("/etc/os-release").exists() else "",
            "elf": {str(p): dict(info, owners=provenance[p]) for p, info in infos.items()},
            "libraries": {name: str(path) for name, path in sorted(aliases.items())},
            "verification": {"loader_list_only": verified, "game_executed": False},
            "symlinks": [{"path": "env/shaders", "target": "../shaders",
                          "reason": "/proc/self/exe resolves to the explicit loader"}],
            "licenses": license_report, "files": records,
            "manifest_hash_note": "This manifest excludes itself; all other files are hashed.",
            "omitted": ([{"path": "start.cmd", "reason": "WSL launcher is not native Linux",
                          "source": str(source / "start.cmd"),
                          "sha256": source_hashes["start.cmd"]}]
                        if "start.cmd" in source_hashes else []),
            "uncovered": LIMITS,
        }
        (stage / "runtime-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n",
                                                   encoding="utf-8")
        final_hashes = {str(p.relative_to(source)): digest(p)
                        for p in source.rglob("*") if p.is_file()}
        require(final_hashes == source_hashes,
                "Release changed during packaging; wait for builds to finish")
        require(all(digest(p) == expected for p, expected in dependency_hashes.items()),
                "System/build dependency changed during packaging; retry on a stable host")
        require(not os.path.lexists(output), f"Output appeared during staging: {output}")
        stage.rename(output)
    return {"output": str(output), "elf_objects": len(infos), "env_files": len(aliases),
            "files": len(records), "complete_runtime": False}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("release", type=Path, help="Existing trusted Linux Release directory")
    parser.add_argument("output", type=Path, help="Brand-new directory outside Release")
    parser.add_argument("--executable", default="pvz_perf")
    args = parser.parse_args()
    try:
        print(json.dumps(package(args), indent=2))
        print("WARNING: ELF closure only; read runtime-audit.json and license obligations.",
              file=sys.stderr)
        return 0
    except (PackageError, OSError, subprocess.SubprocessError) as error:
        print(f"package-linux-runtime: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
