# Achievements Background Extension

The nine existing achievement background resources are extended from 800x225
to 1400x225. Their original 800 RGBA columns remain byte-for-byte identical at
columns 300 through 1099. Drawing them at local x=-300 preserves the original
two-column achievement layout, BACK stone, MORE button, text and underground
easter eggs. No resource IDs, texture symbols, icon sheets or button images change.

The helper workspace's `ReferenceResearch/Widescreen/extend_achievements.py`
performs the extension offline using Pillow:

- The header mirrors only its leftmost 88 and rightmost 96 columns. These
  contain grass and dirt, without BACK/title lettering.
- The repeating dirt/rock tile reflects 300 columns on each side, preserving
  the dirt strata and rocks without short periodic repeats.
- The China scene uses its leftmost 96 and rightmost 32 columns, avoiding
  the zombie characters while extending the inverted grass and sky. Beyond the
  first 32 added right columns, a 64-column transition introduces the wider,
  character-free left cloud/grass strip rather than repeating a tiny cloud.
- The six cave overlays receive transparent side margins, exposing the extended
  dirt tile underneath without duplicating any characters or easter eggs.

The widget paints an opaque dirt-colored base before the images, including the
bottom join. This prevents antialiased source edges or transparent gaps from
revealing menu artwork retained from another page. Its content width stays 800;
the background, clip and mouse insets cover local x=-300 through x=1100.
There is no image processing, new texture, extra image allocation or texture
creation during drawing.

Run that helper with `--check` to validate all nine dimensions and
compare the central source pixels against Git HEAD. Running without `--check`
regenerates the extensions and is idempotent. Optional `--preview PATH` writes
three 1400x600 background views: header, Peggle depth, and the bottom China scene.
This is an offline asset preview, not a game screenshot.

Hit rectangles remain in widget-local coordinates while the widget moves.
Scrolling uses the normal widget move/dirty/mouse-rehit path, and BACK clears
scroll momentum and restores the page's initial vertical position before return.
