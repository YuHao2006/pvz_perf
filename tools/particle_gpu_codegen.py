"""Offline particle drawing descriptors consumed directly by all GPU backends."""
import struct

TRACKS = (
    "SystemRed", "SystemGreen", "SystemBlue", "SystemAlpha", "SystemBrightness",
    "ParticleRed", "ParticleGreen", "ParticleBlue", "ParticleAlpha", "ParticleBrightness",
    "ParticleScale", "ParticleStretch", "ClipTop", "ClipBottom", "ClipLeft", "ClipRight",
    "AnimationRate",
)


def gpu_record(definition: dict) -> bytes:
    atlas, emitters = definition["atlas"], definition["emitters"]
    words = [4., float(len(emitters)), 0., float(atlas["slot_count"])]
    words.extend([0.] * (32 * len(emitters)))

    def is_set(nodes):
        return bool(nodes) and nodes[0][4] not in (0, 8)

    for index, emitter in enumerate(emitters):
        tracks = emitter["tracks"]
        flags = emitter["flags"]
        mask = sum(1 << i for i, channel in enumerate(("Red", "Green", "Blue", "Alpha"))
                   if is_set(tracks["System" + channel]) or is_set(tracks["Particle" + channel]))
        mask |= int(is_set(tracks["ParticleScale"])) << 4
        mask |= int(is_set(tracks["ParticleStretch"])) << 5
        mask |= int(is_set(tracks["ParticleSpinSpeed"]) or
                    is_set(tracks["ParticleSpinAngle"]) or (flags & 3) != 0) << 6
        mask |= int(bool(emitter["fields"][0]) or any(is_set(tracks[n]) for n in (
            "EmitterRadius", "EmitterOffsetX", "EmitterOffsetY", "EmitterBoxX", "EmitterBoxY"))) << 7
        base = 4 + index * 32
        words[base:base + 8] = [float(flags), float(mask), float(emitter["offset"]),
                                float(emitter["frames"]), float(emitter["image_frames"]),
                                float(emitter["animated"]), float(is_set(tracks["AnimationRate"])),
                                float(emitter["mask"])]
        for slot, name in enumerate(TRACKS):
            words[base + 8 + slot] = float(len(words))
            nodes = tracks[name]
            words.append(float(len(nodes)))
            for numerator, denominator, low, high, curve, distribution in nodes:
                words.extend((numerator / denominator, low, high, float(curve),
                              float(distribution), 0., 0., 0.))
    words[2] = float(len(words))
    for dimensions, rectangles in zip(atlas["variant_dimensions"], atlas["variant_rectangles"]):
        width, height = dimensions
        for x, y, w, h in rectangles:
            uv = (x / width, y / height, (x + w) / width, (y + h) / height) if width and height else (0.,) * 4
            words.extend((float(w), float(h), *uv, 0., 0.))
    if len(words) >= 1 << 24:
        raise ValueError("GPU particle blob exceeds exact float index range")
    return (struct.pack("<4I", 0x31504750, len(words), len(emitters), atlas["variant_count"])
            + struct.pack(f"<{len(words)}f", *words))
