param(
    [Parameter(Mandatory=$true)][string]$Executable,
    [Parameter(Mandatory=$true)][string]$Dumpbin
)
$ErrorActionPreference='Stop'
$directory=Split-Path -Parent $Executable
$files=@($Executable)
foreach($name in @('dxcompiler.dll','dxil.dll','bass.dll',
        'msvcp140.dll','vcruntime140.dll','vcruntime140_1.dll',
        'data\pvz_dat64_converter.exe','data\msvcp140.dll',
        'data\vcruntime140.dll','data\vcruntime140_1.dll')){
    $path=Join-Path $directory $name
    if(Test-Path -LiteralPath $path){$files+=$path}
}
# This gate catches known downlevel regressions; it is not a complete OS emulator.
$unsupported='\b(CreateFile2|CopyFile2|GetSystemTimePreciseAsFileTime|WaitOnAddress|WakeByAddressSingle|WakeByAddressAll|GetDpiForWindow|GetDpiForSystem|AdjustWindowRectExForDpi|SetProcessDpiAwarenessContext|RoInitialize|RoUninitialize|RoGetActivationFactory|RoOriginateLanguageException|CoIncrementMTAUsage|CoDecrementMTAUsage)\s*$|api-ms-win-core-winrt'
foreach($file in $files){
    $imports=& $Dumpbin /imports $file
    if($LASTEXITCODE -ne 0){throw "Cannot inspect imports: $file"}
    $blocked=$imports | Select-String -Pattern $unsupported
    if($blocked){
        throw ("Win7-incompatible hard import in {0}:`n{1}" -f $file,($blocked -join "`n"))
    }
}
Write-Output "PASS: no known Win8+ hard imports in $($files.Count) game/dependency files"
