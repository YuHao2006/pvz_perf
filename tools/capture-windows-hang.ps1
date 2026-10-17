param([int]$TargetProcessId = 0)
$ErrorActionPreference = 'Stop'
if (![Environment]::Is64BitProcess) { throw 'Run this script in 64-bit PowerShell.' }
$projectRoot = Split-Path -Parent $PSScriptRoot
$runtime = Join-Path $projectRoot 'out/x64-win32-dx12/Release'
$executable = Join-Path $runtime 'pvz_perf.exe'
if ($TargetProcessId) {
    $target = Get-Process -Id $TargetProcessId
} else {
    $candidates = @(Get-Process -Name pvz_perf -ErrorAction SilentlyContinue |
        Where-Object { $_.Path -eq $executable })
    if ($candidates.Count -ne 1) {
        throw 'Expected one running DX12 game; specify -TargetProcessId for another game build.'
    }
    $target = $candidates[0]
}
if ($target.ProcessName -notmatch '^(pvz_perf|PlantsVsZombiesModern(?:-test)?)$') {
    throw 'The selected process is not a pvz_perf or frozen comparison game.'
}

if (!('PvzExternalHangDump' -as [type])) {
    Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;

public static class PvzExternalHangDump
{
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern SafeProcessHandle OpenProcess(
        UInt32 access, bool inheritHandle, UInt32 processId);

    [DllImport("dbghelp.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool MiniDumpWriteDump(
        SafeProcessHandle process, UInt32 processId, SafeFileHandle file,
        UInt32 dumpType, IntPtr exception, IntPtr userStreams, IntPtr callback);
}
'@
}

$run = Join-Path $projectRoot ('log/windows-hang-' +
    (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $run | Out-Null
$dump = Join-Path $run 'game.dmp'
$metadata = [ordered]@{
    processId = $target.Id
    executable = $target.Path
    executableSha256 = (Get-FileHash -LiteralPath $target.Path -Algorithm SHA256).Hash
    processStartedUtc = $target.StartTime.ToUniversalTime().ToString('o')
    captureStartedUtc = [DateTime]::UtcNow.ToString('o')
    captureFinishedUtc = $null
    captureKind = 'external-full-memory-thread-handle-dump'
    dump = $dump
    status = 'capturing'
}
$processHandle = [PvzExternalHangDump]::OpenProcess(0x450, $false, $target.Id)
if ($processHandle.IsInvalid) {
    $errorCode = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
    $processHandle.Dispose()
    throw [ComponentModel.Win32Exception]::new($errorCode)
}
try {
    $file = [IO.File]::Open($dump, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write,
        [IO.FileShare]::None)
    try {
        # Full memory, handles, unloaded modules, memory regions and thread metadata.
        $ok = [PvzExternalHangDump]::MiniDumpWriteDump($processHandle, $target.Id,
            $file.SafeFileHandle, 0x1826, [IntPtr]::Zero, [IntPtr]::Zero, [IntPtr]::Zero)
        if (!$ok) {
            $errorCode = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
            throw [ComponentModel.Win32Exception]::new($errorCode)
        }
        $metadata.status = 'captured'
    } finally { $file.Dispose() }
} finally {
    $processHandle.Dispose()
    $metadata.captureFinishedUtc = [DateTime]::UtcNow.ToString('o')
    [IO.File]::WriteAllText((Join-Path $run 'capture.json'), ($metadata | ConvertTo-Json))
}
Write-Output "Captured: $dump"
