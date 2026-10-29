# Portal relocation parity with 1073

The reference executable is `PlantsVsZombies.exe` from the local
`Plants_Vs_Zombies_V1.2.0.1073_EN` installation, SHA-256
`5F650F52D12751E08B63E590EDB0D9B9F09D087CEA900BAA0EB39E4AF8EDA251`.
The following addresses refer to that executable.

`PortalStart` (`0x429A70`) initially places square portals at `(2,0)` and
`(9,1)`, and circle portals at `(9,3)` and `(2,4)`. Coordinates are zero-based.

`MoveAPortal` (`0x429F20`) chooses an open portal with equal weight, then
enumerates columns 0 through 9 and rows 0 through 4. A candidate is eligible
only when it contains no open portal, is not in the partner portal's row,
and is not in the relocating portal's old row. All eligible cells have equal
weight. The two row comparisons are at `0x429FC5` and `0x429FCE`, both using
the grid item's row field at offset `0x14`.

The previous modern implementation incorrectly excluded the partner's
column and did not exclude the old row. `Challenge::MoveAPortal` now matches
the reference. It deliberately continues to allow columns 0 and 9, plants
under portals, and portals in the same column. The original has no additional
distance-to-house exclusion in this candidate loop.

Spawn weighting is a separate mechanism: the reference at `0x42A270` gives
a relative weight of 0.01 to a row whose effective route to the mower is
shorter than five columns; otherwise a row with a portal receives 1.0 and
a row without a portal receives 0.2. Those are weights, not percentages.
The route calculation at `0x42A350` follows portals from column 10 and caps
its distance accumulation at 40.

`tools/native-tests/test_portal_relocation.py` compiles the actual candidate
loop and tests every old and partner coordinate pair against the row rules,
including occupied cells, same-column candidates, and both edge columns.
It does not require opening or manipulating the game.

## Particle update ownership

Read-only disassembly of the same 1073 executable shows two update paths:
`GridItem::Update` calls particle update `0x521A20` at `0x45191C`; the global
effect update calls it at `0x4484EC` unless byte `+0x1D` is set. The pool
allocator clears that byte at `0x5232B3`, and portal creation at
`0x4517E8` only stores the returned particle ID at `0x4517F0`.
It does not set the attachment/update-owner flag. Thus a live portal particle
normally receives both calls in a logical step. The omission is observable;
whether its resulting speed was deliberate cannot be established from code alone.

The current implementation intentionally uses one global update with the
Board-supplied nanosecond timestamp. GridItem retains creation, drawing,
positioning and destruction, but does not advance particle simulation.
This removes the original duplicate update rather than claiming exact parity
with that particular original behavior. Reanim and relocation rules are separate.
