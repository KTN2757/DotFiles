#!/bin/bash
wallpaper=$(find ~/Pictures/Wallpapers/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
swww img --transition-type wipe $wallpaper
wal -i $wallpaper
pywalfox update
