param([switch]$StageRuntime,[string]$BuildDirectory)
$ErrorActionPreference='Stop'
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0x3FFF
$projectRoot=Split-Path -Parent $PSScriptRoot
$vs='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$cmake=(Get-Command cmake -ErrorAction Stop).Source
$ninja=(Get-Command ninja -ErrorAction Stop).Source
$build=if($BuildDirectory){[IO.Path]::GetFullPath($BuildDirectory)}else{Join-Path $projectRoot 'out\x64-win32-dx12'}
$installed=Join-Path (Split-Path -Parent $projectRoot) '_shared\vcpkg_installed'
$configure='call "{0}" >nul && "{1}" -S "{2}" -B "{3}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{4}" -DVCPKG_INSTALLED_DIR="{5}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_VULKAN=OFF -DPVZ_BUILD_FRAMEWORK_D3D12=ON -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_RENDER_BACKEND=D3D12 -DPVZ_NATIVE_MESSAGE_READINESS=ON -DPVZ_NATIVE_MESSAGE_PUMP_BUDGET=OFF -DPVZ_NATIVE_MESSAGE_SKIP_MOVE=OFF -DPVZ_NATIVE_CLIENT_HITTEST=OFF' -f $vs,$cmake,$projectRoot,$build,$ninja,$installed
& $env:ComSpec /d /s /c $configure
if($LASTEXITCODE){throw "D3D12 game configuration failed: $LASTEXITCODE"}
$compile='call "{0}" >nul && "{1}" --build "{2}" --target LawnProject --parallel 12' -f $vs,$cmake,$build
& $env:ComSpec /d /s /c $compile
if($LASTEXITCODE){throw "D3D12 game build failed: $LASTEXITCODE"}
if($StageRuntime){
    $source=Join-Path $projectRoot 'out\x64-win32-vulkan\Release'
    $destination=Join-Path $build 'Release'
    foreach($name in @('main.pak64','bass.dll','settings.json','scale.json')){
        $target=Join-Path $destination $name
        if(!(Test-Path -LiteralPath $target)){
            Copy-Item -LiteralPath (Join-Path $source $name) -Destination $target
        }
    }
    $dataDestination=Join-Path $destination 'data'
    New-Item -ItemType Directory -Path $dataDestination -Force | Out-Null
    foreach($file in Get-ChildItem -LiteralPath (Join-Path $source 'data') -File){
        if($file.Name -match '^users\.dat$|^user\d+\.dat64$|^game\d+_\d+\.dat64$' -and
            !(Test-Path -LiteralPath (Join-Path $dataDestination $file.Name))){
            Copy-Item -LiteralPath $file.FullName -Destination (Join-Path $dataDestination $file.Name)
        }
    }
}
