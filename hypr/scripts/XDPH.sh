#!/usr/bin/env bash

killall -q xdg-desktop-portal-hyprland
killall -q xdg-desktop-portal-wlr  
killall -q xdg-desktop-portal-gtk
killall -q xdg-desktop-portal
sleep 1

/usr/lib/xdg-desktop-portal-hyprland &
sleep 2

/usr/lib/xdg-desktop-portal &
sleep 1
