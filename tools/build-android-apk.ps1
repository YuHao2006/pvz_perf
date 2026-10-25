param(
    [string]$BuildDirectory = (Join-Path $PSScriptRoot '..\out\android-arm64'),
    [string]$PakFile = "",
    [ValidateSet('Debug','Release')]
    [string]$Configuration = 'Release',
    [switch]$Install
)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$build = (Resolve-Path $BuildDirectory -ErrorAction SilentlyContinue)
if (!$build) { throw "Android build directory does not exist: $BuildDirectory" }
$build = $build.Path
if (!$PakFile) { $PakFile = Join-Path $build "SexyAppFramework\main.pak64" }
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
if (!$gradle) { throw 'Gradle is required. Install the Android command-line tools or Android Studio.' }
Push-Location $project
try {
    & $gradle.Source ':app:assemble' + $Configuration
    if ($LASTEXITCODE -ne 0) { throw "Gradle failed with exit code $LASTEXITCODE" }
    $apk = Join-Path $project "app\build\outputs\apk\$($Configuration.ToLower())\app-$($Configuration.ToLower()).apk"
    Write-Output $apk
    if ($Install) {
        adb install -r $apk
        if ($LASTEXITCODE -ne 0) { throw "adb install failed with exit code $LASTEXITCODE" }
    }
} finally { Pop-Location }
