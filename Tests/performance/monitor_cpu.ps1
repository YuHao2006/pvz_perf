param(
    [Parameter(Mandatory=$true)][string]$Name,
    [int]$Seconds = 120,
    [string]$Out = "C:\temp\cpu_usage.csv"
)
# 进程 CPU 占用监控：每秒读一次 TotalProcessorTime 差分 → 该秒消耗的 CPU 核秒
# 输出 CSV: elapsed_s,cpu_seconds(该秒),cpu_percent(单核=100)。进程退出即停。
Remove-Item $Out -ErrorAction SilentlyContinue
$log = New-Object System.IO.StreamWriter($Out)
$log.WriteLine("elapsed_s,cpu_seconds,cpu_percent")
$deadline = (Get-Date).AddSeconds($Seconds)
$elapsed = 0
$last = $null
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Milliseconds 1000
    $elapsed++
    $p = Get-Process -Name $Name -ErrorAction SilentlyContinue
    if (-not $p) { $log.WriteLine("$elapsed,EXITED,"); continue }
    $t = 0.0
    foreach ($proc in $p) { $t += $proc.TotalProcessorTime.TotalSeconds }
    if ($null -ne $last) {
        $d = [math]::Round($t - $last, 4)
        $log.WriteLine("$elapsed,$d,$([math]::Round($d*100,1)))")
        $log.Flush()
    }
    $last = $t
}
$log.Close()
Write-Output "monitor-done -> $Out"
