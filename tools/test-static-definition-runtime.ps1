param(
    [Parameter(Mandatory=$true)][string]$BuildDirectory,
    [string]$PakFile,
    [string]$ManifestFile,
    [string]$Python = 'python',
    [string]$OutputDirectory,
    [switch]$ReuseExecutable
)
$ErrorActionPreference='Stop'
$taskRoot=Split-Path -Parent $PSScriptRoot
$taskBuild=(Resolve-Path -LiteralPath $BuildDirectory).Path
$taskRuntime=Join-Path $taskBuild 'Release'
if (!$PakFile) { $PakFile=Join-Path $taskBuild 'cache/resources/main.pak64' }
$taskPak=(Resolve-Path -LiteralPath $PakFile).Path
if (!$ManifestFile) {
    $ManifestFile=Join-Path (Split-Path -Parent $taskPak) 'manifest.json'
    if (!(Test-Path -LiteralPath $ManifestFile)) {
        $ManifestFile=Join-Path $taskBuild 'cache/resources/manifest.json'
    }
}
$taskManifest=(Resolve-Path -LiteralPath $ManifestFile).Path
$taskTemp=[IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar
$taskOutput=if($OutputDirectory){[IO.Path]::GetFullPath($OutputDirectory)}else{
    Join-Path $taskTemp ('pvz-static-definition-runtime-'+[Guid]::NewGuid().ToString('N'))}
if (!$taskOutput.StartsWith($taskTemp,[StringComparison]::OrdinalIgnoreCase)) {
    throw 'Static definition test outputs must stay inside the system Temp directory'
}
New-Item -ItemType Directory -Path $taskOutput -Force | Out-Null
$taskBefore=(Get-FileHash -LiteralPath $taskPak -Algorithm SHA256).Hash
$taskFixtures=Join-Path $taskOutput ('fixtures-'+[Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $taskFixtures | Out-Null
$taskFixtureScript=@'
import io, json, pathlib, sys, zipfile
from PIL import Image
pak, manifest, destination = map(pathlib.Path, sys.argv[1:])
report = json.loads(manifest.read_text(encoding="utf-8"))
assert report["format"] == "pvz-resource-build-static-v1"
definitions = report["definition_atlases"]
particle = definitions["compiled/particles/potatomine.compiled"]
reanimation = definitions["compiled/reanim/potatomine.compiled"]
target = particle["atlas_path"]
assert target and target == reanimation["atlas_path"]
png = io.BytesIO()
Image.new("RGBA", (1, 1), (255, 0, 255, 255)).save(png, format="PNG")
cases = {"missing": None, "corrupt": b"intentionally invalid PNG fixture",
         "wrong-dimension": png.getvalue()}
with zipfile.ZipFile(pak) as source:
    names = source.namelist()
    assert target in names
    assert not any(name.startswith(("compiled/reanim/", "compiled/particles/", "compiled/projectiles/"))
                   and name.endswith(".compiled") for name in names)
    for case, replacement in cases.items():
        with zipfile.ZipFile(destination / (case + ".zip"), "x",
                             compression=zipfile.ZIP_STORED) as output:
            for name in names:
                if name == target:
                    if replacement is not None:
                        output.writestr(name, replacement)
                else:
                    output.writestr(name, source.read(name))
print(json.dumps({"target": target, "reanimation_id": reanimation["definition_id"],
                  "particle_id": particle["definition_id"]}))
'@
try {
    $taskFixtureMetadata=& $Python -c $taskFixtureScript $taskPak $taskManifest $taskFixtures
    if ($LASTEXITCODE -ne 0) { throw 'Cannot prepare isolated static-definition PNG fixtures' }
    $taskMetadata=$taskFixtureMetadata | ConvertFrom-Json
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
    $taskSource=Join-Path $taskRoot 'Tests\native\StaticDefinitionRuntimeTests.cpp'
    $taskObject=Join-Path $taskOutput 'StaticDefinitionRuntimeTests.cpp.obj'
    $taskExecutable=Join-Path $taskOutput 'static_definition_runtime_tests.exe'
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
    $taskLinkCommand=[regex]::Replace($taskLinkCommand,'/pdb:[^ ]+','/pdb:"'+(Join-Path $taskOutput 'static_definition_runtime_tests.pdb')+'"','IgnoreCase')
    $taskLinkCommand=[regex]::Replace($taskLinkCommand,'/implib:[^ ]+','/implib:"'+(Join-Path $taskOutput 'static_definition_runtime_tests.lib')+'"','IgnoreCase')
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
            if ($LASTEXITCODE -ne 0) { throw 'Static definition runtime test compilation failed' }
            & $env:ComSpec /d /v:on /s /c ($taskEnvironment+$taskLinkCommand)
            if ($LASTEXITCODE -ne 0) { throw 'Static definition runtime test link failed' }
        }
        finally { Pop-Location }
    }
    elseif (!(Test-Path -LiteralPath $taskExecutable)) {
        throw 'Build the static definition test before reusing its executable'
    }
    foreach ($taskDll in Get-ChildItem -LiteralPath $taskRuntime -Filter '*.dll' -File) {
        Copy-Item -LiteralPath $taskDll.FullName -Destination $taskOutput -Force
    }
    $taskShaders=Join-Path $taskOutput 'shaders'
    $taskRuntimeShaders=Join-Path $taskRuntime 'shaders'
    if ((Test-Path -LiteralPath $taskRuntimeShaders) -and !(Test-Path -LiteralPath $taskShaders)) {
        New-Item -ItemType Junction -Path $taskShaders -Target $taskRuntimeShaders | Out-Null
    }
    foreach ($taskCase in @('lifecycle','missing','corrupt','wrong-dimension')) {
        $taskFixture=if($taskCase -eq 'lifecycle'){$taskPak}else{Join-Path $taskFixtures ($taskCase+'.zip')}
        $taskStart=[Diagnostics.ProcessStartInfo]::new($taskExecutable)
        $taskStart.WorkingDirectory=$taskOutput
        $taskStart.UseShellExecute=$false
        $taskStart.CreateNoWindow=$true
        $taskStart.RedirectStandardOutput=$true
        $taskStart.RedirectStandardError=$true
        foreach ($taskArgument in @($taskFixture,$taskCase,$taskPak,
                [string]$taskMetadata.reanimation_id,[string]$taskMetadata.particle_id,
                [string]$taskMetadata.target)) {
            $taskStart.ArgumentList.Add($taskArgument)
        }
        $taskChild=[Diagnostics.Process]::Start($taskStart)
        $taskStdout=$taskChild.StandardOutput.ReadToEndAsync()
        $taskStderr=$taskChild.StandardError.ReadToEndAsync()
        $taskTimer=[Diagnostics.Stopwatch]::StartNew()
        while (!$taskChild.WaitForExit(1000)) {
            if ($taskTimer.Elapsed.TotalSeconds -gt 180) {
                $taskChild.Kill()
                $taskChild.WaitForExit()
                throw "Static definition test timed out: $taskCase"
            }
        }
        $taskOutText=$taskStdout.GetAwaiter().GetResult()
        $taskErrText=$taskStderr.GetAwaiter().GetResult()
        [IO.File]::WriteAllText((Join-Path $taskOutput ($taskCase+'.stdout.log')),$taskOutText)
        [IO.File]::WriteAllText((Join-Path $taskOutput ($taskCase+'.stderr.log')),$taskErrText)
        Write-Output $taskOutText
        if ($taskErrText) { Write-Output $taskErrText }
        if ($taskChild.ExitCode -ne 0) { throw "Static definition test failed: $taskCase" }
    }
    Write-Output "PASS all four static definition runtime cases. Evidence: $taskOutput"
}
finally {
    $taskAfter=(Get-FileHash -LiteralPath $taskPak -Algorithm SHA256).Hash
    if ($taskBefore -ne $taskAfter) { throw 'Original production package changed during tests' }
    Write-Output "Original package SHA256 unchanged: $taskAfter"
}
