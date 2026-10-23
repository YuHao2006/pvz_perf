param(
    [Parameter(Mandatory=$true)][string]$Converter,
    [string]$Fixture = (Join-Path $PSScriptRoot '../game3_58.dat64'),
    [string]$OutputDirectory
)
$ErrorActionPreference = 'Stop'
$converterPath = (Resolve-Path -LiteralPath $Converter).Path
$fixturePath = (Resolve-Path -LiteralPath $Fixture).Path
if (!$OutputDirectory) {
    $OutputDirectory = Join-Path $PSScriptRoot ("../../out/dat64-ns-regression-" + [guid]::NewGuid().ToString('N'))
}
$output = [IO.Path]::GetFullPath($OutputDirectory)
New-Item -ItemType Directory -Path $output -ErrorAction Stop | Out-Null
Add-Type @'
using System;
public static class Dat64NanosecondRegression {
 public static void Patch(string input, string output, int offset, ulong value, bool payload) {
  byte[] b = System.IO.File.ReadAllBytes(input);
  byte[] v = payload ? BitConverter.GetBytes(value) : BitConverter.GetBytes((uint)value);
  v.CopyTo(b, offset);
  // Deliberately leave the former CRC field untouched.
  System.IO.File.WriteAllBytes(output, b);
 }
}
'@
function Invoke-Expected([int]$exitCode, [string[]]$arguments) {
    & $converterPath @arguments
    if ($LASTEXITCODE -ne $exitCode) { throw "Expected exit $exitCode, got $LASTEXITCODE : $arguments" }
}
$v2 = Join-Path $output 'v2.dat64'
$roundtrip = Join-Path $output 'v1-roundtrip.dat64'
Invoke-Expected 0 @('--target','dat64-v2',$fixturePath,$v2)
Invoke-Expected 0 @('--target','dat64-v1',$v2,$roundtrip)
if ([BitConverter]::ToUInt32([IO.File]::ReadAllBytes($v2),32) -ne 0) {
    throw 'v2 did not clear the reserved former CRC field'
}
if ((Get-FileHash -LiteralPath $fixturePath).Hash -ne (Get-FileHash -LiteralPath $roundtrip).Hash) {
    throw 'v1 -> v2 -> v1 changed bytes'
}
# A valid v1 timer edit must remain readable with its original, stale CRC.
$editedV1 = Join-Path $output 'edited-v1-stale-crc.dat64'
[Dat64NanosecondRegression]::Patch($roundtrip,$editedV1,(52 + 0x470),17,$false)
$editedV2 = Join-Path $output 'edited-v1-converted.dat64'
Invoke-Expected 0 @('--target','dat64-v2',$editedV1,$editedV2)
if ([BitConverter]::ToUInt64([IO.File]::ReadAllBytes($editedV2),(52 + 0x470)) -ne 170000000) {
    throw 'v1 edit was not imported with the stale CRC'
}
foreach ($expected in @(@($v2,2,3,0x10732), @($roundtrip,1,1,0x10731))) {
    $bytes = [IO.File]::ReadAllBytes($expected[0])
    foreach ($field in @(@(8,$expected[1]),@(20,$expected[2]),@(36,$expected[3]))) {
        if ([BitConverter]::ToUInt32($bytes,$field[0]) -ne $field[1]) { throw 'Header field mismatch' }
    }
}
foreach ($bad in @(@(8,4),@(20,1),@(36,0x10731))) {
    $source = Join-Path $output "bad-header-$($bad[0]).dat64"
    $target = Join-Path $output "rejected-$($bad[0]).dat64"
    [Dat64NanosecondRegression]::Patch($v2,$source,$bad[0],$bad[1],$false)
    Invoke-Expected 1 @('--target','dat64-v2',$source,$target)
    if (Test-Path -LiteralPath $target) { throw 'Rejected header created an output file' }
}
# Header + SyncBytes length prefix + first Board timer (mFogBlownCountDown).
$fractional = Join-Path $output 'fractional.dat64'
[Dat64NanosecondRegression]::Patch($v2,$fractional,(52 + 0x470),15000001,$true)
$rejected = Join-Path $output 'precision-rejected.dat'
Invoke-Expected 1 @($fractional,$rejected)
if (Test-Path -LiteralPath $rejected) { throw 'Strict precision rejection created an output file' }
Invoke-Expected 0 @('--round-time','nearest',$fractional,(Join-Path $output 'rounded.dat'))
$copy = Join-Path $output 'fractional-copy.dat64'
Invoke-Expected 0 @('--target','dat64-v2',$fractional,$copy)
if ((Get-FileHash -LiteralPath $fractional).Hash -ne (Get-FileHash -LiteralPath $copy).Hash) {
    throw 'v2 copy lost nanoseconds'
}
$stale = Join-Path $output 'v2-stale-crc.dat64'
[Dat64NanosecondRegression]::Patch($fractional,$stale,32,3735928559,$false)
$normalized = Join-Path $output 'v2-stale-crc-copy.dat64'
Invoke-Expected 0 @('--target','dat64-v2',$stale,$normalized)
if ((Get-FileHash -LiteralPath $fractional).Hash -ne (Get-FileHash -LiteralPath $normalized).Hash) {
    throw 'v2 stale CRC was not ignored and cleared'
}
# Music is the final fixed record before the 12-byte SyncBytes end marker.
# Its v2 length is 88 v1 bytes plus four expanded time fields.
$musicOffset = [IO.File]::ReadAllBytes($v2).Length - 12 - 104
$oldIntegerV2 = Join-Path $output 'old-integer-tempo-v2.dat64'
[Dat64NanosecondRegression]::Patch($v2,$oldIntegerV2,($musicOffset + 36),155,$false)
[Dat64NanosecondRegression]::Patch($oldIntegerV2,$oldIntegerV2,($musicOffset + 40),3,$false)
$upgradedTempo = Join-Path $output 'float-tempo-v32.dat64'
Invoke-Expected 0 @('--target','dat64-v3.2',$oldIntegerV2,$upgradedTempo)
$tempoBytes = [IO.File]::ReadAllBytes($upgradedTempo)
$musicOffset = $tempoBytes.Length - 12 - 104
if ([BitConverter]::ToUInt32($tempoBytes,8) -ne 3 -or
    [BitConverter]::ToUInt32($tempoBytes,36) -ne 0x10735 -or
    [BitConverter]::ToUInt32($tempoBytes,40) -ne 2 -or
    [BitConverter]::ToSingle($tempoBytes,($musicOffset + 36)) -ne 155.0 -or
    [BitConverter]::ToSingle($tempoBytes,($musicOffset + 40)) -ne 3.0) {
    throw 'Old v2 integer tempos were not upgraded numerically with the v3.2 header/schema'
}
$fractionalTempo = Join-Path $output 'fractional-tempo-v32.dat64'
[Dat64NanosecondRegression]::Patch($upgradedTempo,$fractionalTempo,($musicOffset + 36),([BitConverter]::SingleToUInt32Bits([single]155.25)),$false)
[Dat64NanosecondRegression]::Patch($fractionalTempo,$fractionalTempo,($musicOffset + 40),([BitConverter]::SingleToUInt32Bits([single]3.5)),$false)
$tempoCopy = Join-Path $output 'fractional-tempo-copy.dat64'
Invoke-Expected 0 @('--target','dat64-v3.2',$fractionalTempo,$tempoCopy)
if ((Get-FileHash -LiteralPath $fractionalTempo).Hash -ne (Get-FileHash -LiteralPath $tempoCopy).Hash) {
    throw 'v3.2 copy lost fractional tempos'
}
$integerTempo = Join-Path $output 'integer-tempo-v1.dat64'
Invoke-Expected 0 @('--target','dat64-v1',$fractionalTempo,$integerTempo)
$tempoBytes = [IO.File]::ReadAllBytes($integerTempo)
$v1MusicOffset = $tempoBytes.Length - 12 - 88
if ([BitConverter]::ToInt32($tempoBytes,($v1MusicOffset + 36)) -ne 155 -or
    [BitConverter]::ToInt32($tempoBytes,($v1MusicOffset + 40)) -ne 4) {
    throw 'Integer tempo export did not round numerically'
}
$integerV2 = Join-Path $output 'integer-tempo-v2.dat64'
Invoke-Expected 0 @('--target','dat64-v2',$fractionalTempo,$integerV2)
$tempoBytes = [IO.File]::ReadAllBytes($integerV2)
$v2MusicOffset = $tempoBytes.Length - 12 - 104
if ([BitConverter]::ToUInt32($tempoBytes,8) -ne 2 -or
    [BitConverter]::ToUInt32($tempoBytes,36) -ne 0x10732 -or
    [BitConverter]::ToInt32($tempoBytes,($v2MusicOffset + 36)) -ne 155 -or
    [BitConverter]::ToInt32($tempoBytes,($v2MusicOffset + 40)) -ne 4) {
    throw 'Explicit v2 export did not restore the old header and integer tempos'
}
foreach ($unsupported in @(@(0,0x10733),@(1,0x10734),@(0,0x10735),@(1,0x10735),@(2,0x10734),@(3,0x10735))) {
    $source = Join-Path $output "unsupported-$($unsupported[0])-$($unsupported[1]).dat64"
    $target = Join-Path $output "unsupported-output-$($unsupported[0])-$($unsupported[1]).dat64"
    [Dat64NanosecondRegression]::Patch($upgradedTempo,$source,36,$unsupported[1],$false)
    [Dat64NanosecondRegression]::Patch($source,$source,40,$unsupported[0],$false)
    $sourceHash = (Get-FileHash -LiteralPath $source).Hash
    Invoke-Expected 1 @('--target','dat64-v3.2',$source,$target)
    if ((Test-Path -LiteralPath $target) -or (Get-FileHash -LiteralPath $source).Hash -ne $sourceHash) {
        throw 'Unsupported input produced output or changed its source'
    }
}
foreach ($targetName in @('dat64-v3','dat64-v3.0','dat64-v3.1')) {
    $target = Join-Path $output "$targetName-rejected.dat64"
    Invoke-Expected 1 @('--target',$targetName,$fixturePath,$target)
    if (Test-Path -LiteralPath $target) { throw 'Unsupported target created output' }
}
Write-Host "PASS: legacy/v1/v2/v3.2, unsupported v3/v3.1 and mismatched headers/targets rejected, precise nanoseconds, float tempos, integer exports and explicit time rounding; fixtures: $output"
