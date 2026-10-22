# Definition-owned reanimation and particle atlases

The v5 resource pipeline resolves authoring image names offline. A compiled
definition owns an atlas and its tracks or emitters contain image rectangles. Explicit build groups may
share one atlas across reanimation and particle definitions. It does not obtain its atlas
or regions through the global `ImageSymbolId` texture registry.

## Package layout

For `compiled/reanim/<name>.compiled` or
`compiled/particles/<name>.compiled`, the default atlas is the sibling
`<name>.atlas.png`. Explicit groups instead use
`compiled/atlases/<group>.atlas.png`. These paths are program bindings generated
in `DefinitionImageBindings.h`, not fields in the compiled definition and not
numbered image resources. Loading code assigns the definition's image pointer
from those bindings. An image-free definition has no PNG and stores zero atlas
dimensions and empty rectangles. Each definition keeps a shared owner;
the physical image is decoded and uploaded once, and no global image symbol
is created for the group.

The authoring DSL and original source images remain build inputs. The standalone
compiler supplies a temporary `.source-record` and its own `image_sources.txt`;
its local source handles refer only to parsed author image names. It neither
reads the program image registry nor accepts `--image-registry`. The package
stage resolves source names from authoring metadata and paths, creates the atlas
and writes inline rectangles into the final v5 envelope. Intermediate files are
not shipped as runtime definitions.
The offline Python stage requires Pillow; the game itself has no Python or
Pillow dependency.
Exact packing additionally requires OR-Tools in the build Python environment.
Install the offline dependencies with
`python -m pip install -r tools/resourcePipeline/requirements.txt`.

## Build configuration

`assets/definitions/ResourceBuild.pvzbuild` is the build entry point.
Reanimation and particle `.dsl` files contain individual definitions. The old
`reanim/root.dsl` and `particles/all.root.dsl` aggregators are removed; the
pipeline passes explicit source lists to the native compiler, without creating
a replacement aggregate DSL.

```text
resource_build(1)
sources(reanim "reanim/units/*.dsl")
sources(particle "particles/particles/*.particle.dsl")
atlas_defaults(solver exact time_limit_seconds 60 workers 1 require_optimal false)
atlas(pea_family reanim:PeaShooter reanim:SnowPea)
# A group can also mix reanim:Name and particle:Name.
# Optional strict override: this group must prove its global minimum.
atlas_settings(pea_family time_limit_seconds unlimited require_optimal true)
```

Ungrouped definitions receive individual atlases. A definition may belong to
only one explicit group. Group members share the union of their source images,
deduplicated by authoring symbol, while the compiler writes each use's actual
rectangle into the definition. Unknown members, duplicate sources, conflicting group
membership, unsafe paths and unknown configuration commands are build errors.

Exact mode refines the native layout using integer coordinates, fixed padded
dimensions, a two-dimensional no-overlap constraint and the `width * height`
objective. The native layout supplies an incumbent and hints. The `AtlasSettings`
API defaults remain `time_limit_seconds=None` and `require_optimal=True`: an
unlimited solve that requires proof of global minimum area. The checked-in
production configuration explicitly overrides those defaults with a **60-second
CP-SAT budget per atlas** and `require_optimal false`, as authorized after the
pea-family proof search remained unproven for more than three hours. This is a
solver budget per packing unit, not a 60-second limit for the entire resource
build or its decoding, native incumbent search and publication steps.

`solver exact` is mandatory in both policies. `require_optimal true` accepts only
`OPTIMAL` or mathematically valid `LOWER_BOUND_PROVEN` results, with the proven
bound equal to the published area. A finite strict solve that ends without proof
still fails the build. Explicit `require_optimal false` is valid only with a
positive finite budget of at most 86,400 seconds. When that budget expires,
publication may retain the best validated incumbent even if its status is
`FEASIBLE` or `UNKNOWN`; `optimal` remains false. An `UNKNOWN` result can retain
the geometrically validated native or checkpoint incumbent when CP-SAT has not
reported a new feasible solution. It is not a claim of minimum area.

Before the independent publication-policy check, the caller validates rectangle
orientation, dimensions, padding, bounds and non-overlap. The policy check also
requires current model/solver versions, a recognized status and consistent
metadata: `objective_area` equals the actual atlas area, the bound lies between
zero and that area, and `gap` honestly records `(area - bound) / area` (zero for
an empty atlas). Invalid status, a false proof marker, inconsistent numbers or
an unbounded opt-out cannot be published. A result marked optimal must satisfy
the proof checks even under the bounded policy.

Previous generated headers and packages remain in place until every atlas
passes its configured policy. Old unproven caches provide validated geometry
hints only, not proof. Proof cache keys include geometry, padding, maximum side,
model version and solver version, not image pixels or search budget. Reports
retain status, bound, gap and optimality rather than relabeling a timed-out
incumbent as optimal. Checkpoints, CP-SAT search logs and
`atlas-proof-progress.json` record offline progress; the progress heartbeat
records the active atlas and its strict or bounded policy. Python builds the
model and coordinates artifacts; the computational search runs in OR-Tools'
native C++ CP-SAT engine.

Bounded builds can reuse a validated final cache without repeating the same
search for every game-code rebuild or backend. A normal completed solve records
`search_complete: true` and `solve_budget_seconds`; an in-progress checkpoint
records `search_complete: false`. With `require_optimal false`, a completed
same-geometry/model/solver cache satisfies an equal or smaller finite budget.
Increasing the budget resumes a fresh solve using the cached geometry as its
incumbent. Strict `require_optimal true` always continues unproven results,
irrespective of prior bounded completion. Cache reuse keeps the original
status, bound, gap and `optimal: false`; it is not a new optimality proof.

