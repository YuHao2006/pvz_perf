param(
    [Parameter(Mandatory = $true)]
    [string] $RunDirectory,

    [ValidateSet("StartAdventure", "Achievements", "LevelOneAward", "Zombatar", "ZombatarFirstUse")]
    [string] $Scenario = "StartAdventure",

    [string] $ProfileName = "",

    [switch] $Force3D
)

$ErrorActionPreference = "Stop"

Add-Type @'
using System;
using System.Runtime.InteropServices;
using System.Threading;

public static class PvZRegressionWin32
{
    [StructLayout(LayoutKind.Sequential)]
    public struct Point
    {
        public int X;
        public int Y;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct Rect
    {
        public int Left;
        public int Top;
        public int Right;
        public int Bottom;
    }

    [DllImport("user32.dll")]
    public static extern bool PostMessage(
        IntPtr window,
        uint message,
        UIntPtr wParam,
        IntPtr lParam);

    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int index);

    [DllImport("user32.dll")]
    public static extern bool ClientToScreen(IntPtr window, ref Point point);

    [DllImport("user32.dll")]
    public static extern bool GetClientRect(IntPtr window, out Rect rect);

    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr window);

    [DllImport("user32.dll")]
    public static extern void mouse_event(
        uint flags,
        uint dx,
        uint dy,
        uint data,
        UIntPtr extraInfo);

    public const uint KeyDown = 0x0100;
    public const uint KeyUp = 0x0101;
    public const uint Character = 0x0102;
    public const uint ActivateApp = 0x001C;
    public const uint MouseMove = 0x0200;
    public const uint LeftButtonDown = 0x0201;
    public const uint LeftButtonUp = 0x0202;
    public const uint Close = 0x0010;
    public const uint MouseEventLeftDown = 0x0002;
    public const uint MouseEventLeftUp = 0x0004;

    public static void SendKey(IntPtr window, int key)
    {
        PostMessage(window, KeyDown, (UIntPtr)(uint)key, IntPtr.Zero);
        PostMessage(window, KeyUp, (UIntPtr)(uint)key, IntPtr.Zero);
    }

    public static void EnableDebugKeys(IntPtr window)
    {
        PostMessage(window, KeyDown, (UIntPtr)0x11, IntPtr.Zero); // Control
        PostMessage(window, KeyDown, (UIntPtr)0x12, IntPtr.Zero); // Alt
        SendKey(window, 0x44); // D
        PostMessage(window, KeyUp, (UIntPtr)0x12, IntPtr.Zero);
        PostMessage(window, KeyUp, (UIntPtr)0x11, IntPtr.Zero);
    }

    public static void SendChar(IntPtr window, char character)
    {
        PostMessage(window, Character, (UIntPtr)character, IntPtr.Zero);
    }

    public static void Click(IntPtr window, int x, int y)
    {
        PostMessage(window, ActivateApp, (UIntPtr)1, IntPtr.Zero);
        SetForegroundWindow(window);

        Rect client;
        if (!GetClientRect(window, out client))
            throw new InvalidOperationException("GetClientRect failed.");

        int clientWidth = client.Right - client.Left;
        int clientHeight = client.Bottom - client.Top;
        Point point = new Point {
            X = (int)((long)x * clientWidth / 800),
            Y = (int)((long)y * clientHeight / 600)
        };
        if (!ClientToScreen(window, ref point))
            throw new InvalidOperationException("ClientToScreen failed.");
        if (!SetCursorPos(point.X, point.Y))
            throw new InvalidOperationException("SetCursorPos failed.");

        Thread.Sleep(50);
        mouse_event(MouseEventLeftDown, 0, 0, 0, UIntPtr.Zero);
        Thread.Sleep(50);
        mouse_event(MouseEventLeftUp, 0, 0, 0, UIntPtr.Zero);
    }
}
'@

