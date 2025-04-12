#!/bin/bash
bluetoothctl scan on
sleep 10
bluetoothctl connect 42:40:05:CC:D0:90
sleep 3
pactl set-sink-volume @DEFAULT_SINK@ .125
