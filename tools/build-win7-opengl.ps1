param(
    [string]$BuildDirectory,
    [string]$MsvcToolsetDirectory,
    [ValidateSet('OPENGL','D3D9')][string]$RenderBackend = 'OPENGL',
    [switch]$ConfigureOnly,
    [string[]]$Target = @('LawnProject'),
    [switch]$StageRuntime
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$build = if ($BuildDirectory) { [IO.Path]::GetFullPath($BuildDirectory) } else {
    Join-Path $root ('out\x64-win7-'+$RenderBackend.ToLowerInvariant())
}
$cache = Join-Path $build 'CMakeCache.txt'
if (Test-Path -LiteralPath $cache) {
    $backend = Select-String -LiteralPath $cache -Pattern '^PVZ_RENDER_BACKEND:STRING=(.+)$'
    $platform = Select-String -LiteralPath $cache -Pattern '^PVZ_WINDOWS_PLATFORM:STRING=(.+)$'
    if (($backend -and $backend.Matches[0].Groups[1].Value -ne $RenderBackend) -or
        ($platform -and $platform.Matches[0].Groups[1].Value -ne 'WIN7')) {
        throw "Build directory belongs to another platform/backend: $build"
    }
}
$cmake = (Get-Command cmake -ErrorAction Stop).Source
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity = [IntPtr]0x3FFF
$vs = 'C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$ninja = 'C:\Users\Administrator\AppData\Local\Programs\CLion\bin\ninja\win\x64\ninja.exe'
$installed = Join-Path (Split-Path -Parent $root) '_shared\vcpkg_installed'
if (!$MsvcToolsetDirectory) {
    $MsvcToolsetDirectory = Join-Path $root 'out\toolchains\msvc-14.44\Contents\VC\Tools\MSVC\14.44.35207'
}
$toolset = (Resolve-Path -LiteralPath $MsvcToolsetDirectory).Path
if ((Split-Path -Leaf $toolset) -notlike '14.44.*') {
    throw 'This build requires the tested MSVC 14.44 toolset'
}
$compiler = Join-Path $toolset 'bin\Hostx64\x64\cl.exe'
foreach ($file in @($compiler, $vs, $ninja)) {
    if (!(Test-Path -LiteralPath $file)) { throw "Build tool missing: $file" }
}
# These strings are cmd.exe environment setup, matching build-modern-game.ps1.
$toolsetEnvironment = 'set "PATH={0}\bin\Hostx64\x64;!PATH!" && set "INCLUDE={0}\include;!INCLUDE!" && set "LIB={0}\lib\x64;!LIB!" && ' -f $toolset
$toolsetOptions = ' -DCMAKE_C_COMPILER="{0}" -DCMAKE_CXX_COMPILER="{0}" -DCMAKE_LINKER="{1}\bin\Hostx64\x64\link.exe" -DCMAKE_AR="{1}\bin\Hostx64\x64\lib.exe"' -f $compiler, $toolset
$configure = 'call "{0}" >nul && {1}"{2}" -S "{3}" -B "{4}" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_MAKE_PROGRAM="{5}" -DVCPKG_INSTALLED_DIR="{6}" -DVCPKG_MANIFEST_INSTALL=OFF -DPVZ_BUILD_FRAMEWORK_VULKAN=OFF -DPVZ_BUILD_FRAMEWORK_D3D12=OFF -DPVZ_WINDOW_BACKEND=WIN32 -DPVZ_WINDOWS_PLATFORM=WIN7 -DPVZ_RENDER_BACKEND={8}{7}' -f $vs, $toolsetEnvironment, $cmake, $root, $build, $ninja, $installed, $toolsetOptions, $RenderBackend
& $env:ComSpec /d /v:on /s /c $configure
if ($LASTEXITCODE -ne 0) { throw "Win7 $RenderBackend configure failed: $LASTEXITCODE" }
if ($ConfigureOnly) { return }
$targetArguments = ($Target | ForEach-Object { '"' + $_ + '"' }) -join ' '
$compile = 'call "{0}" >nul && {1}"{2}" --build "{3}" --target {4} --parallel 12' -f $vs, $toolsetEnvironment, $cmake, $build, $targetArguments
& $env:ComSpec /d /v:on /s /c $compile
if ($LASTEXITCODE -ne 0) { throw "Win7 $RenderBackend build failed: $LASTEXITCODE" }
if ($Target -contains 'LawnProject') {
    if ($StageRuntime) {
        $source = Join-Path $root 'out\x64-win32-dx12\Release'
        $destination = Join-Path $build 'Release'
        foreach ($file in @('main.pak64', 'bass.dll')) {
            if (!(Test-Path -LiteralPath (Join-Path $destination $file))) {
                Copy-Item -LiteralPath (Join-Path $source $file) -Destination (Join-Path $destination $file)
            }
        }
    }
}
