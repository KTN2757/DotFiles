#!/bin/bash

# Check if VPN is running
if ! sudo ip netns exec discord-vpn ip a show tun0 &>/dev/null 2>&1; then
    sudo /usr/local/bin/discord-vpn-start
    sleep 3
fi

# Launch Discord in the VPN namespace and detach
nohup sudo ip netns exec discord-vpn sudo -u $USER DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY discord > /dev/null 2>&1 &

# Exit immediately
exit 0
