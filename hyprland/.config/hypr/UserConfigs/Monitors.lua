-- https://wiki.hyprland.org/Configuring/Monitors/
-- Configure your Display resolution, offset, scale and Monitors here, use `hyprctl monitors` to get the info.

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "1",
})

-- High Refresh Rate
hl.monitor({
  output = "",
  mode = "highrr",
  position = "auto",
  scale = "1",
})

-- High Resolution
hl.monitor({
  output = "",
  mode = "highres",
  position = "auto",
  scale = "1",
})
