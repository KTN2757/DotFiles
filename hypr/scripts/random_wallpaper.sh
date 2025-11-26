#!/bin/bash
wallpaper=$(find ~/Pictures/Wallpapers/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
swww img --transition-type wipe $wallpaper
wal -i $wallpaper

pywalfox update
~/.config/hypr/scripts/notification.sh

kvantummanager --set pywal 2>/dev/null

/opt/oomox/plugins/theme_oomox/change_color.sh -o oomox-xresources-reverse /opt/oomox/scripted_colors/xresources/xresources-reverse 2>/dev/null
/opt/oomox/plugins/icons_archdroid/archdroid-icon-theme/change_color.sh -o oomox-xresources-reverse /opt/oomox/scripted_colors/xresources/xresources-reverse 2>/dev/null

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita" 2>/dev/null
gsettings set org.gnome.desktop.interface gtk-theme "oomox-xresources-reverse" 2>/dev/null

gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark" 2>/dev/null
gsettings set org.gnome.desktop.interface icon-theme "oomox-xresources-reverse" 2>/dev/null
eww reload

if tmux info &> /dev/null; then
    tmux source-file ~/.config/tmux/tmux.conf
    ~/.config/tmux/plugins/tmux-tokyo-night/src/theme.sh
fi
