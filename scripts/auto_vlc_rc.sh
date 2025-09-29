#!/bin/bash
cd "/mnt/Bulk Drive/Github/vlc-rpc/"
npm run dev &
sleep 5
hyprctl dispatch closewindow title:"VLC Discord Rich Presence"
