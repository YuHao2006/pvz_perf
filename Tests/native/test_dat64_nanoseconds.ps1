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
foreach ($bad in @(@(8,3),@(20,1),@(36,0x10731))) {
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
Write-Host "PASS: editable v1/v2 payloads without CRC updates, version dispatch, header rejection, precise roundtrip and explicit rounding; fixtures: $output"
