# Original-layout background repair candidates

This batch covers twelve backgrounds: the six battle maps, the unsodded tutorial
yard, the aquarium, the mushroom garden, the greenhouse and both shop backgrounds.
The AI challenge background was retired and deleted; all three challenge pages
and achievement awards use the approved native Replanted background and shared
three-slice drawing. `manifest.json` records the exact source
path, SHA-256, canvas, six tile extents and processing state for every background.
The garden, shop and challenge sources are existing project wide baselines; they
are not represented as untouched 1073 images.

Each source passed through the existing offline Anime4K UL executable twice:
1400×600 → 2800×1200 → 5600×2400. Each four-times master was split into a 3×2
grid with 192-pixel overlaps. Each tile was independently edited with the built-in
image_gen tool. Actual routing/model identity is not exposed; the prompt's
sunburst preference is not evidence of a particular model being used.

`tile-*-*-ai-raw.png` (named `tile-0-0--ai-raw.png`, etc.) preserves generated
outputs. Where recorded, `generation-prompt.json` contains the actual batch
prompt; other batches retain a prompt summary in `stitch-report.json`.

The compositor uniformly fits/crops each output to its recorded tile extent;
it never stretches X and Y independently. It restores broad source illumination
before joining tiles. Minimum-error seams through the overlaps and a four-pixel
transition replace broad feathering, which produced doubled contours when the
AI shifted an edge. White/lavender runtime pool areas are restored exactly.

Every folder preserves the stitched four-times master and a two-times runtime
candidate, plus an overview comparison and detailed horizontal/vertical seam
comparisons. `validation.json` records hashes and structural checks. File sizes
and successful checks do not prove exact geometric fidelity: AI can still move
local features or change line weight. These candidates require art review and
were kept out of runtime mappings during preparation. The later local in-game
trial uses the clean-v2 revisions described below.

All twelve backgrounds also have a `clean-v2` revision. These remove invented
dense grain, hairline wood scratches and brush hatching, particularly the fencing
above lawns. The edit instructions retain original sparse knots, cracks, pits,
chips, distinct grass tufts and objects. `clean-v2-prompt.json` records the exact
instruction for each background; six `tile-*-*--clean-v2.png` files retain its raw
outputs. The corrected four-times masters and two-times candidates remain
separate from the first revision. `runtime-integration.json` records their later
installation for the user's local in-game inspection, including replaced mapping
paths and source hashes; this is not final visual approval.

`noise-comparison--clean-v2.jpg` shows first revision above / cleanup below;
`comparison--clean-v2.jpg` shows the Anime4K reference above / cleanup below.
The seam detail images allow close inspection. `cleanup-plan.json` tracks all
twelve candidates, and `clean-variant-validation.json` checks decoding,
dimensions, exact master-to-candidate reduction and unchanged pool blank regions.
Those checks do not substitute for visual approval.

The original wide shop baseline contains rectangular pasted color patches.
First-revision shop colors are therefore retained as the cleanup's broad color
reference, preventing those patches from returning and avoiding tile-to-tile
shading changes during cleanup. Other backgrounds use the original broad colors.

The local batch-30 review page shows all twelve backgrounds, their independently
reviewed cleanup revisions, the integrated font
preview and the missing fourth fertilizer stage candidate. Review decisions are
separate from generation/compositing status.
