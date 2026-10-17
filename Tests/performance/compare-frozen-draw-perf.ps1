param(
    [Parameter(Mandatory)][string[]]$ControlRuns,
    [Parameter(Mandatory)][string[]]$CandidateRuns,
    [string]$OutputFile
)
$ErrorActionPreference='Stop'

function Median([double[]]$Values){
    if(!$Values.Count){return $null}
    $sorted=@($Values | Sort-Object)
    $middle=[int][Math]::Floor($sorted.Count/2)
    if($sorted.Count%2){return [double]$sorted[$middle]}
    return ([double]$sorted[$middle-1]+[double]$sorted[$middle])/2
}
function Read-Runs([string[]]$Paths){
    foreach($path in $Paths){
        $root=[IO.Path]::GetFullPath($path)
        $verification=Get-Content -LiteralPath (Join-Path $root 'verification.json') -Raw | ConvertFrom-Json
        if($verification.status -ne 'passed' -or $verification.exitCode -ne 0 -or
            !$verification.frozenDrawBenchmark -or !$verification.rtssLayerDisabled){
            throw "Not a completed isolated frozen benchmark: $root"
        }
        $rows=@(Import-Csv -LiteralPath (Join-Path $root 'frozen-draw-perf.csv'))
        if($rows.Count -ne 640){throw "Wrong sample count: $root"}
        $times=@($rows | ForEach-Object {
            [double]::Parse($_.draw_cpu_us,[Globalization.CultureInfo]::InvariantCulture)
        })
        $sorted=@($times | Sort-Object)
        [pscustomobject]@{
            path=$root;affinity=$verification.affinity;sha256=$verification.executableSha256
            medianUs=(Median $times);p90Us=$sorted[[int][Math]::Ceiling($sorted.Count*.9)-1]
            medianThreadCycles=if($rows[0].PSObject.Properties.Name -contains 'thread_cycles'){
                Median @($rows | ForEach-Object { [double]$_.thread_cycles })
            }else{$null}
            roundMedians=@($rows | Group-Object round | ForEach-Object {
                Median @($_.Group | ForEach-Object {
                    [double]::Parse($_.draw_cpu_us,[Globalization.CultureInfo]::InvariantCulture)
                })
            })
            pixels=[IO.File]::ReadAllBytes((Join-Path $root 'frozen-draw-pixels.bin'))
            population=($rows[0].plants+':'+$rows[0].zombies+':'+$rows[0].textures)
        }
    }
}
$control=@(Read-Runs $ControlRuns)
$candidate=@(Read-Runs $CandidateRuns)
if(!$control.Count -or !$candidate.Count){throw 'Both benchmark groups are required'}
$reference=$control[0]
$referencePixels=[Convert]::ToBase64String($reference.pixels)
foreach($run in @($control)+@($candidate)){
    if($run.affinity -ne $reference.affinity -or $run.population -ne $reference.population -or
        ![String]::Equals([Convert]::ToBase64String($run.pixels),$referencePixels,[StringComparison]::Ordinal)){
        throw "Core, population, textures or exact pixels differ: $($run.path)"
    }
}
$controlMedian=Median @($control | ForEach-Object medianUs)
$candidateMedian=Median @($candidate | ForEach-Object medianUs)
$controlP90=Median @($control | ForEach-Object p90Us)
$candidateP90=Median @($candidate | ForEach-Object p90Us)
$summary=[ordered]@{
    schema=1;controlRuns=@($control.path);candidateRuns=@($candidate.path)
    affinity=$reference.affinity;pixelBytes=$reference.pixels.Length;exactPixelsEqual=$true
    controlMedianUs=$controlMedian;candidateMedianUs=$candidateMedian
    medianChangePercent=100*($candidateMedian/$controlMedian-1)
    controlP90Us=$controlP90;candidateP90Us=$candidateP90
    p90ChangePercent=100*($candidateP90/$controlP90-1)
    controlMedianThreadCycles=Median @($control | ForEach-Object medianThreadCycles)
    candidateMedianThreadCycles=Median @($candidate | ForEach-Object medianThreadCycles)
    gate=if($candidateMedian -le $controlMedian -and $candidateP90 -le $controlP90){'pass'}else{'not-passed'}
    limitation='Frozen CPU draw timing; excludes flush/fence/readback and does not prove physical mouse or battery FPS behavior.'
}
$json=$summary | ConvertTo-Json -Depth 8
if($OutputFile){[IO.File]::WriteAllText([IO.Path]::GetFullPath($OutputFile),$json)}
$json
if($summary.gate -ne 'pass'){exit 1}
