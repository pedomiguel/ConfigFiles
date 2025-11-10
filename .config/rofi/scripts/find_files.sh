#!/bin/bash

# Directory to search in (e.g., your home directory)
SEARCH_DIR="$HOME"

# Use 'find' to get a list of all files and directories, then pipe it to Rofi.
# The selected file/directory path is stored in the 'chosen' variable.
chosen=$(find "$SEARCH_DIR" -name '.*' -prune -o -type f -print | rofi -dmenu -i -p "Search Files")

# If the user selected a file (the 'chosen' variable is not empty),
# then open it with xdg-open (which uses the default application).
if [ -n "$chosen" ]; then
    xdg-open "$chosen"
fi
