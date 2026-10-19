param([switch]$StageRuntime,[string]$BuildDirectory)
$ErrorActionPreference='Stop'
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0x3FFF
$projectRoot=Split-Path -Parent $PSScriptRoot
$vs='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$cmake=(Get-Command cmake -ErrorAction Stop).Source
$ninja=(Get-Command ninja -ErrorAction Stop).Source
$build=if($BuildDirectory){[IO.Path]::GetFullPath($BuildDirectory)}else{Join-Path $projectRoot 'out\x64-win32-dx12'}
$installed=Join-Path (Split-Path -Parent $projectRoot) '_shared\vcpkg_installed'
$configure='call "{0}" >nul && "{1}" -S "{2}" -B "{3}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{4}" -DVCPKG_INSTALLED_DIR="{5}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_VULKAN=OFF -DPVZ_BUILD_FRAMEWORK_D3D12=ON -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_WINDOWS_PLATFORM=WIN10 -DPVZ_RENDER_BACKEND=D3D12' -f $vs,$cmake,$projectRoot,$build,$ninja,$installed
& $env:ComSpec /d /s /c $configure
if($LASTEXITCODE){throw "D3D12 game configuration failed: $LASTEXITCODE"}
$compile='call "{0}" >nul && "{1}" --build "{2}" --target LawnProject --parallel 12' -f $vs,$cmake,$build
& $env:ComSpec /d /s /c $compile
if($LASTEXITCODE){throw "D3D12 game build failed: $LASTEXITCODE"}
if($StageRuntime){
    $source=Join-Path $projectRoot 'out\x64-win32-vulkan\Release'
    $destination=Join-Path $build 'Release'
    foreach($name in @('main.pak64','bass.dll')){
        $target=Join-Path $destination $name
        if(!(Test-Path -LiteralPath $target)){
            Copy-Item -LiteralPath (Join-Path $source $name) -Destination $target
        }
    }
    if(!(Test-Path -LiteralPath (Join-Path $destination 'scale.json'))){
        Copy-Item -LiteralPath (Join-Path $projectRoot 'scale.json') -Destination (Join-Path $destination 'scale.json')
    }
}
