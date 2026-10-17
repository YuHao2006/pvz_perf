param(
    [string]$VcVars='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
)
$ErrorActionPreference='Stop'
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0xBFFF
$projectRoot=Split-Path -Parent $PSScriptRoot
$source=$projectRoot
$build=Join-Path $projectRoot 'out\x64-win32-dx12'
$cmake=(Get-Command cmake -ErrorAction Stop).Source
$ninja=(Get-Command ninja -ErrorAction Stop).Source
if(!(Test-Path -LiteralPath $VcVars)){throw "MSVC environment script missing: $VcVars"}
$installed=Join-Path (Split-Path -Parent $projectRoot) '_shared\vcpkg_installed'
$configure='call "{0}" >nul && "{1}" -S "{2}" -B "{3}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{4}" -DBUILD_TESTING=ON -DVCPKG_INSTALLED_DIR="{5}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_D3D12=ON -DPVZ_BUILD_FRAMEWORK_VULKAN=OFF -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_RENDER_BACKEND=D3D12' -f $VcVars,$cmake,$source,$build,$ninja,$installed
& $env:ComSpec /d /s /c $configure
if($LASTEXITCODE){throw "D3D12 configuration failed: $LASTEXITCODE"}
$compile='call "{0}" >nul && "{1}" --build "{2}" --target sexy_d3d12_render_tests sexy_d3d12_scale_compile_tests --parallel 12' -f $VcVars,$cmake,$build
& $env:ComSpec /d /s /c $compile
if($LASTEXITCODE){throw "D3D12 compilation failed: $LASTEXITCODE"}
