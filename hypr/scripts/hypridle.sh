#!/bin/bash
if pgrep -x "hypridle" > /dev/null; then
    killall -9 hypridle
    notify-send -i /usr/share/icons/hyprland.png "Hypridle" "Turned off"
else
    hypridle &
    notify-send -i /usr/share/icons/hyprland.png "Hypridle" "Turned on"
fi
