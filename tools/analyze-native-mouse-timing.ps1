param([Parameter(Mandatory)][string[]]$Paths)
$ErrorActionPreference='Stop'

function Median([double[]]$Values) {
    $ordered=@($Values | Sort-Object)
    if(!$ordered.Count){return $null}
    $middle=[int][Math]::Floor($ordered.Count/2)
    if($ordered.Count%2){return $ordered[$middle]}
    return ($ordered[$middle-1]+$ordered[$middle])/2
}

foreach($pattern in $Paths) {
    foreach($file in Get-Item -Path $pattern) {
        $rows=@(Import-Csv -LiteralPath $file.FullName)
        foreach($column in @('seconds','loaded','active','updates','draws','pumps',
            'queued_motion','proc_motion','cursor_messages','hit_tests','samples',
            'direct_reads','pump_us','pump_cycles','read_us','widget_us','cursor_us')) {
            if(!$rows.Count -or $column -notin $rows[0].PSObject.Properties.Name) {
                throw "Missing native mouse timing column '$column': $($file.FullName)"
            }
        }
        $steady=@($rows | Where-Object {
            $_.loaded -eq '1' -and $_.active -eq '1' -and [double]$_.seconds -ge .5
        })
        foreach($group in @('quiet','motion')) {
            $selected=@($steady | Where-Object {
                $moving=([long]$_.queued_motion+[long]$_.proc_motion) -gt 0
                $moving -eq ($group -eq 'motion')
            })
            if(!$selected.Count){continue}
            $seconds=($selected | Measure-Object -Property seconds -Sum).Sum
            $updates=($selected | Measure-Object -Property updates -Sum).Sum
            $draws=($selected | Measure-Object -Property draws -Sum).Sum
            $pumps=($selected | Measure-Object -Property pumps -Sum).Sum
            [pscustomobject]@{
                file=$file.FullName;activity=$group;intervals=$selected.Count
                seconds=[Math]::Round($seconds,3)
                engineUpdateHz=[Math]::Round($updates/$seconds,2)
                engineDrawHz=[Math]::Round($draws/$seconds,2)
                medianIntervalDrawHz=Median @($selected | ForEach-Object {
                    [double]$_.draws/[double]$_.seconds
                })
                queuedMotionPerSecond=($selected | Measure-Object queued_motion -Sum).Sum/$seconds
                clientCursorMessagesPerSecond=($selected | Measure-Object cursor_messages -Sum).Sum/$seconds
                hitTestsPerSecond=($selected | Measure-Object hit_tests -Sum).Sum/$seconds
                pumpWallUsPerPass=if($pumps){($selected | Measure-Object pump_us -Sum).Sum/$pumps}else{0}
                pumpCyclesPerPass=if($pumps){($selected | Measure-Object pump_cycles -Sum).Sum/$pumps}else{0}
                heartbeatReadUsPerUpdate=if($updates){($selected | Measure-Object read_us -Sum).Sum/$updates}else{0}
                widgetMouseUsPerUpdate=if($updates){($selected | Measure-Object widget_us -Sum).Sum/$updates}else{0}
                setCursorUsPerUpdate=if($updates){($selected | Measure-Object cursor_us -Sum).Sum/$updates}else{0}
                sampler=@($selected.thread_sampler | Sort-Object -Unique)
                acLine=@($selected.ac_line | Sort-Object -Unique)
                fullscreen=@($selected.fullscreen | Sort-Object -Unique)
            }
        }
    }
}
