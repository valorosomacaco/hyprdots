#!/bin/bash

WALL_DIR="/home/ale/Pictures/Wallpapers"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

IFS=$'\n'

SELECTED_WALL=$(for a in *.jpg *jpeg *.png *gif; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "" -theme ~/.config/rofi/sfondi.rasi)

if [ -n "$SELECTED_WALL" ]; then 
	/home/ale/Scripts/walcli.sh "$SELECTED_WALL"
fi

cd "$CWD" || exit
