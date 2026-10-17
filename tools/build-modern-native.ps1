param([switch]$Test)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$vs = 'C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$cmake = (Get-Command cmake -ErrorAction Stop).Source
$ninja = 'C:\Users\Administrator\AppData\Local\Programs\CLion\bin\ninja\win\x64\ninja.exe'
$packages = Join-Path (Split-Path -Parent $root) '_shared\vcpkg_installed\x64-windows-static-md'
$build = Join-Path $root 'out\x64-win32-vulkan'
$env:VULKAN_SDK = 'C:\UserProgram\VulkanSDK\1.4.350.0'
foreach ($path in @($vs,$cmake,$ninja,$packages,$env:VULKAN_SDK)) {
    if (!(Test-Path -LiteralPath $path)) { throw "Required tool/dependency path missing: $path" }
}
$installed=Join-Path (Split-Path -Parent $root) '_shared\vcpkg_installed'
$configure = 'call "{0}" >nul && "{1}" -S "{2}" -B "{3}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{4}" -DCMAKE_PREFIX_PATH="{5}" -DVCPKG_INSTALLED_DIR="{6}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_VULKAN=ON -DPVZ_BUILD_FRAMEWORK_D3D12=OFF -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_RENDER_BACKEND=VULKAN' -f $vs,$cmake,$root,$build,$ninja,$packages,$installed
& $env:ComSpec /d /s /c $configure
if ($LASTEXITCODE -ne 0) { throw "Native renderer configure failed: $LASTEXITCODE" }
$targets='sexy_vulkan_hdr_observer_tests sexy_vulkan_enumeration_tests sexy_vulkan_initialization_tests sexy_vulkan_hdr_tests sexy_vulkan_scale_pipeline_tests sexy_vulkan_scale_gpu_tests sexy_vulkan_scale_compile_tests sexy_vulkan_render_tests'
$compile = 'call "{0}" >nul && "{1}" --build "{2}" --target {3} --parallel 6' -f $vs,$cmake,$build,$targets
& $env:ComSpec /d /s /c $compile
if ($LASTEXITCODE -ne 0) { throw "Native renderer build failed: $LASTEXITCODE" }
if ($Test) {
    & (Join-Path (Split-Path -Parent $cmake) 'ctest.exe') --test-dir $build -R '^sexy_vulkan_' --output-on-failure
    if ($LASTEXITCODE -ne 0) { throw "Native renderer tests failed: $LASTEXITCODE" }
}
