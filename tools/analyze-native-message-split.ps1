param(
    [Parameter(Mandatory)][string[]]$Paths,
    [string]$OutputFile
)
$ErrorActionPreference='Stop'
$culture=[Globalization.CultureInfo]::InvariantCulture
function Number([string]$Value) {
    $result=[double]::Parse($Value,$culture)
    if([double]::IsNaN($result) -or [double]::IsInfinity($result)) {
        throw 'Non-finite message trace number'
    }
    return $result
}
$output=@(foreach($pattern in $Paths) {
    foreach($file in Get-Item -Path $pattern) {
        $rows=@(Import-Csv -LiteralPath $file.FullName)
        if(!$rows.Count) {throw "Empty message trace: $($file.FullName)"}
        foreach($field in @('schema','interval','seconds','loaded','active','fullscreen',
            'ac_line','affinity_mask','updates','draws','returned_messages',
            'discarded_motion','kind','phase','message','count','inclusive_us',
            'exclusive_us','max_us','thread_cycles','cycles_recorded')) {
            if($field -notin $rows[0].PSObject.Properties.Name) {throw "Missing trace field: $field"}
        }
        foreach($row in $rows) {
            if($row.schema -ne '1' -or (Number $row.exclusive_us) -gt (Number $row.inclusive_us) -or
                (Number $row.exclusive_us) -lt 0 -or [long]$row.count -lt 1 -or
                (Number $row.max_us) -gt (Number $row.inclusive_us)) {
                throw "Invalid timing hierarchy: $($file.Name) interval=$($row.interval)"
            }
        }
        $intervals=@(foreach($interval in $rows | Group-Object interval) {
            $pumps=@($interval.Group | Where-Object {$_.kind -eq 'phase' -and $_.phase -eq 'pump'})
            if($pumps.Count -ne 1) {throw "Missing/duplicate pump root: $($interval.Name)"}
            $meta=$pumps[0]
            foreach($row in $interval.Group) {
                foreach($field in @('seconds','loaded','active','fullscreen','ac_line',
                    'affinity_mask','updates','draws','returned_messages','discarded_motion')) {
                    if($row.$field -ne $meta.$field) {throw "Inconsistent interval metadata: $field"}
                }
            }
            if($meta.loaded -ne '1' -or $meta.active -ne '1') {continue}
            $nativeMotion=@($interval.Group | Where-Object {
                $_.kind -eq 'engine' -and $_.message -in @('WM_MOUSEMOVE','WM_SETCURSOR','WM_NCHITTEST')
            }).Count -gt 0
            $motion=[long]$meta.discarded_motion -gt 0 -or $nativeMotion
            [pscustomobject]@{
                metadata=$meta;rows=$interval.Group
                group="ac=$($meta.ac_line),affinity=$($meta.affinity_mask),fullscreen=$($meta.fullscreen),motion=$motion"
            }
        })
        foreach($group in $intervals | Group-Object group) {
            $seconds=($group.Group | ForEach-Object {Number $_.metadata.seconds} | Measure-Object -Sum).Sum
            $updates=($group.Group | ForEach-Object {[long]$_.metadata.updates} | Measure-Object -Sum).Sum
            $draws=($group.Group | ForEach-Object {[long]$_.metadata.draws} | Measure-Object -Sum).Sum
            $metrics=@(foreach($metric in @($group.Group | ForEach-Object rows) |
                Group-Object {$_.kind+'/'+$_.phase+'/'+$_.message}) {
                $inclusive=($metric.Group | ForEach-Object {Number $_.inclusive_us} | Measure-Object -Sum).Sum
                $exclusive=($metric.Group | ForEach-Object {Number $_.exclusive_us} | Measure-Object -Sum).Sum
                $count=($metric.Group | ForEach-Object {[long]$_.count} | Measure-Object -Sum).Sum
                [pscustomobject]@{
                    metric=$metric.Name
                    callsPerSecond=$count/$seconds
                    inclusiveMsPerSecond=$inclusive/$seconds/1000
                    exclusiveMsPerSecond=$exclusive/$seconds/1000
                    maximumCallUs=($metric.Group | ForEach-Object {Number $_.max_us} | Measure-Object -Maximum).Maximum
                    threadCyclesPerSecond=($metric.Group | ForEach-Object {[double]$_.thread_cycles} | Measure-Object -Sum).Sum/$seconds
                    cyclesRecorded=($metric.Group[0].cycles_recorded -eq '1')
                }
            })
            [pscustomobject]@{
                file=$file.FullName;group=$group.Name;intervals=$group.Count;seconds=$seconds
                engineUpdateHz=$updates/$seconds;engineDrawHz=$draws/$seconds
                metrics=$metrics
                limitation='Inclusive parent/child times overlap. Exclusive times exclude nested measured scopes. Engine draw Hz is not precise present FPS. Physical HID and scene identity are not inferred.'
            }
        }
    }
})
if($OutputFile) {
    [IO.File]::WriteAllText([IO.Path]::GetFullPath($OutputFile),
        (ConvertTo-Json -InputObject $output -Depth 8))
}
$output
