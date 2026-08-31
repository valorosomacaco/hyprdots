#!/bin/bash


IMAGE="$1"


awww img "$IMAGE" --transition-type="random" --transition-fps="60"
pkill -f /usr/lib/xdg-desktop-portal-gtk
matugen --prefer darkness --show-colors -t scheme-tonal-spot image "$IMAGE"
pkill swayosd-server 
swayosd-server &
disown
pkill -f polkit-gnome-authe && /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

