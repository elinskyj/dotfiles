#!/usr/bin/env bash
#https://github.com/hyprwm/Hyprland/issues/3835

timeout=0
handle() {
  case $1 in
  windowtitle*)
    # Extract the window ID from the line
    window_id=${1#*>>}

    # Fetch the list of windows and parse it using jq to find the window by its decimal ID
    window_info=$(hyprctl clients -j | jq --arg id "0x$window_id" '.[] | select(.address == ($id))')

    # Extract the title from the window info
    window_title=$(echo "$window_info" | jq -r '.title')

    # Check if the title matches the characteristics of the Bitwarden popup window
    if [[ "$window_title" == *"Bitwarden"* ]]; then

      # in case of double rename only allow once per second
      if ((SECONDS < timeout)); then
        return
      fi
      timeout=$((SECONDS + 1))

      hyprctl --batch "dispatch togglefloating address:0x$window_id ; dispatch resizewindowpixel exact 20% 40%,address:0x$window_id ; dispatch centerwindow"
    fi
    ;;
  esac
}

# Listen to the Hyprland socket for events and process each line with the handle function
socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
