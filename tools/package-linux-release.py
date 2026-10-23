#!/usr/bin/env python3
"""Package a native Linux build with explicit files, notices and host requirements."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import stat
import subprocess
import zipfile


SAVE_ENTRIES = frozenset({
    "data/users.dat", "data/user1.dat64", "data/game1_58.dat64",
    "retail/users.dat", "retail/user1.dat", "retail/game1_13.dat",
})
EFFECT_NOTICES = ("SOURCES.txt", "Magpie-LICENSE.txt", "Anime4K-LICENSE.txt",
                  "SSimDownscaler-LGPL-3.0.txt")


def read_test_saves(path):
    """Read only the generator's exact entries, without extracting ZIP paths."""
    result = {}
    seen = set()
    with zipfile.ZipFile(path) as archive:
        for info in archive.infolist():
            name = info.filename
            if name in seen:
                raise ValueError(f"Duplicate test-save ZIP entry: {name}")
            seen.add(name)
            if stat.S_ISLNK(info.external_attr >> 16):
                raise ValueError(f"Symlink in test-save ZIP: {name}")
            if name in {"data/", "retail/"} and info.is_dir():
                continue
            if name not in SAVE_ENTRIES | {"README.txt"} or info.is_dir():
                raise ValueError(f"Unexpected test-save ZIP entry: {name}")
            result["TEST-SAVES.txt" if name == "README.txt" else name] = archive.read(info)
    missing = SAVE_ENTRIES - result.keys()
    if missing:
        raise ValueError(f"Missing generated test saves: {sorted(missing)}")
    if any(not result[name] for name in SAVE_ENTRIES):
        raise ValueError("Generated test saves must not be empty")
    return result


