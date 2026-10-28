param(
    [int]$ProcessId = 0,
    [ValidateSet('11x','25x')][string]$CpuMultiplier = '11x',
    [string]$OutputDirectory = ''
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$executable = 'C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\PlantsVsZombies.exe'
if (!$ProcessId) {
    $candidates = @(Get-Process PlantsVsZombies -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $executable })
    if ($candidates.Count -ne 1) { throw 'Launch one retail 1073 instance with tools/run-endless-orig.cmd.' }
    $ProcessId = $candidates[0].Id
}
$process = Get-Process -Id $ProcessId
if ($process.Path -ne $executable -or $process.ProcessorAffinity.ToInt64() -ne 0x4000) {
    throw 'Expected retail 1073 on logical processor 14.'
}
if (!$OutputDirectory) {
    $OutputDirectory = Join-Path $env:TEMP ('pvz-retail-' + $CpuMultiplier + '-' + [Guid]::NewGuid().ToString('N'))
}
$measurementDirectory = Join-Path $OutputDirectory 'measurement'
if (Test-Path -LiteralPath $measurementDirectory) { throw 'This measurement directory already exists.' }
Write-Host 'Load Survival Endless Pool. Leave the Continue/Paused screen showing the canonical starting formation.'
Write-Host 'Press Enter here to start. Resume at t=3 seconds. Sampling ends only when you Quit the game.'
$null = Read-Host 'Press Enter to verify the checkpoint and start'
& python (Join-Path $root 'Tests/performance/windows_game_probe.py') $ProcessId --kind original `
    --scene endless --multiplier $CpuMultiplier --output $measurementDirectory --preroll 3 `
    --until-exit --verify-original-endless
if ($LASTEXITCODE -ne 0) { throw 'Retail observation failed; do not use an unverified run as a baseline.' }
Write-Output ('Measurement saved to ' + $measurementDirectory)
