#!/bin/bash
COVER="/tmp/album_cover.png"
 
if [ ! -f "$COVER" ]; then
  ffmpeg -loglevel 0 -f lavfi -i color=c=black:s=400x400:d=1 -frames:v 1 "$COVER" 2>/dev/null
fi
 
display_cover() {
  printf '\e[2J\e[H'
  printf '\n'
  kitty +icat --align=center "$COVER" 2>/dev/null
}
 
display_cover &
wait
 
while inotifywait -q -q -e close_write "$COVER" 2>/dev/null; do
  display_cover &
  wait
done
 
