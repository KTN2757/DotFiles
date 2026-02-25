#!/bin/bash
MAC="42:40:05:CC:D0:90"
DEVICE_PATH="/org/bluez/hci0/dev_42_40_05_CC_D0_90"

bluetoothctl power on >/dev/null 2>&1
sleep 1

CONNECTED=$(busctl get-property org.bluez "$DEVICE_PATH" org.bluez.Device1 Connected 2>/dev/null | awk '{print $2}')

if [ "$CONNECTED" = "true" ]; then
    bluetoothctl disconnect "$MAC" >/dev/null 2>&1
else
    bluetoothctl connect "$MAC" >/dev/null 2>&1
    sleep 1
    pactl set-sink-volume @DEFAULT_SINK@ 12% >/dev/null 2>&1
fi
