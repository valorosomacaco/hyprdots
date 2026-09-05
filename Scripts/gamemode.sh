#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = true ] ; then
    hyprctl eval 'hl.config({
        animations = { enabled = false },
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            rounding = 0
        },
        general = { gaps_in = 0, gaps_out = 0 }
    })'
    killall -SIGUSR1 waybar
else
    killall -SIGUSR2 waybar
    hyprctl reload
fi   
