#!/bin/bash
while true; do
    wallpaper=$(find ~/Pictures/Wallpapers/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
    swww img --transition-type wipe $wallpaper
    wal -i $wallpaper > /dev/null
    pywalfox update
    sleep 300
done