def effect_files(directory):
    if not directory.is_dir():
        raise FileNotFoundError(directory)
    for path in sorted(directory.rglob("*")):
        relative = path.relative_to(directory)
        if any(part.startswith(".") or part.lower() in {
                "build", "debug", "cache", "__pycache__", "intermediate", "intermediates"
        } for part in relative.parts):
            continue
        name = path.name.lower()
        document = (path.name in EFFECT_NOTICES
                    or name.startswith(("readme", "sources", "license", "copying", "notice"))
                    or "license" in name)
        if path.is_file() and (path.suffix.lower() in {".hlsl", ".hlsli", ".dds"}
                               or (document and path.suffix.lower() in {"", ".md", ".txt", ".rst"})):
            yield "effects/" + relative.as_posix(), path


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def package(args):
    root = Path(__file__).resolve().parents[1]
    release = args.release.resolve()
    files = {}

    def include(path, name):
        if not path.is_file():
            raise FileNotFoundError(path)
        files[name] = path

    for name in ('pvz_perf', 'main.pak64', 'libbass.so', 'libdxcompiler.so', 'libdxil.so',
                 'pvz_perf.png', 'pvz_perf.desktop'):
        include(release / name, name)
    include(release / 'data/pvz_dat64_converter', 'data/pvz_dat64_converter')
    include(root / 'scale.json', 'scale.json')
    include(root / 'LICENSE', 'LICENSE')
    include(root / 'pvzPerf/SexyAppFramework/PopCap Framework License.txt',
            'licenses/PopCap-Framework.txt')
    for folder, suffixes in [('shaders', {'.spv'})]:
        for p in sorted((release / folder).rglob('*')):
            if p.is_file() and p.suffix.lower() in suffixes:
                include(p, p.relative_to(release).as_posix())
    for name, path in effect_files(args.effects_directory):
        include(path, name)
    for name in ('README.md', *EFFECT_NOTICES, 'Anime4K/Anime4K_Upscale_Denoise_UL.hlsl',
                 'SSimDownscaler.hlsl', 'StubDefs.hlsli'):
        if 'effects/' + name not in files:
            raise ValueError('Missing default effect: ' + name)
    if not any(name.startswith('shaders/') for name in files):
        raise ValueError('No compiled Vulkan shaders')
    for name in EFFECT_NOTICES:
        include(args.effects_directory / name, 'licenses/' + name)
    include(args.bass / 'bass.txt', 'licenses/BASS.txt')
    for name in ('directx-dxc', 'highway', 'jpegli', 'lcms', 'libjpeg-turbo', 'libspng', 'nlohmann-json', 'zlib'):
        include(args.vcpkg / 'share' / name / 'copyright', 'licenses/' + name + '.txt')
    forbidden = [name for name in files if Path(name).suffix.lower() in
                 {'.dat', '.dat64', '.log', '.pdb', '.py', '.cpp'} or
                 Path(name).name.lower() in {'users.dat', 'settings.json'}]
    if forbidden:
        raise ValueError(f'Unexpected private, debug or test files: {forbidden}')
    saves = read_test_saves(args.test_saves)
    requirements = {}
    for name, path in files.items():
        with path.open('rb') as stream:
            magic = stream.read(4)
        if magic != b'\x7fELF':
            continue
        environment = dict(os.environ, LC_ALL='C')
        versions = subprocess.check_output(
            ['readelf', '-W', '--version-info', str(path)], text=True, env=environment)
        dynamic = subprocess.check_output(
            ['readelf', '-W', '-d', str(path)], text=True, env=environment)
        # Definitions exported by bundled libraries are not host requirements.
        needs = re.search(r"Version needs section[^\n]*\n(.*?)(?=\nVersion .* section|\Z)",
                          versions, re.DOTALL)
        versions = needs.group(1) if needs else ''
        data = {'needed': re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)}
        for namespace in ('GLIBC', 'GLIBCXX', 'CXXABI'):
            values = set(re.findall(r'\b' + namespace + r'_(\d+(?:\.\d+)+)', versions))
            data[namespace] = max(values, key=lambda v: tuple(map(int, v.split('.')))) if values else None
        requirements[name] = data
    metadata = dict(version=args.version, backend=args.backend,
                    source_commit=args.source_commit or subprocess.check_output(
                        ['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
                    runtime_libraries_bundled=['libbass.so', 'libdxcompiler.so', 'libdxil.so'],
                    system_crt_bundled=False, cpu_baseline=args.cpu_baseline,
                    cpu_baseline_source='packager argument; build flags are not verified',
                    elf_requirements=requirements,
                    test_saves_sha256=sha(args.test_saves),
                    generated_test_saves=sorted(SAVE_ENTRIES),
                    files={name: dict(bytes=p.stat().st_size, sha256=sha(p)) for name, p in sorted(files.items())})
    metadata['files'].update({
        name: dict(bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
        for name, data in sorted(saves.items())
    })
    minimums = {}
    for namespace in ('GLIBC', 'GLIBCXX', 'CXXABI'):
        values = [entry[namespace] for entry in requirements.values() if entry[namespace]]
        minimums[namespace] = max(values, key=lambda v: tuple(map(int, v.split('.')))) if values else None
    metadata['minimum_symbol_versions'] = minimums
    requirement_text = ', '.join(f'{name} >= {value}' for name, value in minimums.items() if value)
    if not requirement_text:
        requirement_text = 'No GLIBC/GLIBCXX/CXXABI version requirements detected; see manifest'
    window_packages = 'libx11-6' if args.backend == 'x11' else 'libwayland-client0 libwayland-cursor0 libxkbcommon0 libdecor-0-0 libdecor-0-plugin-1-cairo'
    readme = f'''pvz_perf {args.version} - Linux x64 / {args.backend} / Vulkan

Extract the entire archive, then run ./start.sh from a terminal.
data/ contains the generated PerfTest completed profile and canonical endless baseline.
retail/ contains equivalent original-format saves; see TEST-SAVES.txt when present.
No personal settings, progressed personal saves, performance probes or logs are included.
start.sh uses the writable package data/ directory unless PVZ_APPDATA_DIR is already set.
Running ./pvz_perf directly uses its native HOME data default.
The launcher does not copy saves into HOME or overwrite an existing HOME profile.
Re-extract the supplied baseline before each benchmark comparison.
data/pvz_dat64_converter converts supported DAT/DAT64 saves.
Supported level formats: original 1073 DAT, DAT64 v1, v2 and v3.2 only.
Unpublished DAT64 v3.0/v3.1 inputs and targets are unsupported.

ELF symbol requirements from the packaged binaries: {requirement_text}.
Requires a compatible Linux kernel and a GPU/driver supporting the game's Vulkan bindless path.
CPU baseline declared by the packager: {args.cpu_baseline} (build flags are not verified).
GLIBC/C++ runtimes, display/audio services and Vulkan drivers come from the host.
Do not replace your system libc to run this package.

Example Ubuntu package names (availability/version depends on your distribution):
libstdc++6 libgcc-s1 libopenal1 libvulkan1 {window_packages} zenity
Install a working Vulkan ICD for your GPU. Audio uses OpenAL Soft and a host audio backend.
Wayland additionally needs its compositor, libdecor plugin and XKB data.
Error dialogs use host zenity or kdialog; stderr and logs remain available without them.

scale.json uses the included Anime4K and SSimDownscaler effects.
Third-party sources/terms and the PopCap Framework notice are in licenses/.
release-manifest.json records source revision, hashes and ELF dependencies.
'''
    launcher = ('#!/bin/sh\nset -eu\ncd -- "$(dirname -- "$0")"\n'
                'export PVZ_APPDATA_DIR="${PVZ_APPDATA_DIR:-$(pwd)/data}"\n'
                'exec ./pvz_perf "$@"\n')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(args.output, 'x', compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        for name, path in sorted(files.items()):
            if name in {'pvz_perf', 'data/pvz_dat64_converter', 'pvz_perf.desktop'}:
                info = zipfile.ZipInfo.from_file(path, name)
                info.create_system = 3
                info.external_attr = (stat.S_IFREG | 0o755) << 16
                info.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(info, path.read_bytes())
            else:
                archive.write(path, name)
        for name, data in sorted(saves.items()):
            archive.writestr(name, data)
        archive.writestr('README.txt', readme)
        archive.writestr('release-manifest.json', json.dumps(metadata, indent=2) + '\n')
        info = zipfile.ZipInfo('start.sh')
        info.create_system = 3
        info.external_attr = (stat.S_IFREG | 0o755) << 16
        archive.writestr(info, launcher)
    with zipfile.ZipFile(args.output) as archive:
        if archive.testzip():
            raise ValueError('Archive CRC verification failed')
        for name in ('start.sh', 'pvz_perf.desktop', 'pvz_perf', 'data/pvz_dat64_converter'):
            if not archive.getinfo(name).external_attr >> 16 & stat.S_IXUSR:
                raise ValueError(f'Executable permission lost: {name}')
    print(json.dumps(dict(archive=str(args.output.resolve()), bytes=args.output.stat().st_size,
                          sha256=sha(args.output), files=len(files)+len(saves)+3), indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--release', required=True, type=Path)
    parser.add_argument('--backend', required=True, choices=['x11', 'wayland'])
    parser.add_argument('--vcpkg', required=True, type=Path, help='Target triplet installed prefix')
    parser.add_argument('--bass', required=True, type=Path, help='Extracted BASS distribution')
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--version', default='v1.1')
    parser.add_argument('--test-saves', required=True, type=Path,
                        help='Generated package-test-saves.py ZIP; both data/ and retail/ are required')
    parser.add_argument('--effects-directory', required=True, type=Path,
                        help='Staged Magpie effects, README, SOURCES and licenses')
    parser.add_argument('--source-commit', help='Source revision; defaults to git HEAD at packaging time')
    parser.add_argument('--cpu-baseline', default='unspecified',
                        help="Build's CPU baseline, recorded without inferring build flags")
    package(parser.parse_args())
