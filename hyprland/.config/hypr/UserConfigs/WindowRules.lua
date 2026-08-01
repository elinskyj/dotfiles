-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

hl.window_rule({
  match = {
    class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)",
  },
  center = true,
  float = true,
})

hl.window_rule({
  match = {
    class = "([Tt]hunar)",
    title = "(File Operation Progress|Confirm to replace files)",
  },
  center = true,
  float = true,
})

hl.window_rule({
  match = {
    modal = true,
  },
  center = true,
  float = true,
  size = { "(window_x*0.60)", "(window_y*0.50)" },
})

hl.window_rule({
  match = {
    title = "^(Keybindings)$",
  },
  center = true,
})

hl.window_rule({
  match = {
    title = "^(Picture-in-Picture)$",
  },
  center = true,
  float = true,
  keep_aspect_ratio = true,
  workspace = "3",
  opacity = "0.95 0.75 1.0",
})

hl.window_rule({
  match = {
    class = "^(gthumb)$",
  },
  center = true,
  float = true,
  size = { "(window_x*0.75)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^(*)$",
  },
  idle_inhibit = "fullscreen",
})

hl.window_rule({
  match = {
    title = "^(*)$",
  },
  idle_inhibit = "fullscreen",
})

hl.window_rule({
  match = {
    class = "^([Tt]hunderbird)$",
  },
  workspace = "1",
})

hl.window_rule({
  match = {
    class = "^([Zz]en(.[Bb]rowser.*)?)$",
  },
  workspace = "2",
  opacity = "1.0 0.9 1.0",
})

hl.window_rule({
  match = {
    class = "^(([Dd]is|[Ww]eb)cord|[Vv]esktop)$",
  },
  workspace = "4",
  opacity = "0.94 0.86 1.0",
})

hl.window_rule({
  match = {
    class = "^([Ss]team)$",
  },
  workspace = "3 silent",
})

hl.window_rule({
  match = {
    class = "^(virt-manager(-wrapped)?)$",
  },
  workspace = "6 silent",
})

hl.window_rule({
  match = {
    class = "^([Aa]udacious)$",
  },
  workspace = "9 silent",
  opacity = "0.9 0.7 1.0",
})

hl.window_rule({
  match = {
    class = "^(org.kde.polkit-kde-authentication-agent-1)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "([Zz]oom|onedriver(-launcher)?)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk)",
  },
  float = true,
  opacity = "0.9 0.8 1.0",
  size = { "(window_x*0.70)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "(org.gnome.Calculator)",
    title = "(Calculator)",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "((VS)?[Cc]odium(-url-handler)?|code-oss|electron)",
    title = "(Add Folder to Workspace)",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^([Rr]ofi)$",
  },
  float = true,
  opacity = "0.9 0.6 1.0",
})

hl.window_rule({
  match = {
    class = "^(eog|org.gnome.Loupe)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(nwg-look|qt5ct|qt6ct)$",
  },
  float = true,
  opacity = "0.9 0.8 1.0",
  size = { "(window_x*0.60)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^(mpv|com.github.rafostar.Clapper)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(nm-applet|nm-connection-editor|blueman-manager)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$",
  },
  float = true,
  opacity = "0.82 0.75 1.0",
  size = { "(window_x*0.70)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^([Yy]ad)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(wihotspot(-gui)?)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(evince)$",
  },
  float = true,
  size = { "(window_x*0.70)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^(file-roller|org.gnome.FileRoller)$",
  },
  float = true,
  opacity = "0.9 0.8 1.0",
  size = { "(window_x*0.60)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^([Bb]aobab|org.gnome.[Bb]aobab)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    title = "(Kvantum Manager)",
  },
  float = true,
  opacity = "0.9 0.8 1.0",
  size = { "(window_x*0.60)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^([Ss]team)$",
    title = "^((?![Ss]team).*|[Ss]team [Ss]ettings)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    class = "^([Qq]alculate-gtk)$",
  },
  float = true,
})

hl.window_rule({
  match = {
    title = "^(hyprgui)$",
  },
  float = true,
  size = { "(window_x*0.60)", "(window_y*0.70)" },
})

hl.window_rule({
  match = {
    class = "^([Tt]hunar|org.gnome.Nautilus)$",
  },
  opacity = "0.9 0.8 1.0",
})

hl.window_rule({
  match = {
    class = "^(pcmanfm-qt)$",
  },
  opacity = "0.8 0.6 1.0",
})

hl.window_rule({
  match = {
    class = "^(Alacritty|kitty|kitty-dropterm)$",
  },
  opacity = "0.8 0.7 1.0",
})

hl.window_rule({
  match = {
    class = "^(VSCodium|codium-url-handler|code-oss)$",
  },
  opacity = "0.9 0.8 1.0",
})

hl.window_rule({
  match = {
    class = "^(gnome-disks|evince|wihotspot(-gui)?|org.gnome.baobab)$",
  },
  opacity = "0.94 0.86 1.0",
})

hl.window_rule({
  match = {
    class = "^(app.drey.Warp)$",
  },
  opacity = "0.8 0.7 1.0",
})

hl.window_rule({
  match = {
    class = "^(seahorse)$",
  },
  opacity = "0.9 0.8 1.0",
})