Older v2 final caches do not contain a budget marker. Their elapsed time alone
does not establish completion. `exact_atlas.import_completed_budget(cache,
manifest)` can import evidence from the successfully published manifest: its
explicit finite bounded policy, entire final exact metadata, dimensions,
current geometry/model/solver key and intact cache must match. The published
elapsed time must also cover that budget. Explicit unfinished checkpoints are
never promoted. Copying a valid resource cache and its matching manifest to
another backend can therefore preserve completed search effort without
weakening geometric or publication checks.

Curated portable layout caches live in `assets/definitions/atlas-cache/`. They
are build inputs only: they contain rectangle geometry and solver metadata,
not source pixels, machine paths or runtime textures, and are not included in
the game's pak. `exact_atlas.export_completed_cache(cache, manifest,
destination)` selects only the current published groups' valid optimal proofs
or completed bounded searches. It excludes unrelated historical cache files
and unfinished checkpoints. Portable records keep the v2 format and add
padding/maximum-side geometry settings so their identity can be reconstructed.
Use a fresh destination for a clean export; unrelated pre-existing destination
files are not deleted automatically.

Before resource compilation, `exact_atlas.seed_completed_cache(source, cache)`
validates each curated record's digest, current model/solver version, filename
key, rectangle geometry and completion/proof metadata. It atomically fills only
missing local cache files; an existing local search or result is never replaced.
This avoids repeating completed 60-second searches on a clean checkout or a
different backend while retaining the same policy checks. Geometry, model or
OR-Tools version changes can invalidate a seed and require a new search;
strict mode still continues any seeded result that has no optimality proof.

The native `reanimc pack-atlas-layout` command optimizes rectangle layouts in
one batch for the complete definition corpus. It tries several deterministic
MaxRects placement heuristics, rectangle orders and candidate dimensions.
The input images have no semantic placement order. Batch-global candidates
score every remaining image against the available spaces at each step, while
fixed-order candidates remain alternative heuristics. Returned coordinates
are mapped back to the original local region indices.
Both coordinate-axis orientations are searched. A search with exchanged width
and height maps its coordinates back before emitting the layout; this explores
vertical filling without rotating any source image.
The previous shelf layout remains a candidate, so compact packing cannot
increase an individual atlas's area. Search is bounded and happens only during
resource compilation. Python applies the selected coordinates and pixel
extrusion; the game does no layout search.

## Compiled records

All integers are little endian. The common envelope is three `u32` values:

| Offset | Value |
| --- | --- |
| `0x00` | Reanimation cookie `0xDEADFED9`, particle cookie `0xDEADFEDA` |
| `0x04` | Payload length in bytes |
| `0x08` | Payload CRC32 |

The payload begins with:

| Offset | Type | Meaning |
| --- | --- | --- |
| `0x00` | `u32` | Reanimation `0x35564152` (`RAV5`), particle `0x35564150` (`PAV5`) |
| `0x04` | `u32` | Atlas width |
| `0x08` | `u32` | Atlas height |
| `0x0C` | compact body | Existing transform/emitter structure with inline image rectangles |

Regions retain full logical image sizes and original strip grids. Packing does
not rotate or trim source images. Two pixels of replicated edge padding surround
each image; padding is outside the recorded rectangle. Each former image field
is replaced by six inline `u32` values: x, y, width, height, rows and columns.
Six zero values mean no image. There is no image symbol ID, local image ID,
region-index table or image path in the compiled record.
Some original particle strips have widths not divisible by their column count.
Their cell dimensions keep the original integer division rather than stretching
the image or rejecting its grid.

The remainder uses the established compact transform/emitter body layout,
including its `IDT5`/`IDP5` internal layout tag. The image registry hash in that
body is zero and every former image field contains the six-word rectangle.
The particle emitter-body byte count includes these expanded fields.
Track, font and emitter-name identity tables retain their existing independent
hashes and meanings. The outer v5 cookie and prefix distinguish this format from
the previous globally bound resource format.

These resource CRCs detect broken build artifacts. They are independent of DAT64
save files, whose former content CRC slot is ignored to permit manual editing.

## Ownership and rendering

Each loaded definition holds a shared owner of one resident GPU atlas and owns
a rectangle for each image-bearing transform or emitter. Tracks and emitters store this metadata inline;
they do not hold image views or global texture symbols. The region preserves
logical width, height, rows and columns. Rendering uses the definition's atlas
`Image*` and an absolute source rectangle, translating the logical frame origin
into atlas coordinates once. Runtime image overrides retain their independent
image and strip dimensions.

Definition atlases must bypass the older runtime atlas packing path. Source
PNG decoding may run on the loading worker; GPU upload remains on the primary
thread and releases the temporary decoded pixels. `ResidentImage` has no
`MemoryImage` host, software buffers, or per-region texture metadata. Loaded
definitions retain the GPU texture and region records. A failed load releases
the incomplete definition.

## Global image resources

Only inline rectangles appear in definitions' shipped image fields.
The global registry retains images needed directly by game code, UI or fonts.
The ordinary program sources `ProgramImageSymbols.h/.cpp` define its enum and
pointer bindings. Reanimation and particle compilers do not generate or update
those sources. Existing IDs remain stable.
Its `Image*` bindings can refer to the same GPU-backed image class used by
definitions; the class does not require a global symbol registration.
Definition-only image descriptors and their standalone physical files are
excluded from the package; shared direct consumers protect their resources.
Existing authoring IDs can remain as offline identities without binding runtime
textures. Unoccupied resource slots are represented explicitly rather than
silently reusing a previous texture ID.

The twelve retained QuickPlay images remain independent UI resources as requested.
Their preservation does not depend on the current menu referencing every button.

Atlas memory and duplicate pixels across definitions need measurement. Fewer
texture bindings do not by themselves establish a Vulkan performance gain.
