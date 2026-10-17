param(
    [ValidateSet('X11', 'WAYLAND')][string]$Window = 'X11',
    [string]$Distribution = 'Ubuntu-26.04',
    [string]$VcpkgRoot = 'C:/UserProgram/vcpkg',
    [switch]$ConfigureOnly
)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$architecture = (& wsl.exe -d $Distribution -- uname -m).Trim()
if ($LASTEXITCODE) { throw 'Cannot query the Linux build architecture' }
$cpu = switch ($architecture) {
    'x86_64' { 'x64' }
    'aarch64' { 'arm64' }
    default { throw "Unsupported Linux build architecture: $architecture" }
}
$build = Join-Path $projectRoot "out/$cpu-$($Window.ToLowerInvariant())-vulkan"
$linuxProject = (& wsl.exe -d $Distribution -- wslpath -a $projectRoot.Replace('\', '/')).Trim()
$linuxBuild = "$linuxProject/out/$cpu-$($Window.ToLowerInvariant())-vulkan"
$linuxVcpkg = (& wsl.exe -d $Distribution -- wslpath -a $VcpkgRoot.Replace('\', '/')).Trim()
if ($LASTEXITCODE) { throw 'Cannot resolve the vcpkg root' }
$bassArchitecture = if ($cpu -eq 'x64') { 'x86_64' } else { 'aarch64' }
$arguments = @('-d', $Distribution, '--exec', 'env',
    'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin', 'cmake',
    '-S', $linuxProject, '-B', $linuxBuild, '-G', 'Ninja',
    "-DCMAKE_TOOLCHAIN_FILE=$linuxVcpkg/scripts/buildsystems/vcpkg.cmake",
    '-DVCPKG_MANIFEST_INSTALL=OFF',
    '-UPVZ_BASS_DLL',
    "-DVCPKG_INSTALLED_DIR=$linuxProject/out/linux-window-deps/vcpkg_installed",
    "-DVCPKG_TARGET_TRIPLET=$cpu-linux",
    '-DCMAKE_BUILD_TYPE=Release', '-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON',
    '-DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=OFF',
    '-DCMAKE_C_COMPILER=/usr/bin/gcc', '-DCMAKE_CXX_COMPILER=/usr/bin/g++',
    '-DCMAKE_MAKE_PROGRAM=/usr/bin/ninja', '-DPython3_EXECUTABLE=/usr/bin/python3',
    '-DPKG_CONFIG_EXECUTABLE=/usr/bin/pkg-config',
    '-DPVZ_GLSLC=/usr/bin/glslc', '-DPVZ_SPIRV_VAL=/usr/bin/spirv-val',
    "-DPVZ_WINDOW_BACKEND=$Window", '-DPVZ_RENDER_BACKEND=VULKAN',
    '-DPVZ_BUILD_FRAMEWORK_VULKAN=ON', '-DPVZ_BUILD_FRAMEWORK_D3D12=OFF',
    '-DPVZ_BUILD_LEGACY_GAME=ON', '-DBUILD_TESTING=ON',
    "-DPVZ_BASS_LIBRARY=$linuxProject/out/linux-window-deps/bass/libs/$bassArchitecture/libbass.so")
& wsl.exe @arguments
if ($LASTEXITCODE) { throw "Linux $Window configuration failed" }
if ($ConfigureOnly) { return }
& wsl.exe -d $Distribution --exec cmake --build $linuxBuild --target LawnProject --parallel 8
if ($LASTEXITCODE) { throw "Linux $Window build failed" }
Write-Output "Linux game: $build/Release/pvz_perf"
