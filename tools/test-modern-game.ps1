param([switch]$Scale,[switch]$ScaleInitiallyOn,[switch]$Hdr,[switch]$RuntimeScale,[switch]$Audio,[switch]$Credits,[string]$InvalidHdrStrength,
    [ValidateSet('BeforeLoader','BeforeImages','AfterImages','AfterMusic','AfterParticles')][string]$CloseDuringLoading,
    [ValidateSet('Pool','Fog','Survival','Continue','Boss','Squirrel','Vase','Aquarium','Beghouled','Whack','Tree','Shovel','Zen','ZenLifetime','ModalLifetime','Upsell','ZenClose','TreeClose','SaveReject','IZombie','ParticleEmitters')][string]$Gameplay,
    # 性能测量模式：关 Vulkan 校验层/同步校验（诊断全关，帧时间才真实）
    [switch]$NoValidation,
    [switch]$FrozenDrawBenchmark,
    [ValidatePattern('^[A-Za-z0-9_-]+\.exe$')][string]$ExecutableName='pvz_perf.exe',
    [string]$RuntimeDirectory,
    [ValidatePattern('^[A-Za-z0-9_-]+$')][string]$RejectPeerProcess,
    # 2026-10-06 LPE 基线测量：十六进制处理器掩码（如 0x4000=LP14 单 LPE），
    # 启动后立即设置（装载头几拍未钉，稳态测量无影响）
    [ValidatePattern('^0x[0-9A-Fa-f]+$')][string]$Affinity,
    [ValidateRange(10,600)][int]$TimeoutSeconds=120)
