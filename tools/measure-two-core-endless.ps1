param(
    [ValidateSet('11x','25x')][string]$CpuMultiplier = '11x',
    [string]$OutputDirectory = '',
    [switch]$IncludeOriginal
)
$ErrorActionPreference = 'Stop'
$taskRoot = Split-Path -Parent $PSScriptRoot
$env:PVZ_APPDATA_DIR = ''
$env:PVZ_SETTINGS_FILE = ''
$env:PVZ_LOG_DIR = ''
$taskRelease = Join-Path $taskRoot 'out/x64-win32-vulkan/Release'
$taskRetail = 'C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN'
$taskRetailData = 'C:\ProgramData\PopCap Games\PlantsVsZombies\userdata'
if (!$OutputDirectory) {
    $OutputDirectory = Join-Path $env:TEMP ('pvz-two-core-240-v100-' + [Guid]::NewGuid().ToString('N'))
}
New-Item -ItemType Directory -Path $OutputDirectory -Force | Out-Null
$taskOutput = [IO.Path]::GetFullPath($OutputDirectory)
$taskShell = (Get-Process -Id $PID).Path
$taskPython = (Get-Command python).Source
$taskConverter = Join-Path $taskRelease 'data/pvz_dat64_converter.exe'
$taskSource = Join-Path $taskRoot 'Tests/game3_13.dat'
$taskManifest = Get-Content (Join-Path $taskRoot 'Tests/manifest.json') -Raw | ConvertFrom-Json
if ((Get-FileHash $taskSource -Algorithm SHA256).Hash.ToLowerInvariant() -ne $taskManifest.original.sha256) {
    throw 'Canonical retail checkpoint checksum mismatch.'
}
function Get-SelectedProfile([string]$Directory) {
    $taskBytes = [IO.File]::ReadAllBytes((Join-Path $Directory 'users.dat'))
    $taskCount = [BitConverter]::ToUInt16($taskBytes,4)
    if ($taskCount -ne 1) { throw 'Expected exactly one selected benchmark profile; refusing ambiguous reset.' }
    $taskNameLength = [BitConverter]::ToUInt16($taskBytes,6)
    return [BitConverter]::ToUInt32($taskBytes,12+$taskNameLength)
}
function Invoke-Case([string]$Kind,[string]$Executable,[string]$Directory,[string]$Data,[string]$Wrapper) {
    if (Get-Process pvz_perf,PlantsVsZombies -ErrorAction SilentlyContinue) {
        throw 'Close the current game normally before starting the next benchmark.'
    }
    $taskCase = Join-Path $taskOutput $Kind
    New-Item -ItemType Directory -Path $taskCase -Force | Out-Null
    $taskProfile = Get-SelectedProfile $Data
    $taskMode = if ($Kind -eq 'modern-240') { 58 } else { 13 }
    $taskExtension = if ($Kind -eq 'modern-240') { 'dat64' } else { 'dat' }
    $taskSave = Join-Path $Data ("game{0}_{1}.{2}" -f $taskProfile,$taskMode,$taskExtension)
    if (Test-Path $taskSave) { Copy-Item -LiteralPath $taskSave -Destination (Join-Path $taskCase ('previous-'+[IO.Path]::GetFileName($taskSave))) }
    if ($Kind -eq 'modern-240') {
        $taskConverted = Join-Path $taskCase 'canonical.dat64'
        & $taskConverter $taskSource $taskConverted --target dat64-v4
        if ($LASTEXITCODE) { throw 'Canonical current-save conversion failed.' }
        Copy-Item -LiteralPath $taskConverted -Destination $taskSave -Force
        $taskSettingsPath = Join-Path $taskRelease 'settings.json'
        Copy-Item $taskSettingsPath (Join-Path $taskCase 'settings-before.json')
        $taskSettings = Get-Content $taskSettingsPath -Raw | ConvertFrom-Json
        $taskSettings.targetFps = 240
        $taskSettings.autoDetectFrameRate = $false
        $taskSettings.waitForVSync = 0
        $taskSettings | ConvertTo-Json | Set-Content $taskSettingsPath -Encoding utf8
        Copy-Item $taskSettingsPath (Join-Path $taskCase 'settings.json')
    } else {
        Copy-Item -LiteralPath $taskSource -Destination $taskSave -Force
    }
    # Launch unelevated, pinned from process creation; elevation is observer-only.
    $taskLaunch = 'start "pvz-two-core" /D "{0}" /affinity C000 "{1}"' -f $Directory,$Executable
    & $env:ComSpec /d /s /c $taskLaunch
    $taskDeadline = [DateTime]::UtcNow.AddSeconds(45)
    do {
        Start-Sleep -Milliseconds 150
        $taskGame = @(Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $Executable })
    } until ($taskGame.Count -eq 1 -or [DateTime]::UtcNow -ge $taskDeadline)
    if ($taskGame.Count -ne 1) { throw 'Cannot locate the newly launched game.' }
    if ($taskGame[0].ProcessorAffinity.ToInt64() -ne 0xC000) { throw 'Expected logical processors 14 and 15.' }
    $taskCommand = @"
