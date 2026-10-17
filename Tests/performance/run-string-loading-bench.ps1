<#
.SYNOPSIS
Measures the actual modern game's AfterParticles loading-close workload on LP14.
.DESCRIPTION
Main owns final measurement scheduling. Run this only when main can serialize
all LP14 work. This runner never builds anything or substitutes another workload.
It compiles its embedded Win32 launcher with Add-Type only when explicitly run.

Supply one common, windowed/unscaled settings.json and one profile directory
containing users.dat and any user<ID>.dat files. These are frozen once, then
copied freshly for both warm-ups and every measured process. No .dat64 files,
interruption saves, or profile conversions are included.

OutputDirectory must be new, inside this project, and separate from all inputs.
Example (execution is deliberately opt-in):
  ./Tests/performance/run-string-loading-bench.ps1 -Measure `
    -NormalizePrimaryThreadPriority `
    -SettingsFile ./out/x64-win32-dx12/Release/settings.json `
    -UsersDirectory ./out/x64-win32-dx12/Release/data `
    -OutputDirectory ./out/string-loading-bench/run-20261010
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$SettingsFile,
    [Parameter(Mandatory = $true)][string]$UsersDirectory,
    [Parameter(Mandatory = $true)][string]$OutputDirectory,
    [switch]$Measure,
    [switch]$NormalizePrimaryThreadPriority,
    [ValidateRange(10, 600)][int]$TimeoutSeconds = 120
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
if (-not $Measure) { throw 'Execution requires -Measure; main must serialize all final LP14 measurements.' }
if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT -or [IntPtr]::Size -ne 8) {
    throw 'This contract requires 64-bit PowerShell on Windows.'
}
$root = [IO.Path]::GetFullPath((Split-Path -Parent (Split-Path -Parent $PSScriptRoot)))
$runtimes = @{
    A = 'C:\Users\Administrator\AppData\Local\Temp\pvz-strings-baseline-20261010'
    B = Join-Path $root 'out\x64-win32-dx12\Release'
}
$SettingsFile = [IO.Path]::GetFullPath($SettingsFile)
$UsersDirectory = [IO.Path]::GetFullPath($UsersDirectory)
$output = [IO.Path]::GetFullPath($OutputDirectory).TrimEnd([char[]]'\/')
$utf8 = New-Object Text.UTF8Encoding($false)
$mutex = New-Object Threading.Mutex($false, 'Global\PvzStringLoadingBench-LP14')
$ownsMutex = $false
$metadata = $null
$launcher = [Diagnostics.Process]::GetCurrentProcess()
$launcherAffinity = $launcher.ProcessorAffinity

function Test-ContainsPath([string]$Parent, [string]$Child) {
    $parentPath = $Parent.TrimEnd([char[]]'\/')
    return $Child.Equals($parentPath, [StringComparison]::OrdinalIgnoreCase) -or
        $Child.StartsWith($parentPath + '\', [StringComparison]::OrdinalIgnoreCase)
}

function Assert-PlainPath([string]$Path) {
    # Reject junction aliases rather than allowing output to alias an input.
    $cursor = $Path
    while ($cursor) {
        if (Test-Path -LiteralPath $cursor) {
            $item = Get-Item -LiteralPath $cursor -Force
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                throw "Reparse points are outside the input/output contract: $cursor"
            }
        }
        $cursor = Split-Path -Parent $cursor
    }
}

function Write-Json([string]$Path, $Value) {
    [IO.File]::WriteAllText($Path, ($Value | ConvertTo-Json -Depth 12) + "`n", $utf8)
}

