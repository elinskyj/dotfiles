#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  #
# Wallpaper Effects using ImageMagick (SUPER SHIFT W)

# Variables
current_wallpaper="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
wallpaper_output="$HOME/.config/hypr/wallpaper_effects/.wallpaper_modified"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

# Directory for swaync
iDIR="$HOME/.config/swaync/images"
iDIRi="$HOME/.config/swaync/icons"

# swww transition config
FPS=30
TYPE="wipe"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# Define ImageMagick effects
declare -A effects=(
    ["No Effects"]="no-effects"
    ["Black & White"]="convert $current_wallpaper -colorspace gray -sigmoidal-contrast 10,40% $wallpaper_output"
    ["Blurred"]="convert $current_wallpaper -blur 0x10 $wallpaper_output"
    ["Charcoal"]="convert $current_wallpaper -charcoal 0x5 $wallpaper_output"
    ["Edge Detect"]="convert $current_wallpaper -edge 1 $wallpaper_output"
    ["Emboss"]="convert $current_wallpaper -emboss 0x5 $wallpaper_output"
    ["Frame Raised"]="convert $current_wallpaper +raise 150 $wallpaper_output"
    ["Frame Sunk"]="convert $current_wallpaper -raise 150 $wallpaper_output"
    ["Negate"]="convert $current_wallpaper -negate $wallpaper_output"
    ["Oil Paint"]="convert $current_wallpaper -paint 4 $wallpaper_output"
    ["Posterize"]="convert $current_wallpaper -posterize 4 $wallpaper_output"
    ["Polaroid"]="convert $current_wallpaper -polaroid 0 $wallpaper_output"
    ["Sepia Tone"]="convert $current_wallpaper -sepia-tone 65% $wallpaper_output"
    ["Solarize"]="convert $current_wallpaper -solarize 80% $wallpaper_output"
    ["Sharpen"]="convert $current_wallpaper -sharpen 0x5 $wallpaper_output"
    ["Vignette"]="convert $current_wallpaper -vignette 0x3 $wallpaper_output"
    ["Vignette-black"]="convert $current_wallpaper -background black -vignette 0x3 $wallpaper_output"
    ["Zoomed"]="convert $current_wallpaper -gravity Center -extent 1:1 $wallpaper_output"
)

# Function to apply no effects
no-effects() {
    swww img -o "$focused_monitor" "$current_wallpaper" $SWWW_PARAMS &&
    # Wait for swww command to complete
    wait $!
    # Run other commands after swww
    wallust run "$current_wallpaper" -s &&
    wait $!
    # Refresh rofi, waybar, wallust palettes
	sleep 2
	"$SCRIPTSDIR/Refresh.sh"

    notify-send -u low -i "$iDIR/ja.png" "No wallpaper" "effects applied"
    # copying wallpaper for rofi menu
    cp "$current_wallpaper" "$wallpaper_output"
}

# Function to run rofi menu
main() {
    # Populate rofi menu options
    options=("No Effects")
    for effect in "${!effects[@]}"; do
        [[ "$effect" != "No Effects" ]] && options+=("$effect")
    done

    choice=$(printf "%s\n" "${options[@]}" | LC_COLLATE=C sort | rofi -dmenu -i -config ~/.config/rofi/config-wallpaper-effect.rasi)

    # Process user choice
    if [[ -n "$choice" ]]; then
        if [[ "$choice" == "No Effects" ]]; then
            no-effects
        elif [[ "${effects[$choice]+exists}" ]]; then
            # Apply selected effect
            notify-send -u normal -i "$iDIR/ja.png"  "Applying:" "$choice effects"
            eval "${effects[$choice]}"
            # Wait for effects to be applied
            sleep 1
            # Execute swww command after image conversion
            swww img -o "$focused_monitor" "$wallpaper_output" $SWWW_PARAMS &
            # Wait for swww command to complete
            sleep 2
            # Wait for other commands to finish
            wallust run "$wallpaper_output" -s &
            # Wait for other commands to finish
            sleep 0.5
            # Refresh rofi, waybar, wallust palettes
            "${SCRIPTSDIR}/Refresh.sh"
            notify-send -u low -i "$iDIR/ja.png" "$choice" "effects applied"
        else
            echo "Effect '$choice' not recognized."
        fi
    fi
}

# Check if rofi is already running and kill it
if pidof rofi > /dev/null; then
    pkill rofi
fi

main

sleep 5 # add delay of 5 secords for those who have slow machines
# supports sddm sequoia_2 theme only
sddm_sequoia="/usr/share/sddm/themes/sequoia_2"
if [ -d "$sddm_sequoia" ]; then
    notify-send -i "$iDIRi/picture.png" "Set wallpaper" "as SDDM background?" \
        -t 10000 \
        -A "yes=Yes" \
        -A "no=No" \
        -h string:x-canonical-private-synchronous:wallpaper-notify

    dbus-monitor "interface='org.freedesktop.Notifications',member='ActionInvoked'" |
    while read -r line; do
        if echo "$line" | grep -q "yes"; then
            # User chose "Yes", copy the wallpaper with correct syntax
            pkexec /usr/bin/cp -r "$HOME/.config/hypr/wallpaper_effects/.wallpaper_modified" "$sddm_sequoia/backgrounds/default"
            notify-send -i "$iDIRi/picture.png" "SDDM" "Background SET"
            break
        elif echo "$line" | grep -q "no"; then
            break
        fi
    done &
fi
