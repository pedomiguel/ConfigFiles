#!/bin/bash

# Directory to search in (e.g., your home directory)
SEARCH_DIR="$HOME"

chosen=$(fd --type f --hidden --exclude .git . "$SEARCH_DIR" | \
    rofi -dmenu \
         -i \
         -p "󰈞 Search" \
         -sorting-method fzf \
         -theme-str 'window {width: 60%;} listview {lines: 15;}')

# If the user selected a file (the 'chosen' variable is not empty),
# then open it with xdg-open (which uses the default application).
if [ -n "$chosen" ]; then
    xdg-open "$chosen"
fi
