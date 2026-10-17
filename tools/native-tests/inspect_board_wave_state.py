"""Read an existing dat64 Board snapshot using offsets from the target compiler."""
import argparse
import json
from pathlib import Path
import struct
import zlib

parser = argparse.ArgumentParser()
parser.add_argument("save", type=Path)
parser.add_argument("layout", type=Path)
args = parser.parse_args()
layout = json.loads(args.layout.read_text(encoding="utf-8-sig"))
data = args.save.read_bytes()
assert data[:8] == b"PVZDAT64"
version, header_size, authority, flags, payload_size, crc, schema, reserved = struct.unpack_from(
    "<4IQ2IQ", data, 8
)
assert (version, header_size, authority, flags, schema, reserved) == (1, 48, 1073, 1, 0x10731, 0)
payload = data[header_size:]
assert len(payload) == payload_size and zlib.crc32(payload) == crc
state_size = struct.unpack_from("<I", payload)[0]
assert state_size == layout["boardSize"] - layout["stateOffset"]
state = payload[4:4 + state_size]
result = {"file": str(args.save), "stateSize": state_size, "crc": "PASS"}
for field, offset in layout.items():
    if not field.startswith("m") or field == "mZombiesInWave":
        continue
    code = "<?" if field in {
        "mPaused", "mLevelComplete", "mLevelAwardSpawned"
    } else "<I" if field == "mMainCounter" else "<i"
    result[field] = struct.unpack_from(code, state, offset)[0]
pool_offset = 4 + state_size
result["zombiePool"] = dict(zip(
    ("freeHead", "maxUsed", "size", "recordBytes"),
    struct.unpack_from("<4I", payload, pool_offset)
))
result["zombies"] = []
records = payload[pool_offset + 16:pool_offset + 16 + result["zombiePool"]["recordBytes"]]
for index in range(result["zombiePool"]["maxUsed"]):
    record = records[index * layout["zombieSlotSize"]:(index + 1) * layout["zombieSlotSize"]]
    identity = struct.unpack_from("<I", record, layout["zombieSize"])[0]
    if not identity & 0xffff0000:
        continue
    zombie = {"id": identity}
    for name, offset in layout["zombieFields"].items():
        code = "<?" if name in {"mDead", "mVisible", "mYuckyFace", "mIsEating"} else "<f" if name in {
            "mPosX", "mPosY", "mVelX", "mOriginalAnimRate", "mScaleZombie"
        } else "<i"
        zombie[name] = struct.unpack_from(code, record, offset)[0]
    result["zombies"].append(zombie)
cursor = pool_offset
reanimations = {}
for pool_index, pool_layout in enumerate(layout["poolLayouts"]):
    free_head, used, size, byte_count = struct.unpack_from("<4I", payload, cursor)
    assert byte_count == used * pool_layout["slot"]
    if pool_index == 9:
        for index in range(used):
            start = cursor + 16 + index * pool_layout["slot"]
            identity = struct.unpack_from("<I", payload, start + pool_layout["size"])[0]
            if not identity & 0xffff0000:
                continue
            values = {"id": identity}
            for name, offset in layout["reanimFields"].items():
                code = "<?" if name == "mDead" else "<f" if name in {
                    "mAnimTime", "mAnimRate"
                } else "<i"
                values[name] = struct.unpack_from(code, payload, start + offset)[0]
            reanimations[identity] = values
    cursor += 16 + byte_count
for zombie in result["zombies"]:
    zombie["body"] = reanimations.get(zombie["mBodyReanimID"])
print(json.dumps(result, indent=2))