`$ErrorActionPreference='Stop'
`$env:PATH='$([IO.Path]::GetDirectoryName($taskPython));'+`$env:PATH
Set-Location '$($taskRoot.Replace("'","''"))'
try {
    & '$($Wrapper.Replace("'","''"))' -ProcessId $($taskGame[0].Id) -AffinityMask 0xC000 -PerCoreCpu -CpuMultiplier '$CpuMultiplier' -OutputDirectory '$($taskCase.Replace("'","''"))'
    if (`$LASTEXITCODE) { throw 'Observer returned a nonzero exit code.' }
    & python -c "import runpy,sys; from pathlib import Path; sys.path.insert(0,r'$($taskRoot.Replace("'","''"))/Tests/performance'); runpy.run_path(r'$($taskRoot.Replace("'","''"))/Tests/performance/observe-windows-game.py')['plot_samples'](Path(r'$($taskCase.Replace("'","''"))/measurement'), '$Kind')"
    if (`$LASTEXITCODE) { throw 'Timeline plotting failed.' }
    exit 0
} catch {
    `$_ | Out-String | Set-Content '$($taskCase.Replace("'","''"))/observer-error.txt'
    Write-Host `$_ -ForegroundColor Red
    Read-Host 'Observation failed. Press Enter to close'
    exit 1
}
"@
    $taskEncoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($taskCommand))
    $taskObserver = Start-Process -FilePath $taskShell -Verb RunAs -WindowStyle Normal -ArgumentList @('-NoProfile','-EncodedCommand',$taskEncoded) -Wait -PassThru
    if ($taskObserver.ExitCode -ne 0) { throw 'Observation failed; the game is left running and the second case is not started.' }
    @{ case=$Kind; pid=$taskGame[0].Id; affinity='0xC000'; output=$taskCase; completed=$true } |
        ConvertTo-Json | Set-Content (Join-Path $taskCase 'completed.json')
}
try {
    Invoke-Case 'modern-240' (Join-Path $taskRelease 'pvz_perf.exe') $taskRelease (Join-Path $taskRelease 'data') (Join-Path $PSScriptRoot 'measure-release-vulkan.ps1')
    if ($IncludeOriginal) {
        Invoke-Case 'original-100' (Join-Path $taskRetail 'PlantsVsZombies.exe') $taskRetail $taskRetailData (Join-Path $PSScriptRoot 'measure-original-1073.ps1')
    }
    'Requested benchmarks completed.' | Set-Content (Join-Path $taskOutput 'completed.txt')
} catch {
    $_ | Out-String | Set-Content (Join-Path $taskOutput 'session-error.txt')
    throw
}
