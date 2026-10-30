"""Replay the reviewed repair only against the exact observed corrupt snapshot."""
import hashlib,json,sys
from pathlib import Path
manifest=json.loads(Path(__file__).with_name("repair-diff.json").read_text())
source,target=map(Path,sys.argv[1:3]);data=bytearray(source.read_bytes())
assert not target.exists(),"Output must be a new file"
assert hashlib.sha256(data).hexdigest()==manifest["source_sha256"],"Not the reviewed snapshot"
for field in manifest["changed_fields"]:
    at=field["offset"];old,new=bytes.fromhex(field["old"]),bytes.fromhex(field["new"])
    assert data[at:at+len(old)]==old
    data[at:at+len(old)]=new
assert hashlib.sha256(data).hexdigest()==manifest["repaired_sha256"]
target.write_bytes(data)
