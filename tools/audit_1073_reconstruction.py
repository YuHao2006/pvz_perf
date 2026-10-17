#!/usr/bin/env python3
"""Verify that the independent 1073 reconstruction evidence is complete."""

from __future__ import annotations

import csv
import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
AUTHORITY_EXE = Path(
    r"C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\PlantsVsZombies.exe"
)
AUTHORITY_SHA256 = "5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251"
INVENTORY = ROOT / "reconstruction/1073/manifest/functions_1073.csv"
FUNCTION_ROOT = ROOT / "reconstruction/1073/raw_decomp/functions"
RAW_ROOT = ROOT / "reconstruction/1073/raw_decomp"
RAW_ONLY = {
    "00479640": RAW_ROOT / "00479640.asm.txt",
    "004806A0": RAW_ROOT / "004806A0.asm.txt",
    "00488560": RAW_ROOT / "00488560.asm.txt",
}


def fail(message: str) -> None:
    raise SystemExit(f"1073 reconstruction audit: FAIL: {message}")


def main() -> None:
    if not AUTHORITY_EXE.is_file():
        fail(f"authority executable is missing: {AUTHORITY_EXE}")
    digest = hashlib.sha256(AUTHORITY_EXE.read_bytes()).hexdigest()
    if digest != AUTHORITY_SHA256:
        fail(f"authority executable hash changed: {digest}")
    if not INVENTORY.is_file():
        fail(f"function inventory is missing: {INVENTORY}")

    with INVENTORY.open("r", encoding="utf-8", newline="") as stream:
        rows = list(csv.DictReader(stream))
    if len(rows) != 10855:
        fail(f"expected 10855 internal functions, found {len(rows)}")

    addresses = {row["address"].upper() for row in rows}
    if len(addresses) != len(rows):
        fail("function inventory contains duplicate entry addresses")

    decompiled = 0
    listing_only = 0
    missing: list[str] = []
    for address in sorted(addresses):
        source = FUNCTION_ROOT / address[:4] / f"{address}.c"
        if source.is_file() and source.stat().st_size > 0:
            decompiled += 1
            continue
        listing = RAW_ONLY.get(address)
        if listing is not None and listing.is_file() and listing.stat().st_size > 0:
            listing_only += 1
            continue
        missing.append(address)

    if missing:
        preview = ", ".join(missing[:12])
        fail(f"{len(missing)} functions have no retained evidence: {preview}")
    if set(RAW_ONLY) - addresses:
        fail("raw-only function table contains an address outside the inventory")

    print(
        "1073 reconstruction audit: PASS "
        f"({len(rows)} functions; {decompiled} decompiled C; "
        f"{listing_only} complete instruction listings)"
    )


if __name__ == "__main__":
    main()
