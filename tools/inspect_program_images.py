#!/usr/bin/env python3
"""Read the current package/source tree and generate an offline image catalog.

Only --output is written. No archive extraction, game launch, or network access.
"""
from __future__ import annotations

import argparse
import base64
from collections import Counter, defaultdict
from dataclasses import replace
import hashlib
import io
import json
from pathlib import Path
import re
import struct
import zipfile

from PIL import Image

import build_numeric_runtime_pak64 as pak
import compile_numeric_resources as resources
import compile_numeric_fonts as fonts
import definition_atlas

ROOT = Path(__file__).resolve().parents[1]
PROJECTILES = {
    "PROJECTILE_STAR": "杨桃射出的五角星",
    "PROJECTILECACTUS": "仙人掌尖刺",
    "PROJECTILEPEA": "普通豌豆（包括僵尸豌豆）",
    "PROJECTILESNOWPEA": "寒冰豌豆",
    "PUFFSHROOM_PUFF1": "小喷菇孢子",
    "REANIM_CABBAGEPULT_CABBAGE": "卷心菜投手抛出的卷心菜",
    "REANIM_COBCANNON_COB": "玉米加农炮发射的巨型玉米",
    "REANIM_CORNPULT_BUTTER": "玉米投手抛出的黄油",
    "REANIM_CORNPULT_KERNAL": "玉米投手抛出的玉米粒",
    "REANIM_MELONPULT_MELON": "西瓜投手抛出的西瓜",
    "REANIM_WINTERMELON_PROJECTILE": "冰西瓜投手抛出的冰瓜",
    "REANIM_ZOMBIE_CATAPULT_BASKETBALL": "投石车僵尸发射的篮球",
}
EXACT = {
    "REANIM_CORNPULT_BUTTER_SPLAT": ("投射物命中与碎片", "黄油命中后贴在僵尸身上的黄油块"),
    "MELONPULT_PARTICLES": ("投射物命中与碎片", "西瓜命中时散出的碎片"),
    "WINTERMELON_PARTICLES": ("投射物命中与碎片", "冰瓜命中时散出的碎片"),
    "ZOMBIE_BOSS_ICEBALL_PARTICLES": ("投射物命中与碎片", "僵王冰球的冰块碎片效果"),
    "COBCANNON_POPCORN": ("投射物命中与碎片", "玉米加农炮爆炸时的爆米花碎片"),
    "PEA_SHADOWS": ("投射物阴影", "飞行投射物在地面的阴影图格"),
    "REANIM_POT_TOP_DARK": ("植物状态覆盖", "禅境花园花盆顶部的暗色覆盖"),
    "REANIM_WALLNUT_BODY": ("植物图标与展示", "坚果本体在卡片/展示中的直接绘制"),
    "REANIM_STINKY_TURN3": ("花园商品图标", "商店中蜗牛斯丁奇的商品预览"),
    "REANIM_SODROLLCAP": ("加载界面 UI", "标题加载动画中卷起草皮的端盖"),
    "REANIM_TREE_BG": ("场景背景", "智慧树场景的背景"),
    "REANIM_CREDITS_DISCOLIGHTS": ("片尾演出效果", "片尾歌舞的迪斯科灯光"),
    "REANIM_CREDITS_FOGMACHINE": ("片尾演出效果", "片尾歌舞的烟雾机图像"),
    "REANIM_ZOMBIE_HEAD_GROSSOUT": ("僵尸状态与装饰覆盖", "僵尸吃大蒜时的厌恶表情头部"),
    "REANIM_ZOMBIE_PAPER_MADHEAD": ("僵尸状态与装饰覆盖", "读报僵尸报纸被毁后的愤怒头部"),
    "REANIM_ZOMBIE_GARGANTUAR_DUCKXING": ("僵尸武器与吸附物", "巨人僵尸持有的鸭子过街路牌"),
    "REANIM_ZOMBIE_GARGANTUAR_ZOMBIE": ("僵尸武器与吸附物", "巨人僵尸持有的僵尸武器替换"),
    "REANIM_ZOMBIE_DIGGER_PICKAXE": ("僵尸武器与吸附物", "矿工镐头，供磁力菇吸附物显示"),
    "REANIM_ZOMBIE_LADDER_5": ("僵尸武器与吸附物", "放置在植物上或被磁力菇吸走的梯子"),
    "BRAIN": ("战场对象与目标", "我是僵尸等关卡中的脑子目标"),
    "BUNGEECORD": ("僵尸装备与部件", "蹦极僵尸的绳索"),
    "BUNGEETARGET": ("战场指示与光标", "蹦极僵尸的落点靶标"),
    "COBCANNON_TARGET": ("战场指示与光标", "玉米加农炮的瞄准靶标"),
    "BLANK": ("渲染辅助", "空白图像，用作隐藏或替换绘制的辅助资源"),
    "PLANTSHADOW": ("实体阴影", "植物下方的地面阴影"),
    "PLANTSHADOW2": ("实体阴影", "植物下方的另一种地面阴影"),
}
WORDS = {
    "WALLNUT": "坚果", "TALLNUT": "高坚果", "GARLIC": "大蒜", "PUMPKIN": "南瓜",
    "SUNFLOWER": "向日葵", "CRAZYDAVE": "疯狂戴夫", "ZOMBIE": "僵尸",
    "BACKUP": "伴舞", "BALLOON": "气球", "BOBSLED": "雪橇", "BOSS": "僵王",
    "CATAPULT": "投石车", "DIGGER": "矿工", "DISCO": "舞王", "DOLPHINRIDER": "海豚骑士",
    "FLAG": "旗帜", "FOOTBALL": "橄榄球", "GARGANTUAR": "巨人", "IMP": "小鬼",
    "JACKBOX": "玩偶匣", "LADDER": "梯子", "PAPER": "读报", "POGO": "跳跳",
    "POLEVAULTER": "撑杆", "SNORKLE": "潜水", "YETI": "雪人", "ZAMBONI": "冰车",
    "HEAD": "头部", "BODY": "身体", "OUTERARM": "外侧手臂", "INNERARM": "内侧手臂",
    "LEFTARM": "左臂", "UPPER": "上段", "LOWER": "下段", "HAND": "手掌",
    "BONE": "骨骼", "ARM": "手臂", "FOOT": "脚", "JAW": "下颚", "THUMB": "拇指",
    "REDEYE": "红眼", "DAMAGE": "损伤", "CRACKED": "裂纹", "WITHBALL": "带球",
    "POLE": "投球臂", "SIDING": "侧板", "BUCKET": "铁桶", "CONE": "路障帽",
    "HARDHAT": "安全帽", "HELMET": "头盔", "SCREENDOOR": "纱门", "STICK": "跳杆",
    "STICKHANDS": "握杆双手", "PICKAXE": "镐头", "MOUTH": "嘴部",
    "SING": "唱歌口型", "WINK": "眨眼", "MUSTACHE": "胡须", "SUNGLASSES": "墨镜",
    "EYEGLOW": "眼部光效", "MOUTHGLOW": "口部光效", "BLUE": "蓝色",
    "BACK": "返回", "BUTTON": "按钮", "HIGHLIGHT": "高亮态", "DOWN": "按下态",
    "DISABLED": "禁用态", "OVER": "悬停态", "BG": "底图", "BACKGROUND": "背景",
    "MENU": "菜单", "MAIN": "主界面", "INNER": "内层", "WINDOW": "窗口",
    "CLOSEBUTTON": "关闭按钮", "CLOSEBUTTONHIGHLIGHT": "关闭按钮高亮态",
    "INDEXBACK": "索引底图", "INDEXBUTTON": "索引按钮", "INDEXBUTTONHIGHLIGHT": "索引按钮高亮态",
    "PLANTBACK": "植物页底图", "ZOMBIEBACK": "僵尸页底图", "PLANTCARD": "植物卡片",
    "ZOMBIECARD": "僵尸卡片", "ZOMBIEBLANK": "僵尸占位", "ZOMBIEWINDOW": "僵尸窗口",
    "GROUNDDAY": "白天地面", "GROUNDNIGHT": "夜晚地面", "GROUNDPOOL": "泳池地面",
    "GROUNDNIGHTPOOL": "夜晚泳池地面", "GROUNDROOF": "屋顶地面", "GROUNDICE": "结冰地面",
    "IMITATER": "模仿者", "ALMANAC": "图鉴", "STORE": "商店", "ZENGARDEN": "禅境花园",
    "ADVENTURE": "冒险模式", "STARTADVENTURE": "开始冒险", "CHALLENGES": "小游戏",
    "SURVIVAL": "生存模式", "VASEBREAKER": "砸罐子", "OPTIONS": "设置", "QUIT": "退出",
    "HELP1": "帮助第一页", "HELP2": "帮助第二页", "KEY": "钥匙", "SHADOW": "阴影",
    "WOODSIGN": "木牌", "PRESS": "按下态", "MOREWAYSTOPLAY": "更多玩法",
    "ACHIEVEMENTS": "成就", "PEDESTAL": "底座", "LEVELNUMBERS": "关卡数字",
    "ACCESSORY": "饰品", "CLOTHES": "服装", "EYEWEAR": "眼镜", "FACIALHAIR": "胡须",
    "HAIR": "发型", "HATS": "帽子", "TIDBITS": "面部小饰物", "MASK": "着色遮罩",
    "SKIN": "肤色", "BACKDROPS": "背景选择", "ACCEPT": "接受", "BEGIN": "开始",
    "FINISHED": "完成", "VIEW": "查看", "NEWZOMBIE": "新建僵尸", "NEXT": "下一项",
    "PREV": "上一项", "COLORPICKER": "颜色选择器", "COLORS": "颜色", "NONE": "无",
    "DISPLAY": "预览", "LOGO": "标志", "MAINMENUBACK": "返回主菜单", "WIDGET": "控件",
    "BLANK": "空白", "CRAZYDAVE": "疯狂戴夫", "ROOF": "屋顶", "DOS": "DOS 风格",
    "SMALL": "小型", "TRIPTYCH": "三联展示", "TOS": "使用条款", "ARROW": "箭头",
    "SLIDER": "滑块轨道", "FACIAL": "面部",
    "MINIGAMES": "小游戏", "PUZZLES": "解谜模式", "CLOUD": "云朵",
}


