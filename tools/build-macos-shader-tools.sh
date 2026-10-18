#!/bin/sh
# Standalone prerequisite build; no vcpkg/game flags or LLVM subdirectory state.
# --fetch-only is portable and verifies the exact source/submodule inputs.
# Default: sh tools/build-macos-shader-tools.sh
set -eu

DXC_REV=194bb75bea2becb42810d72a16195089c1908e10
SPIRV_CROSS_REV=300681bbcb8365a8d1eacdacdbdd0249bbf1d6b1
# DXC includes Apple's libc++ StringRef fix #8307 (bacbfaa6600f602df5cc33632c2b08d1404c0319).
project_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)
work_dir="$project_root/out/macos-shader-tools"
prefix=
jobs=${CMAKE_BUILD_PARALLEL_LEVEL:-3}
deployment_target=14.0
sdk=macosx
fetch_only=0
build_cross=1
while [ "$#" -gt 0 ]; do
    case "$1" in
        --fetch-only) fetch_only=1; shift ;;
        --dxc-only) build_cross=0; shift ;;
        --work-dir|--prefix|--jobs|--deployment-target|--sdk)
            if [ "$#" -lt 2 ]; then
                printf 'Missing value for %s\n' "$1" >&2; exit 2
            fi
            case "$1" in
                --work-dir) work_dir=$2 ;;
                --prefix) prefix=$2 ;;
                --jobs) jobs=$2 ;;
                --deployment-target) deployment_target=$2 ;;
                --sdk) sdk=$2 ;;
            esac
            shift 2 ;;
        *) printf 'Unknown argument: %s\n' "$1" >&2; exit 2 ;;
    esac
done
case "$jobs" in
    ''|*[!0-9]*|0) printf '%s\n' '--jobs must be a positive integer' >&2; exit 2 ;;
esac
if [ "$fetch_only" -eq 0 ]; then
    if [ "$(uname -s)" != Darwin ] || [ "$(uname -m)" != arm64 ]; then
        printf '%s\n' 'Building shader tools requires native macOS arm64.' >&2
        exit 2
    fi
fi
mkdir -p "$work_dir"
work_dir=$(CDPATH= cd -- "$work_dir" && pwd -P)
prefix=${prefix:-"$work_dir/install"}
mkdir -p "$prefix"
prefix=$(CDPATH= cd -- "$prefix" && pwd -P)
git=${PVZ_SHADER_GIT:-git}
cmake=${PVZ_SHADER_CMAKE:-cmake}
ninja=${PVZ_SHADER_NINJA:-ninja}
python=${PVZ_SHADER_PYTHON:-python3}

fetch_source() {
    source_dir=$1
    source_url=$2
    source_rev=$3
    if [ ! -d "$source_dir/.git" ]; then
        mkdir -p "$source_dir"
        "$git" -C "$source_dir" init -q
        "$git" -C "$source_dir" remote add origin "$source_url"
    fi
    if [ "$("$git" -C "$source_dir" remote get-url origin)" != "$source_url" ]; then
        printf 'Unexpected source remote: %s\n' "$source_dir" >&2; exit 1
    fi
    # Never discard edits in the dedicated dependency checkout.
    if [ -n "$("$git" -C "$source_dir" status --porcelain --untracked-files=no)" ]; then
        printf 'Dependency checkout has local modifications: %s\n' "$source_dir" >&2
        exit 1
    fi
    if [ "$("$git" -C "$source_dir" rev-parse --verify HEAD 2>/dev/null || :)" != "$source_rev" ]; then
        "$git" -C "$source_dir" fetch --depth 1 origin "$source_rev"
        "$git" -C "$source_dir" checkout --detach "$source_rev"
    fi
    test "$("$git" -C "$source_dir" rev-parse HEAD)" = "$source_rev"
}

dxc_source="$work_dir/src/dxc"
cross_source="$work_dir/src/spirv-cross"
fetch_source "$dxc_source" https://github.com/microsoft/DirectXShaderCompiler.git "$DXC_REV"
"$git" -C "$dxc_source" submodule sync --recursive
"$git" -C "$dxc_source" submodule update --init --recursive --depth 1
submodule_status=$("$git" -C "$dxc_source" submodule status --recursive)
if printf '%s\n' "$submodule_status" | grep -E '^[-+U]' >/dev/null; then
    printf '%s\n' 'DXC submodules are missing or do not match their gitlinks.' >&2
    exit 1
