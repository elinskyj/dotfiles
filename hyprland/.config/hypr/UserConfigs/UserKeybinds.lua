-- See https://wiki.hyprland.org/Configuring/Keywords/ for more settings and variables
-- See also Laptops.conf for laptops keybinds

local mainMod = "SUPER"
local files = "thunar"
local term = "kitty"
local browser = "/opt/zen"
local notes = "obsidian"
local UserScripts = "$HOME/.config/hypr/UserScripts"

-- rofi App launcher
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun, filebrowser, run, window"))

hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- ags overview
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("pkill rofi || true && ags -t 'overview'"))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(UserScripts .. "/DropTerm.sh"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(UserScripts .. "/RofiCalc.sh"))
