"""Serial EXE-machine-code/current-game comparison; never substitutes model timings."""
import argparse
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import statistics
import subprocess
import time


RETAIL_SHA256 = "5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def rows(path):
    return list(csv.DictReader(io.StringIO("\n".join(
        line for line in path.read_text().splitlines() if not line.startswith("#")))))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ("retail", "retail-probe", "current-probe", "structure-probe", "pak", "output"):
        parser.add_argument("--" + key, type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    if sha(args.retail) != RETAIL_SHA256:
        raise RuntimeError("Unsupported retail EXE; addresses are specific to verified English 1073")
    binaries = {"retail": args.retail_probe.resolve(), "current": args.current_probe.resolve(),
                "structure": args.structure_probe.resolve()}
    manifest = {
        "retail_exe_sha256": RETAIL_SHA256, "pak_sha256": sha(args.pak),
        "affinity": "LP14/0x4000", "frequency": "11x user-controlled, not independently sampled",
        "serial": True, "leaf_process_order": ["retail", "current", "current", "retail"],
        "scope": "Actual original x86 machine code versus actual current x64 Release/LTO. Includes ABI wrapper, input decoding and checksum. ISA/ABI differ; not a same-ISA isolated algorithm claim.",
        "binary_sha256": {key: sha(path) for key, path in binaries.items()},
        "source_sha256": {name: sha(root / "Tests/performance" / name) for name in
                          ("production_leaf_benchmark.cpp", "production_structure_benchmark.cpp")},
        "runs": [],
    }

    def invoke(kind, number):
        directory = output / f"{kind}-{number}"
        directory.mkdir()
        env = os.environ.copy()
        env.pop("PVZ_RETAIL_IMAGE_RESERVED", None)
        env["PVZ_APPDATA_DIR"] = str(directory / "profile")
        env["PVZ_SETTINGS_FILE"] = str(directory / "settings.json")
        env["PVZ_LOG_DIR"] = str(directory / "logs")
        command = [str(binaries[kind])]
        if kind != "structure":
            command += [str(args.retail.resolve() if kind == "retail" else args.pak.resolve()),
                        str(directory / "validation.csv")]
        started = time.perf_counter()
        completed = subprocess.run(command, cwd=binaries[kind].parent, env=env,
                                   capture_output=True, timeout=240)
        (directory / "samples.csv").write_bytes(completed.stdout)
        (directory / "stderr.txt").write_bytes(completed.stderr)
        manifest["runs"].append({"kind": kind, "number": number, "exit": completed.returncode,
                                  "seconds": time.perf_counter() - started, "command": command})
        (output / "manifest.json").write_text(json.dumps(manifest, indent=2), encoding="utf-8")
        print(f"{kind}-{number}: exit={completed.returncode}", flush=True)
        if completed.returncode:
            raise RuntimeError(completed.stderr.decode(errors="replace") or f"{kind} failed")
        result = rows(directory / "samples.csv")
        expected_names = {
            "damage_range", "flower_pot_height", "seed_cost_tail", "store_priced_items", "zombatar_palette"
        } if kind != "structure" else {
            "tracks_scan_0pct", "tracks_mask_0pct", "tracks_scan_5pct", "tracks_mask_5pct",
            "groups_all_18", "groups_occupied", "zombies_actual_pool_1024", "zombies_actual_row_171",
            "plants_actual_pool_48", "plants_actual_bucket_48"
        }
        if kind == "retail":
            expected_names |= {"zombies_actual_pool_1024", "plants_actual_pool_48"}
        if {row["kernel"] for row in result} != expected_names:
            raise RuntimeError(f"Missing or unexpected kernels in {kind}")
        for name in {row["kernel"] for row in result}:
            selected = [row for row in result if row["kernel"] == name]
            if len(selected) != 5 or len({row["checksum"] for row in selected}) != 1:
                raise RuntimeError(f"Incomplete samples or unstable checksum: {kind}/{name}")
        return result

    all_runs = {}
    counts = {kind: 0 for kind in binaries}
    for kind in ["retail", "current", "current", "retail", "structure", "structure"]:
        counts[kind] += 1
        number = counts[kind]
        all_runs[kind, number] = invoke(kind, number)
        if kind == "retail" and number == 2:
            if rows(output / "retail-1/validation.csv") != rows(output / "retail-2/validation.csv"):
                raise RuntimeError("Retail result vectors differ between processes")
        if kind == "current":
            reference = rows(output / "retail-1/validation.csv")
            actual = rows(output / f"current-{number}/validation.csv")
            names = {row["kernel"] for row in actual}
            reference = [row for row in reference if row["kernel"] in names]
            if reference != actual:
                differences = [(a, b) for a, b in zip(reference, actual) if a != b]
                (output / "validation-differences.json").write_text(json.dumps(differences[:20], indent=2))
                raise RuntimeError("Retail/current result vectors differ; do not publish timings")

    summary = []
    for (kind, number), data in all_runs.items():
        for name in sorted({row["kernel"] for row in data}):
            selected = [row for row in data if row["kernel"] == name]
            values = [float(row["ns_per_call"]) for row in selected]
            summary.append({"kind": kind, "process": number, "kernel": name,
                            "min_ns": min(values), "median_ns": statistics.median(values),
                            "calls_per_round": int(selected[0]["calls"]),
                            "checksum": selected[0]["checksum"]})
    # The original plant query and both current cell-query algorithms use the
    # same MT19937 placement/query stream and normalized layer/slot checksum.
    for name in ("plants_actual_pool_48", "zombies_actual_pool_1024"):
        checks = {row["checksum"] for row in summary if row["kernel"] == name}
        if len(checks) != 1:
            raise RuntimeError(f"Original/current world-query checksum differs: {name}")
    if sha(args.retail) != RETAIL_SHA256:
        raise RuntimeError("Retail EXE changed while sampling")
    manifest["validation"] = "PASS shared leaf vectors and world-query checksums; retail file unchanged"
    (output / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    (output / "manifest.json").write_text(json.dumps(manifest, indent=2), encoding="utf-8")
    print("PASS all serial production samples and validation", flush=True)


if __name__ == "__main__":
    main()
