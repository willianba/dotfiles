#!/usr/bin/env fish

set WALLPAPER_CACHE "$HOME/.cache/noctalia/wallpapers.json"

set WALLPAPER (
    python3 -c '
import json
import os

path = os.path.expanduser("~/.cache/noctalia/wallpapers.json")

with open(path, "r", encoding="utf-8") as fh:
    data = json.load(fh)

wallpapers = data.get("wallpapers", {})
for monitor in ("DP-2", "HDMI-A-1"):
    dark = wallpapers.get(monitor, {}).get("dark")
    if dark:
        print(dark)
        break
' 2>/dev/null
)

if test -z "$WALLPAPER"
    printf "Failed to resolve wallpaper path from %s\n" "$WALLPAPER_CACHE" >&2
    exit 1
end

set HEX (
    matugen image "$WALLPAPER" --dry-run --show-source-colors 2>/dev/null \
        | string match -r '^#[0-9a-fA-F]{6}$' \
        | head -n 1 \
        | string replace -a '#' ''
)

if test -z "$HEX"
    printf "Failed to extract raw Matugen source color from %s\n" "$WALLPAPER" >&2
    exit 1
end

set CORRECTED_HEX (lua $HOME/.config/scripts/correction.lua "$HEX")

printf "Wallpaper : %s\n" "$WALLPAPER"
printf "Original  : #%s\n" "$HEX"
printf "Corrected : #%s\n" "$CORRECTED_HEX"

openrgb -d "B550M AORUS ELITE" -z 1 -sz 60 -m static -b 70 -c $CORRECTED_HEX &
openrgb -d "HyperX DuoCast" -m direct -c $CORRECTED_HEX &
wait
