#!/usr/bin/env bash

# Check how many tiled windows exist
count=$(hyprctl clients -j | jq '[.[] | select(.floating == false)] | length')

# If there’s already a tiled window, float the new one
if [ "$count" -ge 1 ]; then
    hyprctl dispatch togglefloating
fi
