param(
    [Parameter(Mandatory=$true)][string]$BuildDirectory,
    [Parameter(Mandatory=$true)][string]$SaveFile,
    [string]$PakFile,
    [int]$GameMode = 0,
    [string]$OutputDirectory,
    [ValidateSet('Particle','Reanimation')][string]$RejectVariant,
    [switch]$ReuseExecutable
)
$ErrorActionPreference='Stop'
$taskRoot=Split-Path -Parent $PSScriptRoot
$taskBuild=(Resolve-Path -LiteralPath $BuildDirectory).Path
$taskOriginal=(Resolve-Path -LiteralPath $SaveFile).Path
$taskBefore=(Get-FileHash -LiteralPath $taskOriginal -Algorithm SHA256).Hash
$taskRuntime=Join-Path $taskBuild 'Release'
$taskOutput=if($OutputDirectory){[IO.Path]::GetFullPath($OutputDirectory)}else{Join-Path $taskBuild 'save-upgrade-tests'}
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
$taskCopy=Join-Path $taskOutput ("old-save-"+[Guid]::NewGuid().ToString('N')+'.dat64')
Copy-Item -LiteralPath $taskOriginal -Destination $taskCopy
if ($RejectVariant) {
    if (!$PakFile) { throw 'Variant rejection needs the production resource package' }
    $taskBytes=[IO.File]::ReadAllBytes($taskCopy)
    if ($taskBytes.Length -lt 52 -or [BitConverter]::ToUInt32($taskBytes,36) -ne 0x10739 -or
        [BitConverter]::ToUInt32($taskBytes,40) -ne 3) {
        throw 'Variant rejection requires a current DAT64 v3.3 copy'
    }
    $taskCursor=48+4+[BitConverter]::ToUInt32($taskBytes,48)
    $taskPool=if ($RejectVariant -eq 'Particle') { 6 } else { 9 }
    for ($taskIndex=0; $taskIndex -lt $taskPool; ++$taskIndex) {
        $taskCursor+=16+[BitConverter]::ToUInt32($taskBytes,($taskCursor+12))
    }
    $taskUsed=[BitConverter]::ToUInt32($taskBytes,($taskCursor+4))
    $taskRecordSize=if ($RejectVariant -eq 'Particle') { 84 } else { 244 }
    $taskStride=if ($RejectVariant -eq 'Particle') { 92 } else { 252 }
    $taskVariantOffset=if ($RejectVariant -eq 'Particle') { 4 } else { 12 }
    if ([BitConverter]::ToUInt32($taskBytes,($taskCursor+12)) -ne $taskUsed*$taskStride) {
        throw 'Unexpected current pool layout in variant rejection fixture'
    }
    $taskPatched=$false
    for ($taskIndex=0; $taskIndex -lt $taskUsed; ++$taskIndex) {
        $taskSlot=$taskCursor+16+$taskIndex*$taskStride
        if (([BitConverter]::ToUInt32($taskBytes,($taskSlot+$taskRecordSize)) -band 0xffff0000L) -ne 0) {
            [BitConverter]::GetBytes([uint32]::MaxValue).CopyTo($taskBytes,($taskSlot+$taskVariantOffset))
            $taskPatched=$true
            break
        }
    }
    if (!$taskPatched) { throw 'No live object available for the variant rejection case' }
    [IO.File]::WriteAllBytes($taskCopy,$taskBytes)
}
$taskSource=Join-Path $taskRoot 'Tests\native\SaveGameUpgradeTests.cpp'
$taskObject=Join-Path $taskOutput 'SaveGameUpgradeTests.cpp.obj'
$taskExecutable=Join-Path $taskOutput 'save_upgrade_tests.exe'
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
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/pdb:[^ ]+','/pdb:"'+(Join-Path $taskOutput 'save_upgrade_tests.pdb')+'"','IgnoreCase')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/implib:[^ ]+','/implib:"'+(Join-Path $taskOutput 'save_upgrade_tests.lib')+'"','IgnoreCase')
$taskLinkCommand=[regex]::Replace($taskLinkCommand,'/subsystem:windows','/subsystem:console','IgnoreCase')
$taskLinkMatch=[regex]::Match($taskLinkCommand,'^(?:"[^"]+link.exe"|\S*link.exe)')
if (!$taskLinkMatch.Success) { throw 'Cannot identify the runtime linker' }
$taskResponse=Join-Path $taskOutput 'link.rsp'
[IO.File]::WriteAllText($taskResponse,$taskLinkCommand.Substring($taskLinkMatch.Length),
    [Text.UTF8Encoding]::new($false))
