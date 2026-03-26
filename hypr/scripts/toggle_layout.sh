#!/bin/bash

current=$(hyprctl -j getoption general:layout | jq -r ".str")

if [ "$current" = "scrolling" ]; then
    hyprctl keyword general:layout master
else
    hyprctl keyword general:layout scrolling
fi
