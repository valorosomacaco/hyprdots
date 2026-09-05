#!/bin/bash
if pgrep -x "rofi" > /dev/null;then
	pkill rofi
else
	cliphist list | rofi -theme .config/rofi/history.rasi -dmenu -p "" -display-columns 2 | cliphist decode | wl-copy
fi	
