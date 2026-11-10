# Almanac background artwork

The three Almanac pages keep their 1400x600 paper canvases and original
800x600 content coordinates. Plant pages use the original wooden outer frame;
Zombie and Index pages use their original Almanac stone frames, rather than
the shared Challenge menu frame.

The original 1073 backgrounds are retained under
`assets/source-art/original/almanac/`. Native corner/side pixels and horizontal
rail crops restore each page's own frame without scaling. The outer eight
pixels are copied exactly; the inner eight transition into the existing paper.
The native title plaques retain their previous coordinates and artwork, with
their surrounding shadow darkening restored offline. The old paper's inner
rectangular outline is not copied into the flat paper.

Runtime inputs remain the three opaque RGB PNGs under
`assets/source-art/ai/runtime/images/Almanac_{Index,Plant,Zombie}Back.png`.
Their resource names and logical dimensions do not change. Native background
slicing keeps 16-pixel borders at the visible edges while centering the
800-wide content, including asymmetric battle viewports.

All composition is baked into the resource package. No runtime shadow pass,
new branch, font resource or image is added to the drawing path. Unrelated
paper, plant slots, panels, button positions and input routing remain unchanged.

Artwork retains its original ownership and licensing terms.