function Wait-ForMainWindow {
    param(
        [Parameter(Mandatory = $true)]
        [System.Diagnostics.Process] $Process,

        [int] $TimeoutSeconds = 20
    )

    $deadline = [DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    do {
        Start-Sleep -Milliseconds 200
        $Process.Refresh()
        if ($Process.HasExited) {
            throw "Game exited before creating its main window (exit code $($Process.ExitCode))."
        }

        if ($Process.MainWindowHandle -ne [IntPtr]::Zero) {
            return $Process.MainWindowHandle
        }
    } while ([DateTime]::UtcNow -lt $deadline)

    throw "Timed out waiting for the game window."
}

function Save-GameScreenshot {
    param(
        [Parameter(Mandatory = $true)]
        [IntPtr] $Window,

        [Parameter(Mandatory = $true)]
        [string] $ScreenshotDirectory,

        [Parameter(Mandatory = $true)]
        [string] $Name,

        [int] $TimeoutSeconds = 5
    )

    $before = @(Get-ChildItem -LiteralPath $ScreenshotDirectory -Filter "*.png" -File -ErrorAction SilentlyContinue)
    [PvZRegressionWin32]::SendKey($Window, 0x7A) # F11

    $deadline = [DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    do {
        Start-Sleep -Milliseconds 100
        $after = @(Get-ChildItem -LiteralPath $ScreenshotDirectory -Filter "*.png" -File -ErrorAction SilentlyContinue)
        $created = @($after | Where-Object { $_.FullName -notin $before.FullName })
        if ($created.Count -eq 1) {
            $destination = Join-Path $ScreenshotDirectory ($Name + ".png")
            try {
                Move-Item -LiteralPath $created[0].FullName -Destination $destination -Force
                return Get-Item -LiteralPath $destination
            }
            catch [System.IO.IOException] {
                # The PNG writer has created the directory entry but has not yet
                # closed the file. Retry until the screenshot deadline.
            }
        }
    } while ([DateTime]::UtcNow -lt $deadline)

    throw "The game did not produce screenshot '$Name'."
}

function Wait-ForGameReadyScreenshot {
    param(
        [Parameter(Mandatory = $true)]
        [System.Diagnostics.Process] $Process,

        [Parameter(Mandatory = $true)]
        [IntPtr] $Window,

        [Parameter(Mandatory = $true)]
        [string] $ScreenshotDirectory,

        [int] $TimeoutSeconds = 90,

        [int] $MinimumScreenshotBytes = 100000
    )

    $deadline = [DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    do {
        $Process.Refresh()
        if ($Process.HasExited) {
            throw "Game exited before producing its first capturable frame (exit code $($Process.ExitCode))."
        }

        try {
            $capture = Save-GameScreenshot `
                -Window $Window `
                -ScreenshotDirectory $ScreenshotDirectory `
                -Name "00-startup-ready" `
                -TimeoutSeconds 3
            if ($capture.Length -ge $MinimumScreenshotBytes) {
                return $capture
            }

            # A newly created window can remain in the framework's inactive
            # black-frame state until it receives real foreground input. The
            # logical center is inert during loading and only dismisses the
            # title screen once loading has completed.
            [PvZRegressionWin32]::Click($Window, 400, 300)
            Start-Sleep -Milliseconds 500
        }
        catch {
            if ([DateTime]::UtcNow -ge $deadline) {
                throw "Timed out waiting for the first capturable game frame."
            }
        }
    } while ([DateTime]::UtcNow -lt $deadline)

    throw "Timed out waiting for the first capturable game frame."
}

function Measure-SampledFrameDifference {
    param(
        [Parameter(Mandatory = $true)]
        [string] $First,

        [Parameter(Mandatory = $true)]
        [string] $Second
    )

    Add-Type -AssemblyName System.Drawing
    $firstBitmap = [System.Drawing.Bitmap]::new([string](Resolve-Path -LiteralPath $First))
    $secondBitmap = [System.Drawing.Bitmap]::new([string](Resolve-Path -LiteralPath $Second))
    try {
        if ($firstBitmap.Width -ne $secondBitmap.Width -or
            $firstBitmap.Height -ne $secondBitmap.Height) {
            throw "Cannot compare screenshots with different dimensions."
        }

        [long] $changed = 0
        [long] $sampleCount = 0
        for ($y = 0; $y -lt $firstBitmap.Height; $y += 4) {
            for ($x = 0; $x -lt $firstBitmap.Width; $x += 4) {
                $firstPixel = $firstBitmap.GetPixel($x, $y)
                $secondPixel = $secondBitmap.GetPixel($x, $y)
                $delta = [Math]::Abs([int] $firstPixel.R - [int] $secondPixel.R) +
                    [Math]::Abs([int] $firstPixel.G - [int] $secondPixel.G) +
                    [Math]::Abs([int] $firstPixel.B - [int] $secondPixel.B)
                if ($delta -gt 30) {
                    $changed++
                }
                $sampleCount++
            }
        }

        return 100.0 * $changed / $sampleCount
    }
    finally {
        $firstBitmap.Dispose()
        $secondBitmap.Dispose()
    }
}

function Measure-RegionFrameDifference {
    param(
        [Parameter(Mandatory = $true)]
        [string] $First,

        [Parameter(Mandatory = $true)]
        [string] $Second,

        [Parameter(Mandatory = $true)]
        [int] $X,

        [Parameter(Mandatory = $true)]
        [int] $Y,

        [Parameter(Mandatory = $true)]
        [int] $Width,

        [Parameter(Mandatory = $true)]
        [int] $Height
    )

    Add-Type -AssemblyName System.Drawing
    $firstBitmap = [System.Drawing.Bitmap]::new([string](Resolve-Path -LiteralPath $First))
    $secondBitmap = [System.Drawing.Bitmap]::new([string](Resolve-Path -LiteralPath $Second))
    try {
        if ($firstBitmap.Width -ne $secondBitmap.Width -or
            $firstBitmap.Height -ne $secondBitmap.Height) {
            throw "Cannot compare screenshots with different dimensions."
        }

        $left = [Math]::Max(0, $X)
        $top = [Math]::Max(0, $Y)
        $right = [Math]::Min($firstBitmap.Width, $X + $Width)
        $bottom = [Math]::Min($firstBitmap.Height, $Y + $Height)
        if ($right -le $left -or $bottom -le $top) {
            throw "Screenshot comparison region is empty."
        }

        [long] $changed = 0
        [long] $sampleCount = 0
        for ($y = $top; $y -lt $bottom; $y += 4) {
            for ($x = $left; $x -lt $right; $x += 4) {
                $firstPixel = $firstBitmap.GetPixel($x, $y)
                $secondPixel = $secondBitmap.GetPixel($x, $y)
                $delta = [Math]::Abs([int] $firstPixel.R - [int] $secondPixel.R) +
                    [Math]::Abs([int] $firstPixel.G - [int] $secondPixel.G) +
                    [Math]::Abs([int] $firstPixel.B - [int] $secondPixel.B)
                if ($delta -gt 30) {
                    $changed++
                }
                $sampleCount++
            }
        }

        return 100.0 * $changed / $sampleCount
    }
    finally {
        $firstBitmap.Dispose()
        $secondBitmap.Dispose()
    }
}

$runPath = (Resolve-Path -LiteralPath $RunDirectory).Path
$executable = Join-Path $runPath "SexyAppFramework.exe"
if (-not (Test-Path -LiteralPath $executable -PathType Leaf)) {
    throw "Executable not found: $executable"
}

$dataPath = (Join-Path $runPath "data") + [IO.Path]::DirectorySeparatorChar
$screenshotPath = Join-Path $dataPath "_screenshots"
New-Item -ItemType Directory -Path $screenshotPath -Force | Out-Null
Get-ChildItem -LiteralPath $screenshotPath -Filter "*.png" -File -ErrorAction SilentlyContinue |
    ForEach-Object { Remove-Item -LiteralPath $_.FullName -Force }

$desktopBefore = "{0}x{1}" -f `
    [PvZRegressionWin32]::GetSystemMetrics(0), `
    [PvZRegressionWin32]::GetSystemMetrics(1)

$previousAppData = $env:PVZ_APPDATA_DIR
$previousRegistryKey = $env:PVZ_REGISTRY_KEY
$previousD3DDiagnostics = $env:PVZ_D3D_TEST_DIAGNOSTICS
$env:PVZ_APPDATA_DIR = $dataPath
$env:PVZ_REGISTRY_KEY = "PopCap\PlantsVsZombies\CodexRegression\$Scenario"
$env:PVZ_D3D_TEST_DIAGNOSTICS = "1"
$registryPath = "Registry::HKEY_CURRENT_USER\SOFTWARE\$($env:PVZ_REGISTRY_KEY)"
if (Test-Path -LiteralPath $registryPath) {
    Remove-Item -LiteralPath $registryPath -Recurse -Force
}
if (-not [string]::IsNullOrEmpty($ProfileName) -or $Force3D) {
    New-Item -Path $registryPath -Force | Out-Null
}
if (-not [string]::IsNullOrEmpty($ProfileName)) {
    New-ItemProperty `
        -LiteralPath $registryPath `
        -Name "CurUser" `
        -Value $ProfileName `
        -PropertyType String `
        -Force | Out-Null
}
if ($Force3D) {
    New-ItemProperty `
        -LiteralPath $registryPath `
        -Name "Is3D" `
        -Value 1 `
        -PropertyType DWord `
        -Force | Out-Null
}

$process = $null
$test3DResult = $null
$is3DActive = $false
$captures = @()

try {
    $process = Start-Process -FilePath $executable -WorkingDirectory $runPath -PassThru
    $window = Wait-ForMainWindow -Process $process
    [PvZRegressionWin32]::EnableDebugKeys($window)
    Start-Sleep -Milliseconds 250

    $captures += Wait-ForGameReadyScreenshot `
        -Process $process `
        -Window $window `
        -ScreenshotDirectory $screenshotPath

    # The first drawable frame can still be the loading screen. Repeating this
    # harmless center click dismisses the title screen as soon as it is ready;
    # the same location does not activate a main-menu control.
    1..6 | ForEach-Object {
        [PvZRegressionWin32]::Click($window, 400, 300)
        Start-Sleep -Seconds 2
    }
    Start-Sleep -Seconds 6

    switch ($Scenario) {
        "StartAdventure" {
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "01-main-menu"

            [PvZRegressionWin32]::Click($window, 600, 135)
            Start-Sleep -Milliseconds 1200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "02-start-animation"
            Start-Sleep -Milliseconds 5200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "03-popcap-presents"
            Start-Sleep -Milliseconds 3700
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "04-pvz-logo"
            Start-Sleep -Milliseconds 9200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "05-level-1-1"
        }
        "Achievements" {
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "01-main-menu"

            [PvZRegressionWin32]::Click($window, 80, 535)
            Start-Sleep -Milliseconds 250
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "02-achievements-transition"
            Start-Sleep -Milliseconds 1000
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "03-achievements"

            [PvZRegressionWin32]::Click($window, 180, 75)
            Start-Sleep -Milliseconds 250
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "04-return-transition"
            Start-Sleep -Milliseconds 1000
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "05-returned-menu"
        }
        "LevelOneAward" {
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "01-main-menu"

            [PvZRegressionWin32]::Click($window, 600, 135)
            Start-Sleep -Seconds 20
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "02-level-1-1"

            [PvZRegressionWin32]::SendChar($window, '!')
            Start-Sleep -Seconds 4
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "03-level-1-1-achievement"

            [PvZRegressionWin32]::Click($window, 400, 535)
            Start-Sleep -Seconds 1
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "04-level-1-1-reward"
        }
        "Zombatar" {
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "01-main-menu"

            # The 1073 woodsign3 track settles at logical (32, 180).
            [PvZRegressionWin32]::Click($window, 100, 220)
            Start-Sleep -Milliseconds 1200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "02-zombatar"

            # Hair category, first item, and the first hair palette color.
            [PvZRegressionWin32]::Click($window, 72, 165)
            [PvZRegressionWin32]::Click($window, 198, 172)
            [PvZRegressionWin32]::Click($window, 248, 378)
            Start-Sleep -Milliseconds 500
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "03-zombatar-edited"

            [PvZRegressionWin32]::Click($window, 485, 495)
            Start-Sleep -Milliseconds 2100
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "04-zombatar-confirm"

            [PvZRegressionWin32]::Click($window, 420, 370)
            Start-Sleep -Milliseconds 2100
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "05-zombatar-returned-editor"

            [PvZRegressionWin32]::Click($window, 310, 550)
            Start-Sleep -Milliseconds 1200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "06-returned-menu"
        }
        "ZombatarFirstUse" {
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "01-main-menu"

            [PvZRegressionWin32]::Click($window, 100, 220)
            Start-Sleep -Milliseconds 1200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "02-zombatar-tos"

            # The centered 450x344 1073 TOS dialog places the affirmative
            # stone button in the lower-left half of the panel.
            [PvZRegressionWin32]::Click($window, 285, 430)
            Start-Sleep -Milliseconds 1500
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "03-zombatar-editor"

            [PvZRegressionWin32]::Click($window, 72, 165)
            [PvZRegressionWin32]::Click($window, 198, 172)
            [PvZRegressionWin32]::Click($window, 248, 378)
            Start-Sleep -Milliseconds 500
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "04-zombatar-edited"

            [PvZRegressionWin32]::Click($window, 485, 495)
            Start-Sleep -Milliseconds 2100
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "05-zombatar-confirm"

            [PvZRegressionWin32]::Click($window, 420, 370)
            Start-Sleep -Milliseconds 2100
            [PvZRegressionWin32]::Click($window, 310, 550)
            Start-Sleep -Milliseconds 1200
            $captures += Save-GameScreenshot -Window $window -ScreenshotDirectory $screenshotPath -Name "06-returned-menu"
        }
    }

    [PvZRegressionWin32]::PostMessage(
        $window,
        [PvZRegressionWin32]::Close,
        [UIntPtr]::Zero,
        [IntPtr]::Zero) | Out-Null

    if (-not $process.WaitForExit(15000)) {
        throw "Game did not close gracefully within 15 seconds."
    }
}
finally {
    if ($null -ne $process -and -not $process.HasExited) {
        $process.Refresh()
        if ($process.MainWindowHandle -ne [IntPtr]::Zero) {
            [PvZRegressionWin32]::PostMessage(
                $process.MainWindowHandle,
                [PvZRegressionWin32]::Close,
                [UIntPtr]::Zero,
                [IntPtr]::Zero) | Out-Null
            $process.WaitForExit(10000) | Out-Null
        }

        if (-not $process.HasExited) {
            Stop-Process -Id $process.Id -Force
            $process.WaitForExit(5000) | Out-Null
        }
    }

    $test3DPath = Join-Path $registryPath "Test3D"
    if (Test-Path -LiteralPath $test3DPath) {
        $test3DValues = Get-ItemProperty -LiteralPath $test3DPath
        $test3DResult = [pscustomobject]@{
            FailureReason = [string]$test3DValues.FailureReason
            Warning = [string]$test3DValues.Warning
        }
    }

    if (Test-Path -LiteralPath $registryPath) {
        if (Test-Path -LiteralPath $test3DPath) {
            $runtime3DValues = Get-ItemProperty -LiteralPath $test3DPath
            $is3DActive = [int] $runtime3DValues.Active -ne 0
        }
        Remove-Item -LiteralPath $registryPath -Recurse -Force
    }
    $env:PVZ_APPDATA_DIR = $previousAppData
    $env:PVZ_REGISTRY_KEY = $previousRegistryKey
    $env:PVZ_D3D_TEST_DIAGNOSTICS = $previousD3DDiagnostics
}

$desktopAfter = "{0}x{1}" -f `
    [PvZRegressionWin32]::GetSystemMetrics(0), `
    [PvZRegressionWin32]::GetSystemMetrics(1)

$stateChecks = [ordered]@{}
switch ($Scenario) {
    "StartAdventure" {
        $stateChecks.MenuToPopCap = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "01-main-menu.png") `
            -Second (Join-Path $screenshotPath "03-popcap-presents.png")
        $stateChecks.LogoToLevel = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "04-pvz-logo.png") `
            -Second (Join-Path $screenshotPath "05-level-1-1.png")
        # The 1073 intro keeps the left lawn/background stable while the
        # board and logo transition across the right side.  Gate that moving
        # region instead of requiring a whole-frame replacement.
        $stateChecks.LogoToLevelPanel = Measure-RegionFrameDifference `
            -First (Join-Path $screenshotPath "04-pvz-logo.png") `
            -Second (Join-Path $screenshotPath "05-level-1-1.png") `
            -X 500 -Y 0 -Width 300 -Height 600
    }
    "Achievements" {
        $stateChecks.MenuToAchievements = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "01-main-menu.png") `
            -Second (Join-Path $screenshotPath "03-achievements.png")
        $stateChecks.AchievementsToReturnedMenu = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "03-achievements.png") `
            -Second (Join-Path $screenshotPath "05-returned-menu.png")
        $stateChecks.MenuRoundTrip = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "01-main-menu.png") `
            -Second (Join-Path $screenshotPath "05-returned-menu.png")
    }
    "LevelOneAward" {
        $stateChecks.LevelToAchievement = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "02-level-1-1.png") `
            -Second (Join-Path $screenshotPath "03-level-1-1-achievement.png")
        $stateChecks.AchievementToReward = Measure-SampledFrameDifference `
            -First (Join-Path $screenshotPath "03-level-1-1-achievement.png") `
            -Second (Join-Path $screenshotPath "04-level-1-1-reward.png")
    }
    "Zombatar" {
        $stateChecks.MenuToZombatar = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "01-main-menu.png") -Second (Join-Path $screenshotPath "02-zombatar.png")
        $stateChecks.EditorToConfirmation = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "03-zombatar-edited.png") -Second (Join-Path $screenshotPath "04-zombatar-confirm.png")
        # The editor and confirmation page intentionally share the 1073
        # background and portrait.  Measure the central confirmation panel
        # for the pass/fail gate, while retaining the full-frame value above
        # as a diagnostic signal.
        $stateChecks.EditorToConfirmationPanel = Measure-RegionFrameDifference `
            -First (Join-Path $screenshotPath "03-zombatar-edited.png") `
            -Second (Join-Path $screenshotPath "04-zombatar-confirm.png") `
            -X 100 -Y 100 -Width 600 -Height 400
        $stateChecks.ZombatarMenuRoundTrip = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "01-main-menu.png") -Second (Join-Path $screenshotPath "06-returned-menu.png")
    }
    "ZombatarFirstUse" {
        $stateChecks.MenuToTOS = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "01-main-menu.png") -Second (Join-Path $screenshotPath "02-zombatar-tos.png")
        $stateChecks.MenuToTOSPanel = Measure-RegionFrameDifference `
            -First (Join-Path $screenshotPath "01-main-menu.png") `
            -Second (Join-Path $screenshotPath "02-zombatar-tos.png") `
            -X 150 -Y 100 -Width 500 -Height 380
        $stateChecks.TOSToEditor = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "02-zombatar-tos.png") -Second (Join-Path $screenshotPath "03-zombatar-editor.png")
        $stateChecks.EditorToConfirmation = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "04-zombatar-edited.png") -Second (Join-Path $screenshotPath "05-zombatar-confirm.png")
        $stateChecks.EditorToConfirmationPanel = Measure-RegionFrameDifference `
            -First (Join-Path $screenshotPath "04-zombatar-edited.png") `
            -Second (Join-Path $screenshotPath "05-zombatar-confirm.png") `
            -X 100 -Y 100 -Width 600 -Height 400
        $stateChecks.ZombatarMenuRoundTrip = Measure-SampledFrameDifference -First (Join-Path $screenshotPath "01-main-menu.png") -Second (Join-Path $screenshotPath "06-returned-menu.png")
    }
}

$result = [pscustomobject]@{
    Scenario = $Scenario
    ProcessId = $process.Id
    ExitCode = $process.ExitCode
    DesktopBefore = $desktopBefore
    DesktopAfter = $desktopAfter
    D3DSupported = $null -ne $test3DResult -and [string]::IsNullOrEmpty($test3DResult.FailureReason)
    D3DFailureReason = if ($null -ne $test3DResult) { $test3DResult.FailureReason } else { "Test3D result missing" }
    D3DWarning = if ($null -ne $test3DResult) { $test3DResult.Warning } else { "" }
    Is3DActive = $is3DActive
    Screenshots = @($captures).Count
    ScreenshotDirectory = $screenshotPath
    StateChecks = ($stateChecks.GetEnumerator() | ForEach-Object {
        "{0}={1:N2}%" -f $_.Key, $_.Value
    }) -join "; "
}

$result | Format-List
$captures | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize

if ($result.ExitCode -ne 0) {
    throw "Game exited with code $($result.ExitCode)."
}
if ($result.DesktopBefore -ne $result.DesktopAfter) {
    throw "Desktop resolution changed from $($result.DesktopBefore) to $($result.DesktopAfter)."
}

if (-not $result.D3DSupported) {
    throw "Direct3D 7 acceleration probe failed: $($result.D3DFailureReason)"
}
if ($Force3D -and -not $result.Is3DActive) {
    throw "Direct3D acceleration was requested but the game disabled it."
}

foreach ($check in $stateChecks.GetEnumerator()) {
    if ($check.Key -in @("MenuRoundTrip", "ZombatarMenuRoundTrip")) {
        if ($check.Value -gt 15.0) {
            throw "UI round-trip did not return to the menu: $($check.Key)=$($check.Value)%"
        }
    }
    elseif ($check.Key -in @("EditorToConfirmation", "LogoToLevel")) {
        # Full-frame editor/confirmation differences are intentionally lower
        # because the official page/intro keeps most of the scene unchanged.
        continue
    }
    elseif ($check.Key -eq "LogoToLevelPanel") {
        if ($check.Value -lt 15.0) {
            throw "Expected level intro movement was not observed: $($check.Key)=$($check.Value)%"
        }
    }
    elseif ($check.Key -eq "MenuToTOS") {
        continue
    }
    elseif ($check.Value -lt 50.0) {
        throw "Expected scene transition was not observed: $($check.Key)=$($check.Value)%"
    }
}
