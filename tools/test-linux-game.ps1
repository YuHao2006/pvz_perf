param(
    [ValidateSet('X11', 'WAYLAND')][string]$Window = 'X11',
    [string]$Distribution = 'Ubuntu-26.04',
    [ValidateSet('ui', 'roundtrip')][string]$Mode = 'roundtrip',
    [switch]$WithoutValidation,
    [switch]$WithAudio
)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$runtime = Join-Path $projectRoot "out/x64-$($Window.ToLowerInvariant())-vulkan/Release"
$executable = Join-Path $runtime 'pvz_perf'
$cache = Join-Path (Split-Path -Parent $runtime) 'CMakeCache.txt'
if (!(Select-String -LiteralPath $cache -Pattern '^PVZ_ENABLE_GAME_PROBES:BOOL=ON$' -Quiet)) {
    throw 'This test requires a build with -DPVZ_ENABLE_GAME_PROBES=ON. Release builds exclude game probes.'
}
foreach ($path in @($executable, (Join-Path $runtime 'main.pak64'), (Join-Path $runtime 'libbass.so'))) {
    if (!(Test-Path -LiteralPath $path)) { throw "Missing test input: $path" }
}
$run = Join-Path $projectRoot ("log/native-linux-$($Window.ToLowerInvariant())-" + [guid]::NewGuid().ToString('N'))
$data = Join-Path $run 'data'
$logs = Join-Path $run 'logs'
$settings = Join-Path $run 'settings.json'
New-Item -ItemType Directory -Path $data, $logs -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'test-data/native-linux-settings.json') -Destination $settings
if ($WithAudio) {
    $audioSettings = Get-Content -LiteralPath $settings -Raw | ConvertFrom-Json
    $audioSettings.musicVolume = 85
    $audioSettings.sfxVolume = 85
    $audioSettings.muted = 0
    [IO.File]::WriteAllText($settings, ($audioSettings | ConvertTo-Json))
}
function LinuxPath([string]$Path) {
    $converted = & wsl.exe -d $Distribution -- wslpath -a $Path.Replace('\', '/')
    if ($LASTEXITCODE) { throw "Cannot resolve Linux path: $Path" }
    return $converted.Trim()
}
$arguments = @('-d', $Distribution, '--exec', 'env',
    '-u', 'VK_ICD_FILENAMES', '-u', 'VK_LAYER_PATH',
    '-u', 'VK_INSTANCE_LAYERS', '-u', 'DZN_DEBUG',
    '-u', 'PVZ_MODERN_HIDDEN', '-u', 'PVZ_VULKAN_VALIDATION',
    '-u', 'PVZ_MODERN_SMOKE', '-u', 'PVZ_MODERN_GAMEPLAY',
    '-u', 'VK_DRIVER_FILES', '-u', 'PVZ_BASS_LIBRARY', '-u', 'ALSA_CONFIG_PATH',
    "PVZ_APPDATA_DIR=$(LinuxPath $data)",
    "PVZ_LOG_DIR=$(LinuxPath $logs)",
    "PVZ_SETTINGS_FILE=$(LinuxPath $settings)",
    'PVZ_NATIVE_GAME_SMOKE=1', "PVZ_NATIVE_GAME_SMOKE_MODE=$Mode", 'PVZ_STARTUP_PROBE=1')
if (!$WithoutValidation) {
    $arguments += @('PVZ_VULKAN_VALIDATION=1', 'VK_LAYER_VALIDATE_SYNC=1')
}
if ($WithAudio) { $arguments += @('PVZ_NATIVE_GAME_AUDIO=1', 'ALSOFT_LOGLEVEL=3') }
$arguments += @('timeout', '--signal=TERM', '--kill-after=15s', '540s', (LinuxPath $executable))
Write-Output "Native Linux $Window test: $run"
try {
    # Windows PowerShell 5 turns redirected native stderr into ErrorRecords.
    # Game diagnostics on stderr are not a failed process.
    $ErrorActionPreference = 'Continue'
    & wsl.exe @arguments 1> (Join-Path $run 'stdout.txt') 2> (Join-Path $run 'stderr.txt')
    $code = $LASTEXITCODE
} finally {
    $ErrorActionPreference = 'Stop'
}
$result = Join-Path $logs 'native-linux-game-smoke/result.log'
$metadata = [ordered]@{
    window = $Window
    mode = $Mode
    executable = $executable
    executableSha256 = (Get-FileHash -LiteralPath $executable -Algorithm SHA256).Hash
    packageSha256 = (Get-FileHash -LiteralPath (Join-Path $runtime 'main.pak64') -Algorithm SHA256).Hash
    validation = !$WithoutValidation
    exitCode = $code
    result = $result
}
[IO.File]::WriteAllText((Join-Path $run 'verification.json'), ($metadata | ConvertTo-Json))
if ($code -ne 0) { throw "Native Linux $Window exited $code; evidence: $run" }
if (!(Test-Path -LiteralPath $result) -or
    (Get-Content -LiteralPath $result -Raw) -notmatch 'PASS native-linux-game-smoke close=queued') {
    throw "Native Linux $Window did not complete its real game probe: $run"
}
$resultText = Get-Content -LiteralPath $result -Raw
if ($Mode -eq 'roundtrip' -and
    ($resultText -notmatch 'PASS native-linux-game-smoke close=queued dat64=PASS' -or
     $resultText -notmatch 'PASS dat64-core-state-and-world-bindings' -or
     $resultText -notmatch 'PASS resumed-gameplay-updates' -or
     $resultText -notmatch 'PASS dat64-round-trip')) {
    throw "Native Linux $Window did not verify the full dat64 round trip: $run"
}
$stderr = Get-Content -LiteralPath (Join-Path $run 'stderr.txt') -Raw
if (!$WithoutValidation -and $stderr -match '\[validation\]') {
    throw "Native Linux $Window reported validation diagnostics: $run"
}
Get-Content -LiteralPath $result -Tail 10
Write-Output "PASS: Native Linux $Window game and queued shutdown; evidence: $run"