$taskLinkCommand=$taskLinkMatch.Value+' @"'+$taskResponse+'"'
if (!$ReuseExecutable) {
    Push-Location $taskBuild
    try {
        & $env:ComSpec /d /v:on /s /c ($taskEnvironment+$taskCompileCommand) |
            Where-Object { $_ -notmatch '^(Note: including file:|注意: 包含文件:)' }
        if ($LASTEXITCODE -ne 0) { throw 'Save-upgrade fixture compilation failed' }
        & $env:ComSpec /d /v:on /s /c ($taskEnvironment+$taskLinkCommand)
        if ($LASTEXITCODE -ne 0) { throw 'Save-upgrade fixture link failed' }
    }
    finally { Pop-Location }
}
elseif (!(Test-Path -LiteralPath $taskExecutable)) {
    throw 'Build the save fixture once before reusing its executable'
}
foreach ($taskDll in Get-ChildItem -LiteralPath $taskRuntime -Filter '*.dll' -File) {
    Copy-Item -LiteralPath $taskDll.FullName -Destination $taskOutput -Force
}
$taskShaders=Join-Path $taskOutput 'shaders'
$taskRuntimeShaders=Join-Path $taskRuntime 'shaders'
if ($PakFile -and (Test-Path -LiteralPath $taskRuntimeShaders) -and !(Test-Path -LiteralPath $taskShaders)) {
    New-Item -ItemType Junction -Path $taskShaders -Target $taskRuntimeShaders | Out-Null
}
$taskStart=[Diagnostics.ProcessStartInfo]::new($taskExecutable)
$taskStart.WorkingDirectory=$taskOutput
$taskStart.UseShellExecute=$false
$taskStart.CreateNoWindow=$true
$taskStart.RedirectStandardOutput=$true
$taskStart.RedirectStandardError=$true
$taskStart.ArgumentList.Add($taskCopy)
if ($PakFile) {
    $taskStart.ArgumentList.Add((Resolve-Path -LiteralPath $PakFile).Path)
    $taskStart.ArgumentList.Add($GameMode.ToString())
    if ($RejectVariant) { $taskStart.ArgumentList.Add('reject-variant') }
}
$taskChild=[Diagnostics.Process]::Start($taskStart)
$taskStdout=$taskChild.StandardOutput.ReadToEndAsync()
$taskStderr=$taskChild.StandardError.ReadToEndAsync()
try {
    if (!$taskChild.WaitForExit(50000)) {
        $taskChild.Kill()
        $taskChild.WaitForExit()
        throw 'Save-upgrade fixture exceeded its 50-second process limit'
    }
    $taskStdout.GetAwaiter().GetResult()
    $taskStderr.GetAwaiter().GetResult()
    if ($taskChild.ExitCode -ne 0) { throw "Save-upgrade fixture failed: $($taskChild.ExitCode)" }
}
finally {
    $taskAfter=(Get-FileHash -LiteralPath $taskOriginal -Algorithm SHA256).Hash
    if ($taskBefore -ne $taskAfter) { throw 'Original save changed during the read-only fixture' }
    Write-Output "Original save SHA256 unchanged: $taskAfter"
}
