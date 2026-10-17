param(
    [string]$SourcePak = 'C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\main.pak',
    [string]$Converter = 'C:\Users\Administrator\CLionProjects\codex\pak64\out-vs\bin\Release\pak64.exe',
    [string]$OutputPak64 = ''
)

$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($OutputPak64)) {
    $OutputPak64 = Join-Path $ProjectRoot 'out\legacy-msvc2\Release\main.pak64'
}
if (-not (Test-Path -LiteralPath $SourcePak)) { throw "Source PAK not found: $SourcePak" }
if (-not (Test-Path -LiteralPath $Converter)) { throw "pak64 converter not found: $Converter" }

$tempOutput = "$OutputPak64.tmp.pak64"
Remove-Item -LiteralPath $tempOutput -Force -ErrorAction SilentlyContinue
# The converter is source-authoritative and always emits the complete PAK64.
# Any release-specific trimming is a separate, manually audited operation;
# keeping this build complete prevents shared assets (for example the
# Zombie_disco head and IceTrail) from being mistaken for dead resources.
& $Converter $SourcePak $tempOutput
if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $tempOutput)) {
    throw "pak64 release conversion failed"
}
Move-Item -LiteralPath $tempOutput -Destination $OutputPak64 -Force

$entries = @(tar -tf $OutputPak64)
$definitionSources = @($entries | Where-Object {
    $_ -match '^(?i:reanim/.*\.reanim|particles/.*\.(xml|trail))$'
})
$compiled = @($entries | Where-Object {
    $_ -match '^(?i:compiled/(reanim|particles)/.*\.compiled)$'
})
if ($definitionSources.Count -ne 259) {
    throw "Complete PAK64 definition source count is $($definitionSources.Count), expected 259"
}
if ($compiled.Count -ne 259) {
    throw "Complete PAK64 compiled definition count is $($compiled.Count), expected 259"
}
Write-Host "Complete PAK64 ready: $OutputPak64"
Write-Host "Entries: $($entries.Count); compiled definitions: $($compiled.Count)"
