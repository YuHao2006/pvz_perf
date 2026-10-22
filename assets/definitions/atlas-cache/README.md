# Offline atlas search cache

These 187 unique geometry records cover the current 200 packing units.
They contain rectangle layouts and solver metadata, not image pixels or runtime
textures. Production uses them only after checking the geometry, padding,
maximum side, model, OR-Tools version, record digest and completed-search state.

The matching solver is pinned to OR-Tools **9.15.6755** in
`tools/resourcePipeline/requirements.txt`. Current production configuration
allows a 60-second search per atlas. Records that exhausted that budget without
proof remain explicitly unproven; their status, lower bound and gap are retained.
Strict builds continue solving those records instead of treating them as proofs.

The normal resource pipeline seeds only missing local cache entries. Existing
local searches are preserved. Changed geometry, model or solver versions cause
the affected source cache entries to be skipped.

This directory is part of the source checkout and is not included in
`main.pak64`. It is distributed with the Git repository and GitHub's source
archives, under `assets/definitions/atlas-cache/`. It is not a runtime asset.
