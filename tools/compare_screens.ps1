<#
.SYNOPSIS
  Captures the original 1073 window and the legacy window side by side and
  reports a per-pixel difference (with a highlighted diff image).

.DESCRIPTION
  - Finds windows by exact title.
  - Captures the client area with PrintWindow (DWM-compatible).
  - By default quantizes the legacy capture to RGB565 before comparing,
    because the original uploads 16-bit textures to the GPU while the legacy
    D3D11 path is 32-bit. Without this step the diff is dominated by color
    quantization, not geometry.
  - If the two client sizes differ, both are normalized to 800x600.

.PARAMETER OriginalTitle
  Exact window title of the original game (default "Plants vs. Zombies").
.PARAMETER LegacyTitle
  Exact window title of the legacy build (default "Plants vs. Zombies [legacy]").
.PARAMETER OriginalPath
  Optional source image path. When supplied together with LegacyPath, compare
  the two files directly instead of capturing windows.
.PARAMETER LegacyPath
  Optional legacy image path. Must be supplied together with OriginalPath.
.PARAMETER Threshold
  Per-pixel max-channel difference used to count "changed" pixels (default 16).
.PARAMETER SkipQuantize
  Do not quantize the legacy capture to RGB565 before comparing.
.PARAMETER MaskPath
  Optional PNG mask: white pixels are compared, black pixels are excluded.
  If omitted and -MotionMask is not set, everything is compared.
.PARAMETER MotionMask
  Capture the original twice (configurable delay apart) and automatically
  exclude pixels that moved (clouds, animations), keeping only static UI.
.PARAMETER MotionDelayMs
  Delay between the two motion-mask captures in milliseconds (default 2000).
  Clouds drift slowly, so a short delay can miss them entirely.
.PARAMETER OutDir
  Directory for original.png / legacy.png / diff.png (default out\screen_compare).
#>
param(
    [string]$OriginalTitle = "Plants vs. Zombies",
    [string]$LegacyTitle = "Plants vs. Zombies [legacy]",
    [string]$OriginalPath = "",
    [string]$LegacyPath = "",
    [int]$Threshold = 16,
    [switch]$SkipQuantize,
    [string]$MaskPath = "",
    [switch]$MotionMask,
    [int]$MotionDelayMs = 2000,
    [string]$OutDir = "out\screen_compare"
)

$ErrorActionPreference = "Stop"

Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;

public static class ScreenCompare
{
    [StructLayout(LayoutKind.Sequential)]
    public struct RECT { public int Left, Top, Right, Bottom; }

    [StructLayout(LayoutKind.Sequential)]
    public struct POINT { public int X, Y; }

    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

    [DllImport("user32.dll")]
    public static extern bool GetClientRect(IntPtr hWnd, out RECT lpRect);

    [DllImport("user32.dll")]
    public static extern bool ClientToScreen(IntPtr hWnd, ref POINT lpPoint);

    [DllImport("user32.dll")]
    public static extern bool PrintWindow(IntPtr hWnd, IntPtr hdcBlt, uint nFlags);

    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    [DllImport("user32.dll")]
    public static extern bool SetProcessDPIAware();

    [DllImport("user32.dll")]
    public static extern bool IsIconic(IntPtr hWnd);

    [DllImport("gdi32.dll")]
    public static extern IntPtr GetDC(IntPtr hWnd);

    [DllImport("gdi32.dll")]
    public static extern int ReleaseDC(IntPtr hWnd, IntPtr hDC);

    [DllImport("gdi32.dll")]
    public static extern bool BitBlt(IntPtr hdcDest, int x, int y, int w, int h,
        IntPtr hdcSrc, int x1, int y1, uint rop);

    public static Bitmap CaptureWindow(IntPtr hwnd)
    {
        RECT rc;
        if (!GetClientRect(hwnd, out rc))
            throw new InvalidOperationException("GetClientRect failed");

        int w = Math.Max(1, rc.Right);
        int h = Math.Max(1, rc.Bottom);
        Bitmap bmp = new Bitmap(w, h, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(bmp))
        {
            IntPtr hdc = g.GetHdc();
            bool ok = PrintWindow(hwnd, hdc, 0x3); // PW_CLIENTONLY | PW_RENDERFULLCONTENT
            if (!ok)
            {
                IntPtr wdc = GetDC(hwnd);
                BitBlt(hdc, 0, 0, w, h, wdc, 0, 0, 0x00CC0020);
                ReleaseDC(hwnd, wdc);
            }
            g.ReleaseHdc(hdc);
        }
        return bmp;
    }

