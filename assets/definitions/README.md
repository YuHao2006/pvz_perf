# Resource definition inputs

These are the checked-in author inputs used by the main resource build.
The original imports retain their encoding, comments and existing notices.
The source paths below record provenance, not runtime or build dependencies.

| Destination, relative to the project | Original source | Files | Bytes |
| --- | --- | ---: | ---: |
| `tools/resourceCompiler/src/` | `../openPvz/reanimC/{src,include,CMakeLists.txt,README.md}` | 11 | 391660 |
| `assets/definitions/reanim/` | `../openPvz/.generated/rootcorpus/{root.dsl,units/**/*.dsl}` | 147 | 13883768 |
| `assets/definitions/particles/` | `../openPvz/.particle_work/out/{all.root.dsl,particles/**/*.dsl}` | 113 | 139564 |
| `assets/definitions/particle-reference/` | `../openPvz/.particle_work/gold64/*.xml.compiled` | 112 | 276506 |
| `assets/definitions/fonts/` | `C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/pak/data/*.txt` | 20 | 142048 |

Counts and byte totals above exclude this README. All 403 copied files were
checked against their sources using SHA-256.

## Compiler

The real compiler is C++: five `.cpp` translation units and four headers, plus
the original CMakeLists.txt and README.md. Its source root is
`tools/resourceCompiler/src/`, with translation units directly in that directory and
headers in `include/reanim/`. The CMake target remains `reanimc`.

The standalone CMakeLists.txt requires CMake 3.24 or newer, C++23,
and `ZLIB::ZLIB`. On Windows it requires the Ninja generator and MSVC x64.
The original README contains historical upstream paths and a `build.bat`
example; that machine-specific helper was not copied. The upstream build
directory, executables, and build products were not copied.
The main CMake build compiles this tool in its own tools/resourceCompiler/build
subdirectory under the selected combination's build tree.

## Required particle gold input

**Keep `particle-reference/`: these are required gold inputs to the existing
particle compiler. Do not silently remove them as generated build output.**

The 112 `.xml.compiled` files were copied in full from
`../openPvz/.particle_work/gold64/`. Although their names end in `.compiled`,
the current `compile-particle-v2` implementation requires `--gold64` and reads
these runtime-native records to obtain gold track data. They are input
dependencies, not products emitted by this migration. Pass
`assets/definitions/particle-reference` as `--gold64`.
Every one of the 112 particle DSL `source-name` values has a matching gold file.
No other particle compiled output was imported.

The optional `--image-registry PATH` input to `compile-particle-v2` enables its
numeric production output. That registry is supplied by the surrounding
resource build and is not a DSL forward dependency.

## DSL dependency closure

Preserve the following relative layout:

```text
reanim/root.dsl
reanim/units/*.dsl
particles/all.root.dsl
particles/particles/*.particle.dsl
particle-reference/*.xml.compiled
fonts/*.txt
```

`reanim/root.dsl` has 146 forwards and reaches all 146 unit definitions
(147 files including the root). `particles/all.root.dsl` has 112 forwards and
reaches all 112 particle definitions (113 files including the root).
References resolve relative to the file containing each directive.

Both complete trees were checked for nested `forward` and `import` directives.
There are no nested directives, missing targets, references outside either
tree, or unreferenced DSL files. The original relative paths and root filenames
were retained without editing the DSL.

DSL image symbols and animation attachment names are resource/runtime
references rather than file inclusion directives. Their resources remain the
responsibility of the surrounding asset build.

## Font definitions

The source directory contains exactly 20 `.txt` files, all confirmed to contain
font `LayerSetImage` definitions. All 20 were copied byte-for-byte, without text
decoding or re-encoding. The definitions reference their existing font image
atlases, including outline layers; those images are separate asset dependencies
and were not copied into this definitions directory.
