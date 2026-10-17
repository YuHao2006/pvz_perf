#!/usr/bin/env python3
"""Package a native Linux build with explicit files, notices and host requirements."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import stat
import subprocess
import zipfile


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
    include(root / 'effects/README.md', 'effects/README.md')
    include(root / 'pvzPerf/SexyAppFramework/PopCap Framework License.txt',
            'licenses/PopCap-Framework.txt')
    for folder, suffixes in [('shaders', {'.spv'}), ('effects', {'.hlsl', '.hlsli', '.dds'})]:
        for p in sorted((release / folder).rglob('*')):
            if p.is_file() and p.suffix.lower() in suffixes:
                include(p, p.relative_to(release).as_posix())
    for name in ('Anime4K/Anime4K_Upscale_Denoise_UL.hlsl', 'SSimDownscaler.hlsl', 'StubDefs.hlsli'):
        if 'effects/' + name not in files:
            raise ValueError('Missing default effect: ' + name)
    if not any(name.startswith('shaders/') for name in files):
        raise ValueError('No compiled Vulkan shaders')
    for name in ('SOURCES.txt', 'Magpie-LICENSE.txt', 'Anime4K-LICENSE.txt', 'SSimDownscaler-LGPL-3.0.txt'):
        include(root / 'effects'/ name, 'licenses/' + name)
    include(args.bass / 'bass.txt', 'licenses/BASS.txt')
    for name in ('directx-dxc', 'highway', 'jpegli', 'lcms', 'libjpeg-turbo', 'libspng', 'nlohmann-json', 'zlib'):
        include(args.vcpkg / 'share' / name / 'copyright', 'licenses/' + name + '.txt')
    forbidden = [name for name in files if Path(name).suffix.lower() in
                 {'.dat', '.dat64', '.log', '.pdb', '.py', '.cpp'} or
                 Path(name).name.lower() in {'users.dat', 'settings.json'}]
    if forbidden:
        raise ValueError(f'Unexpected private, debug or test files: {forbidden}')
    requirements = {}
    for name, path in files.items():
        if path.read_bytes()[:4] != b'\x7fELF':
            continue
        versions = subprocess.check_output(['readelf', '--version-info', str(path)], text=True)
        dynamic = subprocess.check_output(['readelf', '-d', str(path)], text=True)
        data = {'needed': re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)}
        for namespace in ('GLIBC', 'GLIBCXX', 'CXXABI'):
            values = set(re.findall(r'\b' + namespace + r'_(\d+(?:\.\d+)+)', versions))
            data[namespace] = max(values, key=lambda v: tuple(map(int, v.split('.')))) if values else None
        requirements[name] = data
    metadata = dict(version=args.version, backend=args.backend,
                    source_commit=subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
                    runtime_libraries_bundled=['libbass.so', 'libdxcompiler.so', 'libdxil.so'],
                    system_crt_bundled=False, cpu_build_flag='-march=native',
                    build_cpu='Intel Core Ultra 9 185H', elf_requirements=requirements,
                    files={name: dict(bytes=p.stat().st_size, sha256=sha(p)) for name, p in sorted(files.items())})
    window_packages = 'libx11-6' if args.backend == 'x11' else 'libwayland-client0 libwayland-cursor0 libxkbcommon0 libdecor-0-0 libdecor-0-plugin-1-cairo'
    readme = f'''pvz_perf {args.version} - Linux x64 / {args.backend} / Vulkan

Extract the entire archive, then run ./start.sh from a terminal.
No profiles, saved games, personal settings, performance probes or logs are included.
The game creates its data under ~/.local/share/PlantsVsZombiesModern by default.
data/pvz_dat64_converter converts supported DAT/DAT64 saves.

This is the current Ubuntu 25.10 native build, not an Ubuntu 22.04 compatibility build.
Requires glibc >= 2.38, GLIBCXX >= 3.4.32, CXXABI >= 1.3.15, a compatible Linux kernel,
and a GPU/driver supporting the game's Vulkan bindless path.
Compiled with -march=native on Intel Core Ultra 9 185H; not guaranteed on every x86-64 CPU.
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
    launcher = '#!/bin/sh\nset -eu\ncd -- "$(dirname -- "$0")"\nexec ./pvz_perf "$@"\n'
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(args.output, 'x', compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        for name, path in sorted(files.items()):
            archive.write(path, name)
        archive.writestr('README.txt', readme)
        archive.writestr('release-manifest.json', json.dumps(metadata, indent=2) + '\n')
        info = zipfile.ZipInfo('start.sh')
        info.create_system = 3
        info.external_attr = (stat.S_IFREG | 0o755) << 16
        archive.writestr(info, launcher)
    with zipfile.ZipFile(args.output) as archive:
        if archive.testzip():
            raise ValueError('Archive CRC verification failed')
        if not archive.getinfo('start.sh').external_attr >> 16 & stat.S_IXUSR:
            raise ValueError('Launcher executable permission lost')
    print(json.dumps(dict(archive=str(args.output.resolve()), bytes=args.output.stat().st_size,
                          sha256=sha(args.output), files=len(files)+3), indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--release', required=True, type=Path)
    parser.add_argument('--backend', required=True, choices=['x11', 'wayland'])
    parser.add_argument('--vcpkg', required=True, type=Path, help='Target triplet installed prefix')
    parser.add_argument('--bass', required=True, type=Path, help='Extracted BASS distribution')
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--version', default='v1.0')
    package(parser.parse_args())
