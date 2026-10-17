# Standalone preparation only by default. Main owns scheduling all LP14 work.
# Measurement is intentionally opt-in and forbidden while the pause is active.
[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)),
    [string]$OldDirectory = 'C:/Users/Administrator/AppData/Local/Temp/pvz-strings-baseline-20261010/compiled/reanim',
    [string]$NewDirectory = 'C:/Users/Administrator/CLionProjects/codex/openPvz/.generated/rootcorpus/out-idt5-final-20261010',
    [string]$PythonExe = 'C:/UserProgram/DevTools/Python314/python.exe',
    [string]$VsEnvironment = 'C:/UserProgram/Visual Studuio/2026/Community/VC/Auxiliary/Build/vcvars64.bat',
    [string]$OutputDirectory = '',
    [switch]$BuildOnly,
    [switch]$Measure,
    [switch]$PinLP14
)
$ErrorActionPreference = 'Stop'
if ($BuildOnly -and $Measure) { throw 'Choose BuildOnly or Measure.' }
if ($Measure -and -not $PinLP14) { throw 'Measurement requires -PinLP14; main must serialize all benchmarks on LP14.' }
$utf8 = New-Object System.Text.UTF8Encoding($false)
$project = [IO.Path]::GetFullPath($ProjectRoot)
$source = Join-Path $project 'Tests/performance/bench_reanim_metadata.cpp'
$generator = Join-Path $project 'Tests/performance/gen-reanim-metadata-bench-fixture.py'
foreach ($required in @($source, $generator, $PythonExe, $OldDirectory, $NewDirectory)) {
    if (-not (Test-Path -LiteralPath $required)) { throw "Missing required path: $required" }
}
if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path ([IO.Path]::GetTempPath()) ('reanim-metadata-preparation-' + [guid]::NewGuid().ToString('N'))
}
$output = [IO.Path]::GetFullPath($OutputDirectory)
# No writes to input corpus or game runtime directories.
foreach ($inputDirectory in @($OldDirectory, $NewDirectory)) {
    $root = [IO.Path]::GetFullPath($inputDirectory).TrimEnd([char[]]'\/')
    if ($output.Equals($root, [StringComparison]::OrdinalIgnoreCase) -or
        $output.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
        throw 'Output must be separate from old/new corpus directories.'
    }
}
New-Item -ItemType Directory -Path $output -Force | Out-Null
$build = Join-Path $output 'standalone-build'
New-Item -ItemType Directory -Path $build -Force | Out-Null
$fixture = Join-Path $build 'reanim_metadata_bench_fixture.h'
$manifest = Join-Path $output 'fixture-manifest.json'
& $PythonExe -B $generator --project $project --old-dir $OldDirectory --new-dir $NewDirectory --output $fixture --manifest $manifest
if ($LASTEXITCODE -ne 0) { throw "Offline fixture verification failed: $LASTEXITCODE" }
if (-not $BuildOnly -and -not $Measure) {
    Write-Host "Prepared and verified fixture only. No compiler or benchmark executable started. Output: $output"
    return
}
if (-not (Test-Path -LiteralPath $VsEnvironment)) { throw "Missing VS environment: $VsEnvironment" }
$executable = Join-Path $build 'bench_reanim_metadata.exe'
$object = Join-Path $build 'bench_reanim_metadata.obj'
$assembly = Join-Path $build 'bench_reanim_metadata.asm'
$compile = 'cl.exe /nologo /std:c++23preview /O2 /Ob2 /DNDEBUG /EHsc /W4 /MD /GL- /fp:precise /FAcs /Fa"' + $assembly + '" /I"' + $build + '" /Fo"' + $object + '" /Fe"' + $executable + '" "' + $source + '" /link /INCREMENTAL:NO /OPT:REF /OPT:NOICF'
$commandFile = Join-Path $build 'build.cmd'
[IO.File]::WriteAllText($commandFile, "@call `"$VsEnvironment`"`r`n@if errorlevel 1 exit /b %errorlevel%`r`n@$compile`r`n@exit /b %errorlevel%`r`n", $utf8)
$buildInfo = New-Object Diagnostics.ProcessStartInfo
$buildInfo.FileName = $env:ComSpec
$buildInfo.Arguments = '/d /s /c ""' + $commandFile + '""'
$buildInfo.WorkingDirectory = $build
$buildInfo.UseShellExecute = $false
$buildInfo.CreateNoWindow = $true
$buildInfo.RedirectStandardOutput = $true
$buildInfo.RedirectStandardError = $true
$buildProcess = [Diagnostics.Process]::Start($buildInfo)
$buildOut = $buildProcess.StandardOutput.ReadToEndAsync()
$buildErr = $buildProcess.StandardError.ReadToEndAsync()
$buildProcess.WaitForExit()
[IO.File]::WriteAllText((Join-Path $output 'build.log'), $buildOut.Result + $buildErr.Result, $utf8)
if ($buildProcess.ExitCode -ne 0) { throw "Standalone build failed: $($buildProcess.ExitCode); see build.log" }
if ($BuildOnly) {
    Write-Host "Standalone build complete; no benchmark started. Executable: $executable"
    return
}
# One process, synchronous wait: never dispatch a second benchmark here.
# The executable has its own LP14 mutex. Other benchmark families remain the
# responsibility of main's serialized scheduler; this mutex does not own them.
$runInfo = New-Object Diagnostics.ProcessStartInfo
$runInfo.FileName = $executable
$runInfo.Arguments = '--serialized-measurement --pin-lp14 --old-dir "' + [IO.Path]::GetFullPath($OldDirectory) + '" --new-dir "' + [IO.Path]::GetFullPath($NewDirectory) + '" --output "' + $output + '"'
$runInfo.WorkingDirectory = $build
$runInfo.UseShellExecute = $false
$runInfo.CreateNoWindow = $true
$runInfo.RedirectStandardOutput = $true
$runInfo.RedirectStandardError = $true
$runProcess = [Diagnostics.Process]::Start($runInfo)
$runOut = $runProcess.StandardOutput.ReadToEndAsync()
$runErr = $runProcess.StandardError.ReadToEndAsync()
$timedOut = -not $runProcess.WaitForExit(30000)
if ($timedOut) { $runProcess.Kill(); $runProcess.WaitForExit() }
[IO.File]::WriteAllText((Join-Path $output 'run.log'), $runOut.Result + $runErr.Result, $utf8)
$metadata = [ordered]@{
    completed_utc = [DateTime]::UtcNow.ToString('o')
    source = $source
    source_sha256 = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash.ToLowerInvariant()
    generator_sha256 = (Get-FileHash -LiteralPath $generator -Algorithm SHA256).Hash.ToLowerInvariant()
    runner_sha256 = (Get-FileHash -LiteralPath $PSCommandPath -Algorithm SHA256).Hash.ToLowerInvariant()
    fixture_sha256 = (Get-FileHash -LiteralPath $fixture -Algorithm SHA256).Hash.ToLowerInvariant()
    executable_sha256 = (Get-FileHash -LiteralPath $executable -Algorithm SHA256).Hash.ToLowerInvariant()
    compile_command = $compile
    benchmark_process_id = $runProcess.Id
    benchmark_exit_code = $runProcess.ExitCode
    benchmark_timed_out = $timedOut
    maximum_process_wall_ms = 30000
    all_LP14_benchmarks_serialized_by_main = $true
    game_executables_started = $false
    total_game_loading_measured = $false
}
[IO.File]::WriteAllText((Join-Path $output 'run-metadata.json'), ($metadata | ConvertTo-Json -Depth 4) + "`n", $utf8)
if ($timedOut) { throw '30 second benchmark process budget exceeded; no partial medians should be accepted.' }
if ($runProcess.ExitCode -ne 0) { throw "Benchmark failed: $($runProcess.ExitCode); see run.log" }
$results = Get-Content -LiteralPath (Join-Path $output 'results.json') -Raw | ConvertFrom-Json
if ($results.status -ne 'passed' -or $results.rounds -ne 9 -or $results.affinity_effective -ne 16384 -or
    $results.logical_processor_observed -ne 14 -or $results.wall_ms -ge 30000) {
    throw 'Measurement metadata violates the run contract.'
}
Write-Host $runOut.Result
Write-Host "Results: $output"
