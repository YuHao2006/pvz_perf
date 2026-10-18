#!/bin/sh
set -eu

if [ "$(uname -s)" != Darwin ] || [ "$(uname -m)" != arm64 ]; then
    printf '%s\n' 'This experimental build requires native macOS arm64.' >&2
    exit 2
fi

project_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
vcpkg_root=${VCPKG_ROOT:-"$HOME/vcpkg"}
build=${PVZ_MACOS_BUILD_DIR:-"$project_root/out/arm64-cocoa-metal"}
bass_library=${PVZ_BASS_LIBRARY:-}
if [ ! -f "$bass_library" ]; then
    printf '%s\n' 'Set PVZ_BASS_LIBRARY to the official macOS libbass.dylib.' >&2
    exit 2
fi
lipo "$bass_library" -verify_arch arm64

cmake -S "$project_root" -B "$build" -G Ninja \
    "-DCMAKE_TOOLCHAIN_FILE=$vcpkg_root/scripts/buildsystems/vcpkg.cmake" \
    "-DVCPKG_INSTALLED_DIR=$project_root/out/macos-deps/vcpkg_installed" \
    "-DVCPKG_OVERLAY_PORTS=$project_root/vcpkg-overlay-ports" \
    -DVCPKG_TARGET_TRIPLET=arm64-osx \
    -DVCPKG_HOST_TRIPLET=arm64-osx \
    "-DVCPKG_MANIFEST_INSTALL=${VCPKG_MANIFEST_INSTALL:-ON}" \
    -DCMAKE_OSX_ARCHITECTURES=arm64 \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=14.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DPVZ_WINDOW_BACKEND=COCOA \
    -DPVZ_RENDER_BACKEND=METAL \
    -DPVZ_BUILD_FRAMEWORK_VULKAN=OFF \
    -DPVZ_BUILD_FRAMEWORK_D3D12=OFF \
    -DPVZ_BUILD_NATIVE_WINDOW_ADAPTER=OFF \
    -DPVZ_BUILD_LEGACY_GAME=ON \
    -DPVZ_BUILD_DAT64_CONVERTER=ON \
    -DPVZ_ENABLE_GAME_PROBES=OFF \
    -DBUILD_TESTING=OFF \
    "-DPVZ_BASS_LIBRARY=$bass_library"
cmake --build "$build" --config Release \
    --target reanimc pvz_dat64_converter LawnProject \
    --parallel "${CMAKE_BUILD_PARALLEL_LEVEL:-3}"
printf 'Experimental macOS game: %s/Release/pvz_perf\n' "$build"
