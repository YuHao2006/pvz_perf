param(
    [Parameter(Mandatory = $true)][string]$Title,
    [Parameter(Mandatory = $true)][int]$X,
    [Parameter(Mandatory = $true)][int]$Y
)
$ErrorActionPreference = "Stop"
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public static class PvZClick
{
    [StructLayout(LayoutKind.Sequential)]
    public struct POINT { public int X, Y; }

    [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr hWnd);
    [DllImport("user32.dll")] public static extern bool ClientToScreen(IntPtr hWnd, ref POINT p);
    [DllImport("user32.dll")] public static extern int GetSystemMetrics(int index);
    [DllImport("user32.dll")] public static extern bool SetProcessDPIAware();

    [DllImport("user32.dll")]
    public static extern uint SendInput(uint n, INPUT[] inputs, int size);

    [StructLayout(LayoutKind.Sequential)]
    public struct INPUT
    {
        public uint type;
        public MOUSEINPUT mi;
    }
    [StructLayout(LayoutKind.Sequential)]
    public struct MOUSEINPUT
    {
        public int dx, dy;
        public uint mouseData, dwFlags, time;
        public IntPtr dwExtraInfo;
    }
    public const uint MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const uint MOUSEEVENTF_LEFTUP   = 0x0004;
    public const uint MOUSEEVENTF_ABSOLUTE = 0x8000;

    public static void Click(IntPtr hwnd, int cx, int cy)
    {
        SetProcessDPIAware();
        SetForegroundWindow(hwnd);
        System.Threading.Thread.Sleep(150);
        POINT p = new POINT { X = cx, Y = cy };
        ClientToScreen(hwnd, ref p);
        // move + down + up via absolute coordinates
        INPUT[] inp = new INPUT[3];
        int px = p.X * 65535 / GetSystemMetrics(0);
        int py = p.Y * 65535 / GetSystemMetrics(1);
        inp[0].type = 0; inp[0].mi.dx = px; inp[0].mi.dy = py;
        inp[0].mi.dwFlags = MOUSEEVENTF_ABSOLUTE | 0x0001;
        inp[1].type = 0; inp[1].mi.dx = px; inp[1].mi.dy = py;
        inp[1].mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTDOWN;
        inp[2].type = 0; inp[2].mi.dx = px; inp[2].mi.dy = py;
        inp[2].mi.dwFlags = MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_LEFTUP;
        SendInput(3, inp, Marshal.SizeOf(typeof(INPUT)));
    }
}
'@
$proc = Get-Process -ErrorAction SilentlyContinue |
    Where-Object { $_.MainWindowTitle -eq $Title -and $_.MainWindowHandle -ne 0 } |
    Select-Object -First 1
if ($null -eq $proc) { throw "Window not found: '$Title'" }
[PvZClick]::Click($proc.MainWindowHandle, $X, $Y)
Write-Output "clicked $Title at client ($X,$Y) pid=$($proc.Id)"
