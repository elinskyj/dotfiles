-- refer to Hyprland wiki for more info https://wiki.hyprland.org/Configuring/Variables/

hl.config({
  dwindle = {
    -- pseudotile = true,
    preserve_split = true,
    special_scale_factor = 0.8,
  },
  master = {
    --new_is_master = 1,
    new_on_top = 1,
    mfact = 0.5,
  },
  general = {
    --sensitivity = 1.00,
    -- apply_sens_to_raw = 1,
    resize_on_border = true,
    layout = "dwindle",
  },
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    repeat_rate = 50,
    repeat_delay = 300,
    numlock_by_default = true,
    left_handed = false,
    follow_mouse = true,
    float_switch_override_focus = false,
    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,
      clickfinger_behavior = false,
      middle_button_emulation = true,
      --["tap-to-click"] = true,
      drag_lock = false,
    },
  },
  -- Enable touchpad gestures
  hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
  }),
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    mouse_move_enables_dpms = true,
    --vrr = 0
    enable_swallow = true,
    --no_direct_scanout = true, --for fullscreen games
    focus_on_activate = false,
    swallow_regex = "^(kitty)$",
    --disable_autoreload = true
  },
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles = true,
    pass_mouse_when_bound = false,
  },
  --Could help when scaling and not pixelating
  xwayland = {
    force_zero_scaling = true,
  },
})
