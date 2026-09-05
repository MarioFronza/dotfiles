-- Keybindings. See https://wiki.hypr.land/Configuring/Binds/
-- List everything currently bound: hyprctl binds

-- Apps ---------------------------------------------------------------------
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"), { description = "Terminal" })
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd("alacritty -e tmux new-session -A -s terminal"), { description = "Terminal (tmux)" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("xdg-open about:blank"), { description = "Browser" })
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("alacritty -e nvim"), { description = "Editor" })
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd("nautilus"), { description = "File manager" })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("wofi --show drun"), { description = "App launcher" })

-- Window management ----------------------------------------------------------
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind("SUPER + D", hl.dsp.layout("togglesplit"), { description = "Toggle window split" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Fullscreen" })
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })

-- Focus (vim-style)
hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }), { description = "Focus left" })
hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }), { description = "Focus right" })
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }), { description = "Focus up" })
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }), { description = "Focus down" })

-- Move window (vim-style)
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "l" }), { description = "Move window left" })
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "r" }), { description = "Move window right" })
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "u" }), { description = "Move window up" })
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "d" }), { description = "Move window down" })

-- Resize window (vim-style, hold to repeat)
hl.bind("SUPER + CTRL + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { description = "Expand window right", repeating = true })
hl.bind("SUPER + CTRL + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { description = "Shrink window right", repeating = true })
hl.bind("SUPER + CTRL + k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { description = "Shrink window down", repeating = true })
hl.bind("SUPER + CTRL + j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { description = "Expand window down", repeating = true })

-- Workspaces
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), { description = "Switch to workspace " .. workspace })
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), { description = "Move window to workspace " .. workspace })
end

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move window to scratchpad" })

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind("SUPER + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "Former workspace" })

hl.bind("SUPER + SHIFT + ALT + LEFT", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind("SUPER + SHIFT + ALT + RIGHT", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })

hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { description = "Cycle windows" })
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ next = false }), { description = "Cycle windows backward" })

hl.bind("CTRL + ALT + TAB", hl.dsp.focus({ monitor = "+1" }), { description = "Next monitor" })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { description = "Move window", mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { description = "Resize window", mouse = true })

hl.bind("SUPER + G", hl.dsp.group.toggle(), { description = "Toggle window grouping" })
hl.bind("SUPER + CTRL + LEFT", hl.dsp.group.prev(), { description = "Group focus left" })
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.group.next(), { description = "Group focus right" })

-- Clipboard ------------------------------------------------------------------
-- Universal copy/paste/cut: sends the terminal chord in terminal apps, the
-- normal chord everywhere else.
local TERMINAL_CLASSES = { Alacritty = true, kitty = true, foot = true, ["com.mitchellh.ghostty"] = true }

local function send_key_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

local function active_window_is_terminal()
  local window = hl.get_active_window()
  return window ~= nil and TERMINAL_CLASSES[window.class] == true
end

local function universal_clipboard(default_mods, default_key, terminal_mods, terminal_key)
  return function()
    if active_window_is_terminal() then
      send_key_once(terminal_mods, terminal_key)()
    else
      send_key_once(default_mods, default_key)()
    end
  end
end

hl.bind("SUPER + C", universal_clipboard("CTRL", "C", "CTRL", "Insert"), { description = "Universal copy" })
hl.bind("SUPER + V", universal_clipboard("CTRL", "V", "SHIFT", "Insert"), { description = "Universal paste" })
hl.bind("SUPER + X", send_key_once("CTRL", "X"), { description = "Universal cut" })
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"), { description = "Clipboard history" })

-- Media ------------------------------------------------------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { description = "Volume up", locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { description = "Volume down", locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { description = "Mute", locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { description = "Mute microphone", locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { description = "Brightness up", locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { description = "Brightness down", locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/pause", locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/pause", locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Next track", locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track", locked = true })

-- Utilities ------------------------------------------------------------------
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"), { description = "Screenshot" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"), { description = "Screenshot region" })
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })
hl.bind("SUPER + SHIFT + ALT + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock system" })
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd("wlogout"), { description = "Power menu" })

local function toggle_process(name)
  return hl.dsp.exec_cmd("pkill -x " .. name .. " || " .. name)
end

hl.bind("SUPER + CTRL + I", toggle_process("hypridle"), { description = "Toggle idle lock" })
hl.bind("SUPER + CTRL + N", toggle_process("hyprsunset"), { description = "Toggle night light" })
