param(
    [Parameter(Mandatory=$true)][string]$BuildDirectory
)
$ErrorActionPreference='Stop'
$taskRoot=Split-Path -Parent $PSScriptRoot
$taskBuild=(Resolve-Path -LiteralPath $BuildDirectory).Path
$taskRuntime=Join-Path $taskBuild 'Release'
$taskOutput=Join-Path $taskBuild 'music-runtime-tests'
$taskNinja='C:\Users\Administrator\AppData\Local\Programs\CLion\bin\ninja\win\x64\ninja.exe'
$taskVcvars='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
$taskCommands=@(& $taskNinja -C $taskBuild -t commands LawnProject)
if ($LASTEXITCODE -ne 0) { throw 'Cannot inspect the existing runtime build graph' }
$taskMain=Join-Path $taskRoot 'pvzPerf\main.cpp'
$taskCompile=@($taskCommands | Where-Object {
    $_ -match '/FoSexyAppFramework[\\/]CMakeFiles[\\/]LawnProject.dir[\\/]__[\\/]main.cpp.obj' })
$taskExpanded=@(& $taskNinja -C $taskBuild -t compdb -x | ConvertFrom-Json)
if ($LASTEXITCODE -ne 0) { throw 'Cannot expand the runtime link response' }
$taskLink=@($taskExpanded | Where-Object {
    $_.command -match 'vs_link_exe.*pvz_perf.exe' } | ForEach-Object { $_.command })
if ($taskCompile.Count -ne 1 -or $taskLink.Count -ne 1) {
    throw 'Expected one game entry point and one runtime link command'
}
New-Item -ItemType Directory -Path $taskOutput -Force | Out-Null
$taskSource=Join-Path $taskRoot 'Tests\native\MusicRuntimeTests.cpp'
$taskObject=Join-Path $taskOutput 'MusicRuntimeTests.cpp.obj'
$taskExecutable=Join-Path $taskOutput 'music_runtime_tests.exe'
$taskCompileCommand=$taskCompile[0].Replace($taskMain,$taskSource)
$taskCompileCommand=[regex]::Replace($taskCompileCommand,'/Fo[^ ]+','/Fo"'+$taskObject+'"')
$taskCompileCommand=[regex]::Replace($taskCompileCommand,'/Fd[^ ]+','/Fd"'+(Join-Path $taskOutput 'compile.pdb')+'"')
$taskCompilerMatch=[regex]::Match($taskCompile[0],'^(?:"([^"]+)"|(\S+))')
$taskCompiler=if ($taskCompilerMatch.Groups[1].Success) {
    $taskCompilerMatch.Groups[1].Value
} else { $taskCompilerMatch.Groups[2].Value }
$taskToolset=Split-Path -Parent (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $taskCompiler)))
$taskEnvironment='call "{0}" >nul && set "PATH={1}\bin\Hostx64\x64;!PATH!" && set "INCLUDE={1}\include;!INCLUDE!" && set "LIB={1}\lib\x64;!LIB!" && ' -f $taskVcvars,$taskToolset
$taskLinkCommand=$taskLink[0].Substring($taskLink[0].IndexOf(' -- ')+4)
$taskLinkCommand=($taskLinkCommand -split ' && ',2)[0]
$taskLinkCommand=$taskLinkCommand.Replace('SexyAppFramework\CMakeFiles\LawnProject.dir\__\main.cpp.obj','"'+$taskObject+'"')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/out:[^ ]+','/out:"'+$taskExecutable+'"','IgnoreCase')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/pdb:[^ ]+','/pdb:"'+(Join-Path $taskOutput 'music_runtime_tests.pdb')+'"','IgnoreCase')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/implib:[^ ]+','/implib:"'+(Join-Path $taskOutput 'music_runtime_tests.lib')+'"','IgnoreCase')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/subsystem:windows','/subsystem:console','IgnoreCase')
$taskLinkMatch=[regex]::Match($taskLinkCommand,'^(?:"[^"]+link.exe"|\S*link.exe)')
if (!$taskLinkMatch.Success) { throw 'Cannot identify the runtime linker' }
$taskResponse=Join-Path $taskOutput 'link.rsp'
[IO.File]::WriteAllText($taskResponse,$taskLinkCommand.Substring($taskLinkMatch.Length),
    [Text.UTF8Encoding]::new($false))
$taskLinkCommand=$taskLinkMatch.Value+' @"'+$taskResponse+'"'
Push-Location $taskBuild
try {
    & $env:ComSpec /d /v:on /s /c ($taskEnvironment+$taskCompileCommand) |
        Where-Object { $_ -notmatch '^(Note: including file:|注意: 包含文件:)' }
    if ($LASTEXITCODE -ne 0) { throw 'Music runtime fixture compilation failed' }
    & $env:ComSpec /d /v:on /s /c ($taskEnvironment+$taskLinkCommand)
    if ($LASTEXITCODE -ne 0) { throw 'Music runtime fixture link failed' }
}
finally { Pop-Location }
foreach ($taskDll in Get-ChildItem -LiteralPath $taskRuntime -Filter '*.dll' -File) {
    Copy-Item -LiteralPath $taskDll.FullName -Destination $taskOutput -Force
}
Push-Location $taskOutput
try {
    $taskStart=[Diagnostics.ProcessStartInfo]::new($taskExecutable)
    $taskStart.WorkingDirectory=$taskOutput
    $taskStart.UseShellExecute=$false
    $taskStart.CreateNoWindow=$true
    $taskStart.RedirectStandardOutput=$true
    $taskStart.RedirectStandardError=$true
    $taskStart.ArgumentList.Add((Join-Path $taskRoot 'assets\runtime'))
    $taskChild=[Diagnostics.Process]::Start($taskStart)
    $taskStdout=$taskChild.StandardOutput.ReadToEndAsync()
    $taskStderr=$taskChild.StandardError.ReadToEndAsync()
    if (!$taskChild.WaitForExit(50000)) {
        $taskChild.Kill()
        $taskChild.WaitForExit()
        throw 'Music runtime fixture exceeded its 50-second process limit'
    }
    $taskStdout.GetAwaiter().GetResult()
    $taskStderr.GetAwaiter().GetResult()
    if ($taskChild.ExitCode -ne 0) { throw "Music runtime regression failed: $($taskChild.ExitCode)" }
}
finally { Pop-Location }