def label(name: str) -> str:
    value = name.removeprefix("IMAGE_").removeprefix("REANIM_")
    def word(token: str) -> str:
        if token in WORDS:
            return WORDS[token]
        match = re.fullmatch(r"([A-Z]+)(\d+)", token)
        if match and match[1] in WORDS:
            return WORDS[match[1]] + " " + match[2]
        return token
    return "·".join(word(token) for token in value.split("_"))


def describe(name: str, references: list[dict]) -> tuple[str, str, str]:
    n = name.removeprefix("IMAGE_")
    if n in PROJECTILES:
        return "投射物本体", PROJECTILES[n] + "，用于飞行中的本体绘制", "源码绘制表确认"
    if n in EXACT:
        category, purpose = EXACT[n]
        return category, purpose, "源码调用与名称确认"
    if n.startswith(("REANIM_GARLIC_BODY", "REANIM_PUMPKIN_DAMAGE",
                     "REANIM_WALLNUT_CRACKED", "REANIM_TALLNUT_CRACKED")):
        return "植物伤损覆盖", label(name) + "：血量下降后替换原身体图的伤损状态", "源码伤损替换确认"
    if n.startswith("REANIM_ZOMBIE_CATAPULT_POLE"):
        return "僵尸装备与装弹状态", label(name) + "：投石车投球臂，按伤损及是否载球切换", "源码状态切换确认"
    if n.startswith("REANIM_ZOMBIE_"):
        if any(t in n for t in ("MUSTACHE", "SUNGLASSES", "GLOW", "HEAD_REDEYE")):
            return "僵尸状态与装饰覆盖", label(name) + "：状态或装饰替换图", "源码调用与名称推断"
        if any(t in n for t in ("BUCKET", "CONE", "HARDHAT", "HELMET", "SCREENDOOR")):
            return "僵尸护具与伤损覆盖", label(name) + "：护具本体或对应受损阶段；亦可能用于掉落/吸附展示", "源码护具表与名称推断"
        if any(t in n for t in ("DAMAGE", "UPPER2", "LOWER2", "BODY1_", "HEAD2", "FOOT2", "PAPER2", "PAPER3")):
            return "僵尸伤损覆盖", label(name) + "：受伤或肢体缺失后使用的替换图", "源码伤损路径与名称推断"
        return "僵尸掉落肢体与部件", label(name) + "：掉落部件、装备或动画轨道的直接用图", "源码调用与名称推断"
    if n.startswith("REANIM_SUNFLOWER_HEAD_"):
        return "植物表情与演出覆盖", label(name) + "：片尾歌舞/表情动画的头部替换", "源码调用与名称推断"
    if n.startswith("REANIM_CRAZYDAVE_MOUTH"):
        return "角色口型覆盖", label(name) + "：疯狂戴夫对话口型替换", "源码调用与名称确认"
    if n.startswith("REANIM_COIN") or n == "REANIM_DIAMOND":
        return "收集物与奖励", label(name) + "：金币、银币、钻石或其发光绘制", "源码调用与名称确认"
    if n.startswith("ZOMBATAR_"):
        sub = n[len("ZOMBATAR_"):]
        detail = label("IMAGE_" + sub).replace("拇指", "滑块柄")
        if re.match(r"(ACCESSORY|CLOTHES|EYEWEAR|FACIALHAIR|HAIR|HATS|TIDBITS)_\d+", sub):
            category = "僵尸头像着色遮罩" if "_MASK" in sub else "僵尸头像可选部件"
            return category, "自定义僵尸头像：" + detail, "源码部件数组与名称确认"
        if re.search(r"BACKGROUND|(?:^|_)BG(?:_|$)|ZOMBIE_BLANK", sub):
            return "僵尸头像编辑器背景", "自定义僵尸头像编辑器：" + detail, "源码界面调用与名称推断"
        return "僵尸头像编辑器 UI", "自定义僵尸头像编辑器：" + detail, "源码界面调用与名称推断"
    if n.startswith("BACKGROUND") or n in {"AQUARIUM1", "SOD1ROW", "SOD3ROW"}:
        if any(s in n for s in ("MASK", "OVERLAY")):
            return "场景遮罩与覆盖层", label(name) + "：与对应战场/花园背景配套的遮罩或覆盖层", "源码背景路径与名称推断"
        stage = {"BACKGROUND1": "白天草坪", "BACKGROUND1UNSODDED": "尚未铺草皮的白天庭院",
                 "BACKGROUND2": "夜晚草坪", "BACKGROUND3": "白天泳池", "BACKGROUND4": "夜晚泳池",
                 "BACKGROUND5": "屋顶", "BACKGROUND6BOSS": "僵王战屋顶",
                 "BACKGROUND_GREENHOUSE": "禅境温室", "BACKGROUND_MUSHROOMGARDEN": "蘑菇花园",
                 "AQUARIUM1": "水族馆", "SOD1ROW": "单行草皮", "SOD3ROW": "三行草皮"}.get(n, label(name))
        return "场景背景", stage + "背景/地面", "源码场景绘制与名称确认"
    if n.startswith("POOL"):
        return "泳池水面与光效", label(name) + "：泳池底层、水面、明暗或焦散效果", "源码泳池绘制与名称推断"
    if n.startswith("ZOMBIE_NOTE") or n in {"ZOMBIE_FINAL_NOTE", "CREDITS_ZOMBIENOTE"}:
        return "僵尸来信界面", label(name) + "：关卡间僵尸来信纸张/图案", "源码界面调用与名称确认"
    if n.startswith("ZOMBIE_BOBSLED"):
        return "僵尸装备与部件", label(name) + "：雪橇小队雪橇的分片/内部绘制", "源码调用与名称确认"
    if n.startswith("ZOMBIE"):
        return "僵尸掉落肢体与部件", label(name) + "：对应僵尸的掉头、断臂或跳杆部件图", "源码粒子调用与名称推断"
    if n.startswith(("REANIM_SELECTORSCREEN_", "SELECTORSCREEN_", "QUICKPLAY_")):
        return "主菜单与模式选择 UI", label(name) + "：主菜单/快速游戏的按钮、装饰或底图", "源码界面调用与名称推断"
    if n.startswith("STORE_"):
        return ("商店商品图标" if "ICON" in n else "商店 UI"), label(name) + "：疯狂戴夫商店的商品或界面绘制", "源码商店调用与名称推断"
    if n.startswith("ALMANAC"):
        return "图鉴 UI", label(name) + "：植物/僵尸图鉴的页面、卡片或控件", "源码图鉴调用与名称推断"
    if n.startswith("ACHEESEMENTS_"):
        return "成就图标与界面", label(name) + "：成就页图标、地下装饰或滚动控件", "源码成就界面与名称推断"
    if n.startswith(("OPTIONS_", "DIALOG_", "BUTTON_", "EDITBOX")):
        return "通用控件与设置 UI", label(name) + "：对话框、按钮边片或设置控件", "源码界面调用与名称推断"
    if n.startswith(("CHALLENGE_", "SURVIVAL_THUMBNAILS", "MINIGAME_TROPHY", "SLOTMACHINE", "BEGHOULED")):
        return "小游戏与关卡选择 UI", label(name) + "：小游戏/生存模式的界面、缩略图或覆盖层", "源码模式界面与名称推断"
    if n.startswith(("SEED", "IMITATERSEED", "PACKET_PLANTS", "CONVEYORBELT")):
        return "种子卡与选卡 UI", label(name) + "：选卡、种子栏、卡片或传送带绘制", "源码选卡路径与名称推断"
    if n.startswith(("FLAGMETER", "SUNBANK", "COINBANK", "SHOVELBANK")):
        return "战场 HUD", label(name) + "：波次进度、阳光/金币或铲子栏", "源码战场 UI 与名称推断"
    if n.startswith(("CRATER", "TOMBSTONE", "NIGHT_GRAVE", "SCARY_POT", "WALLNUT_BOWLINGSTRIPE")):
        return "战场地物", label(name) + "：弹坑、墓碑、罐子或保龄球道线等地物", "源码地物路径与名称推断"
    if n.startswith(("FOG", "RAIN", "ICE", "WATER", "WAVE", "WHITEWATER", "DIRT", "ROCK", "SPOTLIGHT")):
        return "天气与环境粒子", label(name) + "：雾、雨、冰、水花、尘土或灯光效果", "源码效果调用与名称推断"
    if n.startswith(("ZEN_", "ZENSHOP", "FERTILIZER", "BUG_SPRAY", "PHONOGRAPH", "TREEFOOD", "WATERINGCAN")):
        return "花园工具与提示", label(name) + "：禅境花园工具、需求提示或商品", "源码花园路径与名称推断"
    if n.startswith(("AWARD", "TROPHY", "SUNFLOWER_TROPHY", "MONEYBAG", "PRESENT", "CARKEYS", "CHOCOLATE", "TACO")):
        return "收集物与奖励", label(name) + "：拾取奖励、解锁物或奖杯展示", "源码奖励路径与名称推断"
    if n.startswith(("LOADBAR", "TITLESCREEN", "PVZ_LOGO", "POPCAP_LOGO")):
        return "加载界面 UI", label(name) + "：启动标题、标志或加载进度条", "源码标题界面与名称推断"
    if n.startswith(("SHOVEL", "ICON_", "LOCK")):
        return "工具与状态图标", label(name) + "：工具、清场车或解锁状态图标", "源码调用与名称推断"
    if name.startswith("FONT_IMAGE_"):
        return "字体图像", "HouseOfTerror 28 号字体的字形位图", "字体资源清单确认"
    if n.startswith("CREDITS_"):
        return "片尾界面 UI", label(name) + "：片尾演出界面控件", "源码调用与名称推断"
    return "提示与辅助绘制", label(name) + "：提示气泡或辅助绘制；具体用途请结合下列引用确认", "用途推断，待人工确认"


