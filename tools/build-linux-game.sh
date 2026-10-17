#!/bin/sh
set -eu

case "${1:-x11}" in
    x11|X11) window=X11; window_dir=x11 ;;
    wayland|WAYLAND) window=WAYLAND; window_dir=wayland ;;
    *) printf '%s\n' 'Usage: sh tools/build-linux-game.sh [x11|wayland]' >&2; exit 2 ;;
esac
case "$(uname -m)" in
    x86_64) cpu=x64; bass_arch=x86_64 ;;
    aarch64|arm64) cpu=arm64; bass_arch=aarch64 ;;
    *) printf '%s\n' 'Unsupported Linux CPU architecture' >&2; exit 2 ;;
esac

project_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
vcpkg_root=${VCPKG_ROOT:-"$HOME/vcpkg"}
build="$project_root/out/$cpu-$window_dir-vulkan"
dependency_root="$project_root/out/linux-window-deps"
bass_library=${PVZ_BASS_LIBRARY:-"$dependency_root/bass/libs/$bass_arch/libbass.so"}

cmake -S "$project_root" -B "$build" -G Ninja \
    -UPVZ_BASS_DLL \
    "-DCMAKE_TOOLCHAIN_FILE=$vcpkg_root/scripts/buildsystems/vcpkg.cmake" \
    "-DVCPKG_INSTALLED_DIR=$dependency_root/vcpkg_installed" \
    "-DVCPKG_OVERLAY_PORTS=$project_root/vcpkg-overlay-ports" \
    "-DVCPKG_TARGET_TRIPLET=$cpu-linux" \
    "-DVCPKG_MANIFEST_INSTALL=${VCPKG_MANIFEST_INSTALL:-ON}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    "-DPVZ_WINDOW_BACKEND=$window" \
    -DPVZ_RENDER_BACKEND=VULKAN \
    -DPVZ_BUILD_FRAMEWORK_VULKAN=ON \
    -DPVZ_BUILD_FRAMEWORK_D3D12=OFF \
    -DPVZ_BUILD_LEGACY_GAME=ON \
    -DBUILD_TESTING=ON \
    "-DPVZ_BASS_LIBRARY=$bass_library"
cmake --build "$build" --target LawnProject --parallel "${CMAKE_BUILD_PARALLEL_LEVEL:-8}"
printf 'Linux game: %s/Release/pvz_perf\n' "$build"
