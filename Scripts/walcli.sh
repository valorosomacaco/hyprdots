#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $= <path_to_image>"
	exit 1
fi

IMAGE="$1"


awww img "$IMAGE" --transition-type="random" --transition-fps="60"

matugen --prefer darkness --show-colors -t scheme-tonal-spot image "$IMAGE"

pkill -f polkit-gnome-authe && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1; pkill swayosd-server && swayosd-server; systemctl --user stop xdg-desktop-portal-gtk && systemctl --user start xdg-desktop-portal-gtk

getAdwaitaScheme="$(gsettings get org.gnome.desktop.interface color-scheme)"
if [ "$getAdwaitaScheme" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme prefer-light && gsettings set org.gnome.desktop.interface color-scheme prefer-dark;
else
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark && gsettings set org.gnome.desktop.interface color-scheme prefer-light;
fi