    public static void Quantize565(Bitmap bmp)
    {
        Rectangle rect = new Rectangle(0, 0, bmp.Width, bmp.Height);
        BitmapData data = bmp.LockBits(rect, ImageLockMode.ReadWrite, PixelFormat.Format32bppArgb);
        try
        {
            int stride = data.Stride;
            int length = stride * bmp.Height;
            byte[] bytes = new byte[length];
            Marshal.Copy(data.Scan0, bytes, 0, length);
            for (int y = 0; y < bmp.Height; y++)
            {
                int row = y * stride;
                for (int x = 0; x < bmp.Width; x++)
                {
                    int i = row + x * 4;
                    int b = bytes[i];
                    int g = bytes[i + 1];
                    int r = bytes[i + 2];
                    int r5 = r >> 3;
                    int g6 = g >> 2;
                    int b5 = b >> 3;
                    bytes[i]     = (byte)((b5 << 3) | (b5 >> 2));
                    bytes[i + 1] = (byte)((g6 << 2) | (g6 >> 4));
                    bytes[i + 2] = (byte)((r5 << 3) | (r5 >> 2));
                }
            }
            Marshal.Copy(bytes, 0, data.Scan0, length);
        }
        finally
        {
            bmp.UnlockBits(data);
        }
    }

    public static Bitmap Resize(Bitmap src, int width, int height)
    {
        Bitmap dst = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(dst))
        {
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
            g.DrawImage(src, 0, 0, width, height);
        }
        return dst;
    }

    public static Bitmap ResizeNearest(Bitmap src, int width, int height)
    {
        Bitmap dst = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(dst))
        {
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.NearestNeighbor;
            g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.None;
            g.DrawImage(src, 0, 0, width, height);
        }
        return dst;
    }

    public static Bitmap To32bppArgb(Bitmap src)
    {
        Bitmap dst = new Bitmap(src.Width, src.Height, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(dst))
        {
            g.DrawImageUnscaled(src, 0, 0);
        }
        return dst;
    }

    public static Bitmap CreateWhiteMask(int width, int height)
    {
        Bitmap mask = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        using (Graphics g = Graphics.FromImage(mask))
        {
            g.Clear(Color.White);
        }
        return mask;
    }

    public static Bitmap MotionMask(Bitmap a, Bitmap b, int threshold)
    {
        int w = Math.Min(a.Width, b.Width);
        int h = Math.Min(a.Height, b.Height);
        Bitmap mask = new Bitmap(w, h, PixelFormat.Format32bppArgb);
        Rectangle ra = new Rectangle(0, 0, w, h);
        Rectangle rb = new Rectangle(0, 0, w, h);
        BitmapData da = a.LockBits(ra, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        BitmapData db = b.LockBits(rb, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        BitmapData dm = mask.LockBits(new Rectangle(0, 0, w, h), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
        try
        {
            int sa = da.Stride, sb = db.Stride, sm = dm.Stride;
            byte[] ba = new byte[sa * h], bb = new byte[sb * h], bm = new byte[sm * h];
            Marshal.Copy(da.Scan0, ba, 0, ba.Length);
            Marshal.Copy(db.Scan0, bb, 0, bb.Length);
            for (int y = 0; y < h; y++)
            {
                int oa = y * sa, ob = y * sb, om = y * sm;
                for (int x = 0; x < w; x++)
                {
                    int ia = oa + x * 4, ib = ob + x * 4, im = om + x * 4;
                    int dmax = Math.Max(
                        Math.Abs(ba[ia + 2] - bb[ib + 2]),
                        Math.Max(
                            Math.Abs(ba[ia + 1] - bb[ib + 1]),
                            Math.Abs(ba[ia] - bb[ib])));
                    byte v = dmax <= threshold ? (byte)255 : (byte)0;
                    bm[im] = v; bm[im + 1] = v; bm[im + 2] = v; bm[im + 3] = 255;
                }
            }
            Marshal.Copy(bm, 0, dm.Scan0, bm.Length);
        }
        finally
        {
            a.UnlockBits(da);
            b.UnlockBits(db);
            mask.UnlockBits(dm);
        }
        return mask;
    }

    public class Result
    {
        public double MeanDiff;
        public int MaxDiff;
        public long DiffPixels;
        public double DiffPercent;
        public long ComparedPixels;
        public Bitmap DiffImage;
    }

    public static Result Compare(Bitmap a, Bitmap b, Bitmap mask, int threshold)
    {
        int w = Math.Min(a.Width, Math.Min(b.Width, mask.Width));
        int h = Math.Min(a.Height, Math.Min(b.Height, mask.Height));
        Rectangle ra = new Rectangle(0, 0, w, h);
        Rectangle rb = new Rectangle(0, 0, w, h);
        Rectangle rm = new Rectangle(0, 0, w, h);
        BitmapData da = a.LockBits(ra, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        BitmapData db = b.LockBits(rb, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        BitmapData dm = mask.LockBits(rm, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        Bitmap diff = new Bitmap(w, h, PixelFormat.Format32bppArgb);
        BitmapData dd = diff.LockBits(new Rectangle(0, 0, w, h), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
        try
        {
            int sa = da.Stride;
            int sb = db.Stride;
            int sm = dm.Stride;
            int sd = dd.Stride;
            byte[] ba = new byte[sa * h];
            byte[] bb = new byte[sb * h];
            byte[] bm = new byte[sm * h];
            byte[] bd = new byte[sd * h];
            Marshal.Copy(da.Scan0, ba, 0, ba.Length);
            Marshal.Copy(db.Scan0, bb, 0, bb.Length);
            Marshal.Copy(dm.Scan0, bm, 0, bm.Length);

            double sum = 0;
            long max = 0;
            long changed = 0;
            long compared = 0;
            for (int y = 0; y < h; y++)
            {
                int oa = y * sa;
                int ob = y * sb;
                int om = y * sm;
                int od = y * sd;
                for (int x = 0; x < w; x++)
                {
                    int ia = oa + x * 4;
                    int ib = ob + x * 4;
                    int im = om + x * 4;
                    int ml = bm[im + 2];
                    if (ml < 128)
                    {
                        bd[od + x * 4]     = 0x40;
                        bd[od + x * 4 + 1] = 0x40;
                        bd[od + x * 4 + 2] = 0x40;
                        bd[od + x * 4 + 3] = 0xFF;
                        continue;
                    }
                    compared++;
                    int ar = ba[ia + 2], ag = ba[ia + 1], ab = ba[ia];
                    int br = bb[ib + 2], bg = bb[ib + 1], bbv = bb[ib];
                    int dr = Math.Abs(ar - br);
                    int dg = Math.Abs(ag - bg);
                    int dbv = Math.Abs(ab - bbv);
                    int dmax = Math.Max(dr, Math.Max(dg, dbv));
                    sum += dmax;
                    if (dmax > max) max = dmax;
                    if (dmax > threshold)
                    {
                        changed++;
                        bd[od + x * 4]     = 0x30;
                        bd[od + x * 4 + 1] = 0x30;
                        bd[od + x * 4 + 2] = 0xF0;
                        bd[od + x * 4 + 3] = 0xFF;
                    }
                    else
                    {
                        bd[od + x * 4]     = (byte)ab;
                        bd[od + x * 4 + 1] = (byte)ag;
                        bd[od + x * 4 + 2] = (byte)ar;
                        bd[od + x * 4 + 3] = 0xFF;
                    }
                }
            }
            Marshal.Copy(bd, 0, dd.Scan0, bd.Length);

            Result r = new Result();
            r.ComparedPixels = compared;
            r.MeanDiff = compared > 0 ? sum / (double)compared : 0.0;
            r.MaxDiff = (int)max;
            r.DiffPixels = changed;
            r.DiffPercent = compared > 0 ? 100.0 * changed / (double)compared : 0.0;
            r.DiffImage = diff;
            return r;
        }
        finally
        {
            a.UnlockBits(da);
            b.UnlockBits(db);
            mask.UnlockBits(dm);
            diff.UnlockBits(dd);
        }
    }
}
'@

[ScreenCompare]::SetProcessDPIAware() | Out-Null

function Find-Window([string]$title) {
    $proc = Get-Process -ErrorAction SilentlyContinue |
        Where-Object { $_.MainWindowTitle -eq $title -and $_.MainWindowHandle -ne 0 } |
        Select-Object -First 1
    if ($null -eq $proc) {
        throw "Window not found: '$title'"
    }
    return $proc.MainWindowHandle
}

$outDir = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $OutDir))
[System.IO.Directory]::CreateDirectory($outDir) | Out-Null

$fileMode = $OriginalPath -ne "" -or $LegacyPath -ne ""
if ($fileMode -and ($OriginalPath -eq "" -or $LegacyPath -eq "")) {
    throw "OriginalPath and LegacyPath must be supplied together."
}

if ($fileMode) {
    $originalPathFull = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $OriginalPath))
    $legacyPathFull = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $LegacyPath))
    if (-not (Test-Path -LiteralPath $originalPathFull)) {
        throw "Original image not found: $originalPathFull"
    }
    if (-not (Test-Path -LiteralPath $legacyPathFull)) {
        throw "Legacy image not found: $legacyPathFull"
    }
    if ($MotionMask) {
        throw "MotionMask is only valid when capturing live windows."
    }

    $loadedOriginal = [System.Drawing.Bitmap]::FromFile($originalPathFull)
    $loadedLegacy = [System.Drawing.Bitmap]::FromFile($legacyPathFull)
    try {
        $original = [ScreenCompare]::To32bppArgb($loadedOriginal)
        $legacy = [ScreenCompare]::To32bppArgb($loadedLegacy)
    }
    finally {
        $loadedOriginal.Dispose()
        $loadedLegacy.Dispose()
    }
}
else {
    $originalHwnd = Find-Window $OriginalTitle
    $legacyHwnd = Find-Window $LegacyTitle

    foreach ($hwnd in @($originalHwnd, $legacyHwnd)) {
        if ([ScreenCompare]::IsIconic($hwnd)) {
            [ScreenCompare]::ShowWindow($hwnd, 9) | Out-Null
        }
        [ScreenCompare]::SetForegroundWindow($hwnd) | Out-Null
        Start-Sleep -Milliseconds 300
    }

    $original = [ScreenCompare]::CaptureWindow($originalHwnd)
    $legacy = [ScreenCompare]::CaptureWindow($legacyHwnd)
}

