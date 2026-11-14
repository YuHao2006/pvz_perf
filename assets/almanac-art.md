# Almanac background artwork

The three pages retain 1400x600 canvases and original 800x600 content
coordinates. Plant uses the native wooden frame; Zombie and Index use their
own Almanac stone frames. No Challenge frame is blended into these pages.

The three JPEGs under `assets/source-art/original/almanac/` were verified
byte-for-byte against `C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/main.pak`.
The title plaques and native baked shadows come from those JPEGs, not newly
generated artwork. Shadow matting excludes the old paper outline.

Pages are recomposed from the clean, continuous paper master, with the retained
transparent functional-art layers at their existing coordinates. The former
stone border is discarded completely: there are no cloned pixel strips,
blurred texture patches or stretched edge pixels. Native frame rails extend
by unscaled crops; their inner antialiasing composites over clean paper.
Plant's original embossed paper outline is not imported into its frame.

Runtime inputs remain `assets/source-art/ai/runtime/images/Almanac_{Index,Plant,Zombie}Back.png`.
The layout, resource IDs, buttons, hit regions and 16-pixel background slicing
are unchanged. All composition and shadow matting happen offline, with no
additional drawing pass, runtime branch or filter.

Original game artwork retains its ownership and licensing terms.
