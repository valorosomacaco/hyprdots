#!/bin/bash
if pgrep -x "hyprpicker" > /dev/null;then
	pkill hyprpicker
else
	hyprpicker --autocopy
fi

