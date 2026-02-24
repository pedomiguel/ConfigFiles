#!/usr/bin/env bash

UPDATES=$(dnf check-update -q 2>/dev/null | grep -E '^[a-zA-Z0-9]' | wc -l)

if [ "$UPDATES" -eq 0 ]; then
    echo '{"text":"󰇚 0","class":"up-to-date"}'
else
    echo "{\"text\":\"󰇚 $UPDATES\",\"class\":\"updates-available\"}"
fi
