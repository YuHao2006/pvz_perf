Variable-step event audit, 2026-11-14

Scope: non-generated game/framework C++/headers, 531 files scanned; time/phase/terminal candidates manually reviewed. Pattern coverage is not a proof that every possible large-step defect is absent.

Fixes: spike damage before expiry; independent gatling-head shots; vault collision window crossing; dolphin entry/completion; independent death shakes; shooter actions drained in deadline order before replacement; chooser/Dave/shovel interaction barriers; intro final events before retirement; clamped chooser/bank/view-lawn endpoints; independent huge-wave voice/music cues before expiry; Credits terminal events before phase replacement; explicit total catch-up delta.

Real production-object tests: 100/30/60Hz plus 250ms, 500ms, 2s and 3.5s shooter intervals, projectile counts at actual deadlines, spike damage and actor completion, tall-nut blocks, both HUD layouts and ordinary/conveyor rules, paired huge-wave cues, Credits StopFoley ordering and catch-up budget. Other catalog/regression logs retain their own stated coverage.

No new actor fields, save format changes, event queues or production timing logs. ICE3/ICE4 ordering preserved. Discrete collision precision and unrendered short visual segments are separate from event dispatch; this audit does not promise exact historical spatial simulation through arbitrary wall-clock stalls.

Commands:
  tools/test-image-runtime.ps1 -BuildDirectory out/x64-win32-vulkan -Case step-events
  same fixture: plant-attacks, ice3, intro-rules, credits, survival-rules
  tools/test-static-definition-runtime.ps1 -BuildDirectory out/x64-win32-vulkan

Final review additions:
- Doom/Ice special before automatic removal, preserving asleep/squished/bungee suppression.
- Marigold production strictly before retirement; Sun-shroom production before/at/after growth with original tie order.
- Boss death dispatches each distinct explosion phase.
- Ice expiry safely handles absent/live particles.
- Level fade consumes scheduled mower rewards/cue before retirement and credits in-flight collections before Board destruction.
- Collected sun/money/gifts retain ordinary pursuit arithmetic; intervals long enough to reach the destination stop there instead of overshooting indefinitely.

Actual pre-fix runs: before-terminal-special.log fails on swallowed special; before-collection.log fails on nonconverging collection. These test executables linked the then-current unpatched production objects. Other newly added boundary reproducers were confirmed statically and then tested after the fix; they are not claimed as separate pre-fix runtime captures.
Latest step-events.log and plant-attacks/ice3/survival-rules/award-rules/garden-rules/zombie-behavior.log all passed against the final production objects. Older intro/credits/static-definition logs retain the earlier verification point stated by their provenance; source hashes here identify the final checked-in candidates, not a claim to have rerun every old suite after the final additions.
No new serialized fields or production profiling logs. Ordinary active battle frames do not execute the terminal catch-up loops.
