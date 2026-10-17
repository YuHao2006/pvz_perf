[CmdletBinding()]
param(
    [string]$ProjectRoot = (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)),
    [string]$GoldenCorpus = 'C:/Users/Administrator/CLionProjects/codex/openPvz/.particle_work/baseline_v4',
    [string]$PythonExe = 'C:/UserProgram/DevTools/Python314/python.exe',
    [string]$VsEnvironment = 'C:/UserProgram/Visual Studuio/2026/Community/VC/Auxiliary/Build/vcvars64.bat',
    [string]$OutputDirectory = '',
    [switch]$FadeOutOnly
)
$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$project = [IO.Path]::GetFullPath($ProjectRoot)
$tools = Join-Path $project 'Tests/performance'
$source = Join-Path $tools 'bench_particle_emitter_names.cpp'
$generator = Join-Path $tools 'gen-particle-emitter-bench-fixture.py'
foreach ($required in @($source, $generator, $PythonExe, $VsEnvironment, $GoldenCorpus)) {
    if (-not (Test-Path -LiteralPath $required)) { throw "Missing required path: $required" }
}
if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $runLabel = if ($FadeOutOnly) { 'particle-emitter-fadeout-' } else { 'particle-emitter-microbench-' }
    $OutputDirectory = Join-Path $project ('log/' + $runLabel + (Get-Date -Format 'yyyyMMdd-HHmmss-fff'))
}
$output = [IO.Path]::GetFullPath($OutputDirectory)
$allowedLog = [IO.Path]::GetFullPath((Join-Path $project 'log')) + [IO.Path]::DirectorySeparatorChar
if (-not $output.StartsWith($allowedLog, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Results must be under this project log folder.'
}
New-Item -ItemType Directory -Path $output -Force | Out-Null
$build = Join-Path ([IO.Path]::GetTempPath()) ('particle-emitter-bench-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $build | Out-Null
$fixture = Join-Path $build 'particle_emitter_bench_fixture.h'
$manifest = Join-Path $output 'fixture-manifest.json'
& $PythonExe -B $generator --project $project --gold-v2 $GoldenCorpus --output $fixture --manifest $manifest
if ($LASTEXITCODE -ne 0) { throw "Fixture generation failed with exit code $LASTEXITCODE" }

$executable = Join-Path $build 'bench_particle_emitter_names.exe'
$object = Join-Path $build 'bench_particle_emitter_names.obj'
$assembly = Join-Path $build 'bench_particle_emitter_names.asm'
$compile = 'cl.exe /nologo /std:c++23preview /O2 /Ob2 /DNDEBUG /EHsc /W4 /MD /GL- /fp:precise /FAcs /Fa"' + $assembly + '" /I"' + $build + '" /Fo"' + $object + '" /Fe"' + $executable + '" "' + $source + '" /link /INCREMENTAL:NO /OPT:REF /OPT:NOICF'
$response = Join-Path $build 'compile-command.cmd'
$batch = "@call `"$VsEnvironment`"`r`n@if errorlevel 1 exit /b %errorlevel%`r`n@where cl.exe`r`n@$compile`r`n@exit /b %errorlevel%`r`n"
[IO.File]::WriteAllText($response, $batch, $utf8)
# Keep setup and compilation in one cmd process so the official environment persists.
$buildInfo = New-Object System.Diagnostics.ProcessStartInfo
$buildInfo.FileName = $env:ComSpec
$buildInfo.Arguments = '/d /s /c ""' + $response + '""'
$buildInfo.WorkingDirectory = $build
$buildInfo.UseShellExecute = $false
$buildInfo.CreateNoWindow = $true
$buildInfo.RedirectStandardOutput = $true
$buildInfo.RedirectStandardError = $true
$buildProcess = [Diagnostics.Process]::Start($buildInfo)
$buildOutTask = $buildProcess.StandardOutput.ReadToEndAsync()
$buildErrTask = $buildProcess.StandardError.ReadToEndAsync()
$buildProcess.WaitForExit()
$buildOut = $buildOutTask.Result
$buildErr = $buildErrTask.Result
[IO.File]::WriteAllText((Join-Path $output 'build.log'), $buildOut + $buildErr, $utf8)
if ($buildProcess.ExitCode -ne 0) {
    Write-Host ($buildOut + $buildErr)
    throw "Standalone Release build failed with exit code $($buildProcess.ExitCode)"
}
# Preserve the exact fixture and standalone executable that produced this result.
Copy-Item -LiteralPath $fixture -Destination (Join-Path $output 'particle_emitter_bench_fixture.h')
Copy-Item -LiteralPath $executable -Destination (Join-Path $output 'bench_particle_emitter_names.exe')
Copy-Item -LiteralPath $assembly -Destination (Join-Path $output 'bench_particle_emitter_names.asm')

$runInfo = New-Object Diagnostics.ProcessStartInfo
$runInfo.FileName = $executable
$runInfo.Arguments = '"' + $output + '"' + $(if ($FadeOutOnly) { ' --fadeout-only' } else { '' })
$runInfo.WorkingDirectory = $build
$runInfo.UseShellExecute = $false
$runInfo.CreateNoWindow = $true
$runInfo.RedirectStandardOutput = $true
$runInfo.RedirectStandardError = $true
$runProcess = [Diagnostics.Process]::Start($runInfo)
$runOutTask = $runProcess.StandardOutput.ReadToEndAsync()
$runErrTask = $runProcess.StandardError.ReadToEndAsync()
$runProcess.WaitForExit()
$runOut = $runOutTask.Result
$runErr = $runErrTask.Result
[IO.File]::WriteAllText((Join-Path $output 'run.log'), $runOut + $runErr, $utf8)
Write-Host ($runOut + $runErr)
if ($runProcess.ExitCode -ne 0) { throw "Microbenchmark failed with exit code $($runProcess.ExitCode)" }
$results = Get-Content -LiteralPath (Join-Path $output 'results.json') -Raw | ConvertFrom-Json
if ($results.status -ne 'passed' -or $results.affinity_effective -ne 16384 -or $results.logical_processor_observed -ne 14 -or $results.rounds -ne 9 -or $results.benchmark_wall_seconds -ge 15) {
    throw 'Result metadata did not satisfy the controlled-run contract.'
}
$meta = [ordered]@{
    utc_completed = [DateTime]::UtcNow.ToString('o')
    project_root = $project
    golden_corpus = [IO.Path]::GetFullPath($GoldenCorpus)
    source_path = $source
    source_sha256 = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash.ToLowerInvariant()
    generator_path = $generator
    generator_sha256 = (Get-FileHash -LiteralPath $generator -Algorithm SHA256).Hash.ToLowerInvariant()
    runner_path = $PSCommandPath
    runner_sha256 = (Get-FileHash -LiteralPath $PSCommandPath -Algorithm SHA256).Hash.ToLowerInvariant()
    visual_studio_environment = $VsEnvironment
    compiler_command = $compile
    standalone_executable_sha256 = (Get-FileHash -LiteralPath $executable -Algorithm SHA256).Hash.ToLowerInvariant()
    build_directory = $build
    output_directory = $output
    scope = $(if ($FadeOutOnly) { 'fadeout_only' } else { 'full_suite' })
    build_process_id = $buildProcess.Id
    benchmark_process_id = $runProcess.Id
    build_process_exited = $buildProcess.HasExited
    benchmark_process_exited = $runProcess.HasExited
    game_sources_edited = $false
    game_processes_started = $false
}
[IO.File]::WriteAllText((Join-Path $output 'run-metadata.json'), ($meta | ConvertTo-Json -Depth 5) + "`n", $utf8)
Write-Host "Result directory: $output"
Write-Host "Temporary build directory: $build"
