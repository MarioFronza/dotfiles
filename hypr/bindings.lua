-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- -----------------------------------------------------
-- Window Management (Vim Style)
-- -----------------------------------------------------

-- Free up h/j/k/l by relocating the quattro defaults that sit on them.
hl.unbind("SUPER + K") -- was: Keybindings
hl.unbind("SUPER + J") -- was: Toggle window split
hl.unbind("SUPER + L") -- was: Toggle workspace layout
hl.unbind("SUPER + CTRL + H") -- was: Hardware menu
hl.unbind("SUPER + CTRL + K") -- was: Herdr keybindings
hl.unbind("SUPER + CTRL + L") -- was: Lock system

o.bind("SUPER + ALT + J", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + D", "Toggle window split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + ALT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + ALT + H", "Hardware menu", "omarchy-menu toggle hardware")
o.bind("SUPER + SHIFT + ALT + K", "Herdr keybindings", "omarchy-menu-herdr-keybindings")
o.bind("SUPER + SHIFT + ALT + L", "Lock system", "omarchy-system-lock")

-- Close window (i3-style), freeing SUPER+W.
hl.unbind("SUPER + W") -- was: Close window
o.bind("SUPER + SHIFT + Q", "Close window", hl.dsp.window.close())

-- Move focus (h/j/k/l).
o.bind("SUPER + h", "Focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + l", "Focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + k", "Focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + j", "Focus down", hl.dsp.focus({ direction = "d" }))

-- Move active window (shift + h/j/k/l).
o.bind("SUPER + SHIFT + h", "Move window left", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + SHIFT + l", "Move window right", hl.dsp.window.move({ direction = "r" }))
o.bind("SUPER + SHIFT + k", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + SHIFT + j", "Move window down", hl.dsp.window.move({ direction = "d" }))

-- Resize active window (ctrl + h/j/k/l, hold to repeat).
o.bind("SUPER + CTRL + l", "Expand window right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + h", "Shrink window right", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + k", "Shrink window down", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
o.bind("SUPER + CTRL + j", "Expand window down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