$originalPath = Join-Path $outDir "original.png"
$legacyPath = Join-Path $outDir "legacy.png"
$original.Save($originalPath, [System.Drawing.Imaging.ImageFormat]::Png)
$legacy.Save($legacyPath, [System.Drawing.Imaging.ImageFormat]::Png)

if (-not $SkipQuantize) {
    [ScreenCompare]::Quantize565($legacy)
}

$mask = $null
if ($MaskPath -ne "") {
    $maskPathFull = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $MaskPath))
    if (-not (Test-Path $maskPathFull)) {
        throw "Mask file not found: $maskPathFull"
    }
    $loadedMask = [System.Drawing.Bitmap]::FromFile($maskPathFull)
    $mask = New-Object System.Drawing.Bitmap $loadedMask.Width, $loadedMask.Height, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $maskGraphics = [System.Drawing.Graphics]::FromImage($mask)
    $maskGraphics.DrawImage($loadedMask, 0, 0, $loadedMask.Width, $loadedMask.Height)
    $maskGraphics.Dispose()
    $loadedMask.Dispose()
}
elseif ($MotionMask) {
    Write-Host "Capturing a second original frame to build the motion mask..."
    Start-Sleep -Milliseconds $MotionDelayMs
    $originalB = [ScreenCompare]::CaptureWindow($originalHwnd)
    $mask = [ScreenCompare]::MotionMask($original, $originalB, 8)
    $originalB.Dispose()
}

