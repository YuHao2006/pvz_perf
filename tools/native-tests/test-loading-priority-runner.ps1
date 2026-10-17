param(
    [Parameter(Mandatory=$true)][string]$FixtureExecutable,
    [Parameter(Mandatory=$true)][string]$OutputDirectory
)
$ErrorActionPreference='Stop'
Set-StrictMode -Version Latest
$root=Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$runner=Join-Path $root 'Tests/performance/run-string-loading-bench.ps1'
$FixtureExecutable=(Resolve-Path -LiteralPath $FixtureExecutable).Path
$output=[IO.Path]::GetFullPath($OutputDirectory)
if(Test-Path -LiteralPath $output){throw 'Fixture output must be a new directory'}
New-Item -ItemType Directory -Path $output | Out-Null
$tokens=$null
$errors=$null
$ast=[System.Management.Automation.Language.Parser]::ParseFile($runner,[ref]$tokens,[ref]$errors)
if($errors.Count){throw ($errors | Out-String)}
$assignment=$ast.Find({
    param($node)
    $node -is [System.Management.Automation.Language.AssignmentStatementAst] -and
    $node.Left -is [System.Management.Automation.Language.VariableExpressionAst] -and
    $node.Left.VariablePath.UserPath -eq 'nativeSource'
},$true)
$literal=$assignment.Right.Find({
    param($node)
    $node -is [System.Management.Automation.Language.StringConstantExpressionAst]
},$true)
Add-Type -TypeDefinition $literal.Value
$environment=[Environment]::GetEnvironmentVariables()
[string[]]$names=@($environment.Keys)
[Array]::Sort($names,[StringComparer]::OrdinalIgnoreCase)
$block=(($names | ForEach-Object {$_+'='+$environment[$_]}) -join "`0")+"`0`0"
$observer=[Diagnostics.Process]::GetCurrentProcess()
$originalAffinity=$observer.ProcessorAffinity
$results=[ordered]@{status='running';executable=$FixtureExecutable;cases=@()}
try {
    $outsideLP14=$originalAffinity.ToInt64() -band (-bnot [long]0x4000)
    if(!$outsideLP14){throw 'Test observer requires a processor outside LP14'}
    $observer.ProcessorAffinity=[IntPtr]$outsideLP14
    foreach($case in @(
        @{name='unaltered';normalize=$false;timeout=5000},
        @{name='normalized';normalize=$true;timeout=5000},
        @{name='owned-timeout';normalize=$true;timeout=30}
    )){
        $sample=[PvzStringLoadingBench.Native]::Measure($FixtureExecutable,
            (Split-Path -Parent $FixtureExecutable),$block,
            (Join-Path $output ($case.name+'-stdout.txt')),
            (Join-Path $output ($case.name+'-stderr.txt')),
            [uint32]$case.timeout,[bool]$case.normalize)
        if($sample.EffectiveAffinity -ne 0x4000 -or $sample.NormalizedPrimaryPriority -ne $case.normalize){
            throw 'Fixture affinity/normalization contract changed'
        }
        if($case.name -eq 'owned-timeout'){
            if(!$sample.TimedOut -or $sample.ExitCode -ne 0xdead){throw 'Owned timeout was not reaped'}
        }else{
            if($sample.TimedOut -or $sample.ExitCode -ne 0){throw 'Priority fixture did not complete normally'}
        }
        if($case.name -eq 'normalized'){
            if($sample.PrioritySamples -le 0 -or $sample.PriorityCorrections -ne 1 -or
                $sample.FirstPriorityCorrectionMs -le 0 -or $sample.MaxPriorityObservationGapMs -le 0){
                throw 'Raised primary priority was not observed and corrected exactly once'
            }
        }elseif($case.name -eq 'unaltered' -and
            ($sample.PrioritySamples -ne 0 -or $sample.PriorityCorrections -ne 0)){
            throw 'Unaltered fixture priority was observed or changed'
        }
        if(Get-Process -Id $sample.ProcessId -ErrorAction SilentlyContinue){
            throw 'Fixture child remains live after return'
        }
        # Functional evidence only, deliberately omit wall/CPU/cycle metrics.
        $results.cases+=@{
            case=$case.name;processId=$sample.ProcessId;exitCode=$sample.ExitCode;
            timedOut=$sample.TimedOut;priorityCorrections=$sample.PriorityCorrections;
            priorityObserved=($sample.PrioritySamples -gt 0);affinity='0x4000'
        }
    }
    $creationFailed=$false
    try {
        $null=[PvzStringLoadingBench.Native]::Measure((Join-Path $output 'missing.exe'),
            $output,$block,(Join-Path $output 'missing-stdout.txt'),
            (Join-Path $output 'missing-stderr.txt'),5000,$true)
    }catch [System.ComponentModel.Win32Exception]{$creationFailed=$true}
    if(!$creationFailed){throw 'Missing executable was not rejected'}
    $results.creationFailureRejected=$true
    $results.status='passed'
    'PASS loading launcher priorities, suspended LP14 affinity, owned timeout, and creation failure'
}catch {
    $results.status='failed'
    $results.failure=$_.Exception.Message
    throw
}finally {
    $observer.ProcessorAffinity=$originalAffinity
    $observer.Dispose()
    [IO.File]::WriteAllText((Join-Path $output 'verification.json'),($results | ConvertTo-Json -Depth 8))
}
