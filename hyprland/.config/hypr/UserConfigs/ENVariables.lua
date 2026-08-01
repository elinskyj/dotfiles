-- See https://wiki.hyprland.org/Configuring/Environment-variables/

-- environment-variables
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_BACKEND", "wayland", "x11")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- xwayland apps scale fix (useful if you are use monitor scaling)
-- see https://wiki.hyprland.org/Configuring/XWayland/
-- toolkit-specific scale
hl.env("GDK_SCALE", "1")

-- firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- electron >28 apps (may help)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA
-- This is from Hyprland Wiki. Below will be activated nvidia gpu detected
-- See hyprland wiki https://wiki.hyprland.org/Nvidia/#environment-variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- to use nvidia as primary renderer (need hyprland >0.45)
--hl.env("AQ_DRM_DEVICES", "/dev/dri/card1 (nvidia)")
--hl.env("AQ_DRM_DEVICES", "/dev/dri/card0")

-- additional ENV's for nvidia. Caution, activate with care
--hl.env("GBM_BACKEND", "nvidia-drm")
--hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
--hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
--hl.env("WLR_DRM_NO_ATOMIC", "1")
