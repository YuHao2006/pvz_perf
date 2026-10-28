param(
    [string]$BuildDirectory = (Join-Path $PSScriptRoot '..\out\android-arm64'),
    [string]$PakFile = "",
    [string]$OutputDirectory = (Join-Path $PSScriptRoot '..\out\android-vulkan'),
    [ValidateSet('Debug','Release')]
    [string]$Configuration = 'Release',
    [switch]$Install
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$build = (Resolve-Path $BuildDirectory -ErrorAction SilentlyContinue)
if (!$build) { throw "Android build directory does not exist: $BuildDirectory" }
$build = $build.Path
if (!$PakFile) { $PakFile = Join-Path $build "Release\main.pak64" }
if (!(Test-Path -LiteralPath $PakFile)) { throw "main.pak64 not found: $PakFile" }
$project = Join-Path $root 'android'
$assetDir = Join-Path $project 'app\src\main\assets'
$jniDir = Join-Path $project 'app\src\main\jniLibs\arm64-v8a'
New-Item -ItemType Directory -Force -Path $assetDir | Out-Null
New-Item -ItemType Directory -Force -Path $jniDir | Out-Null
Copy-Item -LiteralPath $PakFile -Destination (Join-Path $assetDir 'main.pak64') -Force
$nativeLibrary = Join-Path $build 'Release\libpvz_perf.so'
if (!(Test-Path -LiteralPath $nativeLibrary)) { throw "Android native library not found: $nativeLibrary" }
Copy-Item -LiteralPath $nativeLibrary -Destination (Join-Path $jniDir 'libpvz_perf.so') -Force
$gradle = Get-Command gradlew.bat -ErrorAction SilentlyContinue
if (!$gradle) { $gradle = Get-Command gradle -ErrorAction SilentlyContinue }
if (!$gradle) {
    $cachedGradle = Get-ChildItem "$env:USERPROFILE\.gradle\wrapper\dists" -Recurse -Filter gradle.bat -ErrorAction SilentlyContinue |
        Sort-Object FullName -Descending | Select-Object -First 1
    if ($cachedGradle) { $gradle = $cachedGradle }
}
if (!$gradle) { throw 'Gradle is required. The cached Gradle distribution was not found.' }
# 缓存分发命中的是 FileInfo（无 .Source）；Get-Command 命中的是 ApplicationInfo。
$gradle = if ($gradle.Source) { $gradle.Source } else { $gradle.FullName }
if (!$env:JAVA_HOME) {
    $jdk = Get-ChildItem 'C:\Program Files\Java' -Directory -ErrorAction SilentlyContinue |
        Where-Object { Test-Path (Join-Path $_.FullName 'bin\java.exe') } |
        Sort-Object Name -Descending | Select-Object -First 1
    if ($jdk) { $env:JAVA_HOME = $jdk.FullName }
}
if (!$env:JAVA_HOME) { throw 'A complete JDK is required; JAVA_HOME is not set.' }
Push-Location $project
try {
    & $gradle (':app:assemble' + $Configuration)
    if ($LASTEXITCODE -ne 0) { throw "Gradle failed with exit code $LASTEXITCODE" }
    $apk = Join-Path $project "app\build\outputs\apk\$($Configuration.ToLower())\app-$($Configuration.ToLower()).apk"
    if (!(Test-Path -LiteralPath $apk)) {
        $apk = Join-Path $project "app\build\outputs\apk\$($Configuration.ToLower())\app-$($Configuration.ToLower())-unsigned.apk"
    }
    if (!(Test-Path -LiteralPath $apk)) { throw 'Gradle finished without an APK output.' }
    New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
    $suffix = if ($apk.EndsWith('-unsigned.apk')) { '-unsigned' } else { '' }
    $outputApk = Join-Path $OutputDirectory ("pvz-arm64-perf-" + $Configuration.ToLower() + $suffix + '.apk')
    Copy-Item -LiteralPath $apk -Destination $outputApk -Force
    Write-Output ([IO.Path]::GetFullPath($outputApk))
    if ($Install) {
        if ($suffix) { throw 'Sign the unsigned Release APK before installing it.' }
        adb install -r $outputApk
        if ($LASTEXITCODE -ne 0) { throw "adb install failed with exit code $LASTEXITCODE" }
    }
} finally { Pop-Location }
