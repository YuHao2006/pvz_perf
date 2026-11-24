param([Parameter(Mandatory)][string]$Key, [string]$Relative = '')
$root = Split-Path -Parent $PSScriptRoot
$project = Get-Content -Raw -LiteralPath (Join-Path $root 'config/workspace-paths.json') | ConvertFrom-Json
$file = if ($env:PVZ_PATHS_CONFIG) { $env:PVZ_PATHS_CONFIG } else { $project.machineConfig }
$file = [IO.Path]::GetFullPath([IO.Path]::Combine($root, $file))
$setting = (Get-Content -Raw -LiteralPath $file -ErrorAction Stop | ConvertFrom-Json).$Key
if (!$setting) { throw "Set $Key in $file" }
[IO.Path]::GetFullPath([IO.Path]::Combine((Split-Path $file), $setting, $Relative))
