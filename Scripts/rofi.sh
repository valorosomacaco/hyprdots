if pgrep -x "rofi" > /dev/null;then
	pkill rofi
else
	rofi -show drun -theme ~/.config/rofi/config.rasi
fi

