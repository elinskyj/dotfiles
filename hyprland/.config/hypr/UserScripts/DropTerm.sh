#!/bin/env bash

TERM_TITLE="drop-term"
TERM="kitty"

# Define dropdown terminal size and position in percent of screen size
DROP_W=80
DROP_H=50
DROP_X=$(((100 - DROP_W) / 2))
DROP_Y=4

# Get the window ID of the dropdown terminal (if it exists)
EXISTING_WINDOW_ID=$(hyprctl clients -j | jq -r ".[] | select(.initialTitle == \"$TERM_TITLE\") | .address")
# Get the active window ID
ACTIVE_WINDOW_ID=$(hyprctl activewindow -j | jq -r '.address')

if [[ "$ACTIVE_WINDOW_ID" == "$EXISTING_WINDOW_ID" ]]; then
  # If it's the active window, send it to the special workspace
  hyprctl dispatch movetoworkspacesilent "special,address:$EXISTING_WINDOW_ID"
elif [[ -n "$EXISTING_WINDOW_ID" ]]; then
  # Restore it to the current workspace
  hyprctl dispatch movetoworkspace "+0,address:$EXISTING_WINDOW_ID"
else
  # If it's not running, launch a new instance
  hyprctl dispatch exec "[float; move $DROP_X% $DROP_Y%; size $DROP_W% $DROP_H%] $TERM --title $TERM_TITLE"
fi
