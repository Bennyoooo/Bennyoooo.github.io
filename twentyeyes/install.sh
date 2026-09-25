#!/bin/sh
# TwentyEyes installer — https://bennyjiang.com/twentyeyes
# Downloads the app, clears the Gatekeeper quarantine flag (the app is not notarized),
# copies it to /Applications and launches it.
set -eu
URL="https://bennyjiang.com/twentyeyes/TwentyEyes.zip"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "Downloading TwentyEyes..."
curl -fsSL "$URL" -o "$TMP/TwentyEyes.zip"
ditto -x -k "$TMP/TwentyEyes.zip" "$TMP"
[ -d "$TMP/TwentyEyes.app" ] || { echo "Download did not contain TwentyEyes.app"; exit 1; }
xattr -dr com.apple.quarantine "$TMP/TwentyEyes.app" 2>/dev/null || true
pkill -x TwentyEyes 2>/dev/null || true
rm -rf /Applications/TwentyEyes.app
mv "$TMP/TwentyEyes.app" /Applications/TwentyEyes.app
open /Applications/TwentyEyes.app
echo "Installed /Applications/TwentyEyes.app. Look for the eye icon in your menu bar; enable 'Launch at login' from its menu."
