--Commands & Apps to be executed at launch

local scriptsDir = "$HOME/.config/hypr/scripts"
local UserScripts = "$HOME/.config/hypr/UserScripts"

local wallDIR = "$HOME/Pictures/wallpapers"
local awwwRandom = UserScripts .. "/WallpaperAutoChange.sh"

hl.on("hyprland.start", function()
  -- wallpaper stuff / More wallpaper options below
  hl.exec_cmd("awww-daemon --format xrgb")
  hl.exec_cmd(awwwRandom .. " " .. wallDIR)

  -- startup
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Polkit (Polkit Gnome / KDE)
  hl.exec_cmd(scriptsDir .. "/Polkit.sh")

  -- startup apps
  hl.exec_cmd("waybar &")
  hl.exec_cmd("nm-applet --indicator &")
  hl.exec_cmd("swaync &")
  hl.exec_cmd("ags &")
  hl.exec_cmd("blueman-applet &")
  hl.exec_cmd("/usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &")
  hl.exec_cmd("kdeconnect-indicator &")
  hl.exec_cmd("/opt/kanata &")

  --clipboard manager
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Starting hypridle to start hyprlock
  hl.exec_cmd("hypridle &")
end)
