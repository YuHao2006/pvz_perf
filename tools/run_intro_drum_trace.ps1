param(
    [Parameter(Mandatory = $true)]
    [string] $RunDirectory
)

$ErrorActionPreference = "Stop"

Add-Type @'
using System;
using System.Runtime.InteropServices;

public static class IntroDrumTraceWin32
{
    [DllImport("user32.dll")]
    public static extern bool PostMessage(
        IntPtr window,
        uint message,
        UIntPtr wParam,
        IntPtr lParam);

    public const uint KeyDown = 0x0100;
    public const uint KeyUp = 0x0101;
    public const uint Close = 0x0010;
}
'@

$runPath = (Resolve-Path -LiteralPath $RunDirectory).Path
$executable = Join-Path $runPath "SexyAppFramework.exe"
if (-not (Test-Path -LiteralPath $executable -PathType Leaf)) {
    throw "Executable not found: $executable"
}

$dataPath = Join-Path $runPath "data"
New-Item -ItemType Directory -Path $dataPath -Force | Out-Null

$previousAppData = $env:PVZ_APPDATA_DIR
$previousRegistryKey = $env:PVZ_REGISTRY_KEY
$previousTrace = $env:PVZ_RUNTIME_TRACE

$tracePath = Join-Path $dataPath "intro-music-trace.csv"
$env:PVZ_APPDATA_DIR = $dataPath
$env:PVZ_REGISTRY_KEY = "PopCap\PlantsVsZombies\CodexIntroDrumTrace"
$env:PVZ_RUNTIME_TRACE = $tracePath

$registryPath = "Registry::HKEY_CURRENT_USER\SOFTWARE\$($env:PVZ_REGISTRY_KEY)"
if (Test-Path -LiteralPath $registryPath) {
    Remove-Item -LiteralPath $registryPath -Recurse -Force
}

$process = $null
try {
    $process = Start-Process -FilePath $executable -WorkingDirectory $runPath -ArgumentList "-tod" -PassThru

    $deadline = [DateTime]::UtcNow.AddSeconds(30)
    do {
        Start-Sleep -Milliseconds 200
        $process.Refresh()
        if ($process.HasExited) {
            throw "Game exited before creating its main window (exit code $($process.ExitCode))."
        }
        if ($process.MainWindowHandle -ne [IntPtr]::Zero) {
            break
        }
    } while ([DateTime]::UtcNow -lt $deadline)

    if ($process.MainWindowHandle -eq [IntPtr]::Zero) {
        throw "Timed out waiting for the game window."
    }

    $window = $process.MainWindowHandle

    # Press 'I' while the title/loading screen is still present. With -tod this
    # is recorded as a quick-load request and starts the PopCap intro once the
    # loading thread completes.
    [IntroDrumTraceWin32]::PostMessage($window, [IntroDrumTraceWin32]::KeyDown, [UIntPtr]0x49, [IntPtr]::Zero) | Out-Null
    [IntroDrumTraceWin32]::PostMessage($window, [IntroDrumTraceWin32]::KeyUp, [UIntPtr]0x49, [IntPtr]::Zero) | Out-Null

    Start-Sleep -Seconds 22

    [IntroDrumTraceWin32]::PostMessage($window, [IntroDrumTraceWin32]::Close, [UIntPtr]::Zero, [IntPtr]::Zero) | Out-Null
    if (-not $process.WaitForExit(15000)) {
        throw "Game did not close gracefully within 15 seconds."
    }
}
finally {
    if ($null -ne $process -and -not $process.HasExited) {
        $process.Refresh()
        if ($process.MainWindowHandle -ne [IntPtr]::Zero) {
            [IntroDrumTraceWin32]::PostMessage(
                $process.MainWindowHandle,
                [IntroDrumTraceWin32]::Close,
                [UIntPtr]::Zero,
                [IntPtr]::Zero) | Out-Null
            $process.WaitForExit(10000) | Out-Null
        }
        if (-not $process.HasExited) {
            Stop-Process -Id $process.Id -Force
            $process.WaitForExit(5000) | Out-Null
        }
    }

    if (Test-Path -LiteralPath $registryPath) {
        Remove-Item -LiteralPath $registryPath -Recurse -Force
    }
    $env:PVZ_APPDATA_DIR = $previousAppData
    $env:PVZ_REGISTRY_KEY = $previousRegistryKey
    $env:PVZ_RUNTIME_TRACE = $previousTrace
}

Write-Output "trace=$tracePath"
Write-Output "exitCode=$($process.ExitCode)"
