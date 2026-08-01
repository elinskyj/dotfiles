#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

wallDIR="$HOME/Pictures/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')

PICS=($(find "${wallDIR}" -ipath "*/archive" -prune -o -type f -regextype posix-extended -regex ".*\.jpe?g|.*\.pn(g|m)|.*\.tga|.*\.(g|t)iff?|.*\.webp|.*\.bmp|.*\.farbfeld" -print0))
RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

# Transition config
FPS=30
TYPE="random"
DURATION=1
BEZIER=".43,1.19,1,.4"
AWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

awww query || awww-daemon --format xrgb && awww img -o $focused_monitor ${RANDOMPICS} $AWWW_PARAMS

wait $!
sleep 2
"$SCRIPTSDIR/Refresh.sh"

sleep 0.5
"$SCRIPTSDIR/WallpaperLock.sh"
