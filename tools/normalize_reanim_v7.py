"""One-time source migration; verify every replacement against legacy float32."""
from pathlib import Path
import re
import struct


FIELDS = re.compile(r"\b(fps|x|y|skew-x|skew-y|scale-x|scale-y|alpha)\s*:\s*([+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)")
OPAQUE = re.compile(r'"(?:\\.|[^"\\])*"|//[^\n]*|/\*[\s\S]*?\*/')


def bits(text: str) -> bytes:
    return struct.pack("<f", float(text))


def normalize(text: str) -> str:
    def replace(match: re.Match) -> str:
        original = match[2]
        for places in range(1, 10):
            candidate = format(float(original), f".{places}g")
            if bits(candidate) == bits(original):
                return match[0][:match.start(2) - match.start()] + candidate
        raise ValueError(f"No finite float32 equivalent for {match[1]}: {original}")
    parts, previous = [], 0
    for match in OPAQUE.finditer(text):
        parts.extend((FIELDS.sub(replace, text[previous:match.start()]), match[0]))
        previous = match.end()
    parts.append(FIELDS.sub(replace, text[previous:]))
    return "".join(parts)


if __name__ == "__main__":
    root = Path(__file__).resolve().parents[1] / "assets/definitions/reanim"
    count = 0
    for path in root.rglob("*.dsl"):
        original = path.read_text(encoding="utf-8")
        result = normalize(original)
        if result != original:
            path.write_text(result, encoding="utf-8", newline="\n")
            count += 1
    print(f"Normalized {count} reanim source files; all changed numbers verified as float32.")
