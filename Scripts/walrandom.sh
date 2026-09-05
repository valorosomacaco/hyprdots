#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="${1:-$HOME/Pictures/Wallpapers}"

mapfile -t images < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \
     -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' \) )

if [ ${#images[@]} -eq 0 ]; then
  echo "No images found in $WALLPAPER_DIR" >&2
  exit 1
fi

chosen="${images[RANDOM % ${#images[@]}]}"

awww img "$chosen" --transition-type="random" --transition-fps="60"
pkill -f /usr/lib/xdg-desktop-portal-gtk
matugen --prefer darkness --show-colors -t scheme-tonal-spot image "$chosen"
pkill swayosd-server
swayosd-server &
disown
pkill -f polkit-gnome-authe && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

