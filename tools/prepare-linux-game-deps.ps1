param([string]$Distribution = 'Ubuntu-26.04')
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$dependencyRoot = Join-Path $projectRoot 'out/linux-window-deps'
$archives = Join-Path $dependencyRoot 'archives'
New-Item -ItemType Directory -Path $archives -Force | Out-Null
$packages = @('libvulkan-dev', 'vulkan-tools', 'vulkan-validationlayers', 'glslc', 'spirv-tools',
    'libx11-dev', 'libwayland-dev', 'libwayland-bin', 'libxkbcommon-dev',
    'wayland-protocols', 'libdecor-0-dev', 'libdecor-0-plugin-1-cairo',
    'libasound2-plugins', 'libopenal-dev', 'xclip', 'wl-clipboard', 'xdg-user-dirs')
$uris = & wsl.exe -d $Distribution -u root -- apt-get --print-uris -qq -y --no-install-recommends install @packages
if ($LASTEXITCODE) { throw 'Unable to resolve Linux game dependencies' }
$paths = [Collections.Generic.List[string]]::new()
foreach ($line in $uris) {
    if ($line -notmatch "^'([^']+)' ([^ ]+) ([0-9]+) MD5Sum:([0-9a-f]+)$") {
        throw "Unexpected apt URI record: $line"
    }
    $uri = $Matches[1] -replace '^http:', 'https:'
    $filename = $Matches[2]
    $repositoryFilename = [Uri]::UnescapeDataString((([Uri]$uri).AbsolutePath -split '/')[-1])
    $expectedSize = [long]$Matches[3]
    $archive = Join-Path $archives $filename
    $packageName = $filename.Split('_')[0]
    $metadata = (& wsl.exe -d $Distribution -- apt-cache show $packageName) -join "`n"
    if ($LASTEXITCODE) { throw "Unable to read signed package metadata: $packageName" }
    $sha256 = $null
    foreach ($record in ($metadata -split '\n\n')) {
        if ($record -match '(?m)^Filename: (.+)$') {
            if ([Uri]::UnescapeDataString(($Matches[1] -split '/')[-1]) -eq $repositoryFilename) {
                if ($record -match '(?m)^SHA256: ([0-9a-f]+)$') {
                    $sha256 = $Matches[1]
                    break
                }
            }
        }
    }
    if (!$sha256) { throw "SHA256 missing for $filename" }
    if (!(Test-Path -LiteralPath $archive)) {
        Invoke-WebRequest -Uri $uri -OutFile $archive -TimeoutSec 60
    }
    if ((Get-Item -LiteralPath $archive).Length -ne $expectedSize -or
        (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -ne $sha256) {
        throw "Package verification failed: $filename"
    }
    $linuxArchive = (& wsl.exe -d $Distribution -- wslpath -a $archive.Replace('\', '/')).Trim()
    if ($LASTEXITCODE) { throw "Cannot resolve $archive" }
    $paths.Add($linuxArchive)
    Write-Output "Verified: $filename"
}
if ($paths.Count) {
    & wsl.exe -d $Distribution -u root -- dpkg --install @paths
    if ($LASTEXITCODE) { throw 'Linux dependency installation failed' }
}
Write-Output 'Linux game system dependencies ready.'
