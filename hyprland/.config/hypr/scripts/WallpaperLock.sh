#!/bin/bash
# apply the previously selected wallpaper effect to the current wallpaper

wallpaper_effect="$HOME/.config/hypr/wallpaper_effects/.wallpaper_effect"
eval "$(cat "$wallpaper_effect")"
