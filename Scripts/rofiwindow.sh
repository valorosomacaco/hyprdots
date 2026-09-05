#!/bin/bash
if pgrep -x "rofi" > /dev/null;then
	pkill rofi
else
	rofi -show window -theme ~/.config/rofi/window.rasi
fi	