function Get-Fingerprint([string]$Path, [string]$RelativePath) {
    $file = Get-Item -LiteralPath $Path
    if ($file.PSIsContainer -or ($file.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw "Expected a regular input file: $Path"
    }
    return [ordered]@{
        path = $RelativePath
        bytes = $file.Length
        sha256 = (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
    }
}

function Get-RuntimeFingerprints([string]$Directory) {
    # Hash executable/DLL inputs and the resource trees used by this runtime.
    # Existing logs, PDBs, playable profiles, and runtime settings are not inputs.
    $files = @(
        Get-Item -LiteralPath (Join-Path $Directory 'PlantsVsZombiesModern.exe')
        Get-Item -LiteralPath (Join-Path $Directory 'main.pak64')
        Get-ChildItem -LiteralPath $Directory -File -Filter '*.dll'
        foreach ($tree in @('compiled', 'shaders', 'effects')) {
            $treePath = Join-Path $Directory $tree
            if (-not (Test-Path -LiteralPath $treePath -PathType Container)) {
                throw "Required staged runtime directory missing: $treePath"
            }
            Assert-PlainPath $treePath
            $entries = @(Get-ChildItem -LiteralPath $treePath -Recurse -Force)
            if (@($entries | Where-Object {
                ($_.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0
            }).Count -ne 0) { throw "Runtime input tree contains a reparse point: $treePath" }
            $entries | Where-Object { -not $_.PSIsContainer }
        }
    )
    foreach ($file in ($files | Sort-Object FullName)) {
        $relative = $file.FullName.Substring($Directory.TrimEnd('\').Length + 1).Replace('\', '/')
        Get-Fingerprint $file.FullName $relative
    }
}

function Assert-FingerprintsEqual($Expected, $Actual, [string]$Description) {
    if (($Expected | ConvertTo-Json -Depth 6 -Compress) -cne
        ($Actual | ConvertTo-Json -Depth 6 -Compress)) {
        throw "Input hashes changed: $Description. No partial results are valid."
    }
}

function Assert-Idle {
    $busy = @(Get-Process | Where-Object {
        $_.ProcessName -match '^(cl|link|ninja|cmake|MSBuild)$|^(PlantsVsZombies|bench_)'
    } | Select-Object Id, ProcessName)
    if ($busy.Count -ne 0) {
        throw ('Conflicting processes are running; nothing was stopped: ' +
            (($busy | ForEach-Object { "$($_.ProcessName)[$($_.Id)]" }) -join ', '))
    }
}

$nativeSource = @'
using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;

namespace PvzStringLoadingBench
{
    public sealed class Sample
    {
        public uint ProcessId;
        public uint ExitCode;
        public bool TimedOut;
        public ulong EffectiveAffinity;
        public ulong SystemAffinity;
        public long WallTicks;
        public long CreateAndPinTicks;
        public long LaunchToExitTicks;
        public long QpcFrequency;
        public double WallMs;
        public double CreateAndPinMs;
        public double LaunchToExitMs;
        public long User100ns;
        public long Kernel100ns;
        public double UserMs;
        public double KernelMs;
        public double TotalCpuMs;
        public ulong Cycles;
        public uint PrimaryThreadId;
        public bool NormalizedPrimaryPriority;
        public uint PrioritySamples;
        public uint PriorityCorrections;
        public double FirstPriorityCorrectionMs;
        public double MaxPriorityObservationGapMs;
        public string CreatedUtc;
        public string ExitedUtc;
    }

    public static class Native
    {
        const uint CREATE_SUSPENDED = 0x00000004;
        const uint CREATE_UNICODE_ENVIRONMENT = 0x00000400;
        const uint CREATE_NO_WINDOW = 0x08000000;
        const uint NORMAL_PRIORITY_CLASS = 0x00000020;
        const uint STARTF_USESHOWWINDOW = 0x00000001;
        const uint STARTF_USESTDHANDLES = 0x00000100;
        const uint WAIT_OBJECT_0 = 0;
        const uint WAIT_TIMEOUT = 258;
        const uint INFINITE = 0xffffffff;
        const uint TIMEOUT_EXIT = 0xdead;
        const ulong LP14 = 0x4000;
        static readonly IntPtr INVALID_HANDLE_VALUE = new IntPtr(-1);

        [StructLayout(LayoutKind.Sequential)]
        struct SECURITY_ATTRIBUTES
        {
            public int nLength;
            public IntPtr lpSecurityDescriptor;
            [MarshalAs(UnmanagedType.Bool)] public bool bInheritHandle;
        }

        [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
        struct STARTUPINFO
        {
            public int cb;
            public string lpReserved;
            public string lpDesktop;
            public string lpTitle;
            public uint dwX, dwY, dwXSize, dwYSize, dwXCountChars, dwYCountChars;
            public uint dwFillAttribute, dwFlags;
            public ushort wShowWindow, cbReserved2;
            public IntPtr lpReserved2, hStdInput, hStdOutput, hStdError;
        }

        [StructLayout(LayoutKind.Sequential)]
        struct PROCESS_INFORMATION
        {
            public IntPtr hProcess, hThread;
            public uint dwProcessId, dwThreadId;
        }

        [StructLayout(LayoutKind.Sequential)]
        struct FILETIME
        {
            public uint Low, High;
            public long Value { get { return ((long)High << 32) | Low; } }
        }

        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, ExactSpelling = true, SetLastError = true)]
        static extern bool CreateProcessW(string application, StringBuilder command,
            IntPtr processAttributes, IntPtr threadAttributes, bool inheritHandles,
            uint flags, IntPtr environment, string workingDirectory,
            ref STARTUPINFO startup, out PROCESS_INFORMATION process);
        [DllImport("kernel32.dll", CharSet = CharSet.Unicode, ExactSpelling = true, SetLastError = true)]
        static extern IntPtr CreateFileW(string path, uint access, uint share,
            ref SECURITY_ATTRIBUTES security, uint disposition, uint attributes, IntPtr template);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool SetProcessAffinityMask(IntPtr process, UIntPtr mask);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool GetProcessAffinityMask(IntPtr process, out UIntPtr processMask, out UIntPtr systemMask);
        [DllImport("kernel32.dll")]
        static extern ushort GetActiveProcessorGroupCount();
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern uint ResumeThread(IntPtr thread);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool SetThreadPriority(IntPtr thread, int priority);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern int GetThreadPriority(IntPtr thread);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern uint GetPriorityClass(IntPtr process);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern uint WaitForSingleObject(IntPtr handle, uint milliseconds);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool GetExitCodeProcess(IntPtr process, out uint exitCode);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool GetProcessTimes(IntPtr process, out FILETIME created,
            out FILETIME exited, out FILETIME kernel, out FILETIME user);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool QueryProcessCycleTime(IntPtr process, out ulong cycles);
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern bool TerminateProcess(IntPtr process, uint exitCode);
        [DllImport("kernel32.dll")]
        static extern bool CloseHandle(IntPtr handle);

        static void Check(bool ok, string operation)
        {
            if (!ok) throw new Win32Exception(Marshal.GetLastWin32Error(), operation);
        }

        static IntPtr Open(string path, uint access, uint disposition)
        {
            SECURITY_ATTRIBUTES security = new SECURITY_ATTRIBUTES();
            security.nLength = Marshal.SizeOf(typeof(SECURITY_ATTRIBUTES));
            security.bInheritHandle = true;
            IntPtr handle = CreateFileW(path, access, 3, ref security, disposition, 0x80, IntPtr.Zero);
            Check(handle != INVALID_HANDLE_VALUE, "CreateFileW: " + path);
            return handle;
        }

        static void Close(IntPtr handle)
        {
            if (handle != IntPtr.Zero && handle != INVALID_HANDLE_VALUE) CloseHandle(handle);
        }

        public static Sample Measure(string executable, string runtime, string environmentBlock,
            string stdout, string stderr, uint timeoutMs, bool normalizePrimaryPriority)
        {
            if (GetActiveProcessorGroupCount() != 1)
                throw new InvalidOperationException("LP14 contract requires exactly one processor group.");
            if (!Stopwatch.IsHighResolution)
                throw new InvalidOperationException("A high-resolution QPC clock is required.");
            PROCESS_INFORMATION process = new PROCESS_INFORMATION();
            IntPtr environment = IntPtr.Zero, input = IntPtr.Zero, output = IntPtr.Zero, error = IntPtr.Zero;
            bool createdChild = false, exited = false;
            try
            {
                environment = Marshal.StringToHGlobalUni(environmentBlock);
                input = Open("NUL", 0x80000000, 3);
                output = Open(stdout, 0x40000000, 1);
                error = Open(stderr, 0x40000000, 1);
                STARTUPINFO startup = new STARTUPINFO();
                startup.cb = Marshal.SizeOf(typeof(STARTUPINFO));
                startup.dwFlags = STARTF_USESHOWWINDOW | STARTF_USESTDHANDLES;
                startup.wShowWindow = 0; // SW_HIDE, plus the game's explicit hidden mode.
                startup.hStdInput = input;
                startup.hStdOutput = output;
                startup.hStdError = error;
                StringBuilder command = new StringBuilder("\"" + executable + "\" -nosound");
                long launch = Stopwatch.GetTimestamp();
                Check(CreateProcessW(executable, command, IntPtr.Zero, IntPtr.Zero, true,
                    CREATE_SUSPENDED | CREATE_UNICODE_ENVIRONMENT | CREATE_NO_WINDOW |
                        NORMAL_PRIORITY_CLASS,
                    environment, runtime, ref startup, out process), "CreateProcessW");
                createdChild = true;
                Check(GetPriorityClass(process.hProcess) == NORMAL_PRIORITY_CLASS,
                    "Verify owned child Normal priority class");

                UIntPtr effective, system;
                Check(GetProcessAffinityMask(process.hProcess, out effective, out system), "GetProcessAffinityMask");
                if ((system.ToUInt64() & LP14) == 0)
                    throw new InvalidOperationException("LP14 is unavailable in the system affinity mask.");
                Check(SetProcessAffinityMask(process.hProcess, new UIntPtr(LP14)), "SetProcessAffinityMask");
                Check(GetProcessAffinityMask(process.hProcess, out effective, out system), "Verify affinity");
                if (effective.ToUInt64() != LP14)
                    throw new InvalidOperationException("Effective affinity is not exactly 0x4000.");
                if (normalizePrimaryPriority)
                {
                    Check(SetThreadPriority(process.hThread, 0), "Set initial primary thread Normal priority");
                    Check(GetThreadPriority(process.hThread) == 0, "Verify initial primary thread priority");
                }

                // No application code executes before the verified affinity.
                long resume = Stopwatch.GetTimestamp();
                uint previousSuspendCount = ResumeThread(process.hThread);
                Check(previousSuspendCount != 0xffffffff, "ResumeThread");
                if (previousSuspendCount != 1)
                    throw new InvalidOperationException("Unexpected primary-thread suspend count.");
                uint prioritySamples = 0, priorityCorrections = 0;
                long firstCorrection = 0, lastObservation = resume, maxObservationGap = 0;
                uint wait;
                if (!normalizePrimaryPriority)
                    wait = WaitForSingleObject(process.hProcess, timeoutMs);
                else
                {
                    long deadline = resume + (long)timeoutMs * Stopwatch.Frequency / 1000;
                    while (true)
                    {
                        wait = WaitForSingleObject(process.hProcess, 1);
                        if (wait != WAIT_TIMEOUT) break;
                        long observation = Stopwatch.GetTimestamp();
                        if (observation >= deadline) break;
                        uint primaryWait = WaitForSingleObject(process.hThread, 0);
                        if (primaryWait == WAIT_OBJECT_0) continue;
                        Check(primaryWait == WAIT_TIMEOUT, "Check owned primary thread lifetime");
                        int priority = GetThreadPriority(process.hThread);
                        Check(priority != Int32.MaxValue, "Get owned primary thread priority");
                        // The frozen loader raises only its primary thread to AboveNormal.
                        // Other policies are not silently coerced into this comparison.
                        if (priority != 0 && priority != 1)
                            throw new InvalidOperationException("Unexpected primary-thread priority: " + priority);
                        ++prioritySamples;
                        maxObservationGap = Math.Max(maxObservationGap, observation - lastObservation);
                        lastObservation = observation;
                        if (priority == 1)
                        {
                            Check(SetThreadPriority(process.hThread, 0), "Normalize owned primary thread priority");
                            Check(GetThreadPriority(process.hThread) == 0, "Verify normalized primary priority");
                            if (priorityCorrections == 0) firstCorrection = observation;
                            ++priorityCorrections;
                        }
                    }
                }
                bool timedOut = wait == WAIT_TIMEOUT;
                long end = Stopwatch.GetTimestamp();
                if (timedOut)
                {
                    // This handle owns precisely the child created above, never a process tree.
                    Check(TerminateProcess(process.hProcess, TIMEOUT_EXIT), "Terminate owned timed-out child");
                    Check(WaitForSingleObject(process.hProcess, INFINITE) == WAIT_OBJECT_0, "Wait for owned child termination");
                    end = Stopwatch.GetTimestamp();
                }
                else Check(wait == WAIT_OBJECT_0, "WaitForSingleObject");
                exited = true;

                uint exitCode;
                ulong cycles;
                FILETIME created, ended, kernel, user;
                Check(GetExitCodeProcess(process.hProcess, out exitCode), "GetExitCodeProcess");
                Check(GetProcessTimes(process.hProcess, out created, out ended, out kernel, out user), "GetProcessTimes");
                Check(QueryProcessCycleTime(process.hProcess, out cycles), "QueryProcessCycleTime");
                Sample sample = new Sample();
                sample.ProcessId = process.dwProcessId;
                sample.ExitCode = exitCode;
                sample.TimedOut = timedOut;
                sample.EffectiveAffinity = effective.ToUInt64();
                sample.SystemAffinity = system.ToUInt64();
                sample.QpcFrequency = Stopwatch.Frequency;
                sample.WallTicks = end - resume;
                sample.CreateAndPinTicks = resume - launch;
                sample.LaunchToExitTicks = end - launch;
                sample.WallMs = sample.WallTicks * 1000.0 / Stopwatch.Frequency;
                sample.CreateAndPinMs = sample.CreateAndPinTicks * 1000.0 / Stopwatch.Frequency;
                sample.LaunchToExitMs = sample.LaunchToExitTicks * 1000.0 / Stopwatch.Frequency;
                sample.User100ns = user.Value;
                sample.Kernel100ns = kernel.Value;
                sample.UserMs = user.Value / 10000.0;
                sample.KernelMs = kernel.Value / 10000.0;
                sample.TotalCpuMs = (user.Value + kernel.Value) / 10000.0;
                sample.Cycles = cycles;
                sample.PrimaryThreadId = process.dwThreadId;
                sample.NormalizedPrimaryPriority = normalizePrimaryPriority;
                sample.PrioritySamples = prioritySamples;
                sample.PriorityCorrections = priorityCorrections;
                sample.FirstPriorityCorrectionMs = firstCorrection == 0 ? 0 :
                    (firstCorrection - resume) * 1000.0 / Stopwatch.Frequency;
                sample.MaxPriorityObservationGapMs = maxObservationGap * 1000.0 / Stopwatch.Frequency;
                sample.CreatedUtc = DateTime.FromFileTimeUtc(created.Value).ToString("o");
                sample.ExitedUtc = DateTime.FromFileTimeUtc(ended.Value).ToString("o");
                return sample;
            }
            finally
            {
                // Also reap our suspended child if pinning/resume setup fails.
                try
                {
                    if (createdChild && !exited)
                    {
                        Check(TerminateProcess(process.hProcess, TIMEOUT_EXIT), "Terminate owned child after launcher failure");
                        Check(WaitForSingleObject(process.hProcess, INFINITE) == WAIT_OBJECT_0, "Reap owned child");
                    }
                }
                finally
                {
                    if (createdChild)
                    {
                        Close(process.hThread);
                        Close(process.hProcess);
                    }
                    Close(input);
                    Close(output);
                    Close(error);
                    if (environment != IntPtr.Zero) Marshal.FreeHGlobal(environment);
                }
            }
        }
    }
}
'@

try {
    try { $ownsMutex = $mutex.WaitOne(0) }
    catch [Threading.AbandonedMutexException] {
        $ownsMutex = $true
        throw 'A previous runner abandoned the mutex; investigate that run before measuring again.'
    }
    if (-not $ownsMutex) { throw 'Another string-loading runner owns the global LP14 mutex.' }
    $observerAffinity = $launcherAffinity.ToInt64() -band (-bnot [long]0x4000)
    if ($observerAffinity -eq 0) { throw 'Launcher requires an available processor outside LP14.' }
    $launcher.ProcessorAffinity = [IntPtr]$observerAffinity
    if (-not (Test-ContainsPath $root $output) -or $output.Equals($root, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'OutputDirectory must be a new directory inside this project.'
    }
    foreach ($path in @($root, $output, $SettingsFile, $UsersDirectory) + @($runtimes.A, $runtimes.B)) {
        Assert-PlainPath $path
    }
    if (Test-Path -LiteralPath $output) { throw "OutputDirectory already exists: $output" }
    foreach ($inputPath in @($SettingsFile, $UsersDirectory, $runtimes.A, $runtimes.B)) {
        if ((Test-ContainsPath $inputPath $output) -or (Test-ContainsPath $output $inputPath)) {
            throw "Output must be separate from input: $inputPath"
        }
    }
    if (-not (Test-Path -LiteralPath $SettingsFile -PathType Leaf) -or
        -not (Test-Path -LiteralPath $UsersDirectory -PathType Container)) {
        throw 'SettingsFile and UsersDirectory must be existing inputs.'
    }
    $settings = Get-Content -LiteralPath $SettingsFile -Raw | ConvertFrom-Json
    if ($settings.screenMode -cne 'windowed' -or
        ($settings.customScale -isnot [int] -and $settings.customScale -isnot [long]) -or
        $settings.customScale -ne 0) {
        throw 'The shared settings.json must specify screenMode="windowed" and integer customScale=0; it is never rewritten.'
    }
    $userFiles = @(Get-ChildItem -LiteralPath $UsersDirectory -File |
        Where-Object { $_.Name -match '^(users|user\d+)\.dat$' } | Sort-Object Name)
    if (@($userFiles | Where-Object { $_.Name -ieq 'users.dat' }).Count -ne 1) {
        throw 'UsersDirectory must contain users.dat; only users.dat and user<ID>.dat are copied.'
    }
    Assert-Idle
    $inputs = [ordered]@{
        runner = Get-Fingerprint $PSCommandPath 'Tests/performance/run-string-loading-bench.ps1'
        settings = Get-Fingerprint $SettingsFile 'settings.json'
        users = @($userFiles | ForEach-Object { Get-Fingerprint $_.FullName ('users/' + $_.Name) })
        runtimeA = @(Get-RuntimeFingerprints $runtimes.A)
        runtimeB = @(Get-RuntimeFingerprints $runtimes.B)
    }
    $gitHead = & git -C $root rev-parse HEAD
    if ($LASTEXITCODE -ne 0) { throw 'Cannot record the source Git revision.' }
    $gitStatus = @(& git -C $root status --porcelain=v1 --untracked-files=normal)
    if ($LASTEXITCODE -ne 0) { throw 'Cannot record the dirty source state.' }
    $inherited = [Environment]::GetEnvironmentVariables('Process')
    $removedNames = @($inherited.Keys | Where-Object { $_ -match '^(PVZ_|VK_)' } | Sort-Object)
    $baseEnvironment = @{}
    foreach ($key in $inherited.Keys) {
        if ($key -notmatch '^(PVZ_|VK_)') { $baseEnvironment[$key] = [string]$inherited[$key] }
    }
    $controlledEnvironment = [ordered]@{
        PVZ_MODERN_HIDDEN = '1'
        PVZ_MODERN_UNSCALED = '1'
        PVZ_MODERN_SMOKE = '1'
        PVZ_MODERN_CLOSE_DURING_LOADING = 'AfterParticles'
        PVZ_STARTUP_PROBE = '1'
        PVZ_REANIM_PERF = '0'
        VK_LOADER_LAYERS_DISABLE = '*'
        DISABLE_RTSS_LAYER = '1'
    }
    $limitations = @(
        'Actual hidden modern-game initialization, loading to AfterParticles, real close callback, main-loop exit, worker join, cleanup, and destruction; not a string microbenchmark or FPS measurement.'
        'The stage is after LoaderBar/full reanimation definitions, LoadingImages/LoadingFonts, disabled MusicInit, cache/foley setup, and particle definitions. Sound playback/loading is disabled by -nosound.'
        'AfterParticles is a cancellation checkpoint, not a precise end of all loading work: the worker resumes and can enter common/partial PreloadForUser before observing close. Remaining upload/drain and teardown work is included.'
        'Normal completion of user preloading, LoadingSounds, delayed resource groups, LoadingCompleted, user-facing selector readiness, and steady-state gameplay are not measured.'
        'This smoke stage uses a controlled worker wait (up to 500 ms) and startup logging. PASS proves release by main-loop exit, not a 500 ms timeout; probe/scheduling/teardown costs remain included.'
        'WallMs is QPC from immediately before ResumeThread to the parent observing child exit. LaunchToExitMs also includes CreateProcessW and suspended affinity setup; CPU and cycles cover the entire child lifetime and all its threads, including kernel/driver work charged to it.'
        'One warm-up per runtime (retained raw, excluded from medians) precedes nine paired rounds. Hashing and warm-ups populate caches; no cache flush, global power/clock changes, or machine tuning occurs. Owned child processes use Normal priority class. This is not a cold disk/cache test.'
        'Both variants use the same byte-exact settings and users.dat/user<ID>.dat seed. No .dat64 or game saves are copied or converted; modern source reads user<ID>.dat64, so these .dat copies do not establish a profile-detail/save-loading workload.'
        'Staged binaries/resources are compared as provided. Hashes identify them but do not prove matching compiler options or identical non-string changes; an A/B difference is not attributable solely to strings.'
        'The global mutex excludes this tool only. Pre-launch process scans reject named build/game/bench processes, not all background work or a noncooperating process starting after the scan; main remains responsible for serialization.'
    )
    New-Item -ItemType Directory -Path $output | Out-Null
    $metadata = [ordered]@{
        schema = 1
        status = 'prepared'
        createdUtc = [DateTime]::UtcNow.ToString('o')
        finishedUtc = $null
        failure = $null
        schedulingOwner = 'main; all final performance measurement must be serialized on LP14'
        mutex = 'Global\PvzStringLoadingBench-LP14'
        affinityMask = '0x4000'
        logicalProcessor = 14
        launcherAffinityMask = '0x' + $observerAffinity.ToString('X')
        normalizePrimaryThreadPriority = [bool]$NormalizePrimaryThreadPriority
        primaryPriorityPolicy = if($NormalizePrimaryThreadPriority){
            'Owned primary thread Normal; observe every 1ms and undo only AboveNormal, recording corrections and observation gaps. Neither runtime input is modified.'
        }else{'Application primary-thread priorities are not changed; do not claim equal scheduling if the runtimes differ.'}
        processorGroupContract = 'exactly one active processor group'
        runtimeA = $runtimes.A
        runtimeB = $runtimes.B
        settingsSource = $SettingsFile
        usersSource = $UsersDirectory
        output = $output
        executableName = 'PlantsVsZombiesModern.exe'
        arguments = '-nosound'
        warmups = @('A', 'B')
        pairedOrders = @('AB', 'BA', 'AB', 'BA', 'AB', 'BA', 'AB', 'BA', 'AB')
        measuredPairs = 9
        timeoutSeconds = $TimeoutSeconds
        controlledEnvironment = $controlledEnvironment
        environmentPolicy = 'inherit other variables; remove every inherited PVZ_* and VK_* variable, then apply only the recorded controls and private paths'
        removedEnvironmentNames = $removedNames
        disabledInstrumentation = @('PVZ_PHASE_PERF', 'PVZ_WARM_TRACE', 'PVZ_RUNTIME_TRACE', 'PVZ_BENCH_TRACE', 'PVZ_BENCH_LOOKUP', 'PVZ_MPHF_VERIFY', 'PVZ_REANIM_TRACK_DUMP')
        validation = 'PVZ_VULKAN_VALIDATION absent (not 0); all inherited VK_* settings removed; VK_LOADER_LAYERS_DISABLE=*'
        runnerPid = $PID
        machine = [Environment]::MachineName
        os = [Environment]::OSVersion.VersionString
        processorIdentifier = $env:PROCESSOR_IDENTIFIER
        logicalProcessorCount = [Environment]::ProcessorCount
        powershellVersion = $PSVersionTable.PSVersion.ToString()
        dotnetVersion = [Environment]::Version.ToString()
        timezone = [TimeZoneInfo]::Local.Id
        qpcFrequency = [Diagnostics.Stopwatch]::Frequency
        gitHead = $gitHead
        gitStatus = $gitStatus
        inputManifest = 'input-hashes.json'
        rawSamples = 'samples.jsonl and each run/sample.json; warm-ups retained but excluded from medians'
        limitations = $limitations
    }
    Write-Json (Join-Path $output 'metadata.json') $metadata
    Write-Json (Join-Path $output 'input-hashes.json') $inputs
    $seed = Join-Path $output 'seed'
    New-Item -ItemType Directory -Path (Join-Path $seed 'users') | Out-Null
    Copy-Item -LiteralPath $SettingsFile -Destination (Join-Path $seed 'settings.json')
    Assert-FingerprintsEqual $inputs.settings (Get-Fingerprint (Join-Path $seed 'settings.json') 'settings.json') 'frozen settings'
    foreach ($file in $inputs.users) {
        $name = [IO.Path]::GetFileName($file.path)
        $copy = Join-Path $seed $file.path
        Copy-Item -LiteralPath (Join-Path $UsersDirectory $name) -Destination $copy
        Assert-FingerprintsEqual $file (Get-Fingerprint $copy $file.path) "frozen $name"
    }

    Add-Type -TypeDefinition $nativeSource
    $samples = New-Object 'Collections.Generic.List[object]'
    $state = @{ sequence = 0 }

    function Invoke-LoadingRun([string]$Variant, [int]$Pair, [string]$Phase) {
        $state.sequence++
        $runName = '{0:D2}-{1}-pair{2:D2}-{3}' -f $state.sequence, $Phase, $Pair, $Variant
        $run = Join-Path $output $runName
        $users = Join-Path $run 'users'
        $smoke = Join-Path $run 'smoke'
        $logs = Join-Path $run 'logs'
        $temp = Join-Path $run 'tmp'
        New-Item -ItemType Directory -Path $run, $users, $smoke, $logs, $temp | Out-Null
        $sample = [ordered]@{
            sequence = $state.sequence; phase = $Phase; pair = $Pair; variant = $Variant
            directory = $runName; preparedUtc = [DateTime]::UtcNow.ToString('o')
            status = 'prepared'; failure = $null; metrics = $null; passLine = $null
            privateEnvironment = [ordered]@{
                PVZ_APPDATA_DIR = $users
                PVZ_SETTINGS_FILE = Join-Path $run 'settings.json'
                PVZ_LOG_DIR = $logs
                PVZ_MODERN_SMOKE_OUTPUT = $smoke
                TEMP = $temp
                TMP = $temp
            }
            inputCopies = @()
        }
        try {
            $copies = @(
                Copy-Item -LiteralPath (Join-Path $seed 'settings.json') -Destination $sample.privateEnvironment.PVZ_SETTINGS_FILE
                $settingsHash = Get-Fingerprint $sample.privateEnvironment.PVZ_SETTINGS_FILE 'settings.json'
                Assert-FingerprintsEqual $inputs.settings $settingsHash 'per-run settings'
                $settingsHash
                foreach ($file in $inputs.users) {
                    $destination = Join-Path $run $file.path
                    Copy-Item -LiteralPath (Join-Path $seed $file.path) -Destination $destination
                    $hash = Get-Fingerprint $destination $file.path
                    Assert-FingerprintsEqual $file $hash 'per-run profile'
                    $hash
                }
            )
            $sample.inputCopies = $copies
            $environment = @{}
            foreach ($key in $baseEnvironment.Keys) { $environment[$key] = $baseEnvironment[$key] }
            foreach ($key in $controlledEnvironment.Keys) { $environment[$key] = $controlledEnvironment[$key] }
            foreach ($key in $sample.privateEnvironment.Keys) { $environment[$key] = $sample.privateEnvironment[$key] }
            [string[]]$names = @($environment.Keys)
            [Array]::Sort($names, [StringComparer]::OrdinalIgnoreCase)
            $block = (($names | ForEach-Object { $_ + '=' + $environment[$_] }) -join "`0") + "`0`0"
            Write-Json (Join-Path $run 'sample.json') $sample
            Write-Host "$runName on LP14"
            # Last operation before native launch; no asynchronous dispatch anywhere.
            Assert-Idle
            $sample.metrics = [PvzStringLoadingBench.Native]::Measure(
                (Join-Path $runtimes[$Variant] 'PlantsVsZombiesModern.exe'), $runtimes[$Variant],
                $block, (Join-Path $run 'stdout.txt'), (Join-Path $run 'stderr.txt'),
                [uint32]($TimeoutSeconds * 1000), [bool]$NormalizePrimaryThreadPriority)
            if ($sample.metrics.TimedOut) { throw 'Owned child timed out and was terminated; no partial medians are valid.' }
            if ($NormalizePrimaryThreadPriority -and $sample.metrics.PrioritySamples -eq 0) {
                throw 'No live primary-thread priority observations; equal scheduling is unverified.'
            }
            if ($sample.metrics.ExitCode -ne 0) { throw "Game exited nonzero: $($sample.metrics.ExitCode)" }
            if ($sample.metrics.WallTicks -le 0 -or $sample.metrics.TotalCpuMs -le 0 -or $sample.metrics.Cycles -eq 0) {
                throw 'Wall time, process CPU time, and cycles must all be positive measured values.'
            }
            $result = Get-Content -LiteralPath (Join-Path $smoke 'result.log') -Raw
            $pass = [regex]::Matches($result,
                '(?m)^PASS loading-close stage=AfterParticles callback/loop/join/game-cleanup/destruction verified\r?$')
            if ($pass.Count -ne 1) { throw 'Missing unique PASS loading-close stage=AfterParticles with complete teardown evidence.' }
            $identity = Get-Content -LiteralPath (Join-Path $logs 'startup-probe.log') -Raw
            if ($identity -notmatch 'Modern hidden smoke instance identity isolated') {
                throw 'The hidden smoke instance did not confirm isolated identity.'
            }
            $sample.passLine = $pass[0].Value.TrimEnd([char]"`r")
            $sample.status = 'passed'
        }
        catch {
            $sample.status = 'failed'
            $sample.failure = $_.Exception.Message
            throw
        }
        finally {
            Write-Json (Join-Path $run 'sample.json') $sample
            [IO.File]::AppendAllText((Join-Path $output 'samples.jsonl'),
                ($sample | ConvertTo-Json -Depth 8 -Compress) + "`n", $utf8)
            $samples.Add($sample)
        }
        return $sample
    }

    $metadata.status = 'running'
    Write-Json (Join-Path $output 'metadata.json') $metadata
    $null = Invoke-LoadingRun 'A' 0 'warmup'
    $null = Invoke-LoadingRun 'B' 0 'warmup'
    $pairs = @(
        for ($pair = 1; $pair -le 9; $pair++) {
            $order = if (($pair % 2) -eq 1) { @('A', 'B') } else { @('B', 'A') }
            $paired = @{}
            foreach ($variant in $order) { $paired[$variant] = Invoke-LoadingRun $variant $pair 'measured' }
            [ordered]@{
                pair = $pair
                order = $order -join ''
                aSequence = $paired.A.sequence
                bSequence = $paired.B.sequence
                wallImprovementPercent = 100.0 * (1.0 - $paired.B.metrics.WallMs / $paired.A.metrics.WallMs)
                cpuImprovementPercent = 100.0 * (1.0 - $paired.B.metrics.TotalCpuMs / $paired.A.metrics.TotalCpuMs)
                cyclesImprovementPercent = 100.0 * (1.0 - $paired.B.metrics.Cycles / [double]$paired.A.metrics.Cycles)
                wallRatioBToA = $paired.B.metrics.WallMs / $paired.A.metrics.WallMs
                cpuRatioBToA = $paired.B.metrics.TotalCpuMs / $paired.A.metrics.TotalCpuMs
                cyclesRatioBToA = $paired.B.metrics.Cycles / [double]$paired.A.metrics.Cycles
            }
        }
    )
    if ($samples.Count -ne 20 -or @($samples | Where-Object { $_.status -ne 'passed' }).Count -ne 0 -or $pairs.Count -ne 9) {
        throw 'Exactly two successful warm-ups and eighteen successful measurements are required.'
    }
    Assert-Idle
    Assert-FingerprintsEqual $inputs.runner (Get-Fingerprint $PSCommandPath 'Tests/performance/run-string-loading-bench.ps1') 'runner'
    Assert-FingerprintsEqual $inputs.settings (Get-Fingerprint $SettingsFile 'settings.json') 'source settings'
    $finalUsers = @(Get-ChildItem -LiteralPath $UsersDirectory -File |
        Where-Object { $_.Name -match '^(users|user\d+)\.dat$' } | Sort-Object Name |
        ForEach-Object { Get-Fingerprint $_.FullName ('users/' + $_.Name) })
    Assert-FingerprintsEqual $inputs.users $finalUsers 'source profiles'
    Assert-FingerprintsEqual $inputs.runtimeA @(Get-RuntimeFingerprints $runtimes.A) 'baseline runtime'
    Assert-FingerprintsEqual $inputs.runtimeB @(Get-RuntimeFingerprints $runtimes.B) 'new runtime'

    function Get-NineMedian($Values) {
        $sorted = @($Values | Sort-Object)
        if ($sorted.Count -ne 9) { throw 'A median requires all nine values, never a partial sample.' }
        return $sorted[4]
    }
    $summary = [ordered]@{}
    foreach ($variant in @('A', 'B')) {
        $measured = @($samples | Where-Object { $_.phase -eq 'measured' -and $_.variant -eq $variant })
        $metrics = [ordered]@{}
        foreach ($metric in @('WallMs', 'LaunchToExitMs', 'CreateAndPinMs', 'UserMs', 'KernelMs', 'TotalCpuMs', 'Cycles')) {
            $metrics[$metric] = Get-NineMedian @($measured | ForEach-Object { $_.metrics.$metric })
        }
        $summary[$variant] = $metrics
    }
    $report = [ordered]@{
        schema = 1; status = 'passed'; pairs = $pairs; medians = $summary
        pairedMedianImprovementPercent = [ordered]@{
            wall = Get-NineMedian @($pairs | ForEach-Object { $_.wallImprovementPercent })
            cpu = Get-NineMedian @($pairs | ForEach-Object { $_.cpuImprovementPercent })
            cycles = Get-NineMedian @($pairs | ForEach-Object { $_.cyclesImprovementPercent })
        }
        positiveImprovementMeans = 'B uses less time/cycles than A; paired percentages are computed within each round before taking the median'
        limitations = $limitations
    }
    $gateMetrics = [ordered]@{}
    foreach ($metric in @('wall', 'cpu', 'cycles')) {
        $improvement = $report.pairedMedianImprovementPercent[$metric]
        $ratioField = $metric + 'RatioBToA'
        $ratio = Get-NineMedian @($pairs | ForEach-Object { $_[$ratioField] })
        $gateMetrics[$metric] = [ordered]@{
            pairedMedianImprovementPercent = $improvement
            pairedMedianRatioBToA = $ratio
            noMoreThanFivePercentRegression = ($ratio -le 1.05)
        }
    }
    $gatePassed = $NormalizePrimaryThreadPriority -and
        @($gateMetrics.Values | Where-Object { -not $_.noMoreThanFivePercentRegression }).Count -eq 0
    $report.performanceGate = [ordered]@{
        status = if($gatePassed){'passed'}elseif(!$NormalizePrimaryThreadPriority){'unverified-scheduling'}else{'failed'}
        scope = 'AfterParticles loading-close including teardown; not full menu readiness or gameplay FPS'
        maximumPairedMedianRegressionPercent = 5.0
        controlledPrimaryPriorityRequired = $true
        metrics = $gateMetrics
    }
    if (!$gatePassed) { $report.status = 'complete-measurement-gate-not-passed' }
    $metadata.status = 'passed'
    $metadata.performanceGateStatus = $report.performanceGate.status
    $metadata.finishedUtc = [DateTime]::UtcNow.ToString('o')
    Write-Json (Join-Path $output 'metadata.json') $metadata
    # Only a complete, hash-stable run receives a report or any median output.
    Write-Json (Join-Path $output 'report.json') $report
    Write-Host ('Median wall ms: A={0:F3}, B={1:F3}; paired improvement={2:F2}%' -f
        $summary.A.WallMs, $summary.B.WallMs, $report.pairedMedianImprovementPercent.wall)
    Write-Host ('Median User+Kernel CPU ms: A={0:F3}, B={1:F3}; cycles: A={2}, B={3}' -f
        $summary.A.TotalCpuMs, $summary.B.TotalCpuMs, $summary.A.Cycles, $summary.B.Cycles)
    foreach ($limitation in $limitations) { Write-Host $limitation }
    Write-Host "Complete evidence: $output"
    if (!$gatePassed) { throw "Complete measurement retained, performance gate $($report.performanceGate.status)" }
}
catch {
    if ($null -ne $metadata) {
        $metadata.status = 'failed'
        $metadata.failure = $_.Exception.Message
        $metadata.finishedUtc = [DateTime]::UtcNow.ToString('o')
        Write-Json (Join-Path $output 'metadata.json') $metadata
    }
    throw
}
finally {
    $launcher.ProcessorAffinity = $launcherAffinity
    if ($ownsMutex) { $mutex.ReleaseMutex() }
    $mutex.Dispose()
}
