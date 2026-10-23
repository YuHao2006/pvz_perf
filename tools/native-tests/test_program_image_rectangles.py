"""Compare actual gameplay source rectangles with the authoring image geometry."""
from __future__ import annotations

import ast
import operator
from pathlib import Path
import re
import sys
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import definition_atlas as atlas


def arguments(text: str, opening: int) -> tuple[list[str], int]:
    """Split a C++ call's arguments, retaining nested arithmetic and Rect calls."""
    depth, start, result = 1, opening + 1, []
    for index in range(start, len(text)):
        character = text[index]
        if character == "(":
            depth += 1
        elif character == ")":
            depth -= 1
            if depth == 0:
                result.append(text[start:index].strip())
                return result, index
        elif character == "," and depth == 1:
            result.append(text[start:index].strip())
            start = index + 1
    raise AssertionError("Unterminated source call")


def arithmetic(text: str, variables: dict[str, int]) -> int:
    """Evaluate the small integer expressions used by direct source rectangles."""
    for name, value in sorted(variables.items(), key=lambda pair: -len(pair[0])):
        text = text.replace(name, str(value))
    operations = {ast.Add: operator.add, ast.Sub: operator.sub,
                  ast.Mult: operator.mul, ast.Mod: operator.mod}

    def visit(node):
        if isinstance(node, ast.Constant) and type(node.value) is int:
            return node.value
        if isinstance(node, ast.BinOp) and type(node.op) in operations:
            return operations[type(node.op)](visit(node.left), visit(node.right))
        if isinstance(node, ast.UnaryOp) and isinstance(node.op, ast.USub):
            return -visit(node.operand)
        raise AssertionError(f"Unsupported rectangle arithmetic: {text}")

    return visit(ast.parse(text.strip(), mode="eval").body)


def rectangle(expression: str, variables: dict[str, int]) -> tuple[int, ...]:
    match = re.fullmatch(r"(?:Sexy::)?Rect\s*\((.*)\)", expression, re.S)
    if not match:
        raise AssertionError(f"Expected a direct pixel rectangle: {expression}")
    fields, _ = arguments("(" + match[1] + ")", 0)
    if len(fields) != 4:
        raise AssertionError(f"Rectangle needs four coordinates: {expression}")
    return tuple(arithmetic(field, variables) for field in fields)


def source_rectangles(path: str, symbol: str) -> list[str]:
    text = (ROOT / "pvzPerf" / path).read_text(encoding="utf-8-sig")
    text = re.sub(r"//[^\n]*|/\*.*?\*/", "", text, flags=re.S)
    result = []
    for match in re.finditer(r"\b(DrawImage|TodDrawImageRect\w*)\s*\(", text):
        fields, _ = arguments(text, match.end() - 1)
        image_index = 0 if match[1] == "DrawImage" else 1
        if fields[image_index].removeprefix("Sexy::") == symbol:
            result.append(fields[-1] if image_index == 0 else fields[4])
    return result


class ProgramImageRectangleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.names = {
            "IMAGE_CRATER", "IMAGE_SUNFLOWER_TROPHY", "IMAGE_SURVIVAL_THUMBNAILS",
            "IMAGE_CHALLENGE_THUMBNAILS", "IMAGE_SELECTORSCREEN_LEVELNUMBERS",
            "IMAGE_ZEN_NEED_ICONS", "IMAGE_FOG",
            "IMAGE_PLANTSHADOW", "IMAGE_PLANTSHADOW2", "IMAGE_COBCANNON_TARGET",
        }
        files = {atlas.pak.file_key(path.relative_to(ROOT / "assets/runtime").as_posix()): path
                 for path in (ROOT / "assets/runtime").rglob("*") if path.is_file()}
        cls.descriptors = atlas.authoring_descriptors(
            (ROOT / "assets/definitions/resources.json").read_bytes(), files, cls.names)
        cls.sizes = {name: atlas.logical_image(descriptor, files)[0].size
                     for name, descriptor in cls.descriptors.items()}

    def cell(self, symbol, frame):
        width, height = self.sizes[symbol]
        descriptor = self.descriptors[symbol]
        cell_width, cell_height = width // descriptor.cols, height // descriptor.rows
        return ((frame % descriptor.cols) * cell_width,
                (frame // descriptor.cols) * cell_height, cell_width, cell_height)

    def test_ui_dynamic_frame_rectangles_match_every_authoring_cell(self):
        cases = [
            ("Lawn/Widget/ChallengeScreen.cpp", "IMAGE_SURVIVAL_THUMBNAILS", "aDef.mChallengeIconIndex"),
            ("Lawn/Widget/ChallengeScreen.cpp", "IMAGE_CHALLENGE_THUMBNAILS", "aDef.mChallengeIconIndex"),
            ("Lawn/Widget/GameSelector.cpp", "IMAGE_SELECTORSCREEN_LEVELNUMBERS", "aStage"),
            ("Lawn/Widget/GameSelector.cpp", "IMAGE_SELECTORSCREEN_LEVELNUMBERS", "aSub"),
            ("Lawn/ZenGarden.cpp", "IMAGE_ZEN_NEED_ICONS", "aIcon.mCel"),
        ]
        for path, symbol, variable in cases:
            expressions = [value for value in source_rectangles(path, symbol) if variable in value]
            self.assertTrue(expressions, (path, symbol, variable))
            for frame in range(self.descriptors[symbol].cols * self.descriptors[symbol].rows):
                for expression in expressions:
                    with self.subTest(path=path, symbol=symbol, frame=frame):
                        self.assertEqual(rectangle(expression, {variable: frame}), self.cell(symbol, frame))

    def test_fixed_ui_and_crater_frames_select_original_pixels(self):
        cases = [
            ("Lawn/Widget/AwardScreen.cpp", "IMAGE_SUNFLOWER_TROPHY", {0, 1}),
            ("Lawn/Widget/GameSelector.cpp", "IMAGE_SUNFLOWER_TROPHY", {0, 1}),
            ("Lawn/Widget/GameSelector.cpp", "IMAGE_SELECTORSCREEN_LEVELNUMBERS", {0, 1}),
            ("Lawn/Challenge.cpp", "IMAGE_CRATER", {1}),
        ]
        for path, symbol, frames in cases:
            expressions = [value for value in source_rectangles(path, symbol)
                           if not re.search(r"\baStage\b|\baSub\b", value)]
            self.assertTrue(expressions, (path, symbol))
            with self.subTest(path=path, symbol=symbol):
                self.assertEqual({rectangle(value, {}) for value in expressions},
                                 {self.cell(symbol, frame) for frame in frames})

    def test_fog_rectangles_cover_each_gpu_variant(self):
        for path, variable in (("Lawn/Board.cpp", "aFogSource"),
                               ("Lawn/Widget/CreditScreen.cpp", "aFogRect")):
            text = (ROOT / "pvzPerf" / path).read_text(encoding="utf-8-sig")
            self.assertNotIn("IMAGE_FOG_SOFTWARE", text)
            match = re.search(r"const Rect aFogFrame\s*\(([^;]+)\)\s*;", text)
            self.assertIsNotNone(match, "Fog draw must expose its GPU frame dimensions")
            _, _, width, height = rectangle("Rect(" + match[1] + ")", {})
            source = re.search(r"const Rect " + variable + r"\s*\(([^;]+)\)\s*;", text)
            self.assertIsNotNone(source, "Fog draw must select its source in pixels")
            for frame in range(self.descriptors["IMAGE_FOG"].cols):
                with self.subTest(path=path, frame=frame):
                    variables = {"aCelCol": frame, "aFogFrame.mWidth": width, "aFogFrame.mHeight": height}
                    self.assertEqual(rectangle("Rect(" + source[1] + ")", variables), self.cell("IMAGE_FOG", frame))

    def test_single_image_sources_retain_their_complete_rectangle(self):
        cases = [
            ("Lawn/CursorObject.cpp", "IMAGE_COBCANNON_TARGET"),
            ("Lawn/LawnMower.cpp", "IMAGE_PLANTSHADOW"),
            ("Lawn/LawnMower.cpp", "IMAGE_PLANTSHADOW2"),
            ("Lawn/ZenGarden.cpp", "IMAGE_PLANTSHADOW"),
        ]
        for path, symbol in cases:
            expressions = source_rectangles(path, symbol)
            self.assertTrue(expressions, (path, symbol))
            width, height = self.sizes[symbol]
            variables = {f"{symbol}->mWidth": width, f"{symbol}->mHeight": height}
            for expression in expressions:
                with self.subTest(path=path, symbol=symbol):
                    self.assertEqual(rectangle(expression, variables), (0, 0, width, height))


if __name__ == "__main__":
    unittest.main()