if($Gameplay -eq 'Boss' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Boss regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'SaveReject' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Save rejection regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Continue' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Continue regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Upsell' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Upsell regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Squirrel' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Squirrel regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Vase' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Award/vase regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Aquarium' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Aquarium regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Beghouled' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Beghouled regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Whack' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Whack regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Tree' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Tree regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Shovel' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Shovel regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'Zen' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Zen regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'ZenLifetime' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Zen lifetime regression is a focused unscaled/no-audio test'}
if($Gameplay -eq 'ModalLifetime' -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Modal lifetime regression is a focused unscaled/no-audio test'}
if($Gameplay -in @('ZenClose','TreeClose') -and ($Audio -or $Scale -or $RuntimeScale -or $Hdr)){throw 'Store-close regression is a focused unscaled/no-audio test'}
if($CloseDuringLoading -and ($Gameplay -or $Credits -or $Scale -or $Hdr -or $RuntimeScale)){throw 'Loading-close regression is an isolated unscaled startup test'}
if($Audio -and !$Gameplay -and !$CloseDuringLoading){throw '-Audio requires gameplay or loading-close; playback is application-muted'}
if($Credits -and ($Gameplay -or $Audio -or $PSBoundParameters.ContainsKey('InvalidHdrStrength'))){throw '-Credits is an isolated no-audio movie regression'}
if($FrozenDrawBenchmark -and ($Gameplay -notin @('Pool','Fog') -or $Audio -or $Scale -or $Hdr -or $RuntimeScale)){
    throw '-FrozenDrawBenchmark requires isolated unscaled/no-audio Pool or Fog'
}
$rejectHdr=$PSBoundParameters.ContainsKey('InvalidHdrStrength')
if($rejectHdr){$Hdr=$true}
if($Hdr -or $RuntimeScale){$Scale=$true}
$ErrorActionPreference='Stop'
$root=Split-Path -Parent $PSScriptRoot
$runtime=if($RuntimeDirectory){[IO.Path]::GetFullPath($RuntimeDirectory)}else{Join-Path $root 'out\x64-win32-dx12\Release'}
$exe=Join-Path $runtime $ExecutableName
if(!(Test-Path -LiteralPath $exe)){throw 'Build the selected combination first, or pass -RuntimeDirectory'}
$cache=Join-Path (Split-Path -Parent $runtime) 'CMakeCache.txt'
if($ExecutableName -eq 'pvz_perf.exe' -and (Test-Path -LiteralPath $cache) -and
    !(Select-String -LiteralPath $cache -Pattern '^PVZ_ENABLE_GAME_PROBES:BOOL=ON$' -Quiet)){
    throw 'This test requires -DPVZ_ENABLE_GAME_PROBES=ON; release builds exclude in-game probes.'
}
# Concurrent tests can start within the same Windows clock tick. A timestamp
# alone let two processes share settings, save data and evidence files.
$runId=(Get-Date -Format 'yyyyMMdd-HHmmss-fff')+'-'+[Guid]::NewGuid().ToString('N')
$result=Join-Path $runtime ('log\smoke\'+$runId)
if(Test-Path -LiteralPath $result){throw "Smoke output directory already exists: $result"}
$verification=[ordered]@{
    schema=1;executable=$exe;executableSha256=(Get-FileHash -LiteralPath $exe -Algorithm SHA256).Hash;
    scenario=if($CloseDuringLoading){'LoadingClose/'+$CloseDuringLoading}elseif($Credits){'Credits'}elseif($Gameplay){$Gameplay}else{'Scenes'};audio=if($Audio){'real-engines-app-muted'}else{'disabled'};
    scale=[bool]$Scale;scaleInitiallyOn=[bool]$ScaleInitiallyOn;runtimeScale=[bool]$RuntimeScale;hdr=[bool]$Hdr;
    frozenDrawBenchmark=[bool]$FrozenDrawBenchmark;
    rtssLayerDisabled=($env:DISABLE_RTSS_LAYER -eq '1');
    timeoutSeconds=$TimeoutSeconds;
    createdUtc=[DateTime]::UtcNow.ToString('o');finishedUtc=$null;status='prepared';
    processId=$null;exitCode=$null;failure=$null
    functionalStatus='not-completed';nativeValidationStatus='not-checked'
}
$data=Join-Path $result 'data'
New-Item -ItemType Directory -Path $data -Force | Out-Null
# Fresh disposable profile copy; do not copy interruption saves or logs.
Get-ChildItem -LiteralPath (Join-Path $runtime 'data') -File |
    Where-Object {$_.Name -match '^(users|user\d+)\.dat$'} |
    ForEach-Object {Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $data $_.Name)}
$vars=@{
    PVZ_MODERN_HIDDEN='1';PVZ_MODERN_UNSCALED='1';PVZ_MODERN_SMOKE='1';
    PVZ_VULKAN_VALIDATION=$(if($NoValidation){$null}else{'1'});
    VK_LAYER_VALIDATE_SYNC=$(if($NoValidation){$null}else{'1'});
    # SDK 1.4.350 sync validation flags SYNC-HAZARD-PRESENT-AFTER-WRITE (0xe17ab4ae)
    # for every present on this Windows/NVIDIA box even for the layer's own
    # documented-safe pattern (standalone UNDEFINED->PRESENT_SRC barrier, no render
    # pass, semaphore-chained present) and attributes it to vkCmdEndRenderPass, a
    # command such repros never issue. Verified false positive; filtered via the
    # layer's official message-id mechanism. Every other validation message stays
    # fatal for the run (nativeValidationStatus fails on any '[validation]').
    VK_LAYER_MESSAGE_ID_FILTER='0xe17ab4ae';
    PVZ_APPDATA_DIR=$data;PVZ_MODERN_SMOKE_OUTPUT=$result;PVZ_LOG_DIR=$result
}
# Keep both settings writes and scale fixture isolated from the playable build.
$settingsFile=Join-Path $result 'settings.json'
Copy-Item -LiteralPath (Join-Path $runtime 'settings.json') -Destination $settingsFile
$settings=Get-Content -LiteralPath $settingsFile -Raw | ConvertFrom-Json
$settings.screenMode='windowed'
$settings.customScale=if($ScaleInitiallyOn){1}else{0}
if($Audio){$settings.musicVolume=0;$settings.sfxVolume=0;$settings.muted=0}
$settings | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $settingsFile
$vars.PVZ_SETTINGS_FILE=$settingsFile
$vars.PVZ_SCALE_CONFIG_FILE=$null
$vars.PVZ_MODERN_SCALE_SMOKE=$null
$vars.PVZ_MODERN_GAMEPLAY_SMOKE=if($Gameplay){$Gameplay}else{$null}
$vars.PVZ_MODERN_AUDIO_SMOKE=if($Audio){'1'}else{$null}
$vars.PVZ_MODERN_CREDITS_SMOKE=if($Credits){'1'}else{$null}
$vars.PVZ_MODERN_CLOSE_DURING_LOADING=if($CloseDuringLoading){$CloseDuringLoading}else{$null}
$vars.PVZ_FROZEN_DRAW_BENCH=if($FrozenDrawBenchmark){'1'}else{$null}
if($Scale){
    $scaleFile=Join-Path $result 'scale.json'
    $sourceScale=if($RuntimeScale){Join-Path $runtime 'scale.json'}else{Join-Path $PSScriptRoot 'test-data\scale-modern-smoke.json'}
    Copy-Item -LiteralPath $sourceScale -Destination $scaleFile
    if($Hdr){
        $hdrConfig=Get-Content -LiteralPath $scaleFile -Raw | ConvertFrom-Json
        $hdrConfig.HDR.enable=$true
        if($rejectHdr){$hdrConfig.HDR.strength=$InvalidHdrStrength}
        $hdrConfig | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $scaleFile
    }
    $vars.PVZ_SCALE_CONFIG_FILE=$scaleFile
    $vars.PVZ_MODERN_UNSCALED=$null
    $vars.PVZ_MODERN_SCALE_SMOKE='1'
}
function Set-SmokeEnvironment([string]$Key,$Value){
    # PowerShell 7.6 coerces $null to an EMPTY string for a .NET string argument.
    # Empty variables still make C getenv() non-null. Use a real null to remove.
    if($null -eq $Value){
        [Environment]::SetEnvironmentVariable($Key,[System.Management.Automation.Language.NullString]::Value,'Process')
    } else {
        [Environment]::SetEnvironmentVariable($Key,$Value,'Process')
    }
}
$saved=@{}
foreach($key in $vars.Keys){
    $saved[$key]=[Environment]::GetEnvironmentVariable($key,'Process')
    Set-SmokeEnvironment $key $vars[$key]
}
try {
    if($RejectPeerProcess -and (Get-Process -Name $RejectPeerProcess -ErrorAction SilentlyContinue)){
        throw "Peer game process is active: $RejectPeerProcess; test was not started"
    }
    $start=@{FilePath=$exe;WorkingDirectory=$runtime;WindowStyle='Hidden';PassThru=$true;
        RedirectStandardOutput=(Join-Path $result 'stdout.txt');RedirectStandardError=(Join-Path $result 'stderr.txt')}
    if(!$Audio){$start.ArgumentList='-nosound'}
    $p=Start-Process @start
    if($Affinity){
        # LPE 基线测量：启动即钉掩码（装载头几拍未钉，稳态测量无影响）
        $p.ProcessorAffinity=[IntPtr][Convert]::ToInt64($Affinity,16)
    }
    # Keep the native handle alive before waiting. Start-Process can otherwise
    # return a Process whose ExitCode is null after redirected execution:
    # https://github.com/PowerShell/PowerShell/issues/5421
    $heldHandle=$p.Handle
    $verification.processId=$p.Id;$verification.status='running'
    if($Affinity){$verification.affinity=$Affinity}
    [IO.File]::WriteAllText((Join-Path $result 'verification.json'),($verification|ConvertTo-Json))
    Write-Output "Modern smoke PID=$($p.Id); output=$result"
    $deadline=[DateTime]::UtcNow.AddSeconds($TimeoutSeconds)
    while(!$p.WaitForExit(1000)){
        if($RejectPeerProcess -and (Get-Process -Name $RejectPeerProcess -ErrorAction SilentlyContinue)){
            $p.Kill()
            $p.WaitForExit()
            $verification.peerConflictDetected=$true
            throw "Peer game process appeared: $RejectPeerProcess; only the owned test process was stopped; sample invalid"
        }
        if([DateTime]::UtcNow -ge $deadline){
            $verification.status='timeout-process-left-live'
            throw "Smoke timed out; process $($p.Id) left alive for diagnosis"
        }
    }
    $p.Refresh()
    $code=$p.ExitCode
    $verification.exitCode=$code;$verification.finishedUtc=[DateTime]::UtcNow.ToString('o')
    if($null -eq $code){throw "Smoke process exited but ExitCode is unavailable; do not treat null as success"}
    $stderr=Get-Content -LiteralPath (Join-Path $result 'stderr.txt') -Raw
    if($rejectHdr){
        if($code -eq 0 -or $stderr -notmatch 'HDR strength must be a finite number in'){
            throw 'Malformed HDR strength was not rejected with the expected stderr diagnostic'
        }
        Write-Output "PASS: malformed HDR strength rejected; exit=$code"
        $verification.status='passed-expected-rejection'
        $verification.functionalStatus='passed-expected-rejection'
        $verification.nativeValidationStatus='not-checked-parameter-rejection'
        return
    }
    Get-Content -LiteralPath (Join-Path $result 'result.log') -ErrorAction SilentlyContinue
    $stdout=Get-Content -LiteralPath (Join-Path $result 'stdout.txt') -Raw
    if($code -ne 0){throw "Modern smoke exit=$code; see $result and stderr.txt"}
    $verification.nativeValidationStatus=if($stderr -match '\[validation\]'){'failed'}
        elseif($NoValidation){'disabled-for-measurement'}
        elseif($stdout -notmatch '校验层可用，已启用|D3D12 validation enabled'){'not-enabled'}else{'passed'}
    if($verification.nativeValidationStatus -eq 'not-enabled'){throw 'GPU validation was not enabled'}
    $inputLog=Get-Content -LiteralPath (Join-Path $result 'result.log') -Raw
    $minigameBoundaryCounts=@{Vase=17;Aquarium=5;Whack=10;Beghouled=10}
    if($Gameplay -and $minigameBoundaryCounts.ContainsKey($Gameplay)){
        $boundaries=@(Get-Content -LiteralPath (Join-Path $result 'deferred-boundaries.txt'))
        if($boundaries.Count -ne $minigameBoundaryCounts[$Gameplay] -or
            @($boundaries | Where-Object {$_ -notmatch '^phase=\S+ update=\d+ depth=1 pending=0$'}).Count -ne 0){
            throw "Minigame deferred deletion boundaries failed: $Gameplay"
        }
    }
    if((!$Gameplay -and !$Credits -and !$CloseDuringLoading) -or $Gameplay -in @('Pool','Fog')) {
        foreach($probe in @('portable-rotation-eight-nonempty-crops-eight-old-stride-controls',
                           'portable-pixel-corners-ten-gpu-two-negative-controls')) {
            if($inputLog -notmatch ('(?m)^'+[regex]::Escape($probe)+' ')) {
                throw "Missing source-stride/pixel-corner evidence: $probe"
            }
        }
        if($inputLog -notmatch '(?m)^portable-user-list-nine-construct-36-delete-eight-gpu-eight-create'){
            throw 'Smoke did not verify user roster boundary, rendered label and create dialog callback'
        }
        if($inputLog -notmatch '(?m)^portable-achievements-40-original-text-fields'){
            throw 'Original achievement text table was not verified'
        }
        if($inputLog -notmatch '(?m)^portable-continue-confirm-five-modes-gpu-original-text'){
            throw 'Smoke did not verify continue confirmation text, modal ownership and GPU rendering'
        }
        if($inputLog -notmatch '(?m)^portable-continue-entry-five-original-labels-gpu'){
            throw 'Smoke did not verify the distinct first-dialog Restart Level label'
        }
        if($inputLog -notmatch '(?m)^portable-richtext-264-layout-48-gpu-format-font-space-cases'){
            throw 'Smoke did not verify rich-text layout, font changes, whitespace and empty-tag progress'
        }
        if($inputLog -notmatch '(?m)^portable-tooltip-52-layout-48-gpu-original-tail-boundaries'){
            throw 'Smoke did not verify tooltip tail emission, original boundaries, sizing and GPU rendering'
        }
    }
    if((!$Gameplay -and !$Credits -and !$CloseDuringLoading) -or $Gameplay -eq 'ParticleEmitters'){
        foreach($probe in @(
            'portable-alpha-decoder-thirteen-pointer-and-exact-rgba-cases',
            'portable-alpha-append-recursive-blue-and-uncovered-grid-tails',
            'portable-alpha-seven-real-numeric-manifest-compositions',
            'portable-alpha-two-decoder-eighteen-append-one-recursive-gpu-eight-numeric-rejections',
            'portable-alpha-two-native-textures-exact-rgba-and-surviving-gpu-clones',
            'portable-alpha-gpu-clone-exact-rgba-source-destruction-and-revision',
            'portable-alpha-composition-exact-rgba-and-complete-private-lifetime')){
            if($inputLog -notmatch ('(?m)^'+[regex]::Escape($probe)+' ')){
                throw "Alpha composition evidence missing: $probe"
            }
        }
        $alphaLog=Get-Content -LiteralPath (Join-Path $result 'alpha-composition-cases.txt') -Raw
        if(([regex]::Matches($alphaLog,'(?m)^rgba case=.* different=0\r?$')).Count -ne 31 -or
            $alphaLog -notmatch '(?m)^rejections decoder=2 append=18 gpu=1 numeric=8 ' -or
            $alphaLog -notmatch '(?m)^ownershipRestored=1 screenRGBAUnchanged=1 cacheUnchanged=1 cpuPendingRejections=\d+ exactComparisons=31 comparedPixels=\d+ alphaZeroNonzeroRGB=[1-9]\d*\r?$' -or
            $alphaLog -notmatch '(?m)^PASS portable-alpha-composition\r?$'){
            throw 'Alpha composition exact RGBA, rejection or private ownership gate failed'
        }
    }
    if($CloseDuringLoading){
        if($inputLog -notmatch ("(?m)^PASS loading-close stage="+[regex]::Escape($CloseDuringLoading)+" ")){
            throw 'Loading-close request/loop/join/game-cleanup/destruction regression did not complete'
        }
        $verification.functionalStatus='passed'
        if($verification.nativeValidationStatus -eq 'failed'){throw "Native validation diagnostics: $stderr"}
        $verification.status='passed'
        return
    }
    if(!$Gameplay -and !$Credits -and $inputLog -notmatch '(?m)^monitor-notification-state-input-retained '){
        throw 'Hidden monitor-notification state/input regression did not complete'
    }
    if(!$Gameplay -and !$Credits){
        $numericErrors=Get-Content -LiteralPath (Join-Path $result 'numeric-error-contracts.txt') -Raw
        $displayErrors=Get-Content -LiteralPath (Join-Path $result 'native-display-errors.txt') -Raw
        $groupBoundaries=Get-Content -LiteralPath (Join-Path $result 'reanim-group-boundaries.txt') -Raw
        if($numericErrors -notmatch '^21 41 7 \d+\s*$' -or $displayErrors -notmatch '^2\s*$' -or
           $groupBoundaries -notmatch '^4\s*$'){
            throw 'Numeric error type, reason, offset or retained frame ownership checks failed'
        }
        if($inputLog -notmatch '(?m)^portable-scenes-deferred-title-selector-destroyed '){
            throw 'Scenes did not verify actual deferred title/selector destruction'
        }
        $mouseHeartbeat=Get-Content -LiteralPath (Join-Path $result 'win32-mouse-coalescing.txt') -Raw
        if($mouseHeartbeat -notmatch '^native-reports=1000 logical-updates=100 motion-discarded=1 setcursor-discarded=1 button-event-position=1 button-position-reads=0 heartbeat-leave=1\s*$'){
            throw 'Win32 heartbeat did not verify discarded motion/cursor messages and ordered event-position clicks'
        }
        foreach($probe in @('gpu-texture-12-native-single-adapter-cases',
                           'gpu-texture-16-interleaved-sampler-crop-solid-transitions',
                           'portable-store-nine-last-plants-three-controls-original-dialogue',
                           'gpu-texture-single-gpu-sanding-and-stale-bits-rejection',
                           'gpu-image-readback-eight-native-images-state-and-errors',
                           'portable-image-diagnostics-six-snapshots-four-png-deferred-entry',
                           'portable-image-diagnostics-full-registry-shift-f11',
                           'portable-shared-image-font-four-worker-counts-cleanup-handoff',
                           'resource-numeric-manifest-three-types-48-atomic-rejections-retries',
                           'font-numeric-five-malformed-retries-loaded-layer-copies-tags',
                           'font-config-eight-rejections-six-bitmap-controls-three-empty-buttons',
                           'debug-display-1073-fps-coords-demo-two-gpu-canvases-no-cpu',
                           'gpu-image-factories-45-colors-28-crops-36-raw-clones-no-cpu',
                           'portable-shared-assignment-19-lifetime-six-gpu-cases',
                           'portable-shared-publication-real-decode-metadata-failure-three-gpu',
                           'buffer-input-five-owned-moves-loose-and-packed-files',
                           'resource-grid-16-numeric-errors-eight-preserved-gpu-images',
                           'portable-image-maintenance-three-real-cleanup-interleavings',
                           'gpu-vertex-list-10-large-polygons-4-to-1024-clipped-reference',
                           'graphics-scratch-24-gpu-translations-state-restored',
            'gpu-screen-coverage-300-spans-clipping-transform-polyaa')){
            if($inputLog -notmatch ("(?m)^"+$probe+" ")){throw "Native polygon/coverage regression missing: $probe"}
        }
        $sharedLog=Get-Content -LiteralPath (Join-Path $result 'shared-resource-cases.txt') -Raw
        if($sharedLog -notmatch '(?m)^shared-cache-new-casefold-get-set-hit-and-zero-cleanup=1' -or
           $sharedLog -notmatch '(?m)^cleanup-notification-retained=1 next-scan-removed=1 counter-observations=16 wrong=0' -or
           $sharedLog -notmatch '(?m)^shared-publication-real-decoder=1 resource-metadata=1 failed-alpha=1 gpu=3' -or
           $sharedLog -notmatch '(?m)^resource-grid-numeric-rejections=16 preserved-image-gpu=8 live-resource-delta=0' -or
           $sharedLog -notmatch '(?m)^compiled-font malformed=5 retry=5 fonts=\d+ copiedLayers=\d+' -or
           ([regex]::Matches($sharedLog,'(?m)^numeric-manifest mode=\d+ replacement=[01] previous=[01] atomic-rejection=1 corrected=1')).Count -ne 48 -or
           $sharedLog -notmatch '(?m)^image-maintenance-three-real-cleanup-interleavings=1'){
            throw 'Shared reference counts, cache identity or cleanup notification regression failed'
        }
        foreach($probe in @('portable-richtext-six-alignments-color-state','portable-richtext-gpu-six-alignments',
            'portable-preview-profiles-correct-owner-all100-persisted','portable-continue-buttons-disjoint-trophy-font15',
            'portable-button-live-hit-no-update-side-effects','portable-demo-rejected-buffer-lifetime-valid-v1-v2',
            'portable-loading-budget-preload-cancel-advice-init',
            'portable-widget-counters-wrap-dialog-delay-and-input-stamp',
            'portable-app-frame-foley-demo-wire-boundaries',
            'portable-demo-tools-high-address-dialogs-and-time-parser',
            'portable-loading-thread-joined-before-resource-release',
            'portable-log-path-four-threads-512-stable-no-mkdir')){
            if($inputLog -notmatch ("(?m)^"+$probe+" ")){throw "Portable text/profile regression missing: $probe"}
        }
        $hdrStage=if($Hdr){'hdr-notification-state-retained'}else{'hdr-disabled-no-observer'}
        if($inputLog -notmatch ("(?m)^"+$hdrStage+" ")){throw "HDR observer stage missing: $hdrStage"}
    }
    if(!$Credits -and $inputLog -notmatch '(?m)^f11-screenshot-png '){throw 'Native F11 screenshot was not verified'}
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-blover-50tick-zero-entry-and-falling-balloon '){
        throw 'Blover timing and balloon phase regression did not complete'
    }
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-minigame-completion-all-modes-canaries-native-dat '){
        throw 'Minigame completion bounds and native user.dat regression did not complete'
    }
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-zombie-speed-flags-snorkel-cycle-dolphin '){
        throw 'Original zombie speed/animation and snorkel eating-cycle checks did not complete.'
    }
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-postgame-original-mode-map-plant-table-repeat '){
        throw 'Original achievement mode/map/plant-condition table did not complete'
    }
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-pool-all34-types-avatar-flag-enter-exit-balloon '){
        throw 'Original pool type eligibility and saved-avatar flag transitions did not complete'
    }
    if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-mustache-both-spellings-popup-once-original-setter '){
        throw 'Original mustache achievement popup regression did not complete'
    }
    if($Audio -and $Gameplay -ne 'Survival'){
        if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-au-real32-load-unload-two-rejected-no-playback '){
            throw 'AU source lifetime and failed-name retry regression did not complete'
        }
        if($Gameplay -in @('Pool','Fog') -and $inputLog -notmatch '(?m)^portable-wav-odd-chunk-real-source '){
            throw 'RIFF odd-chunk padding and real DirectSound WAV regression did not complete'
        }
        foreach($stage in @('audio-playing','audio-advanced','audio-paused','audio-resumed','audio-save-reloaded')){
            if($inputLog -notmatch ("(?m)^"+$stage+" ")){throw "Audio stage missing: $stage"}
        }
    }
    if($Credits){
        if($inputLog -notmatch '(?m)^credits-dialogue-six-gpu-frames-original-font-boundary '){
            throw 'Original Credits dialogue font regression did not finish'
        }
        if($inputLog -notmatch '(?m)^credits-background-18-real-gpu-six-original-windows '){
            throw 'Original Credits clipped-background placement regression did not finish'
        }
        if($inputLog -notmatch '(?m)^PASS credits;' -or $inputLog -notmatch '(?m)^credits-replay-finished '){
            throw 'Credits attachment/replay regression did not finish'
        }
        if($inputLog -notmatch '(?m)^credits-roll-all-sections-heading-clip-speed-pause-wrap '){
            throw '1073 staff roll layout, movement and clipping regression did not finish'
        }
        if($inputLog -notmatch '(?m)^credits-real-modal-qpc-resume '){
            throw 'Credits real modal QPC resume regression did not finish'
        }
    } elseif($Gameplay -eq 'ParticleEmitters'){
        foreach($stage in @('particle-emitter-seven-selector-cases',
            'portable-actor-shadows-eight-real-draws-original-alpha-darken-gpu',
            'portable-almanac-index-live-plant-shadow-positive-negative-gpu',
            'portable-almanac-detail-live-zombie-shadow-positive-negative-gpu',
            'portable-reanim-two-private-holders-equal-ids-independent-tracks-blends-masks',
            'portable-reanim-startblend-strict-null-text-font-image',
            'portable-frame-time-exact-transforms-38-gpu-nested-and-empty',
            'portable-attachment-crossfade-18-private-pools-12-visible-starts', 'PASS particle-emitters;')){
            if($inputLog -notmatch ('(?m)^'+[regex]::Escape($stage))){throw "Particle emitter evidence missing: $stage"}
        }
    } elseif($Gameplay -eq 'SaveReject'){
        foreach($stage in @('portable-save-six-rejections-real-tryload-deferred-cleanup',
            'portable-pool-read-41-rejections-all-11-pools-unchanged-save',
            'portable-save-definition-72-failed-reads-8-cleanups',
            'portable-particle-data-two-borrowed-views-reuse-equal-id-isolation',
            'portable-particle-list-96-reads-88-disposals',
            'portable-reanimation-track-failures-real-child-preserved','PASS save-reject;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Save rejection regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Continue'){
        foreach($stage in @('portable-continue-seven-modes-21-cancels-seven-nested-and-resumes','PASS continue;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Continue cancellation regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Survival'){
        if($inputLog -notmatch '(?m)^portable-survival-twelve-real-deferred-board-selector-deletions '){
            throw 'Survival did not verify twelve actual board/selector deletion boundaries'
        }
        foreach($stage in @('portable-music-capability-16-layout-cases-wire-retained',
            'portable-survival-six-counter1-autosave-repick-file-lifecycles',
            'portable-survival-six-real-menu-save-continue-captions','PASS survival;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Survival regression missing: $stage"}
        }
        if($Audio -and $inputLog -notmatch '(?m)^portable-survival-six-bass-order-row-resumes '){
            throw 'Survival regression did not verify six real BASS resumes'
        }
        if($Audio -and $inputLog -notmatch '(?m)^portable-music-1073-channel-masks-posreset '){
            throw 'Survival regression did not query the real MOD channel masks and reset flags'
        }
        if($Audio -and $inputLog -notmatch '(?m)^portable-music-stream-owner-load-seek-unload '){
            throw 'Survival regression did not validate music stream input-buffer ownership'
        }
        if(!$Audio -and $inputLog -notmatch '(?m)^portable-disabled-music-loaded-pause-update-resave '){
            throw 'Survival regression did not exercise disabled-music consumers after loading'
        }
    } elseif($Gameplay -eq 'Boss'){
        if($inputLog -notmatch '(?m)^PASS boss;' -or $inputLog -notmatch '(?m)^boss-spawn-all-candidates '){
            throw 'Boss spawn regression did not exercise all candidates'
        }
    } elseif($Gameplay -eq 'Squirrel'){
        foreach($stage in @('squirrel-start-16-layouts-seven-plus-one-delay500','squirrel-four-directions-move50-peek-chew',
            'squirrel-catch-score-retire-zombie-decoy','squirrel-invisible-original-draw','squirrel-final-capture-award','PASS squirrel;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Squirrel regression missing: $stage"}
        }
    } elseif($Gameplay -in @('ZenClose','TreeClose')){
        foreach($stage in @('portable-store-close-back-then-real-request-nested-unwound','portable-store-close-outer-shutdown-cleaned','PASS store-close;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Store-close regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'ModalLifetime'){
        foreach($stage in @('portable-modal-eight-nested-five-pause-return-lifecycles',
            'portable-modal-real-wait-retained-through-nested-collection',
            'portable-message-16-focus-lifecycle-and-same-id-cases',
            'portable-credits-12-owned-pause-lifecycles-noaudio',
            'portable-zombatar-23-delete-callback-profile-list-lifecycles',
            'portable-chooser-27-store-almanac-warning-session-cases',
            'portable-chooser-five-real-start-warning-flows',
    'portable-store-30-quote-user-owner-grant-persistence-cases',
    'portable-selector-47-menu-replay-completion-taco-lifecycles',
    'portable-selector-45-slide-inputs-original-retarget',
    'portable-dave-30-upgrade-quote-session-dialogue-save-cases',
    'portable-store-eight-slot-description-original-switch',
            'portable-modal-four-depths-nested-holds-independent-cleanup-unwind','PASS modal-lifetime;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Modal lifetime regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'ZenLifetime'){
        foreach($stage in @('portable-zen-20-sale-transactions-three-glove-replacements','PASS zen-lifetime;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Zen lifetime regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Zen'){
        foreach($stage in @('portable-zen-ten-real-watering-animation-state-neighbours-and-save-cases',
            'portable-zen-30-routed-fast-clicks-cancel-no-board-update',
            'portable-zen-entry-store-fresh-time-and-12-snail-boundaries',
            'portable-zen-six-room-transitions-24-original-placements-eight-gpu-shadows',
            'portable-zen-18-bugspray-original-gpu-cases',
            'portable-stinky-17-encoded-profile-roundtrips-real-wake',
            'portable-stinky-54-calendar-profile-update-cases','PASS zen;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Zen regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Vase'){
        foreach($stage in @('portable-postgame-13-routes-five-continue-persisted',
            'portable-award-55-button-cursor-tap-state-cases',
            'portable-award-23-cases-original-buttons-and-achievement',
            'portable-gold-trophy-144-award-mode-requirement-cases',
            'portable-vase-all-mode-boundaries-no-seed-chooser','portable-vase-endless-35pots-live-hit',
            'portable-vase-hammer-animation-drop','portable-vase-dat64-menu-reload',
            'portable-vase-original-open-pot-track',
            'portable-vase-next-grid-through-level-end','portable-vase-reward-five-real-collect-and-score-cases',
            'portable-vase-sixth-three-real-startups-and-dat64','PASS vase;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Award/vase regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Upsell'){
        foreach($stage in @('portable-upsell-original-first-line-and-entry-handoff',
            'portable-upsell-three-props-matrices-and-gpu','portable-upsell-type-preserving-clear-and-cleanup',
            'portable-upsell-18-lines-debug-skip-and-scene-transitions','PASS upsell;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Upsell regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Aquarium'){
        foreach($stage in @('portable-aquarium-18-turn-cases-and-3000-swim-updates',
            'portable-sprite-scaling-24-gpu-cases','portable-sprite-scaling-all-water-frames-mirrored',
            'portable-sprite-scaling-actual-zen-placement-shadows',
            'portable-portals-original-disappear-16-close-delete-cycles',
            'portable-aquarium-48-tutorial-cases-and-stable-threshold',
            'portable-aquarium-shadow-gpu-and-real-tooltip',
            'portable-aquarium-buy-feed-fall-and-recover-trophy',
            'portable-aquarium-dat64-menu-reload','portable-aquarium-buy-trophy','PASS aquarium;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Aquarium regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Shovel'){
        foreach($stage in @('portable-shovel-startup-and-bottom-row-dig','portable-squirrel-original-five-row-wallnuts',
            'portable-shovel-dat64-layout','portable-squirrel-dat64-layout','PASS shovel;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Shovel regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Tree'){
        foreach($stage in @('portable-tree-shovel-all-modes-and-24-appearance-cases',
            'portable-tree-toolbar-original-layout-pixels-and-hit',
            'portable-tree-original-tool-height-small-tree-hit-and-pickup-sounds',
            'portable-tree-gift-stock-and-endless-picker-cumulative-counts',
            'portable-tree-purchase-eight-modal-and-save-cases',
            'portable-pool-gpu-source-11-signed-time-pixel-cases',
            'portable-tree-real-food-click-animation-and-growth','portable-tree-dat64-menu-reload','PASS tree;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Tree regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Whack'){
        if([regex]::Matches($inputLog,'(?m)^portable-whack-signed-grave-rect-miss-hit-1073 ').Count -ne 2){
            throw 'Signed grave rectangle miss/hit regression did not cover both Whack modes'
        }
        if([regex]::Matches($inputLog,'(?m)^portable-whack-board-final-wave-299-delay-1000-stopped-updates ').Count -ne 2){
            throw 'Whack final-wave scheduler regression did not cover both modes'
        }
        foreach($stage in @('portable-whack-real-spawn-click-and-cursor-update',
            'portable-whack-minigame-dat64-menu','portable-whack-adventure15-dat64-menu',
            'portable-whack-constructor-die-id-and-ordinary-mode','PASS whack;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Whack regression missing: $stage"}
        }
    } elseif($Gameplay -eq 'Beghouled'){
        foreach($stage in @('portable-beghouled-normal-drag-flash-crater-upgrades',
            'portable-beghouled-twist-predict-flash-real-rotation',
            'portable-beghouled-both-modes-dat64-menu-reload','PASS beghouled;')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Beghouled regression missing: $stage"}
        }
    } elseif($Gameplay){
        if($inputLog -notmatch '(?m)^PASS gameplay;'){throw 'Gameplay smoke did not finish all stages'}
        if($inputLog -notmatch '(?m)^portable-preview-tooltip-27-type-profile-focus-cases'){
            throw 'Gameplay smoke did not verify preview tooltip semantics'
        }
        if($inputLog -notmatch '(?m)^portable-coffee-slots-real-morph-wake-and-rain-163-gpu-frames'){
            throw 'Gameplay smoke did not verify coffee slots/lifecycle and rain composition'
        }
        if($inputLog -notmatch '(?m)^portable-garlic-92-directions-real-chew-and-original-split20'){
            throw 'Gameplay smoke did not verify garlic routing and preserved Split Pea semantics'
        }
        if($inputLog -notmatch '(?m)^portable-tutorial-first-packet-six-origin-and-once-cases'){
            throw 'Gameplay smoke did not verify first-packet tutorial arrow'
        }
        if($inputLog -notmatch '(?m)^portable-seed-2058-availability-2016-hit-four-click-cases'){
            throw 'Gameplay smoke did not verify original Gatling availability and chooser input'
        }
        if($inputLog -notmatch '(?m)^portable-chooser-four-poison-24-flights-1000-frames'){
            throw 'Gameplay smoke did not verify initialized and wrapping chooser animation clocks'
        }
        if($inputLog -notmatch '(?m)^portable-nut-armor-four-init-28-damage-48-stream-six-gpu'){
            throw 'Gameplay smoke did not verify nut armor damage, track serialization and GPU images'
        }
        if($inputLog -notmatch '(?m)^portable-image-resource-1780-stream-cases'){
            throw 'Gameplay smoke did not verify typed image IDs and truncated/failed streams'
        }
        foreach($stage in @('portable-body-five-types-five-states-100-track-streams',
            'portable-splash-all-types-shields-null-and-24-motion-flags',
            'portable-cutscene-96-particle-flags-64-animation-rates')){
            if($inputLog -notmatch ("(?m)^"+$stage)){throw "Body/splash/freeze regression missing: $stage"}
        }
        if($inputLog -notmatch '(?m)^portable-frame-time-exact-transforms-38-gpu-nested-and-empty'){
            throw 'Gameplay smoke did not verify shared reanimation frame-time parity'
        }
        if($inputLog -notmatch '(?m)^portable-reanim-startblend-strict-null-text-font-image'){
            throw 'Gameplay smoke did not verify strict null blend text, font and image'
        }
        if($inputLog -notmatch '(?m)^portable-reanim-two-private-holders-equal-ids-independent-tracks-blends-masks'){
            throw 'Gameplay smoke did not verify equal-ID private reanimation holder isolation'
        }
        if($inputLog -notmatch '(?m)^portable-text-six-modals-267-tooltips-three-art-patterns'){
            throw 'Gameplay smoke did not verify original chooser warnings, Imitater tooltips and art advice'
        }
        if($inputLog -notmatch '(?m)^portable-save-definition-72-failed-reads-8-cleanups'){
            throw 'Gameplay smoke did not verify definition-read failure and real animation cleanup'
        }
        if($inputLog -notmatch '(?m)^portable-gameplay-eight-real-deferred-board-selector-deletions '){
            throw 'Gameplay did not verify eight actual board/selector deletion boundaries'
        }
        if($inputLog -notmatch '(?m)^portable-particle-list-96-reads-88-disposals'){
            throw 'Gameplay smoke did not verify particle ownership read failures and actual pool cleanup'
        }
        if($inputLog -notmatch '(?m)^portable-particle-data-two-borrowed-views-reuse-equal-id-isolation'){
            throw 'Gameplay smoke did not verify borrowed particle DataArray reuse and independent data ownership'
        }
        if($inputLog -notmatch '(?m)^portable-reanimation-track-failures-real-child-preserved'){
            throw 'Gameplay smoke did not verify track failure cleanup without destroying an existing child attachment'
        }
        if($inputLog -notmatch '(?m)^portable-pool-read-41-rejections-all-11-pools-unchanged-save'){
            throw 'Gameplay smoke did not verify all eleven pool rejection paths beyond CRC without changing saved game state'
        }
        if($inputLog -notmatch '(?m)^portable-almanac-36-clicks-eight-modals-six-gpu-icons'){
            throw 'Gameplay smoke did not verify original preview click sounds and almanac icon placement'
        }
        if($inputLog -notmatch '(?m)^portable-almanac-three-recharge-original-gpu-labels'){
            throw 'Actual almanac three recharge labels did not match original reference'
        }
        if($inputLog -notmatch '(?m)^portable-preview-80-original-row-24-water-controls'){
            throw 'Preview logic rows and original direct-row tube controls were not checked'
        }
        if($inputLog -notmatch '(?m)^portable-matrix-font-nine-lookups-36-gpu-cold-warm-cases'){
            throw 'Gameplay smoke did not verify original matrix-font missing glyph spacing and rectangle caching'
        }
        if($inputLog -notmatch '(?m)^portable-memory-image-copy-16-mode-cases'){
            throw 'Gameplay smoke did not verify automatic and forced alpha modes after image copying'
        }
        if($inputLog -notmatch '(?m)^portable-font-atlas-24-gpu-contracts-24-draws-72-rebuilds'){
            throw 'Gameplay smoke did not verify font atlas keys, glyph copies and rebuild lifetime'
        }
        if($inputLog -notmatch '(?m)^portable-font-copy-72-copies-24-source-destructions'){
            throw 'Gameplay smoke did not verify owned/borrowed font copies and source destruction'
        }
        if($inputLog -notmatch '(?m)^portable-font-kernel-four-edge-generated-source-cases'){
            throw 'GPU font resampling edge/tile/generated-source regression did not finish'
        }
        if($inputLog -notmatch '(?m)^portable-survival-caption-52-gpu-18-art-edge-cases'){
            throw 'Survival caption/art boundary regression did not complete'
        }
        if($inputLog -notmatch '(?m)^portable-font-layer-order-16-synthetic-36-real-gpu'){
            throw 'Font layer ordering GPU comparison did not complete'
        }
        if($inputLog -notmatch '(?m)^portable-font-loader-default-order-real-gpu'){
            throw 'Font loader default-order GPU comparison did not complete'
        }
        if($inputLog -notmatch '(?m)^portable-attachment-crossfade-18-private-pools-12-visible-starts'){
            throw 'Gameplay smoke did not verify detached cross-fade ownership and natural pool reclaim'
        }
        if($inputLog -notmatch '(?m)^attachment-dat64-eight-menu-reloads-stable '){
            throw 'Attachment ownership was not verified across eight real menu/save reloads'
        }
        if($inputLog -notmatch '(?m)^gameplay-damaged-armor-eight-menu-reloads-stable '){
            throw 'Damaged armor image bindings were not verified across real menu/save reloads'
        }
        foreach($stage in @('gameplay-water-and-sun','gameplay-ice','gameplay-save-roundtrip','gameplay-resumed',
            'portable-pause-real-dialog-original-labels',
            'portable-board-frame-seven-real-update-draw-boundaries')){
            if($inputLog -notmatch ("(?m)^"+$stage+" ")){throw "Gameplay stage missing: $stage"}
        }
        if($Scale -and $inputLog -notmatch '(?m)^gameplay-scale-retained '){throw 'Gameplay scale retention not exercised'}
    } else {
        if($inputLog -notmatch '(?m)^PASS scenes;'){throw 'Smoke did not finish all stages'}
        foreach($stage in @('portable-zombatar-list-boundary-input-12','portable-zombatar-list-72-gpu-compositions',
            'portable-profile-original-pairs-disk-two-gpu-avatars',
            'portable-sell-helper-derived-buttons-three-close-results',
                           'portable-demo-checked-metadata-transactional-v1-v2',
                           'portable-buffer-264-bit-wires-48-block-roundtrips',
                           'portable-buffer-geometric-growth-16-cases',
                           'portable-buffer-crc-48-exact-seed-and-split-cases',
                           'reanim-cache-23-frames-three-lifetime-paths',
                           'effect-system-eight-real-initialize-dispose-cycles',
                           'tod-allocator-four-strides-lifo-first-block',
                           'pool-effect-real-pixels-six-gpu-frames-three-lifetimes',
            'portable-demo-callsite-dispatch-modal-wrap-errors',
            'portable-win32-52-control-chords-real-edit-undo-no-clipboard',
            'portable-win32-95-printable-16-keypad-real-edit-24-wheel',
            'portable-zombatar-head-297-part-cases-two-line-only-four-gpu',
            'portable-zombatar-resource-16-cycles-two-borrowers-gpu-stable',
            'portable-printf-release-wide-long-exact-empty',
            'portable-zombatar-list-four-coloured-panel-clip-fill-cases')){
            if($inputLog -notmatch ("(?m)^"+$stage+" ")){throw "Zombatar list regression missing: $stage"}
        }
        if($inputLog -notmatch '(?m)^present-deferred-recovered '){throw 'Presentation deferral/recovery probe missing'}
        if($inputLog -notmatch '(?m)^native-resize-deferred-recovered '){throw 'Native resize deferral/recovery probe missing'}
        if($inputLog -notmatch '(?m)^win32-input-cursor '){throw 'Game Win32 input/cursor regression did not execute'}
    }
    if($Scale){
        if(!$Gameplay -and !$Credits){
            foreach($probe in @('win32-input-cursor-fullscreen-chain','win32-input-cursor-scaled')){
                if($inputLog -notmatch ("(?m)^"+$probe+" ")){throw "Missing game input probe: $probe"}
            }
        }
    }
    if($FrozenDrawBenchmark){
        if($inputLog -notmatch '(?m)^frozen-draw-640-samples-32-plants-40-zombies-exact-pixels '){
            throw 'Frozen draw benchmark did not complete its exact-pixel/state checks'
        }
        $samples=@(Import-Csv -LiteralPath (Join-Path $result 'frozen-draw-perf.csv'))
        if($samples.Count -ne 640){throw 'Frozen draw benchmark sample count differs'}
        for($index=0;$index -lt $samples.Count;++$index){
            $sample=$samples[$index]
            $elapsed=[double]::Parse($sample.draw_cpu_us,[Globalization.CultureInfo]::InvariantCulture)
            if([int]$sample.round -ne [int][Math]::Floor($index/32) -or [int]$sample.sample -ne $index%32 -or
                [int]$sample.plants -ne 32 -or [int]$sample.zombies -ne 40 -or
                $sample.pixel_hash -ne $samples[0].pixel_hash -or $sample.textures -ne $samples[0].textures -or
                $elapsed -le 0 -or [double]::IsInfinity($elapsed) -or [double]::IsNaN($elapsed)){
                throw "Frozen draw benchmark row $index is inconsistent"
            }
        }
    }
    $verification.functionalStatus='passed'
    # Check all scenario evidence even when native diagnostics exist. Keep the
    # final gate failed and retain its message; never turn an injected-layer
    # validation error into a pass or skip the scene/scale/input checks.
    if($verification.nativeValidationStatus -eq 'failed'){throw "Native validation diagnostics: $stderr"}
    Write-Output "Modern smoke exit=$code"
    $verification.status='passed'
    Write-Output "PASS: selected game smoke scenario completed; no validation diagnostics; output=$result"
} catch {
    $verification.failure=$_.Exception.Message
    if($verification.status -ne 'timeout-process-left-live'){$verification.status='failed'}
    throw
} finally {
    [IO.File]::WriteAllText((Join-Path $result 'verification.json'),($verification|ConvertTo-Json))
    if($null -ne $p){$p.Dispose()}
    foreach($key in $vars.Keys){Set-SmokeEnvironment $key $saved[$key]}
}
