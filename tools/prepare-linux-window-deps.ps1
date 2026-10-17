param(
    [string]$Distribution='Ubuntu-26.04',
    [string]$ArchiveBaseUri='https://archive.ubuntu.com/ubuntu/'
)
$ErrorActionPreference='Stop'
$projectRoot=Split-Path -Parent $PSScriptRoot
$dependencyRoot=Join-Path $projectRoot 'out\linux-window-deps'
$archives=Join-Path $dependencyRoot 'archives'
$sysroot=Join-Path $dependencyRoot 'sysroot'
New-Item -ItemType Directory -Path $archives,$sysroot -Force | Out-Null
$packages=@('libx11-dev','x11proto-dev','libffi-dev','libwayland-dev','libwayland-bin','libwayland-client0',
    'libwayland-server0','libwayland-cursor0','libxkbcommon-dev','libxkbcommon0','wayland-protocols',
    'libdecor-0-dev','libdecor-0-0','libdecor-0-plugin-1-cairo')
$metadata=(& wsl.exe -d $Distribution -u root -- apt-cache show @packages) -join "`n"
if($LASTEXITCODE){throw 'Unable to read signed Ubuntu package metadata'}
$selected=@{}
foreach($paragraph in ($metadata -split '(?:\r?\n){2,}')){
    $fields=@{}
    foreach($line in ($paragraph -split '\r?\n')){
        if($line -match '^([A-Za-z0-9-]+): (.*)$'){$fields[$Matches[1]]=$Matches[2]}
    }
    if($fields.ContainsKey('Package') -and !$selected.ContainsKey($fields['Package'])){
        $selected[$fields['Package']]=$fields
    }
}
$linuxSysroot=& wsl.exe -d $Distribution -- wslpath -a $sysroot.Replace('\','/')
if($LASTEXITCODE){throw 'Unable to resolve dependency sysroot'}
$linuxSysroot=$linuxSysroot.Trim()
foreach($package in $packages){
    $entry=$selected[$package]
    if(!$entry -or !$entry['Filename'] -or !$entry['SHA256']){
        throw "Package filename/hash unavailable: $package"
    }
    $archive=Join-Path $archives ([IO.Path]::GetFileName($entry['Filename']))
    if(!(Test-Path -LiteralPath $archive)){
        Invoke-WebRequest -Uri ($ArchiveBaseUri.TrimEnd('/')+'/'+$entry['Filename']) `
            -OutFile $archive -TimeoutSec 60
    }
    if((Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ne $entry['SHA256']){
        throw "Ubuntu archive hash mismatch: $package"
    }
    $linuxArchive=(& wsl.exe -d $Distribution -- wslpath -a $archive.Replace('\','/')).Trim()
    & wsl.exe -d $Distribution -u root -- dpkg-deb -x $linuxArchive $linuxSysroot
    if($LASTEXITCODE){throw "Dependency extraction failed: $package"}
    Write-Output "$package extracted (verified SHA256)"
}
Write-Output "Linux window dependency sysroot: $linuxSysroot"
