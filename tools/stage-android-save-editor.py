"""Stage the shared web save editor and its Android storage adapter."""

from pathlib import Path
import shutil
import sys


def replace(text, old, new):
    if text.count(old) != 1:
        raise ValueError(f"Unexpected save editor source: {old[:100]}")
    return text.replace(old, new, 1)


def stage(root, output):
    source = root / "tools/bin/web"
    output.mkdir(parents=True, exist_ok=True)
    for name in (
        "lineup-library.js", "save-codec.js", "save-generate.js", "save-lineups.js",
        "save-model.js", "save-prefab.js", "save-tool-client.js", "save-tool-core.js",
        "save-tool-worker.js", "save-standalone.js",
    ):
        shutil.copyfile(source / name, output / name)
    shutil.copyfile(
        root / "android/app/src/main/save-editor/android-save-host.js",
        output / "android-save-host.js",
    )
    html = (source / "save-editor.html").read_text(encoding="utf-8")
    html = replace(html, "浏览器内的关卡存档", "本机存档")
    html = replace(html, "<h2>导入关卡</h2>", "<h2>导入用户或关卡 DAT64</h2>")
    html = replace(html, "let library,standalone;", "let library,standalone,androidHost;")
    html = replace(
        html, "standalone=await createStandalone();",
        "androidHost=await import('./android-save-host.js');standalone=await createStandalone(androidHost.storage);",
    )
    html = replace(
        html, "function download(data,name,type){const url",
        "function download(data,name,type){if(androidHost)return androidHost.download(data,name);const url",
    )
    html = replace(
        html, "if(host)request('close').catch", "if(standalone||host)request('close').catch",
    )
    html = replace(
        html, r"if(/^game[1-9]\d*_\d+\.dat64$/.test(file?.name))",
        r"if(/^(?:user[1-9]\d*|game[1-9]\d*_\d+)\.dat64$/.test(file?.name))",
    )
    html = replace(
        html, "const result=await request('import',{name:$('filename').value.trim(),bytes:new Uint8Array(await file.arrayBuffer())});fillSaves(result.saves);status('已校验并导入，关卡仅保存在本地。')",
        "const name=$('filename').value.trim();if(!await confirmAction('将 DAT64 导入 '+name+'？已有的同名存档将被替换。'))return;const result=await request('import',{name,bytes:new Uint8Array(await file.arrayBuffer())});fillSaves(result.saves);loadProfiles(result.profiles);status('已校验并导入。')",
    )
    html = replace(html, "导出所选 DAT64", "分享所选 DAT64")
    html = replace(html, "植物动画卡死修复（下载副本）", "植物动画卡死修复（分享副本）")
    html = replace(html, "已下载修复副本，原档未改动。", "已打开修复副本的系统分享。")
    html = replace(html, "status('已导出 '+name)", "status('已打开系统分享：'+name)")
    html = replace(html, "已导出用户列表和用户进度；关卡 DAT64 请单独导出。", "已打开用户资料的系统分享。")
    (output / "save-editor.html").write_text(html, encoding="utf-8", newline="\n")


if __name__ == "__main__":
    stage(Path(__file__).resolve().parents[1], Path(sys.argv[1]))

