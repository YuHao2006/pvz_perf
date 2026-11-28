param(
    [string]$BuildDirectory,
    [string]$X86BuildDirectory,
    [string]$CompatibilityBuildDirectory,
    [string]$X86CompatibilityBuildDirectory,
    [string]$PakFile,
    [switch]$WithoutPak,
    [ValidateSet('','2x','4x')][string]$TexturePack = '',
    [string]$BassLibrary,
    [string]$X86BassLibrary,
    [string]$X86SaveUpgradeLibrary,
    [string]$OutputDirectory,
    [string]$JavaHome = $env:JAVA_HOME,
    [ValidateSet('Debug','Release')][string]$Configuration = 'Release',
    [string]$AndroidSdk = $env:ANDROID_HOME,
    [switch]$Sign,
    [switch]$Install,
    [string]$DeviceSerial
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$project = Join-Path $root 'android'
$compatibility = !$TexturePack
$resolution = switch ($TexturePack) { '2x' { '1200p' } '4x' { '2400p' } default { '600p' } }
$platform = "$resolution-universal"
$minSdk = if ($compatibility) { 24 } else { 34 }
if (!$OutputDirectory) {
    $OutputDirectory = & "$PSScriptRoot/workspace-path.ps1" 'releaseRoot' 'android-universal' -Fallback 'out/distribution'
}
$OutputDirectory = [IO.Path]::GetFullPath([IO.Path]::Combine($PWD.Path, $OutputDirectory))
$edition = if ($TexturePack) { 'hd' } else { 'standard' }
function Get-DefaultAndroidBuildDirectory([string]$Abi, [string]$Backend) {
    $preferred = & "$PSScriptRoot/workspace-path.ps1" 'buildRoot' "android/$edition/$Abi/$Backend" -Fallback 'out/builds'
    $existing = Join-Path $root "out/android-universal-$Abi-$Backend"
    if (!(Test-Path -LiteralPath (Join-Path $preferred 'CMakeCache.txt')) -and
            (Test-Path -LiteralPath (Join-Path $existing 'CMakeCache.txt'))) {
        return $existing
    }
    return $preferred
}
if (!$BuildDirectory) { $BuildDirectory = Get-DefaultAndroidBuildDirectory 'arm64-v8a' 'vk13' }
if (!$X86BuildDirectory) { $X86BuildDirectory = Get-DefaultAndroidBuildDirectory 'x86_64' 'vk13' }
if (!$CompatibilityBuildDirectory) { $CompatibilityBuildDirectory = Get-DefaultAndroidBuildDirectory 'arm64-v8a' 'vk10' }
if (!$X86CompatibilityBuildDirectory) { $X86CompatibilityBuildDirectory = Get-DefaultAndroidBuildDirectory 'x86_64' 'vk10' }
if ($TexturePack -and !$PakFile -and !$WithoutPak) { throw 'Specify -PakFile for the selected HD texture pack.' }

function Get-AndroidBuild([string]$Path, [string]$Abi, [bool]$Legacy) {
    $dir = (Resolve-Path -LiteralPath $Path).Path
    $cache = Get-Content -LiteralPath (Join-Path $dir 'CMakeCache.txt') -Raw
    if ($cache -notmatch "(?m)^ANDROID_ABI:[^=]+=$([regex]::Escape($Abi))\r?$") { throw "Wrong Android ABI in $dir." }
    if (($cache -match '(?m)^PVZ_VULKAN_LEGACY:BOOL=ON\r?$') -ne $Legacy) { throw "Wrong Vulkan build in $dir." }
    $api = [regex]::Match($cache, '(?m)^ANDROID_PLATFORM:[^=]+=android-(\d+)\r?$')
    $maxApi = if ($Legacy) { 24 } elseif ($compatibility) { 29 } else { $minSdk }
    if (!$api.Success -or [int]$api.Groups[1].Value -gt $maxApi) { throw "The native build in $dir must target API $maxApi or lower." }
    [pscustomobject]@{ Output = Join-Path $dir 'Release'; Abi = $Abi; Legacy = $Legacy; Hdr = $cache -match '(?m)^PVZ_ANDROID_HDR_TEST:BOOL=ON\r?$' }
}

$arm = Get-AndroidBuild $BuildDirectory 'arm64-v8a' $false
$x86 = Get-AndroidBuild $X86BuildDirectory 'x86_64' $false
$builds = @($arm,$x86)
if ($compatibility) {
    $armCompat = Get-AndroidBuild $CompatibilityBuildDirectory 'arm64-v8a' $true
    $x86Compat = Get-AndroidBuild $X86CompatibilityBuildDirectory 'x86_64' $true
    $builds += @($armCompat,$x86Compat)
}
if ($arm.Hdr -ne $x86.Hdr) { throw 'The modern builds must agree on the Android HDR test option.' }
if (!$WithoutPak) {
    if (!$PakFile) { $PakFile = Join-Path $arm.Output 'main.pak64' }
    $PakFile = (Resolve-Path -LiteralPath $PakFile).Path
}
if (!$BassLibrary) { $BassLibrary = Join-Path $project 'app/src/main/jniLibs/arm64-v8a/libbass.so' }
if (!$X86BassLibrary) { $X86BassLibrary = Join-Path $project 'app/src/main/jniLibs/x86_64/libbass.so' }
if (!$X86SaveUpgradeLibrary) { $X86SaveUpgradeLibrary = Join-Path $root 'tools/bin/android-x86_64/libpvz_dfu.so' }
$bass = @{ 'arm64-v8a' = $BassLibrary; 'x86_64' = $X86BassLibrary }
$dfu = @{ 'arm64-v8a' = (Join-Path $root 'tools/bin/android-arm64/libpvz_dfu.so'); 'x86_64' = $X86SaveUpgradeLibrary }

function Copy-ShaderSet($First, $Second, [string]$Destination) {
    $src = Join-Path $First.Output 'shaders'
    $other = Join-Path $Second.Output 'shaders'
    $files = @(Get-ChildItem -LiteralPath $src -Filter '*.spv' -File | Where-Object Name -ne 'game_hdr_ps.spv')
    $otherFiles = @(Get-ChildItem -LiteralPath $other -Filter '*.spv' -File | Where-Object Name -ne 'game_hdr_ps.spv')
    if (Compare-Object @($files.Name | Sort-Object) @($otherFiles.Name | Sort-Object)) { throw 'Different shader inventories across ABIs.' }
    foreach ($required in @('game_vs.spv','game_ps.spv','game_sprite_ps.spv','game_sprite_mixed_ps.spv')) {
        if ($required -notin $files.Name) { throw "Required Vulkan shader is missing: $src/$required" }
    }
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    foreach ($shader in $files) {
        if ((Get-FileHash -LiteralPath $shader.FullName).Hash -ne (Get-FileHash -LiteralPath (Join-Path $other $shader.Name)).Hash) {
            throw "Different shader bytecode across ABIs: $($shader.Name)"
        }
        Copy-Item -LiteralPath $shader.FullName -Destination $Destination
    }
}

$staging = Join-Path ([IO.Path]::GetTempPath()) ("pvz-apk-" + [guid]::NewGuid().ToString('N'))
$assetDir = Join-Path $staging 'assets'
$bundledAssets = Join-Path $assetDir 'bundled-saves'
$bundledNames = @('users.dat','user1.dat64','game1_58.dat64')
$expected = @('assets/shaders/game_ps.spv','assets/save-editor/save-editor.html',
    'assets/save-editor/android-save-host.js','assets/save-editor/save-tool-worker.js') +
    @($bundledNames | ForEach-Object { "assets/bundled-saves/$_" })
$hdrTest = $arm.Hdr.ToString().ToLowerInvariant()
$compatibilityFlag = $compatibility.ToString().ToLowerInvariant()
New-Item -ItemType Directory -Path $bundledAssets -Force | Out-Null
try {
    foreach ($name in $bundledNames) {
        Copy-Item -LiteralPath (Join-Path $project "app/src/main/assets/bundled-saves/$name") -Destination $bundledAssets
    }
    if (!$WithoutPak) {
        Copy-Item -LiteralPath $PakFile -Destination (Join-Path $assetDir 'main.pak64')
        $expected += 'assets/main.pak64'
    }
    if ($compatibility) {
        Copy-Item -LiteralPath (Join-Path $root 'pvzPerf/SexyAppFramework/platform/android/default-scale.json') -Destination (Join-Path $assetDir 'scale.json')
        $expected += 'assets/scale.json'
    } else {
        $settings = Get-Content -LiteralPath (Join-Path $root 'config/default-settings.json') -Raw | ConvertFrom-Json
        $settings.landscapeUI = $true
        [IO.File]::WriteAllText((Join-Path $assetDir 'settings.json'), ($settings | ConvertTo-Json), [Text.UTF8Encoding]::new($false))
        $expected += 'assets/settings.json'
    }
    Copy-ShaderSet $arm $x86 (Join-Path $assetDir 'shaders')
    if ($compatibility) {
        Copy-ShaderSet $armCompat $x86Compat (Join-Path $assetDir 'shaders-vk10')
        $expected += 'assets/shaders-vk10/game_ps.spv'
    }
    foreach ($build in $builds) {
        $jni = Join-Path $staging "jniLibs/$($build.Abi)"
        New-Item -ItemType Directory -Path $jni -Force | Out-Null
        $name = if ($build.Legacy) { 'libpvz_perf_vk10.so' } else { 'libpvz_perf.so' }
        Copy-Item -LiteralPath (Join-Path $build.Output 'libpvz_perf.so') -Destination (Join-Path $jni $name)
        $expected += "lib/$($build.Abi)/$name"
        if (!$build.Legacy) {
            Copy-Item -LiteralPath $bass[$build.Abi] -Destination (Join-Path $jni 'libbass.so')
            Copy-Item -LiteralPath $dfu[$build.Abi] -Destination (Join-Path $jni 'libpvz_dfu.so')
            $expected += @("lib/$($build.Abi)/libbass.so","lib/$($build.Abi)/libpvz_dfu.so")
        }
    }
    $gradle = Get-Command gradlew.bat -ErrorAction SilentlyContinue
    if (!$gradle) { $gradle = Get-Command gradle -ErrorAction SilentlyContinue }
    if (!$gradle) {
        $gradle = Get-ChildItem "$env:USERPROFILE/.gradle/wrapper/dists" -Recurse -Filter gradle.bat -ErrorAction SilentlyContinue |
            Sort-Object FullName -Descending | Select-Object -First 1
    }
    if (!$gradle) { throw 'Gradle is required. The cached Gradle distribution was not found.' }
    $gradle = if ($gradle.Source) { $gradle.Source } else { $gradle.FullName }
    if (!$JavaHome) {
        $jdk = Get-ChildItem (& "$PSScriptRoot/workspace-path.ps1" 'jdkDirectory') -Directory -ErrorAction SilentlyContinue |
            Where-Object { Test-Path (Join-Path $_.FullName 'bin/javac.exe') } | Sort-Object Name -Descending | Select-Object -First 1
        if ($jdk) { $JavaHome = $jdk.FullName }
    }
    if (!$JavaHome -or !(Test-Path -LiteralPath (Join-Path $JavaHome 'bin/javac.exe'))) { throw 'A complete JDK is required.' }
    if (!$AndroidSdk) { $AndroidSdk = (& "$PSScriptRoot/workspace-path.ps1" 'androidSdk') }
    $previousJavaHome = $env:JAVA_HOME
    $previousJavaOptions = $env:JAVA_TOOL_OPTIONS
    $previousAndroidHome = $env:ANDROID_HOME
    $socketDir = Join-Path $env:USERPROFILE '.gradle/uds'
    New-Item -ItemType Directory -Force -Path $socketDir | Out-Null
    $env:JAVA_HOME = $JavaHome
    $env:ANDROID_HOME = $AndroidSdk
    $env:JAVA_TOOL_OPTIONS = ($previousJavaOptions + ' "-Djdk.net.unixdomain.tmpdir=' + $socketDir + '"').Trim()
    Push-Location $project
    try {
        $arguments = @(":app:assemble$Configuration", "-PpvzMinSdk=$minSdk", "-PpvzStagingDir=$staging",
            "-PpvzHdrTest=$hdrTest", "-PpvzVulkanCompatibility=$compatibilityFlag", "-PpvzBundledPak=$((!$WithoutPak).ToString().ToLowerInvariant())")
        & $gradle @arguments
        if ($LASTEXITCODE) { throw "Gradle failed with exit code $LASTEXITCODE" }
        $apkDirectory = Join-Path $staging "build/outputs/apk/$($Configuration.ToLowerInvariant())"
        $metadata = Get-Content -LiteralPath (Join-Path $apkDirectory 'output-metadata.json') -Raw | ConvertFrom-Json
        $outputs = @($metadata.elements)
        if ($outputs.Count -ne 1 -or $outputs[0].filters.Count -ne 0) { throw 'Expected one universal APK without ABI filters.' }
        $apk = Join-Path $apkDirectory $outputs[0].outputFile
        $archive = [IO.Compression.ZipFile]::OpenRead($apk)
        try {
            foreach ($path in $expected) {
                $file = $archive.GetEntry($path)
                if (!$file -or $file.Length -eq 0) { throw "Missing APK runtime dependency: $path" }
            }
            $libraries = @($archive.Entries | Where-Object { $_.FullName -match '^lib/[^/]+/[^/]+\.so$' })
            if (Compare-Object @($libraries.FullName) @($expected | Where-Object { $_.StartsWith('lib/') })) {
                throw 'Unexpected native library or ABI in the APK.'
            }
            foreach ($entry in $libraries) {
                $stream = $entry.Open()
                try {
                    $header = [byte[]]::new(20)
                    $offset = 0
                    while ($offset -lt $header.Length) {
                        $read = $stream.Read($header,$offset,$header.Length-$offset)
                        if (!$read) { throw "Truncated ELF header: $($entry.FullName)" }
                        $offset += $read
                    }
                    $expectedMachine = if ($entry.FullName.StartsWith('lib/arm64-v8a/')) { 183 } else { 62 }
                    if ($header[4] -ne 2 -or $header[5] -ne 1 -or [BitConverter]::ToUInt16($header,18) -ne $expectedMachine) {
                        throw "ELF does not match its APK ABI: $($entry.FullName)"
                    }
                } finally { $stream.Dispose() }
            }
        } finally { $archive.Dispose() }
        $suffix = if ($apk.EndsWith('-unsigned.apk')) { '-unsigned' } else { '' }
        if ($suffix -and ($Sign -or $Install)) {
            $buildTools = Get-ChildItem -LiteralPath (Join-Path $AndroidSdk 'build-tools') -Directory |
                Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'apksigner.bat') } |
                Sort-Object Name -Descending | Select-Object -First 1
            if (!$buildTools) { throw 'Android build-tools are required for APK signing.' }
            $key = Join-Path $env:USERPROFILE '.android/debug.keystore'
            if (!(Test-Path -LiteralPath $key)) { throw 'Development signing requires ~/.android/debug.keystore.' }
            $aligned = Join-Path $staging 'aligned.apk'
            $signed = Join-Path $staging 'signed.apk'
            & (Join-Path $buildTools.FullName 'zipalign.exe') -P 16 -f 4 $apk $aligned
            if ($LASTEXITCODE) { throw 'APK alignment failed.' }
            & (Join-Path $buildTools.FullName 'apksigner.bat') sign --ks $key --ks-key-alias androiddebugkey --ks-pass pass:android --key-pass pass:android --out $signed $aligned
            if ($LASTEXITCODE) { throw 'APK signing failed.' }
            & (Join-Path $buildTools.FullName 'apksigner.bat') verify $signed
            if ($LASTEXITCODE) { throw 'APK signature verification failed.' }
            $apk = $signed
            $suffix = ''
        }
        New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
        if ($WithoutPak) { $suffix += '-no-pak64' }
        $outputApk = Join-Path $OutputDirectory ("pvz_perf-$platform-" + $Configuration.ToLowerInvariant() + $suffix + '.apk')
        Copy-Item -LiteralPath $apk -Destination $outputApk -Force
        Write-Output $outputApk
        if ($Install) {
            $device = if ($DeviceSerial) { @('-s',$DeviceSerial) } else { @() }
            & (Join-Path $AndroidSdk 'platform-tools/adb.exe') @device install -r $outputApk
            if ($LASTEXITCODE) { throw 'APK installation failed.' }
        }
    } finally {
        Pop-Location
        $env:JAVA_HOME = $previousJavaHome
        $env:ANDROID_HOME = $previousAndroidHome
        $env:JAVA_TOOL_OPTIONS = $previousJavaOptions
    }
} finally {
    $tempRoot = (Resolve-Path -LiteralPath ([IO.Path]::GetTempPath())).Path.TrimEnd([char[]]@('/','\'))
    $resolvedStage = (Resolve-Path -LiteralPath $staging).Path
    if ([IO.Path]::GetDirectoryName($resolvedStage).Equals($tempRoot,[StringComparison]::OrdinalIgnoreCase) -and
            [IO.Path]::GetFileName($resolvedStage) -match '^pvz-apk-[0-9a-f]{32}$') {
        Remove-Item -LiteralPath $resolvedStage -Recurse -Force
    }
}
