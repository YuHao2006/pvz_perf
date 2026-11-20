"""Rebuild the two HD wordmarks from the registered artwork and retail alpha references.

This offline authoring tool uses Pillow, NumPy and OpenCV. It preserves the logical
canvases and writes the 4x source images consumed by the existing PAK builder.
"""
from pathlib import Path

import cv2
import numpy as np
from PIL import Image


ASSETS = Path(__file__).resolve().parents[1] / "assets"


def rgba(path):
    with Image.open(path) as image:
        return np.array(image.convert("RGBA"))


def to_byte(values):
    return np.rint(np.clip(values, 0, 255)).astype(np.uint8)


def restore_title():
    art = rgba(ASSETS / "source-art/masters/ai/images/candidate-4x__720cbc18.png")
    height, width = art.shape[:2]
    alpha = art[..., 3]
    with Image.open(ASSETS / "runtime/images/PvZ_Logo.png") as original:
        reference = np.asarray(original.convert("RGBA").resize((width, height), Image.Resampling.BICUBIC))
    # Retail shadow pixels carry the soft opacity gradient and neutral ink.
    # Blend back into the HD face over the last 28 levels of opacity.
    weight = np.clip((255 - alpha.astype(np.float32)) / 28, 0, 1)[..., None]
    color = art[..., :3].astype(np.float32)
    art[..., :3] = to_byte(color + (reference[..., :3] - color) * weight)

    # Straight-alpha bilinear filtering also reads the RGB of transparent neighbors.
    empty = alpha == 0
    distance, labels = cv2.distanceTransformWithLabels(
        empty.astype(np.uint8), cv2.DIST_L2, 5, labelType=cv2.DIST_LABEL_PIXEL
    )
    edge_colors = np.zeros((labels.max() + 1, 3), np.uint8)
    edge_colors[labels[~empty]] = art[~empty, :3]
    art[empty, :3] = 0
    gutter = empty & (distance <= 1.5)
    art[gutter, :3] = edge_colors[labels[gutter]]
    return art


def green_ink(image):
    return to_byte(image[..., 1].astype(np.float32) - image[..., 2] * 0.5)


def restore_defeat():
    art = rgba(ASSETS / "source-art/archive/2026-11-16-pre-library/corrections"
               / "package4x-staging-20261116/reanim__zombieswon-4x.png")
    retail = ASSETS / "runtime/reanim"
    original = rgba(retail / "ZombiesWon.jpg")
    matte = rgba(retail / "ZombiesWon_.png")[..., 2]
    # Fit the retail matte to the local differences between the two sets of letters.
    # A single resize would cut colored ink off several letters.
    size = (matte.shape[1] * 2, matte.shape[0] * 2)
    target = cv2.resize(green_ink(art), size, interpolation=cv2.INTER_AREA)
    source = cv2.resize(green_ink(original), size, interpolation=cv2.INTER_CUBIC)
    flow = cv2.calcOpticalFlowFarneback(
        target, source, None, 0.5, 5, 21, 5, 7, 1.5, cv2.OPTFLOW_FARNEBACK_GAUSSIAN
    )
    height, width = art.shape[:2]
    flow = cv2.resize(flow, (width, height), interpolation=cv2.INTER_LINEAR) * 2
    y, x = np.mgrid[:height, :width].astype(np.float32)
    registered = cv2.remap(matte, (x + flow[..., 0] + 0.5) / 4 - 0.5,
                            (y + flow[..., 1] + 0.5) / 4 - 0.5,
                            cv2.INTER_CUBIC, borderMode=cv2.BORDER_CONSTANT)
    ink = to_byte(np.clip((green_ink(art).astype(np.float32) - 30) / 80, 0, 1) * 255)
    art[..., 3] = np.minimum(art[..., 3], np.maximum(registered, ink))
    return art


if __name__ == "__main__":
    for path, pixels in [("images/pvz_logo.png", restore_title()),
                         ("reanim/zombieswon.png", restore_defeat())]:
        for directory in ("current", "exports4x"):
            Image.fromarray(pixels).save(ASSETS / "high-resolution" / directory / path, compress_level=5)
