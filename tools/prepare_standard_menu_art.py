"""Derive the standard edition's menu sprites from a local HD artwork checkout."""
import argparse
from pathlib import Path

from PIL import Image, ImageFilter


IMAGES = Path(__file__).resolve().parents[1] / "assets/runtime/images"
PAGES = ("index", "plant", "zombie")
# Logical origin, shadow offset and opacity fitted to the 1073 plaques on paper.
PLAQUES = {
    "index": ((100, 15), (3, 2), 0.56),
    "plant": ((59, 12), (2, 4), 0.56),
    # The Replanted stone face sits four rows higher inside its sprite than in 1073.
    "zombie": ((32, 21), (2, 4), 0.54),
}


def standard_size(source):
    with Image.open(source) as image:
        width, height = image.size
        if width % 4 or height % 4:
            raise ValueError(f"Expected a 4x master at {source}")
        return image.convert("RGBa").resize((width // 4, height // 4), Image.Resampling.LANCZOS).convert("RGBA")


def main(hd_root):
    masters = hd_root / "assets/high-resolution"
    sources = masters / "current/images"
    output = IMAGES / "almanac"
    output.mkdir(parents=True, exist_ok=True)
    challenge = standard_size(masters / "exports4x/images/challenge_background.png")
    challenge.convert("RGB").save(IMAGES / "Challenge_Background.png")
    names = ["paper", "indexpanels", "plantdecor", "zombiedecor", "plantcard", "zombiecard"]
    names += [f"{page}_border_{i}" for page in PAGES for i in range(8)]
    for name in names:
        standard_size(sources / f"almanac_{name}.png").save(output / f"{name}.png")
    for page, (origin, offset, opacity) in PLAQUES.items():
        plaque = standard_size(sources / f"almanac_{page}header.png")
        # An 800-wide local canvas preserves both the anchor and the shadow gutter.
        # The existing standard-edition packer trims these three pages and records their offsets.
        mask = Image.new("L", (800, 100))
        mask.paste(plaque.getchannel("A"), (origin[0] + offset[0], origin[1] + offset[1]))
        result = Image.new("RGBA", mask.size)
        result.putalpha(mask.filter(ImageFilter.GaussianBlur(2)).point(lambda a: round(a * opacity)))
        result.alpha_composite(plaque, origin)
        result.save(IMAGES / f"Almanac_{page.title()}Back.png")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("hd_root", type=Path)
    main(parser.parse_args().hd_root)
