Loading-screen music and adventure-transition checks

The unpublished all-slots-ready guard in Music::PlayMusic was removed. The
title loads its main module synchronously before StartLoadingThread, and its
module playback path can use that owned slot before the remaining songs are
published. No per-frame retry, new lock, save field or decoder allocation was
added by this correction.

native-runtime.log was produced by:
  tools/test-music-runtime.ps1 -BuildDirectory out/x64-win32-vulkan
It links real production objects and uses BASS output. The fixture mutes its
own master gain; native channel state, gains, track masks and raw decoded PCM
are checked, not the physical speakers. Title playback is checked before the
loading worker starts and with only the main slot loaded. Adventure checks
exercise the controller calls for award -> seeds -> partial fade -> battle,
for five themes; they do not play through whole adventure levels or browser
host lifecycle interruptions. Existing day/night, output-device and 30/60/
100/144/240/1000 FPS pause/resume checks also pass.

web-transitions.jsonl was produced by:
  node tools/wasm/test_music_transitions.mjs out/wasm-v4.0.2-fixed/toy
It imports the source mixer with the shipped OpenMPT decoder, reuses one main
decoder for 36 theme starts, and checks real stereo PCM and playing state.
It is a Node decoder replay, not a browser end-to-end adventure run.

The reported Web adventure-next-level missing-melody symptom is NOT reproduced
by these checks and is NOT claimed fixed. The loading-screen regression is
separate and verified. hashes.json identifies the tested executable, package,
decoder and fixture/production sources. The rebuilt desktop Release has only
the startup correction relative to the manual performance run; the completed
performance run retains its own earlier executable hash in measurement.json.
