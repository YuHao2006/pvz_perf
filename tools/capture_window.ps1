param(
    [Parameter(Mandatory = $true)]
    [string]$Title,
    [Parameter(Mandatory = $true)]
    [string]$OutPath
)

$ErrorActionPreference = "Stop"

Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;

public static class PvZWindowCapture
{
    [StructLayout(LayoutKind.Sequential)]
    public struct RECT { public int Left, Top, Right, Bottom; }

    [DllImport("user32.dll")]
    public static extern bool GetClientRect(IntPtr hWnd, out RECT rect);

    [DllImport("user32.dll")]
    public static extern bool PrintWindow(IntPtr hWnd, IntPtr hdc, uint flags);

    [DllImport("user32.dll")]
    public static extern IntPtr GetDC(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern int ReleaseDC(IntPtr hWnd, IntPtr hdc);

    [DllImport("gdi32.dll")]
    public static extern bool BitBlt(
        IntPtr destination,
        int x,
        int y,
        int width,
        int height,
        IntPtr source,
        int sourceX,
        int sourceY,
        uint rasterOperation);

    public static void Save(IntPtr hwnd, string path)
    {
        RECT rect;
        if (!GetClientRect(hwnd, out rect))
            throw new InvalidOperationException("GetClientRect failed");

        int width = Math.Max(1, rect.Right - rect.Left);
        int height = Math.Max(1, rect.Bottom - rect.Top);
        using (Bitmap bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb))
        using (Graphics graphics = Graphics.FromImage(bitmap))
        {
            IntPtr hdc = graphics.GetHdc();
            try
            {
                if (!PrintWindow(hwnd, hdc, 0x3))
                {
                    IntPtr windowDc = GetDC(hwnd);
                    try
                    {
                        if (windowDc == IntPtr.Zero ||
                            !BitBlt(hdc, 0, 0, width, height, windowDc, 0, 0, 0x00CC0020))
                        {
                            throw new InvalidOperationException("PrintWindow and BitBlt failed");
                        }
                    }
                    finally
                    {
                        if (windowDc != IntPtr.Zero)
                            ReleaseDC(hwnd, windowDc);
                    }
                }
            }
            finally
            {
                graphics.ReleaseHdc(hdc);
            }
            bitmap.Save(path, ImageFormat.Png);
        }
    }
}
'@

$process = Get-Process -ErrorAction SilentlyContinue |
    Where-Object { $_.MainWindowTitle -eq $Title -and $_.MainWindowHandle -ne 0 } |
    Select-Object -First 1
if ($null -eq $process) {
    throw "Window not found: '$Title'"
}

$fullPath = [System.IO.Path]::GetFullPath($OutPath)
$directory = [System.IO.Path]::GetDirectoryName($fullPath)
[System.IO.Directory]::CreateDirectory($directory) | Out-Null
[PvZWindowCapture]::Save($process.MainWindowHandle, $fullPath)
Write-Output $fullPath
