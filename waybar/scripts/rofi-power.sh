#!/bin/bash

# Simple working power menu
# Save as ~/.config/rofi/scripts/simple-powermenu.sh

# Get uptime
uptime_info=$(uptime -p | sed 's/up //')

# Simple options without icons first
options="Lock
Sleep
Logout
Restart
Shutdown"

# Show rofi menu with minimal styling
chosen=$(echo "$options" | rofi -dmenu -i -p "Goodbye $(whoami)" -mesg "Uptime: $uptime_info")

echo "You selected: $chosen"

# Execute chosen option
case $chosen in
    "Lock")
        hyprlock
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    "Restart")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