if ($original.Width -ne $legacy.Width -or $original.Height -ne $legacy.Height) {
    Write-Host "Client sizes differ (original $($original.Width)x$($original.Height), legacy $($legacy.Width)x$($legacy.Height)); normalizing both to 800x600."
    $resizedOriginal = [ScreenCompare]::Resize($original, 800, 600)
    $resizedLegacy = [ScreenCompare]::Resize($legacy, 800, 600)
    $original.Dispose()
    $legacy.Dispose()
    $original = $resizedOriginal
    $legacy = $resizedLegacy
}

if ($null -eq $mask) {
    $mask = [ScreenCompare]::CreateWhiteMask($original.Width, $original.Height)
}
elseif ($mask.Width -ne $original.Width -or $mask.Height -ne $original.Height) {
    $resizedMask = [ScreenCompare]::ResizeNearest($mask, $original.Width, $original.Height)
    $mask.Dispose()
    $mask = $resizedMask
}

$maskSavePath = Join-Path $outDir "mask.png"
$mask.Save($maskSavePath, [System.Drawing.Imaging.ImageFormat]::Png)

$result = [ScreenCompare]::Compare($original, $legacy, $mask, $Threshold)
$diffPath = Join-Path $outDir "diff.png"
$result.DiffImage.Save($diffPath, [System.Drawing.Imaging.ImageFormat]::Png)

Write-Host ""
$maskLabel = "none"
if ($MaskPath -ne "") { $maskLabel = $MaskPath }
elseif ($MotionMask) { $maskLabel = "auto-motion" }
Write-Host "Comparison (legacy quantized to RGB565: $(-not $SkipQuantize), threshold=$Threshold, mask: $maskLabel)"
Write-Host ("Mean max-channel diff : {0:F3}" -f $result.MeanDiff)
Write-Host ("Max max-channel diff  : {0}" -f $result.MaxDiff)
Write-Host ("Compared pixels       : {0}" -f $result.ComparedPixels)
Write-Host ("Pixels above threshold: {0} ({1:F3}% of compared)" -f $result.DiffPixels, $result.DiffPercent)
Write-Host ""
Write-Host "Saved:"
Write-Host ("  original : {0}" -f $originalPath)
Write-Host ("  legacy   : {0}" -f $legacyPath)
Write-Host ("  mask     : {0}" -f $maskSavePath)
Write-Host ("  diff     : {0}" -f $diffPath)

$result.DiffImage.Dispose()
$mask.Dispose()
$original.Dispose()
$legacy.Dispose()
