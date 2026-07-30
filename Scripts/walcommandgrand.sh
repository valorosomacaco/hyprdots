#!/bin/bash
if pgrep -x "rofi" > /dev/null; then
	pkill rofi
else
	~/Scripts/walcommand.sh
fi
