-- Initial boot script enable to apply initial wallpapers, theming, new settings etc.
-- suggest not to change this or delete this including deleting referrence file in ~/.config/hypr/.initial_startup_done
-- as long as the referrence file is present, this initial-boot.sh will not execute
hl.on("hyprland.start", function()
  hl.exec_cmd("$HOME/.config/hypr/initial-boot.sh")
end)

require("configs.Keybinds")

require("UserConfigs.Startup_Apps")

require("UserConfigs.ENVariables")

require("UserConfigs.Monitors")

require("UserConfigs.Laptops")

require("UserConfigs.WindowRules")

require("UserConfigs.UserDecorations")

require("UserConfigs.UserAnimations")

require("UserConfigs.UserKeybinds")

require("UserConfigs.UserSettings")

require("UserConfigs.WorkspaceRules")
