#!/usr/bin/env bash

UPDATES=$(dnf check-update -q 2>/dev/null | grep -E '^[a-zA-Z0-9]' | wc -l)

if [ "$UPDATES" -gt 0 ]; then
  printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates"}' "$UPDATES" "$UPDATES" "$UPDATES"
else
  printf '{"text": "0", "alt": "0", "tooltip": "0 Updates"}'
fi
