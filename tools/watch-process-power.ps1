param(
    [string[]]$ProcessName = @('PlantsVsZombies', 'PlantsVsZombiesModern', 'pvz_perf'),
    [int[]]$ProcessId = @(),
    [ValidateRange(1, 86400)][int]$Seconds = 30,
    [string]$OutputPath = ''
)

$ErrorActionPreference = 'Stop'
if (-not ('PvzPowerSnapshot' -as [type])) {
    Add-Type -TypeDefinition @'
using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
public static class PvzPowerSnapshot {
    [StructLayout(LayoutKind.Sequential)]
    public struct Policy { public uint Version, ControlMask, StateMask; }
    [StructLayout(LayoutKind.Sequential)]
    public struct Power {
        public byte ACLineStatus, BatteryFlag, BatteryLifePercent, SystemStatusFlag;
        public uint BatteryLifeTime, BatteryFullLifeTime;
    }
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern IntPtr OpenProcess(uint access, bool inherit, uint id);
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern IntPtr OpenThread(uint access, bool inherit, uint id);
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern bool GetProcessInformation(IntPtr process, int kind, ref Policy policy, uint size);
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern bool GetThreadInformation(IntPtr thread, int kind, ref Policy policy, uint size);
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern bool GetProcessPriorityBoost(IntPtr process, out bool disabled);
    [DllImport("kernel32.dll", SetLastError=true)]
    static extern bool CloseHandle(IntPtr handle);
    [DllImport("kernel32.dll")]
    public static extern uint GetCurrentThreadId();
    [DllImport("kernel32.dll", SetLastError=true)]
    public static extern bool GetSystemPowerStatus(out Power power);
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")]
    public static extern uint GetWindowThreadProcessId(IntPtr window, out uint process);
    public static Policy Read(uint id, bool thread) {
        IntPtr handle = thread ? OpenThread(0x40, false, id) : OpenProcess(0x1000, false, id);
        if (handle == IntPtr.Zero) throw new Win32Exception(Marshal.GetLastWin32Error());
        try {
            Policy policy = new Policy { Version = 1 };
            bool ok = thread ? GetThreadInformation(handle, 3, ref policy, 12)
                             : GetProcessInformation(handle, 4, ref policy, 12);
            if (!ok) throw new Win32Exception(Marshal.GetLastWin32Error());
            return policy;
        } finally { CloseHandle(handle); }
    }
    public static bool BoostDisabled(uint id) {
        IntPtr handle = OpenProcess(0x400, false, id);
        if (handle == IntPtr.Zero) throw new Win32Exception(Marshal.GetLastWin32Error());
        try {
            bool disabled;
            if (!GetProcessPriorityBoost(handle, out disabled))
                throw new Win32Exception(Marshal.GetLastWin32Error());
            return disabled;
        } finally { CloseHandle(handle); }
    }
}
'@
}

function Get-PolicyLabel($Policy, [uint32]$Bit) {
    if (($Policy.ControlMask -band $Bit) -eq 0) { return 'system-managed' }
    if (($Policy.StateMask -band $Bit) -ne 0) { return 'explicit-on' }
    return 'explicit-off'
}

$deadline = [DateTime]::UtcNow.AddSeconds($Seconds)
$rows = [System.Collections.Generic.List[object]]::new()
do {
    $power = [PvzPowerSnapshot+Power]::new()
    if (-not [PvzPowerSnapshot]::GetSystemPowerStatus([ref]$power)) {
        throw [System.ComponentModel.Win32Exception]::new()
    }
    [uint32]$foregroundProcess = 0
    $null = [PvzPowerSnapshot]::GetWindowThreadProcessId(
        [PvzPowerSnapshot]::GetForegroundWindow(), [ref]$foregroundProcess)
    $targets = @(Get-Process | Where-Object {
        $_.ProcessName -in $ProcessName -or $_.Id -in $ProcessId
    })
    foreach ($target in $targets) {
        $row = [ordered]@{
            utc = [DateTime]::UtcNow.ToString('o')
            pid = $target.Id
            name = $target.ProcessName
            path = ''
            ac = $power.ACLineStatus
            foreground = ($foregroundProcess -eq $target.Id)
            affinity = ''
            priority = ''
            boost_disabled = ''
            process_control = ''
            process_state = ''
            execution_speed_throttling = ''
            ignore_timer_resolution = ''
            window_thread = 0
            thread_control = ''
            thread_state = ''
            error = ''
        }
        try {
            $target.Refresh()
            $row.path = $target.Path
            $row.affinity = '{0:X}' -f $target.ProcessorAffinity.ToInt64()
            $row.priority = [string]$target.PriorityClass
            $row.boost_disabled = [PvzPowerSnapshot]::BoostDisabled($target.Id)
            $policy = [PvzPowerSnapshot]::Read($target.Id, $false)
            $row.process_control = $policy.ControlMask
            $row.process_state = $policy.StateMask
            $row.execution_speed_throttling = Get-PolicyLabel $policy 1
            $row.ignore_timer_resolution = Get-PolicyLabel $policy 4
            [uint32]$windowProcess = 0
            if ($target.MainWindowHandle -ne [IntPtr]::Zero) {
                $threadId = [PvzPowerSnapshot]::GetWindowThreadProcessId(
                    $target.MainWindowHandle, [ref]$windowProcess)
                $row.window_thread = $threadId
                $threadPolicy = [PvzPowerSnapshot]::Read($threadId, $true)
                $row.thread_control = $threadPolicy.ControlMask
                $row.thread_state = $threadPolicy.StateMask
            }
        } catch {
            # Process exit and unsupported queries are evidence, not zero-valued policy.
            $row.error = $_.Exception.Message
        }
        $sample = [pscustomobject]$row
        $rows.Add($sample)
        $sample
    }
    if ([DateTime]::UtcNow -lt $deadline) { Start-Sleep -Milliseconds 1000 }
} while ([DateTime]::UtcNow -lt $deadline)
if ($OutputPath) {
    $rows | Export-Csv -LiteralPath $OutputPath -NoTypeInformation -Encoding UTF8
}