def source_references(root: Path, image_names: list[str]) -> dict[str, list[dict]]:
    exact = set(image_names)
    result = defaultdict(list)
    for source in sorted((root / "pvzPerf").rglob("*")):
        if source.suffix not in pak.CPP_SUFFIXES or "generated" in source.parts:
            continue
        if source.name in {"Resources.cpp", "Resources.h"}:
            continue
        text = source.read_text(encoding="utf-8-sig")
        # Preserve newlines; declarations in generated binding tables and text
        # inside comments/string literals are not actual source references.
        cleaned = pak.TOKEN.sub(lambda match: re.sub(r"[^\n]", " ", match[0]), text)
        original = text.splitlines()
        for number, line in enumerate(cleaned.splitlines(), 1):
            found = set()
            for token in re.findall(r"\b(?:IMAGE_|FONT_IMAGE_)\w+", line):
                if token in exact:
                    found.add(token)
            for name in sorted(found):
                result[name].append({"file": source.relative_to(root).as_posix(), "line": number,
                                     "code": original[number - 1].strip()})
    return result


class ZipImages:
    """Fresh seekable streams for Image.open; never extract archive members."""
    def __init__(self, archive: zipfile.ZipFile):
        self.archive = archive
        self.names = {pak.file_key(name): name for name in archive.namelist()}

    def __contains__(self, key: str) -> bool:
        return key in self.names

    def __getitem__(self, key: str) -> io.BytesIO:
        return io.BytesIO(self.archive.read(self.names[key]))


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def render_markdown(document: dict) -> str:
    lines = ["# 当前图像资源用途图鉴", "",
             f"共 {document['summary']['images']} 项。来源：当前 pak64、图像指针声明、源码和构建 manifest。",
             "用途中的“推断”表示按名称与调用上下文归类，不能视为运行时逐帧观测。"
             "源码引用排除生成声明、注释和字符串；没有直接源码引用的资源仍由资源清单保留。",
             "定义复用表示同一作者源名称或物理源文件也参与任一变体的定义图集。",
             "HTML 图鉴包含透明背景/首帧缩略图、搜索、分类筛选；JSON 保留所有引用与复用定义。", ""]
    for category, count in document["summary"]["categories"].items():
        lines += [f"## {category}（{count}）", "",
                  "| 名称 | 中文用途 / 依据 | 物理路径 | 尺寸 / rows×cols | 源码引用 | 定义复用 |",
                  "|---|---|---|---|---|---|"]
        for row in document["images"]:
            if row["category"] != category:
                continue
            refs = "<br>".join(f"{r['file']}:{r['line']}" for r in row["references"]) or "无直接引用；资源清单保留"
            definitions = "<br>".join(row["definition_uses"]) or "无"
            values = [f"`{row['name']}`", row["purpose"] + " / " + row["basis"],
                      "<br>".join(row["files"]), f"{row['width']}×{row['height']} / {row['rows']}×{row['cols']}",
                      refs, definitions]
            lines.append("| " + " | ".join(value.replace("|", "\\|") for value in values) + " |")
        lines.append("")
    return "\n".join(lines)