fi
for required in external/DirectX-Headers/include/directx/d3d12shader.h \
    external/SPIRV-Headers/include/spirv/unified1/spirv.hpp \
    external/SPIRV-Tools/CMakeLists.txt include/dxc/dxcapi.h include/dxc/WinAdapter.h; do
    if [ ! -f "$dxc_source/$required" ]; then
        printf 'Incomplete DXC sources: %s\n' "$required" >&2; exit 1
    fi
done
if [ "$build_cross" -eq 1 ]; then
    fetch_source "$cross_source" https://github.com/KhronosGroup/SPIRV-Cross.git "$SPIRV_CROSS_REV"
    test -f "$cross_source/spirv_msl.hpp"
fi
printf 'DXC %s\n%s\n' "$DXC_REV" "$submodule_status"
if [ "$build_cross" -eq 1 ]; then printf 'SPIRV-Cross %s\n' "$SPIRV_CROSS_REV"; fi
if [ "$fetch_only" -eq 1 ]; then exit 0; fi

# CMake gets a fresh cache/toolchain, with no game LTO or environment flags.
unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS SDKROOT MACOSX_DEPLOYMENT_TARGET
unset CMAKE_TOOLCHAIN_FILE CMAKE_PREFIX_PATH
sdk_path=$(xcrun --sdk "$sdk" --show-sdk-path)
cc=$(xcrun --sdk "$sdk" --find clang)
cxx=$(xcrun --sdk "$sdk" --find clang++)
dxc_build="$work_dir/build/dxc"
"$cmake" -S "$dxc_source" -B "$dxc_build" -G Ninja \
    -C "$dxc_source/cmake/caches/PredefinedParams.cmake" \
    "-DCMAKE_MAKE_PROGRAM=$ninja" \
    "-DPython3_EXECUTABLE=$python" \
    "-DCMAKE_C_COMPILER=$cc" "-DCMAKE_CXX_COMPILER=$cxx" \
    "-DCMAKE_OSX_SYSROOT=$sdk_path" \
    "-DCMAKE_OSX_DEPLOYMENT_TARGET=$deployment_target" \
    -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE=OFF \
    -DLLVM_ENABLE_LTO=OFF -DLLVM_ENABLE_LIBCXX=ON \
    -DBUILD_SHARED_LIBS=OFF -DLLVM_BUILD_LLVM_DYLIB=OFF \
    -DLLVM_ENABLE_BINDINGS=OFF -DHLSL_BUILD_DXILCONV=OFF \
    -DLLVM_TARGETS_TO_BUILD=None -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_ENABLE_ZLIB=OFF -DLLVM_ENABLE_TERMINFO=OFF \
    -DHLSL_INCLUDE_TESTS=OFF -DCLANG_INCLUDE_TESTS=OFF \
    -DSPIRV_BUILD_TESTS=OFF -DSPIRV_SKIP_TESTS=ON \
    -DENABLE_SPIRV_CODEGEN=ON -DENABLE_METAL_CODEGEN=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_MetalIRConverter=ON \
    -DCMAKE_INSTALL_NAME_DIR=@rpath \
    '-DCMAKE_INSTALL_RPATH=@loader_path;@loader_path/../lib' \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DLLVM_PARALLEL_LINK_JOBS=1
"$cmake" --build "$dxc_build" --target dxcompiler dxc --parallel "$jobs"
mkdir -p "$prefix/bin" "$prefix/lib" "$prefix/include/dxc" "$prefix/share/pvz-shader-tools"
if [ ! -f "$prefix/lib/libdxcompiler.dylib" ] || [ ! -f "$prefix/bin/dxc" ] \
    || [ "$dxc_build/lib/libdxcompiler.dylib" -nt "$prefix/lib/libdxcompiler.dylib" ] \
    || [ "$dxc_build/bin/dxc" -nt "$prefix/bin/dxc" ]; then
    cp -f "$dxc_build/lib/libdxcompiler.dylib" "$prefix/lib/libdxcompiler.dylib"
    cp -f "$dxc_build/bin/dxc" "$prefix/bin/dxc"
    # Normalize versioned upstream IDs so consumers need one app-local file.
    old_id=$(otool -D "$prefix/lib/libdxcompiler.dylib" | sed -n '2p')
    install_name_tool -id @rpath/libdxcompiler.dylib "$prefix/lib/libdxcompiler.dylib"
    if [ "$old_id" != '@rpath/libdxcompiler.dylib' ]; then
        install_name_tool -change "$old_id" @rpath/libdxcompiler.dylib "$prefix/bin/dxc"
    fi
    # install_name_tool invalidates existing signatures on Apple Silicon.
    codesign --force --sign - "$prefix/lib/libdxcompiler.dylib" "$prefix/bin/dxc"
