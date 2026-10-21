# Challenge And Almanac Shared Paper

`runtime/images/Challenge_Background.png` is a 1400 x 600 opaque RGB PNG,
covering Survival, Puzzle and Minigames. The three Almanac page backgrounds
use the exact same full flat paper and stone frame, with separate functional
art. Resource IDs and extensionless paths are unchanged; the old JPEG stays
replaced so it cannot take precedence over the PNG.

## Paper And Native Frame

The paper is derived from the preserved AI master
`source-art/ai/common-menu-paper-hires-v1.png`, 1672 x 941 RGB, SHA-256:
`61fe86d0889f92e5e417665130843e297faa08c5761750b00b6ebdb7c922a0a2`.
The master remains byte-identical and is not packaged as a runtime texture.

Take native rectangle `(136,170)-(1536,770)`, exactly 1400 x 600. It lies below
the generated plaque and inside the generated outer frame. No paper resizing,
horizontal stretching, new image generation or upscaling is needed.

Match RGB offsets against original Challenge JPEG's unobstructed paper at
`(80,120)-(720,540)`. The new paper sample is
`(380,120)-(1020,540)`. Original mean is `(246.28,194.81,137.09)`;
the calibrated derivative mean is `(246.48,194.47,136.85)`.
The stone, plaques and functional art are not recolored.

Stone frame pixels come from the approved 1066 x 600 title-free bordered
reference, `ReferenceResearch/Widescreen/common-menu-paper-flat.png`,
SHA-256 `e506c72ab0d2cc5ae5f76c71cd444936fce399671f6ecf38d7aa0b060d831bd0`.
Extend horizontal rails with native source columns `[0,533)`, `[366,700)`,
and `[533,1066)`, placed at x=0, 533 and 867. Side strips remain native-size.
Preserve the outer eight pixels exactly and feather the next eight into the
common paper. No margin receives an extra inset frame, vignette or shadow.

The resulting shared title-free base is
`ReferenceResearch/Widescreen/paper-pages-1400/common-menu-paper-flat-1400.png`,
SHA-256 `75e7738c15ad0e495bb210386a0f5610761629a5abbe3245d5809b03acd2ed7f`.

## Native Challenge Plaque

Extract only the original plaque/rubble from original 800 x 600
`Challenge_Background.jpg`, rectangle `(80,10)-(720,100)`.
Its JPEG SHA-256 is
`a45a64f87df3bb41be5cd8da4d838c6e0b83ab6161d5bca1acca9c57b25913bb`.
Select stone using alpha =
`255 * clamp((blue - 0.80 * red) / 15, 0, 1)` and place it at `(380,10)`.
No opaque old-paper rectangle is pasted. Plaque size, world position and color
remain unchanged; Almanac pages retain their own distinct functional art.

## Runtime Coordinates

Both Challenge and Almanac derive source padding from
`(imageWidth - BOARD_WIDTH) / 2`, currently 300. Draw three native source crops:
16 columns at each visible edge and a center of width `bounds.mWidth - 32`.
Center source x is `artPadding + bounds.mX + 16`.

At viewport width 800 the center source interval is `[316,1084)`;
at width 1400 it is `[16,1384)`. Intermediate and odd widths use the actual
viewport left and width. The center remains anchored to world x=-300;
UI labels, cards, controls and hit coordinates stay in the 800 x 600 world.
Only the background source-padding expression changes in C++.
Challenge uses the centered menu bounds. Almanac additionally centers its
800-wide dialog in actual bounds and subtracts that origin for background
crops, covering asymmetric battle bounds `(-220,0,1400,600)` without overflow;
see `almanac-art.md`.

The offline compositor is
`ReferenceResearch/Widescreen/compose-paper-pages-1400.py`; comparisons,
source backups, transparent overlays and provenance reports are under
`ReferenceResearch/Widescreen/paper-pages-1400/`.
Checks cover four pages at every integer viewport width 800..1400, plus
asymmetric battle bounds for the three Almanac pages: 4,207 cases.
No runtime bitmap processing, extra resources or lazy loads are introduced.
This revision does not change GameViewport and performs no game/resource build.

Source artwork retains its existing ownership and licensing terms.
