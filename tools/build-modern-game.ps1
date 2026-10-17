param([switch]$StageRuntime,[string]$BuildDirectory)
$ErrorActionPreference='Stop'
$root=Split-Path -Parent $PSScriptRoot
$vs='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$cmake=(Get-Command cmake -ErrorAction Stop).Source
$ninja='C:\Users\Administrator\AppData\Local\Programs\CLion\bin\ninja\win\x64\ninja.exe'
$build=if($BuildDirectory){[IO.Path]::GetFullPath($BuildDirectory)}else{Join-Path $root 'out\x64-win32-vulkan'}
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0x3FFF
$installed=Join-Path (Split-Path -Parent $root) '_shared\vcpkg_installed'
$env:VULKAN_SDK='C:\UserProgram\VulkanSDK\1.4.350.0'
$configure='call "{0}" >nul && "{1}" -S "{2}" -B "{3}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{4}" -DVCPKG_INSTALLED_DIR="{5}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_VULKAN=ON -DPVZ_BUILD_FRAMEWORK_D3D12=OFF -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_RENDER_BACKEND=VULKAN -DPVZ_NATIVE_MESSAGE_READINESS=ON -DPVZ_NATIVE_MESSAGE_PUMP_BUDGET=OFF -DPVZ_NATIVE_MESSAGE_SKIP_MOVE=OFF -DPVZ_NATIVE_CLIENT_HITTEST=OFF' -f $vs,$cmake,$root,$build,$ninja,$installed
& $env:ComSpec /d /s /c $configure
if($LASTEXITCODE -ne 0){throw "Modern configure failed: $LASTEXITCODE"}
$compile='call "{0}" >nul && "{1}" --build "{2}" --target LawnProject --parallel 12' -f $vs,$cmake,$build
& $env:ComSpec /d /s /c $compile
if($LASTEXITCODE -ne 0){throw "Modern game build failed: $LASTEXITCODE"}
# The game POST_BUILD copy is not rerun when only the converter relinks.
# Keep the playable directory current for converter-only source fixes too.
& $cmake -E copy_if_different (Join-Path $build 'tools\saveConverter\build\pvz_dat64_converter.exe') (Join-Path $build 'Release\data\pvz_dat64_converter.exe')
if($LASTEXITCODE -ne 0){throw "Modern converter staging failed: $LASTEXITCODE"}
if($StageRuntime){
    $source=Join-Path $root 'out\x64-win32-dx12\Release'
    $dest=Join-Path $build 'Release'
    foreach($file in @('main.pak64','bass.dll')){
        if(!(Test-Path -LiteralPath (Join-Path $dest $file))){
            Copy-Item -LiteralPath (Join-Path $source $file) -Destination (Join-Path $dest $file)
        }
    }
    # Scale/config files are JSON now (nlohmann single-TU reader, SexyAppBase);
    # the repo copy is canonical when the runtime copy is missing.
    foreach($file in @('scale.json','settings.json')){
        if(!(Test-Path -LiteralPath (Join-Path $dest $file))){
            Copy-Item -LiteralPath (Join-Path $root ("tools\test-data\"+$file)) -Destination (Join-Path $dest $file)
        }
    }
    # Own save copy: never run Modern against Legacy's live data directory.
    $saveDest=Join-Path $dest 'data'
    New-Item -ItemType Directory -Path $saveDest -Force | Out-Null
    foreach($file in Get-ChildItem -LiteralPath (Join-Path $source 'data') -File){
        if($file.Name -match '^users\.dat$|^user\d+\.dat64$|^game\d+_\d+\.dat64$' -and
           !(Test-Path -LiteralPath (Join-Path $saveDest $file.Name))){
            Copy-Item -LiteralPath $file.FullName -Destination (Join-Path $saveDest $file.Name)
        }
    }
}
