$ErrorActionPreference='Stop'
[Diagnostics.Process]::GetCurrentProcess().ProcessorAffinity=[IntPtr]0x3FFF
$projectRoot=[IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
$outputRoot=(Resolve-Path -LiteralPath (Join-Path $projectRoot 'out')).Path
$evidenceRoot=Join-Path $projectRoot 'log/docs-evidence/20261015'
$null=New-Item -ItemType Directory -Path $evidenceRoot -Force
Add-Type -AssemblyName Microsoft.VisualBasic
$records=[System.Collections.Generic.List[object]]::new()

function Assert-ChildPath([string]$Path,[string]$Parent) {
    $full=[IO.Path]::GetFullPath($Path)
    if(-not $full.StartsWith($Parent+[IO.Path]::DirectorySeparatorChar,
        [StringComparison]::OrdinalIgnoreCase)) {throw "Path outside intended root: $full"}
    return $full
}
function Move-Evidence([string]$Source,[string]$Destination) {
    $sourcePath=Assert-ChildPath $Source $outputRoot
    $destinationPath=Assert-ChildPath $Destination $evidenceRoot
    if(-not (Test-Path -LiteralPath $sourcePath)) {return}
    if(Test-Path -LiteralPath $destinationPath) {throw "Evidence destination exists: $destinationPath"}
    $null=New-Item -ItemType Directory -Path (Split-Path -Parent $destinationPath) -Force
    Move-Item -LiteralPath $sourcePath -Destination $destinationPath -ErrorAction Stop
}
function Preserve-TextAndProfiles([string]$Directory,[string]$Label) {
    $directoryPath=Assert-ChildPath $Directory $outputRoot
    $files=@(Get-ChildItem -LiteralPath $directoryPath -Recurse -File -Force)
    foreach($file in $files) {
        $relative=[IO.Path]::GetRelativePath($directoryPath,$file.FullName)
        if($relative -match '(^|[\\/])CMakeFiles([\\/]|$)') {continue}
        if($file.Name -in @('CMakeCache.txt','cmake_install.cmake','CTestTestfile.cmake',
            'DartConfiguration.tcl','compile_commands.json','TargetDirectories.txt','CTestCostData.txt')) {continue}
        $preserve=$file.Extension -in @('.json','.csv','.log','.txt','.md','.cpp','.c','.h','.inl','.ps1','.cmd','.dat','.dat64')
        $preserve=$preserve -or $relative -match '(^|[\\/])[^\\/]*backup[^\\/]*([\\/]|$)'
        if($preserve) {
            Move-Evidence $file.FullName (Join-Path (Join-Path $evidenceRoot $Label) $relative)
        }
    }
}
function Recycle-Directory([string]$Path) {
    $target=Assert-ChildPath $Path $outputRoot
    if(-not (Test-Path -LiteralPath $target)) {return}
    $item=Get-Item -LiteralPath $target -Force
    $children=@(Get-ChildItem -LiteralPath $target -Recurse -Force)
    if(($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -or
        ($children | Where-Object {$_.Attributes -band [IO.FileAttributes]::ReparsePoint})) {
        throw "Reparse point in recycle target: $target"
    }
    if(Get-Process | Where-Object {
        $_.Path -and $_.Path.StartsWith($target+[IO.Path]::DirectorySeparatorChar,
            [StringComparison]::OrdinalIgnoreCase)
    }) {throw "Build is active: $target"}
    $bytes=[long](($children | Where-Object {-not $_.PSIsContainer} | Measure-Object Length -Sum).Sum)
    Write-Output "Recycling $target ($bytes bytes)"
    [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory(
        $target,
        [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
        [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin,
        [Microsoft.VisualBasic.FileIO.UICancelOption]::ThrowException)
    if(Test-Path -LiteralPath $target) {throw "Directory still exists after recycle: $target"}
    $records.Add([pscustomobject]@{path=$target;bytes=$bytes;action='sent-to-recycle-bin'})
    $records | ConvertTo-Json -Depth 4 |
        Set-Content -LiteralPath (Join-Path $evidenceRoot 'recycled-builds.json') -Encoding UTF8
}

foreach($name in @('message-budget-control-20261015','message-filter-control-20261015',
    'message-readiness-control-20261015','native-message-split-20261015','ledger-reference')) {
    Move-Evidence (Join-Path $outputRoot $name) (Join-Path $evidenceRoot $name)
}
Move-Evidence (Join-Path $outputRoot 'perf-baseline-20261013') `
    (Join-Path $evidenceRoot 'baselines/perf-baseline-20261013')

foreach($entry in @(
    @{source='_retired-builds/modern-game/Release';label='baselines/modern-game-20261014-1743/Release'},
    @{source='modern-d3d12-message-budget/Release';label='baselines/mouse-budget-20261015-194222/Release'}
)) {
    $release=Join-Path $outputRoot $entry.source
    if(Test-Path -LiteralPath $release) {
        foreach($item in Get-ChildItem -LiteralPath $release -Force) {
            if($item.Name -ne 'log') {
                Move-Evidence $item.FullName (Join-Path (Join-Path $evidenceRoot $entry.label) $item.Name)
            }
        }
    }
}

$obsolete=@('accessor-control-20261015','board-mode-lifetime-20261015',
    'board-mode-template-control-20261015','final-contract-20261015',
    'message-range-probe-20261015','modern-d3d12-heartbeat',
    'modern-d3d12-message-budget','modern-d3d12-message-split',
    'modern-vulkan-message-split','mouse-thread-control-20261015',
    'overnight-control-20261015','scale-d3d12-cpu-check',
    'win32-aw-probe-20261015','yesno-control-20261015')
foreach($name in $obsolete) {
    $directory=Join-Path $outputRoot $name
    if(Test-Path -LiteralPath $directory) {
        Preserve-TextAndProfiles $directory $name
        Recycle-Directory $directory
    }
}
$retired=Join-Path $outputRoot '_retired-builds'
if(Test-Path -LiteralPath $retired) {
    foreach($directory in Get-ChildItem -LiteralPath $retired -Directory) {
        Preserve-TextAndProfiles $directory.FullName ('retired-'+$directory.Name)
        Recycle-Directory $directory.FullName
    }
    Recycle-Directory $retired
}
foreach($name in @('cleanup-20261015.json','delete-obsolete-builds-20261015-plan.json',
    'build-combination-paths-20261015.json')) {
    Move-Evidence (Join-Path $outputRoot $name) (Join-Path $evidenceRoot $name)
}
$oldLauncher=Join-Path $outputRoot 'start-dx12-budget-lp14.cmd'
if(Test-Path -LiteralPath $oldLauncher) {
    [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
        $oldLauncher,
        [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs,
        [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin,
        [Microsoft.VisualBasic.FileIO.UICancelOption]::ThrowException)
}
[pscustomobject]@{
    recycledDirectories=$records.Count
    recycledBytes=[long](($records | Measure-Object bytes -Sum).Sum)
    evidenceRoot=$evidenceRoot
    permanentDelete=$false
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $evidenceRoot 'cleanup-summary.json') -Encoding UTF8
Write-Output "CLEANUP_COMPLETE directories=$($records.Count)"
