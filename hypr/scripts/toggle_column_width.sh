#!/bin/env sh

STATE_FILE=/tmp/hyprscroll_width

if [ -f "$STATE_FILE" ]; then
    hyprctl keyword plugin:hyprscrolling:column_width 0.9
    rm "$STATE_FILE"
else
    hyprctl keyword plugin:hyprscrolling:column_width 0.5
    touch "$STATE_FILE"
fi
