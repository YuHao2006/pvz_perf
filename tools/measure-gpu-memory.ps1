param(
    [string]$BuildDirectory = 'out/x64-win32-vulkan',
    [string]$OutputDirectory = 'out/verification/gpu-memory-baseline',
    [ValidateRange(1,20)][int]$Runs = 3
)
$ErrorActionPreference='Stop'
$root=Split-Path -Parent $PSScriptRoot
$build=[IO.Path]::GetFullPath((Join-Path $root $BuildDirectory))
$output=[IO.Path]::GetFullPath((Join-Path $root $OutputDirectory))
New-Item -ItemType Directory -Force -Path $output | Out-Null
$runtime=Join-Path $output 'runtime'
& "$PSScriptRoot/test-image-runtime.ps1" -BuildDirectory $build -OutputDirectory $runtime -Case gpu-memory *> (Join-Path $output 'build-and-run1.log')
if($LASTEXITCODE){throw 'GPU memory fixture failed; inspect build-and-run1.log'}
$rows=@()
for($i=1;$i -le $Runs;$i++) {
    if($i -gt 1) {
        Push-Location $runtime
        try {
            & ./image_runtime_tests.exe (Join-Path $build 'Release/main.pak64') gpu-memory *> (Join-Path $output "run$i.log")
            if($LASTEXITCODE){throw "GPU memory run $i failed"}
        } finally {Pop-Location}
    }
    $result=Join-Path $output "run$i.jsonl"
    Copy-Item -LiteralPath (Join-Path $runtime 'gpu-memory.jsonl') -Destination $result -Force
    foreach($line in Get-Content -LiteralPath $result) {
        $sample=$line | ConvertFrom-Json
        $row=[ordered]@{run=$i;phase=$sample.phase;gpu=$sample.gpu}
        foreach($property in $sample.memory.PSObject.Properties){$row[$property.Name]=$property.Value}
        foreach($name in @('process_private_bytes','working_set_bytes','dxgi_available','dxgi_local_bytes','dxgi_nonlocal_bytes')){$row[$name]=$sample.$name}
        $rows += [pscustomobject]$row
    }
}
$rows | Export-Csv -LiteralPath (Join-Path $output 'samples.csv') -NoTypeInformation -Encoding utf8
$metadata=[ordered]@{
    source_commit=(& git -C $root rev-parse HEAD);runs=$Runs
    pak_sha256=(Get-FileHash (Join-Path $build 'Release/main.pak64') -Algorithm SHA256).Hash
    executable_sha256=(Get-FileHash (Join-Path $runtime 'image_runtime_tests.exe') -Algorithm SHA256).Hash
    utc=[DateTime]::UtcNow.ToString('o');viewport='800x600 SDR; fixed offscreen target separately sampled'
    scope='Controlled production resource/cache lifecycle, empty-formation battle; not a heavy endless FPS test. All resource groups loaded. No personal saves.'
    accounting='Renderer VkMemoryRequirements; pooled allocations counted once. DXGI per-process local/nonlocal usage is separate. Renderer total excludes swapchain/driver-private/external effects.'
}
$metadata | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $output 'metadata.json') -Encoding utf8
$rows | Where-Object run -eq 1 | Format-Table phase,generated_bytes,pool_used_bytes,pool_reserved_bytes,dxgi_local_bytes
