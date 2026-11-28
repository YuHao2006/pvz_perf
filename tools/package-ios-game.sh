#!/bin/sh
set -eu
release=$1
framework=$2
out=$3
version=$4
edition=$5
bundle_version=${version%beta}
mkdir -p "$out"
stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT
app="$stage/Payload/PvZ Perf.app"
mkdir -p "$app/shaders" "$app/Frameworks"
exe=$(find "$release" -type f -name pvz_perf -print -quit)
test -s "$exe"
cp "$exe" "$app/pvz_perf"
metal=$(find "$release" -name game.metallib -print -quit)
test -s "$metal"
cp "$metal" "$app/shaders/"
if [ -f "$release/scale.json" ]; then cp "$release/scale.json" "$app/"; fi
ditto "$framework" "$app/Frameworks/bass.framework"
lipo "$framework/bass" -thin arm64 -output "$app/Frameworks/bass.framework/bass"
rm -rf "$app/Frameworks/bass.framework/_CodeSignature"
python3 - "$app/Info.plist" "$bundle_version" "$edition" "${IPHONEOS_DEPLOYMENT_TARGET:?}" <<'PY'
import plistlib,sys
with open(sys.argv[1],"wb") as f:
    hd=sys.argv[3]=="hd"
    plistlib.dump(dict(CFBundleExecutable="pvz_perf",CFBundleName="PvZ Perf HD" if hd else "PvZ Perf",
        CFBundleDisplayName="Plants vs. Zombies",CFBundleIdentifier="io.github.yuhao2006.pvzperf"+(".hd" if hd else ""),
        CFBundlePackageType="APPL",CFBundleVersion=sys.argv[2],CFBundleShortVersionString=sys.argv[2],
        MinimumOSVersion=sys.argv[4],CFBundleSupportedPlatforms=["iPhoneOS"],LSRequiresIPhoneOS=True,
        UIDeviceFamily=[1,2],UIRequiresFullScreen=True,UILaunchScreen={},UIFileSharingEnabled=True,
        LSSupportsOpeningDocumentsInPlace=True,UISupportedInterfaceOrientations=[
        "UIInterfaceOrientationLandscapeLeft","UIInterfaceOrientationLandscapeRight"]),f)
PY
codesign --force --sign - "$app/Frameworks/bass.framework"
codesign --force --sign - "$app"
codesign --verify --deep --strict "$app"
lipo "$app/pvz_perf" -verify_arch arm64
xcrun vtool -show-build "$app/pvz_perf" | grep -E 'platform +IOS$'
actual=$(xcrun vtool -show-build "$app/pvz_perf" | awk '$1=="minos"{print $2; exit}')
test "$actual" = "$IPHONEOS_DEPLOYMENT_TARGET"
plutil -lint "$app/Info.plist"
test ! -e "$app/main.pak64"
ipa="$(cd "$out" && pwd)/pvz-perf-$edition-$version-ios-arm64-no-pak.ipa"
(cd "$stage" && /usr/bin/zip -q -r -y "$ipa" Payload)
unzip -tq "$ipa"
