#!/bin/bash

# Check if VPN is running
if ! sudo ip netns exec discord-vpn ip a show tun0 &>/dev/null 2>&1; then
    sudo /usr/local/bin/discord-vpn-start
    sleep 3
fi

# Get user ID for runtime dir
USER_ID=$(id -u)

# Launch Discord with audio/video access
nohup sudo ip netns exec discord-vpn sudo -u $USER \
    DISPLAY=$DISPLAY \
    XAUTHORITY=$XAUTHORITY \
    XDG_RUNTIME_DIR=/run/user/$USER_ID \
    PULSE_SERVER=unix:/run/user/$USER_ID/pulse/native \
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_ID/bus \
    discord > /dev/null 2>&1 &

# Exit immediately
exit 0
