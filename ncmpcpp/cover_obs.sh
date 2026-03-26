#!/bin/bash
COVER="/tmp/album_cover.png"
EMB_COVER="/tmp/embedded_cover.png"
COVER_SIZE="400"

file="$(mpc --format %file% current)"

MPD_MUSIC_DIR="/mnt/Bulk Drive/Music"
full_file="$MPD_MUSIC_DIR/$file"
album="${full_file%/*}"

ffmpeg -loglevel 16 -y -i "$full_file" -an -vcodec copy "$EMB_COVER" 2>/dev/null

if [ -f "$EMB_COVER" ] && [ -s "$EMB_COVER" ]; then
    art="$EMB_COVER"
else
    art=$(find "$album" -maxdepth 1 -type f | grep -iE ".*\.(jpg|jpeg|png|gif|bmp)$" | head -1)
    
    if [ -z "$art" ]; then
        art="$HOME/.config/ncmpcpp/default_cover.png"
    fi
fi

ffmpeg -loglevel 0 -y -i "$art" -vf "scale=$COVER_SIZE:-1" "$COVER"
