-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Tag every window for a default opacity; override per app below if needed.
hl.window_rule({ match = { class = ".*" }, tag = "+default-opacity" })
hl.window_rule({ match = { tag = "default-opacity" }, opacity = "0.985 0.96" })

-- Fix some dragging issues with unnamed XWayland surfaces.
hl.window_rule({
  match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
  no_focus = true,
})
