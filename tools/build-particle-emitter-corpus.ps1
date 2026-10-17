param(
    [string]$CompilerBuild,
    [string]$InputDsl,
    [string]$GoldDirectory,
    [string]$OutputDirectory,
    [string]$SourcePak,
    [string]$PackageOutput,
    [switch]$SkipCompilerBuild,
    [switch]$StageRuntime
)
$ErrorActionPreference='Stop'
$root=Split-Path -Parent $PSScriptRoot
$compiler=Join-Path $root 'tools\resourceCompiler\src'
$work=Join-Path $root 'log'
if(!$CompilerBuild){$CompilerBuild=Join-Path $root 'out\x64-win32-dx12\tools\resourceCompiler\build'}
if(!$InputDsl){$InputDsl=Join-Path $root 'assets\definitions\particles\all.root.dsl'}
if(!$GoldDirectory){$GoldDirectory=Join-Path $root 'assets\definitions\particle-reference'}
if(!$OutputDirectory){$OutputDirectory=Join-Path $work ('emitter-numeric-'+[guid]::NewGuid().ToString('N'))}
$registry=Join-Path $root 'pvzPerf/Sexy.TodLib\generated\image_symbol_ids.bin'
foreach($path in @($InputDsl,$GoldDirectory,$registry)){
    if(!(Test-Path -LiteralPath $path)){throw "Missing particle compiler input: $path"}
}
if(Test-Path -LiteralPath $OutputDirectory){throw "Choose a fresh particle output directory: $OutputDirectory"}
if(!$SkipCompilerBuild){
    $vs='C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat'
    $cmake=(Get-Command cmake -ErrorAction Stop).Source
    $build='call "{0}" >nul && "{1}" --build "{2}" --parallel 6' -f $vs,$cmake,$CompilerBuild
    & $env:ComSpec /d /s /c $build
    if($LASTEXITCODE){throw "Particle compiler build failed: $LASTEXITCODE"}
}
$exe=Join-Path $CompilerBuild 'reanimc.exe'
if(!(Test-Path -LiteralPath $exe)){throw "Particle compiler not found: $exe"}
$usage=& $exe --help
if($LASTEXITCODE -notin @(0,2) -or ($usage -join "`n") -notlike '*<name>.compiled*'){
    throw "Particle compiler predates direct numeric output names; rebuild it serially: $exe"
}
& $exe compile-particle-v2 --input $InputDsl --output $OutputDirectory --gold64 $GoldDirectory --image-registry $registry
if($LASTEXITCODE){throw "Particle corpus compilation failed: $LASTEXITCODE"}
$report=Join-Path $OutputDirectory 'verification.json'
& python -B (Join-Path $PSScriptRoot 'verify-particle-emitter-corpus.py') --gold-v2 $OutputDirectory --compiled $OutputDirectory --image-registry $registry --output $report
if($LASTEXITCODE){throw "Particle corpus verification failed: $LASTEXITCODE"}
if($StageRuntime){
    # Header integration belongs to the game build; packaging must never change it implicitly.
    $generatedHeader=Join-Path $OutputDirectory 'ParticleEmitterName.h'
    $runtimeHeader=Join-Path $root 'pvzPerf/Sexy.TodLib\generated\ParticleEmitterName.h'
    if((Get-FileHash -LiteralPath $generatedHeader).Hash -ne (Get-FileHash -LiteralPath $runtimeHeader).Hash){
        throw "Emitter registry header changed; integrate and rebuild the game before packaging: $generatedHeader"
    }
    if(!$SourcePak){$SourcePak=Join-Path $root 'out\x64-win32-dx12\Release\main.pak64'}
    if(!$PackageOutput){$PackageOutput=Join-Path $OutputDirectory 'runtime.pak64'}
    $stage=Join-Path $OutputDirectory 'runtime-stage'
    & python -B (Join-Path $PSScriptRoot 'stage_runtime_package.py') $SourcePak $stage --particles $OutputDirectory --root $root
    if($LASTEXITCODE){throw "Particle package staging failed: $LASTEXITCODE"}
    & python -B (Join-Path $PSScriptRoot 'build_numeric_runtime_pak64.py') $SourcePak $stage $PackageOutput --root $root --replace-definitions
    if($LASTEXITCODE){throw "Particle candidate packaging failed: $LASTEXITCODE"}
    Write-Output "Verified runtime candidate package: $PackageOutput"
}
Write-Output "Verified numeric particle corpus: $OutputDirectory"
