#!/bin/bash
grim "$HOME/Pictures/Screenshots/"$(date +%Y%m%d-%H%M%S)"".png
wl-copy < $(stat --format='%Y %n' $HOME/Pictures/Screenshots/* | sort -nr | head -n 1 | cut -d ' ' -f 2-)