fi
"$cmake" -E copy_if_different "$dxc_source/include/dxc/dxcapi.h" "$dxc_source/include/dxc/WinAdapter.h" \
    "$dxc_source/include/dxc/dxcerrors.h" "$prefix/include/dxc/"
"$cmake" -E copy_if_different "$dxc_source/LICENSE.TXT" "$prefix/share/pvz-shader-tools/DXC-LICENSE.TXT"

if [ "$build_cross" -eq 1 ]; then
    cross_build="$work_dir/build/spirv-cross"
    "$cmake" -S "$cross_source" -B "$cross_build" -G Ninja \
        "-DCMAKE_MAKE_PROGRAM=$ninja" \
        "-DCMAKE_C_COMPILER=$cc" "-DCMAKE_CXX_COMPILER=$cxx" \
        "-DCMAKE_OSX_SYSROOT=$sdk_path" \
        "-DCMAKE_OSX_DEPLOYMENT_TARGET=$deployment_target" \
        "-DCMAKE_INSTALL_PREFIX=$prefix" -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE=OFF \
        -DSPIRV_CROSS_STATIC=ON -DSPIRV_CROSS_SHARED=OFF \
        -DSPIRV_CROSS_CLI=OFF -DSPIRV_CROSS_ENABLE_TESTS=OFF \
        -DSPIRV_CROSS_ENABLE_GLSL=ON -DSPIRV_CROSS_ENABLE_MSL=ON \
        -DSPIRV_CROSS_ENABLE_HLSL=OFF -DSPIRV_CROSS_ENABLE_CPP=OFF \
        -DSPIRV_CROSS_ENABLE_REFLECT=OFF -DSPIRV_CROSS_ENABLE_C_API=OFF \
        -DSPIRV_CROSS_ENABLE_UTIL=OFF
    "$cmake" --build "$cross_build" --parallel "$jobs"
    "$cmake" --install "$cross_build"
    "$cmake" -E copy_if_different "$cross_source/LICENSE" "$prefix/share/pvz-shader-tools/SPIRV-Cross-LICENSE"
    for part in core glsl msl; do
        lipo "$prefix/lib/libspirv-cross-$part.a" -verify_arch arm64
    done
fi

otool -L "$prefix/lib/libdxcompiler.dylib" "$prefix/bin/dxc"
for binary in "$prefix/lib/libdxcompiler.dylib" "$prefix/bin/dxc"; do
    lipo "$binary" -verify_arch arm64
    dependencies=$(otool -L "$binary" | sed '1d' | awk '{print $1}')
    for dependency in $dependencies; do
        case "$dependency" in
            @rpath/libdxcompiler.dylib|/usr/lib/*|/System/Library/*) ;;
            *) printf 'Unexpected non-system dylib dependency: %s\n' "$dependency" >&2; exit 1 ;;
        esac
    done
done
# A CPU-only smoke compile proves dylib loading and SPIR-V codegen, no GPU used.
printf '%s\n' 'float4 main() : SV_Target { return float4(1, 0, 0, 1); }' \
    > "$work_dir/smoke.hlsl"
"$prefix/bin/dxc" -spirv -T ps_6_0 -E main \
    "$work_dir/smoke.hlsl" -Fo "$work_dir/smoke.spv"
test -s "$work_dir/smoke.spv"
printf 'DXC=%s\nSPIRV_CROSS=%s\n' "$DXC_REV" "$SPIRV_CROSS_REV" \
    > "$prefix/share/pvz-shader-tools/source-revisions.txt"
printf 'macOS arm64 shader prerequisites staged in %s\n' "$prefix"
