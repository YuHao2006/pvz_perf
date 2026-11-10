# Flat shared-paper Almanac

The Almanac uses the same complete neutral paper and outer stone frame as
Survival, Puzzle and Minigames. This replaces the earlier composition that
retained a large rectangle of original Almanac paper and matched added margins
to its vignette. There are no added side shadows, inner paper outlines,
vignette strips, or separately tinted margin rectangles.

## Runtime Sources

| Source | Dimensions | Format |
| --- | --- | --- |
| `runtime/images/Almanac_IndexBack.png` | 1400 x 600 | Opaque RGB PNG |
| `runtime/images/Almanac_PlantBack.png` | 1400 x 600 | Opaque RGB PNG |
| `runtime/images/Almanac_ZombieBack.png` | 1400 x 600 | Opaque RGB PNG |

These replace the old 800 x 600 JPEGs. The logical resource IDs and
extensionless paths remain unchanged. Do not retain both JPEG and PNG
versions: image loading prefers JPEG. This change does not rebuild resources.

## Common Base

Each page starts with the entire, unmodified
`PlantsVsZombies/ReferenceResearch/Widescreen/paper-pages-1400/common-menu-paper-flat-1400.png`,
1400 x 600 RGB. SHA-256:
`75e7738c15ad0e495bb210386a0f5610761629a5abbe3245d5809b03acd2ed7f`.

The common base is a native 1400 x 600 crop, `(136,170)-(1536,770)`, of the
preserved 1672 x 941 `source-art/ai/common-menu-paper-hires-v1.png`.
The crop excludes the generated plaque and frame without resizing the paper.
Its RGB offsets match unobstructed original Challenge paper; the final sample
mean is `(246.48,194.47,136.85)`, compared with original
`(246.28,194.81,137.09)`. The retained native stone comes from the previously
approved 1066 x 600 shared bordered base: horizontal rails are extended by
native crops, the outer eight pixels remain opaque, and the next eight blend
into paper. There are no separately shaded or tinted margin panels.
Challenge and all three Almanac pages use this exact base. The Almanac neither
copies the Challenge title plaque nor changes any raw AI master.

## Retained Functional Art

Only independently masked UI objects are extracted from original JPEGs using
`git show HEAD:assets/runtime/images/Almanac_<Page>Back.jpg`.
Their world coordinates and native pixel dimensions remain unchanged.
All objects are placed at canvas x = world x + 300. Their transparent layers
are moved 167 pixels from the preceding 1066-wide canvas, without resizing
or modifying their native RGB/alpha pixels.

| Page | Original world crop, exclusive right/bottom | Retained object |
| --- | --- | --- |
| Index | `(100,15)-(702,84)` | Native stone title plaque |
| Index | `(20,168)-(399,426)` | Wood plant display panel |
| Index | `(400,165)-(781,434)` | Stone zombie display panel |
| Plant | `(59,12)-(733,70)` | Native wood title plaque |
| Zombie | `(32,17)-(770,75)` | Native stone title plaque |

Stone masks select neutral/blue stone and dark outlines while rejecting warm
paper. Enclosed dark details remain opaque. Wood masks select the wood's
lower green values within the actual rounded object silhouette. Crop
rectangles are not pasted as opaque paper patches. Real panel textures and
their intrinsic bevels remain; no new shadow or outline is added.

Plant slot guides are transplanted as ink, not paper. A 50 x 70 alpha template
is recovered from the first unobstructed original slot at `(26,92)`.
Only the two-pixel border is sampled; adjacent paper estimates recover the
original dash opacity over brown ink. This template is placed in the existing
8-column, 6-row arrangement, with 52 x 78 spacing. All slot interiors are
transparent so the same common paper remains visible underneath.

Old full-page paper, the inner rounded paper boundary, edge vignettes,
background shadows and decorative plant/zombie watermarks are not imported.
The separate runtime cards, grounds, windows, buttons, portraits, labels,
scrollbars and their hit regions are unchanged.

Original JPEG SHA-256:

| Original | SHA-256 |
| --- | --- |
| `Almanac_IndexBack.jpg` | `297a8b6f81ba8fc084245f9c273cd812b8ced6fef42d8f407b9ecdcb65ad2ff6` |
| `Almanac_PlantBack.jpg` | `beb9a3a6542e3cad596505b3a47632711daf95b29a0f278c14877a01bfb6d755` |
| `Almanac_ZombieBack.jpg` | `70a31b7ada4c80e0eeb3f23272b3eb74e041358bd3746e490f39608c5ffdb802` |

## Coordinates And Verification

`DrawAlmanacBackground` derives art padding from `(imageWidth - BOARD_WIDTH)/2`,
which is 300 for the current 1400-wide source. Native 16-pixel edge strips
follow the actual viewport bounds. The center uses source x =
`artPadding + localBoundsLeft + 16`, width = `bounds.mWidth - 32`,
where `localBoundsLeft = bounds.mX - dialog.mX`.
At viewport width 800 the source interval is `[316,1084)`; at width 1400
it is `[16,1384)`. Odd widths retain the extra pixel on the right.

The dialog's local layout and input remain 800 x 600. Its X origin is
`bounds.mX + (bounds.mWidth - 800)/2`, computed from the actual bounds rather
than assuming symmetric margins. For battle bounds `(-220,0,1400,600)`,
the local page origin is world x=80 and the background local left is -300.
The title, panels and input therefore remain centered in the visible viewport,
and source crops do not exceed the 1400-wide image.
Global hover coordinates subtract the dialog origin; widget-dispatched local
clicks and scrollbar coordinates retain their original geometry. If a resize
changes the origin during Draw or MouseDown, that event's graphics/local X
is adjusted by the origin delta. The Index button stays 32 pixels from the
actual visible left edge, and the close button stays 35 pixels from the
actual visible right edge. Both positions refresh together before button
updates, drawing and clicks, retaining their original 800-wide margins.

Outside the actual UI object masks, each output is pixel-identical to the
complete common base. The outer frame is identical across all three pages.
Checks cover all integer viewport widths from 800 through 1400, source crop
bounds, full opaque coverage, frame pixels, unchanged title/panel coordinates,
and equality to the common paper outside the functional overlays. Almanac
checks also cover the battle viewport left clamped to -220, including
hover/click round trips and resize origin changes: 4,207 page/viewport cases.

Helper scripts, isolated transparent parts, masks, pixel reports and previews
are kept outside the source repository under
`PlantsVsZombies/ReferenceResearch/Widescreen/paper-pages-1400/`.
The compositor is `ReferenceResearch/Widescreen/compose-paper-pages-1400.py`.
The retained functional masks originated in `almanac-flat/`.
No build, resource build, game launch or Git commit is part of this revision.

Artwork retains its original ownership and licensing terms.
