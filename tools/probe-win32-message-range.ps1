$ErrorActionPreference='Stop'
$root=Split-Path -Parent $PSScriptRoot
$evidence=Join-Path $root 'log/docs-evidence/20261015/message-range-probe'
$null=New-Item -ItemType Directory -Path $evidence -Force
$build=Join-Path $root 'out/x64-win32-dx12/native-probes/message-range'
$null=New-Item -ItemType Directory -Path $build -Force
$vs='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$source=Join-Path $PSScriptRoot 'native-tests/win32_message_range_probe.cpp'
$exe=Join-Path $build 'native_message_range_probe.exe'
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0x3FFF
$compile='call "{0}" >nul && cl /nologo /std:c++20 /EHsc /W4 /O2 /GL /MD "{1}" /Fe:"{2}" /Fo:"{3}" /link /LTCG user32.lib' -f $vs,$source,$exe,(Join-Path $build 'probe.obj')
& $env:ComSpec /d /s /c $compile
if($LASTEXITCODE -ne 0) {throw "Probe compile failed: $LASTEXITCODE"}
$output=@(& $exe 2>&1)
$code=$LASTEXITCODE
$output | Set-Content -LiteralPath (Join-Path $evidence 'result.log') -Encoding UTF8
$output
[pscustomobject]@{
    exitCode=$code
    verdict=if($code -eq 2){'rejected-mixed-input-order'}elseif($code -eq 0){'contract-passed'}else{'probe-error'}
    desktopPointerMoved=$false
    physicalHidTested=$false
    gameBuildModified=$false
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $evidence 'verification.json') -Encoding UTF8
if($code -notin @(0,2)) {throw "Probe failed unexpectedly: $code"}
