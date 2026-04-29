#!/bin/bash
CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu \
    -p "Close window?" \
    -no-custom \
    -lines 2 \
    -theme-str 'inputbar { children: [prompt]; }')
[ "$CHOICE" = "Yes" ] && hyprctl dispatch killactive
