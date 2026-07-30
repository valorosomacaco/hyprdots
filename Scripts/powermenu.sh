#!/usr/bin/env bash

set -euo pipefail

ROFI_THEME="${ROFI_THEME:-$HOME/.config/rofi/powermenu.rasi}"
TITLE="${TITLE:-Power Menu}"

for cmd in rofi systemctl hyprlock hyprctl loginctl; do
  command -v "$cmd" >/dev/null 2>&1 || {
    notify-send "$TITLE" "Missing command: $cmd"
    exit 1
  }
done

options=(
  "  Lock"
  "  Suspend"
  "󰍃  Logout"
  "  Reboot"
  "  Shutdown"
)

chosen=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p "$TITLE" -theme "$ROFI_THEME")
[[ -z "$chosen" ]] && exit 0

case "$chosen" in
  "  Lock")
    sleep 0.3 && hyprlock
    ;;
  "  Suspend")
    sleep 0.3 && sh -c 'hyprlock & sleep 0.5 && systemctl suspend'
    ;;
  "󰍃  Logout")
	  hyprctl dispatch 'hl.dsp.exit()'
    ;;
  "  Reboot")
    systemctl reboot
    ;;
  "  Shutdown")
    systemctl poweroff
    ;;
  *)
    exit 1
    ;;
esac
