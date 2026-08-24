#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $= <path_to_image>"
	exit 1
fi

IMAGE="$1"


awww img "$IMAGE" --transition-type="random" --transition-fps="60"

matugen --prefer darkness --show-colors -t scheme-tonal-spot image "$IMAGE"

pkill -f polkit-gnome-authe && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1; pkill swayosd-server && swayosd-server; pkill -x xdg-desktop-portal-hyprland && /usr/lib/xdg-desktop-portal-hyprland & disown && pkill -x xdg-desktop-portal-gtk && /usr/lib/xdg-desktop-portal-gtk & disown



