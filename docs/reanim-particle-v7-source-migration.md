# Reanim / Particle v7 source migration

Authored numeric parameters are normal decimals compiled to float, without a
three-fractional-digit limit or a fixed-point conversion. Values are checked
for valid syntax and finite representable float range. Decimal
cel values are rejected: cel, frame indexes, enum values, counts and image
indexes retain integer semantics.

The source diagnostics include the input filename, property, line and original
invalid literal. Explicit node lists retain literal line locations; structural
track errors identify their property declaration.
Every token is validated, including tokens that the historical legacy track
grammar would otherwise discard.

## Reanim

`tools/normalize_reanim_v7.py` normalized 146 behavior source files. For every
numeric transform / fps replacement it verifies that converting the new text
back to IEEE float32 recovers the original bit pattern. Strings and comments
are excluded from this mechanical normalization. These are source text
compatibility checks. The shortened source text remains valid, but is no
longer a mandatory precision grid.

The six embedded attacher rates temporarily quantized during the earlier
fixed-point implementation have been restored:

| Source files | Temporary rate | Restored rate | Difference |
| --- | ---: | ---: | ---: |
| Credits_Main3, Credits_ZombieArmy1, Credits_ZombieArmy2 | 29.313 | 29.3125 | -0.0005 frame/s |
| Credits_Main3, Credits_ZombieArmy1, Credits_ZombieArmy2 | 25.594 | 25.59375 | -0.00025 frame/s |

Each file contains one occurrence of each rate.

IDTF uses the existing offline source envelope. Its fps and attacher rate are
float values; its transform stride remains 32 bytes, containing six floats,
an int32 cel, and a float alpha in the original order.
Inherited placeholders are resolved before static native definitions are
published. `ReanimatorSourceTransform` owns the authored float parameters; temporary
render transforms remain a separate type.

## Particle

The previous resource build copied native reference motion data, while DSL
motion text was retained for historical import/oracle comparisons. v7 makes
the actual authored text authoritative. `tools/migrate_particle_v7.py` moves
the preserved native values into explicit source node lists and visible
integer metadata/flag declarations, retaining existing image lists and
appearance variants.

All 112 base definition files were migrated: 222 emitters, 3,133 authored
nodes and 276 fields. Every node's time, low and high value recovers the old
float32 bit pattern when sampled as float32; curve and distribution meanings
are preserved. Emitter frame counts, animation mode, flags and emitter type
are checked against the native references too. The two historical constant
curve IDs share one meaning.
The malformed SnowPeaPuff range `[.3.8]` is replaced by its preserved native
node value through this migration.

The explicit node syntax avoids the historical compact grammar's consumed
tokens and makes every authored bound and curve reviewable:

```text
particleAlpha: nodes {
    { time: 0; low: 0; high: 0; curve: Linear; distribution: Linear; }
    { low: 1; high: 1; curve: Linear; distribution: Linear; }
    { low: 1; high: 1; curve: Linear; distribution: Linear; }
    { time: 1; low: 0; high: 0; curve: Linear; distribution: Linear; }
}
```

Explicit `time` is normalized lifetime written as a decimal, unlike the
legacy compact grammar's percentage stamps. Omitted node times are inferred
as reduced rational positions between their surrounding anchors. The example
therefore stores exactly `0/1, 1/3, 2/3, 1/1`. PortalCircle and PortalSquare
alpha tracks use this form; their thirds are never rounded to `.333` / `.667`.

IDRF nodes have a 24-byte offline layout:
`int32 timeNumerator, timeDenominator; float low, high; int32 curve, distribution`.
Static generated native definitions contain these values directly. The
legacy gold/reference records are not shipped.

The distinct IDTF/IDRF magic rejects earlier integer IDT7/IDR7 intermediates,
rather than interpreting integer bits as floats. The resource manifest records
`definition_source_format = IDTF-IDRF-float-v1`.

## Verification

`test_v7_definition_numbers.py` checks decimal boundaries, illegal literals,
discarded-token validation, rational inferred times, normalization exclusions
and all 3,133 migrated particle nodes against the preserved native reference.
The existing native compiler source, reanim variant, particle variant, atlas,
static codegen and numeric pipeline tests cover the rest of the offline
format propagation.

Resource regeneration retains the existing atlas caches. Atlas dimensions
and atlas PNG SHA256 hashes are compared with the pre-migration build; the
number representation change does not require repacking or new textures.
The game package continues to contain images and other resources, with
reanim and particle definitions stored solely in native generated arrays.
