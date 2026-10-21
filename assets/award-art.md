# Award Screen Background

`runtime/images/AwardScreen_Back.png` is an opaque RGB PNG, 1400 x 600.
It replaces the 800 x 600 `AwardScreen_Back.jpg`. The existing
`IMAGE_AWARDSCREEN_BACK` symbol, numeric ID, resource group and extensionless
`AwardScreen_Back` path are unchanged. Keep the old JPEG absent because
extensionless image loading prefers JPEG to PNG. No alpha companion is needed.

## Sources And Composition

The supplied Ultra package at `C:/UserProgram/MOD ULTRA WIDESCREEN/main.eng`
contains `images/awardscreen_back.jpg`, a native 1400 x 600 RGB image.
Its SHA-256 is
`0154c77db3176855d1bbb62cda66fc182d6f604e9aab5eda76e04d1f58abe5cd`.
There is no Award background alpha companion in that archive. The former
runtime background is also opaque RGB with no companion mask.

Ultra's title plaque and reward panel remain centered at source x=400.
Consequently the archive image cannot be drawn centered as a drop-in asset.
The runtime PNG is a derived composition:

- The Ultra native paper and outer wooden frame supply the 1400 x 600 canvas.
- Empty paper at `(700,0)-(1384,600)` is copied at native size to x=16.
  Masks restrict this repair to the old plaque/panel positions. A harmonic
  RGB correction matches the patch to surrounding paper without a rectangular
  brightness seam. The texture itself is never resized or reflected.
- Original 800 x 600 runtime pixels supply independently masked title and
  reward-panel silhouettes, translated by exactly +300 in source X.
  Their opaque pixels, green display, parchment, scale and logical coordinates
  are preserved. This is not a rectangular paste of the old 800-wide page.
- The outer 16-pixel vertical strips and 12-pixel horizontal strips are
  pixel-identical to Ultra. No AI generation is involved.

The award page has a brown wooden border, including its title plaque and reward
panel. This was checked against the supplied original gameplay screenshot,
the original 800 x 600 background, the Ultra source and the runtime PNG.
The earlier description of an outer stone frame was a wording error; the
runtime artwork already uses the wooden frame and was not regenerated for
this correction. The shared drawing helper also handles the separate Challenge
background; that does not change the award page's border material.

The extraction, original backup, masks, compositor, previews and verification
report live outside the game repository under the adjacent helper project:
`PlantsVsZombies/ReferenceResearch/Widescreen/award-21x9/`.
The scripts are `award-21x9.py` and `verify-award-21x9.py` in its parent.
The compositor's `--install` option installs this PNG and removes the JPEG.
Artwork retains its original ownership and licensing terms.

## Coordinates And Coverage

`AwardScreen.cpp` retains all authored title, text, seed, trophy and button
coordinates in the 800 x 600 local layout. The widget origin follows
`bounds.x + (bounds.width - 800)/2`, including asymmetric battle bounds.
For `(-220,0,1400,600)`, the widget origin is world x=80.
The start button now has the same parent association as the other buttons,
so its global hover coordinates subtract the widget origin.

Native 16-pixel side strips follow viewport edges. Between them the image is
cropped using `sourceX = (imageWidth - 800)/2 + localBoundsLeft + 16`.
No background scaling or reflection occurs. The existing achievement
interlude uses the already integrated Challenge background with the same
placement. Its white underlay, the final white/black fade, and the credits
bottom shade cover the actual viewport width. Paper-note content and button
local positions are retained.

Draw accounts for an origin change after graphics translation was prepared;
Update and mouse press/release also refresh the origin. The existing parent
based button hit checks then use the current origin.

## Verification Limits

Offline verification covers every integer width from 800 through 1400,
centered and battle-clamped bounds, both Award and Challenge backgrounds,
native frame equality, original functional pixels, exactly-once horizontal
coverage, opaque image data, fade bounds, resize translation and button
coordinate round trips. The helper writes machine-readable results and native
800/801/1066/1067/1399/1400 previews.

The supported viewport remains the project's existing 800..1400 x 600 range.
These are static pixel and equation checks, not live interaction tests.
No C++ compilation, resource build, game/GUI launch or commit was performed.
Existing output packages must be regenerated in the normal build workflow
before the new runtime source asset is visible in a packaged game.