def render_html(document: dict) -> str:
    serialized = json.dumps(document, ensure_ascii=False, separators=(",", ":")).replace("<", "\\u003c")
    return """<!doctype html>
<html lang="zh-CN"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>当前图像资源图鉴</title>
<style>
*{box-sizing:border-box}body{margin:0;background:#f1f4f0;color:#202b24;font:14px/1.65 system-ui,"Microsoft YaHei",sans-serif}
header{padding:24px 30px;background:#173c2d;color:#fff}h1{margin:0 0 8px;font-size:26px}
header p{max-width:1100px;margin:7px 0;color:#d9e8dd}.controls{position:sticky;top:0;background:#fff;padding:14px 30px;display:flex;gap:12px;flex-wrap:wrap;z-index:2;border-bottom:1px solid #ccd7ce}
input,select{font:inherit;padding:9px;border:1px solid #acbeb0;border-radius:6px}input{flex:1;min-width:270px}
#stats{align-self:center;color:#486451}main{padding:20px 30px}.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(380px,1fr));gap:16px}
article{background:white;border:1px solid #d2dcd2;border-radius:9px;overflow:hidden}article .top{display:flex;gap:14px;padding:16px}
.thumb{width:150px;min-width:150px;height:125px;display:grid;place-items:center;border-radius:6px;background-color:#ececec;background-image:linear-gradient(45deg,#d4d4d4 25%,transparent 25%),linear-gradient(-45deg,#d4d4d4 25%,transparent 25%),linear-gradient(45deg,transparent 75%,#d4d4d4 75%),linear-gradient(-45deg,transparent 75%,#d4d4d4 75%);background-size:16px 16px;background-position:0 0,0 8px,8px -8px,-8px 0}
.thumb img{max-width:144px;max-height:117px;object-fit:contain}h2{font-size:14px;margin:0;overflow-wrap:anywhere}.tag{display:inline-block;background:#e6f0e8;color:#28573c;padding:2px 7px;border-radius:4px;margin-bottom:7px}
.purpose{margin:8px 0 0}.meta{padding:0 16px 14px;overflow-wrap:anywhere}.muted{color:#67746a;font-size:12px}
details{border-top:1px solid #edf0eb;padding:9px 16px}summary{cursor:pointer;color:#315c40}pre{white-space:pre-wrap;overflow-wrap:anywhere;font:12px/1.55 ui-monospace,monospace}
.empty{padding:40px;text-align:center}@media(max-width:480px){main{padding:12px}.grid{grid-template-columns:1fr}.thumb{width:110px;min-width:110px}.thumb img{max-width:104px}}
</style><header><h1>当前图像资源用途图鉴</h1>
<p id="overview"></p><p>缩略图按当前包的透明通道解码；多帧资源显示第一格。用途有“推断”标记时，请结合源码证据确认。源码引用排除了生成声明、注释和字符串。</p>
<p>定义复用涵盖所有变体的作者源名称和物理源文件。此页完全离线，不加载外部资源。</p></header>
<div class="controls"><input id="query" type="search" placeholder="搜索名称、中文用途、物理路径、源码文件或定义…">
<select id="category"><option value="">所有分类</option></select>
<select id="usage"><option value="">所有引用情况</option><option value="code">有源码引用</option><option value="manifest">仅资源清单保留</option><option value="definition">也被定义复用</option><option value="inferred">用途含推断</option></select><span id="stats"></span></div>
<main><div id="grid" class="grid"></div></main>
<script id="catalog-data" type="application/json">""" + serialized + """</script><script>
const catalog=JSON.parse(document.getElementById('catalog-data').textContent);
const esc=value=>String(value??'').replace(/[&<>"']/g,ch=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
const grid=document.getElementById('grid'),query=document.getElementById('query'),category=document.getElementById('category'),usage=document.getElementById('usage');
document.getElementById('overview').textContent=`${catalog.summary.images} 个资源 · ${catalog.summary.with_code_references} 个有源码引用 · ${catalog.summary.with_definition_reuse} 个有定义复用`;
for(const [name,count] of Object.entries(catalog.summary.categories)){const o=document.createElement('option');o.value=name;o.textContent=`${name} (${count})`;category.append(o);}
const searchable=catalog.images.map(({thumbnail,...metadata})=>JSON.stringify(metadata).toLowerCase());
function render(){const needle=query.value.trim().toLowerCase();let count=0;grid.innerHTML=catalog.images.map((r,i)=>{
if(needle&&!searchable[i].includes(needle)||category.value&&r.category!==category.value||usage.value==='code'&&!r.references.length||usage.value==='manifest'&&r.references.length||usage.value==='definition'&&!r.definition_uses.length||usage.value==='inferred'&&!r.basis.includes('推断'))return '';
count++;const refs=r.references.map(v=>`${v.file}:${v.line}\\n  ${v.code}`).join('\\n\\n')||'未发现直接源码引用；由资源清单保留。';
return `<article><div class="top"><div class="thumb"><img loading="lazy" alt="${esc(r.name)}" src="${r.thumbnail}"></div><div><span class="tag">${esc(r.category)}</span><h2>${esc(r.name)}</h2><p class="purpose">${esc(r.purpose)}</p></div></div><div class="meta"><div class="muted">${esc(r.basis)}</div><div>${r.width} × ${r.height} px · rows=${r.rows}, cols=${r.cols} · 单格 ${r.cell_width} × ${r.cell_height}</div><div>${r.files.map(esc).join('<br>')}</div></div><details><summary>源码证据 (${r.references.length})</summary><pre>${esc(refs)}</pre></details><details><summary>定义复用 (${r.definition_uses.length})</summary><pre>${esc(r.definition_uses.join('\\n')||'无匹配的作者源名称或物理源文件')}</pre></details></article>`;}).join('');
document.getElementById('stats').textContent=`显示 ${count} / ${catalog.images.length}`;if(!count)grid.innerHTML='<div class="empty">没有匹配资源</div>';}
query.addEventListener('input',render);category.addEventListener('change',render);usage.addEventListener('change',render);render();
</script></html>"""


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--archive", type=Path)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    cache = root / "out/x64-win32-vulkan/cache/resources"
    archive_path = (args.archive or cache / "main.pak64").resolve()
    manifest_path = (args.manifest or archive_path.parent / "manifest.json").resolve()
    output = (args.output or root / "out/inspection/program-images-current").resolve()
    image_names = resources.read_names(root)
    references = source_references(root, image_names)
    report = json.loads(manifest_path.read_text(encoding="utf-8"))
    definition_names, definition_files = defaultdict(set), defaultdict(set)
    for definition, atlas in report["definition_atlases"].items():
        for variant in atlas.get("variants", [atlas]):
            definition_use = variant.get("path", definition)
            for image in variant["images"]:
                definition_names[image["source"]].add(definition_use)
                for filename in image["files"]:
                    definition_files[pak.file_key(filename)].add(definition_use)
    rows = []
    with zipfile.ZipFile(archive_path) as archive:
        data = archive.read(pak.RESOURCE_PATH)
        tags = fonts.tag_registry(fonts.load_corpus(root / "assets/definitions/fonts"))
        expected, plan, contract_crc, _ = resources.compile_manifest(
            root, (root / "assets/definitions/resources.json").read_bytes(),
            archive.namelist(), image_names, tags)
        header = struct.unpack_from("<8I", data)
        pak.require(data == expected and header[1] == 4 and header[5] == contract_crc,
                    "Package differs from current named load bindings; rebuild first")
        ordered_names = [record["name"] for group in plan for record in group["records"]
                         if record["kind"] == 0]
        descriptors = definition_atlas.descriptors(data, ordered_names)
        pak.require(set(descriptors) == set(ordered_names),
                    "Package must bind every live image pointer exactly once")
        files = ZipImages(archive)
        # NRSC4 deliberately has no source-sheet geometry. Recover the offline
        # author grid for catalog cell previews and the multi-cell audit.
        source_descriptors = definition_atlas.authoring_descriptors(
            (root / "assets/definitions/resources.json").read_bytes(),
            dict.fromkeys(files.names), set(ordered_names))
        for name in ordered_names:
            source = source_descriptors[name]
            descriptor = replace(descriptors[name], rows=source.rows, cols=source.cols)
            pak.require(not descriptor.flags & (resources.PROGRAM | resources.UNAVAILABLE),
                        f"Expected physical current image: {name}")
            image, used = definition_atlas.logical_image(descriptor, files)
            width, height = image.size
            cell_width, cell_height = width // descriptor.cols, height // descriptor.rows
            thumbnail = image.crop((0, 0, cell_width, cell_height))
            thumbnail.thumbnail((144, 117), Image.Resampling.LANCZOS)
            buffer = io.BytesIO()
            thumbnail.save(buffer, format="PNG", optimize=True)
            definitions = set(definition_names[name])
            for filename in used:
                definitions.update(definition_files[filename])
            category, purpose, basis = describe(name, references[name])
            if not references[name]:
                basis = "仅资源清单保留；用途按名称推断"
            rows.append({
                "name": name, "purpose": purpose, "category": category,
                "basis": basis, "path": descriptor.path, "files": sorted(used),
                "width": width, "height": height, "rows": descriptor.rows, "cols": descriptor.cols,
                "cell_width": cell_width, "cell_height": cell_height,
                "references": references[name], "definition_uses": sorted(definitions),
                "thumbnail": "data:image/png;base64," + base64.b64encode(buffer.getvalue()).decode("ascii"),
            })
    pak.require(len({r["name"] for r in rows}) == len(ordered_names), "Catalog names duplicated")
    document = {
        "format": "pvz-program-image-inspection-v3", "binding_contract_crc": f"{contract_crc:08X}",
        "inputs": {"archive": str(archive_path), "archive_sha256": sha256(archive_path),
                   "program_images": str(resources.program_images_path(root)),
                   "program_images_sha256": sha256(resources.program_images_path(root)),
                   "build_manifest": str(manifest_path), "build_manifest_sha256": sha256(manifest_path)},
        "summary": {"images": len(rows), "with_code_references": sum(bool(r["references"]) for r in rows),
                    "with_definition_reuse": sum(bool(r["definition_uses"]) for r in rows),
                    "categories": dict(sorted(Counter(r["category"] for r in rows).items()))},
        "images": rows,
    }
    page = render_html(document)
    embedded = re.search(r'<script id="catalog-data" type="application/json">(.*?)</script>', page, re.S)
    pak.require(embedded is not None and json.loads(embedded[1]) == document,
                "HTML data does not match JSON")
    output.mkdir(parents=True, exist_ok=True)
    (output / "catalog.json").write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (output / "catalog.html").write_text(page, encoding="utf-8")
    (output / "catalog.md").write_text(render_markdown(document), encoding="utf-8")
    pak.require(json.loads((output / "catalog.json").read_text(encoding="utf-8")) == json.loads(embedded[1]),
                "Written JSON does not match HTML")
    print(json.dumps(document["summary"], ensure_ascii=False, indent=2))
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
