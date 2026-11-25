#!/bin/sh
# Package an existing native Release build without copying player data.
set -eu
release=$(cd "$1" && pwd -P)
mkdir -p "$2"
out=$(cd "$2" && pwd -P)
version=$3
pak_mode=${4:-with-pak}
case "$pak_mode" in with-pak|without-pak) ;; *) echo "Invalid PAK mode" >&2; exit 2 ;; esac
name="PvZ Perf HD"
stem="pvz-perf-hd-macos-arm64-$version"
stage=$(mktemp -d "$out/.mac-package.XXXXXX")
trap 'rm -rf "$stage"' EXIT
app="$stage/image/$name.app"
mac="$app/Contents/MacOS"
res="$app/Contents/Resources"
libs="$app/Contents/Frameworks"
mkdir -p "$mac" "$res/shaders" "$libs" "$mac/data"
for f in pvz_perf libbass.dylib data/pvz_dat64_converter; do
    lipo "$release/$f" -verify_arch arm64
done
test -s "$release/shaders/game.metallib"
cp "$release/pvz_perf" "$mac/"
cp "$release/data/pvz_dat64_converter" "$mac/data/"
for f in libbass.dylib; do
    cp "$release/$f" "$libs/"
    ln -s "../Frameworks/$f" "$mac/$f"
    codesign --force --sign - "$libs/$f"
done
if [ "$pak_mode" = with-pak ]; then
    test -s "$release/main.pak64"
    cp "$release/main.pak64" "$res/"
else
    stem="$stem-no-pak"
fi
cp -R "$release/shaders/." "$res/shaders/"
for f in licenses; do
    if [ -d "$release/$f" ]; then cp -R "$release/$f" "$res/"; fi
done
for f in main.pak64 shaders; do
    if [ -e "$res/$f" ]; then ln -s "../Resources/$f" "$mac/$f"; fi
done
python3 - "$app/Contents/Info.plist" "$version" "$name" <<'PY'
import plistlib, sys
with open(sys.argv[1], "wb") as f:
    plistlib.dump(dict(CFBundleName=sys.argv[3], CFBundleExecutable="pvz_perf",
        CFBundleIdentifier="io.github.yuhao2006.pvzperf.hd", CFBundlePackageType="APPL",
        CFBundleShortVersionString=sys.argv[2], CFBundleVersion=sys.argv[2],
        LSMinimumSystemVersion="14.0", NSHighResolutionCapable=True), f)
PY
codesign --force --sign - "$mac/data/pvz_dat64_converter"
codesign --force --sign - "$app"
codesign --verify --deep --strict "$app"
ditto -c -k --keepParent "$app" "$stage/$stem.zip"
mv -f "$stage/$stem.zip" "$out/$stem.zip"
hdiutil create -quiet -format UDZO -volname "$name" -srcfolder "$stage/image" "$stage/$stem.dmg"
hdiutil verify "$stage/$stem.dmg"
mv -f "$stage/$stem.dmg" "$out/$stem.dmg"
printf 'macOS disk image: %s/%s.dmg\n' "$out" "$stem"
