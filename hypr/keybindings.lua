---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

hl.bind("ALT + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd("hyprctl kill"))

-- Notification daemon
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/notification.sh"))
hl.bind("ALT + SHIFT + X", hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind("ALT + SHIFT + C", hl.dsp.exec_cmd("dunstctl context"))
hl.bind("ALT + SHIFT + H", hl.dsp.exec_cmd("dunstctl history-pop"))

-- Headphones
hl.bind("ALT + SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/headphones.sh"))

-- Waybar
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/scripts/lauch.sh"))

-- hypridle
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("~/.config/hypr/scripts/hypridle.sh"))

-- Night Light
hl.bind("ALT + SHIFT + N", hl.dsp.exec_cmd("~/.config/hypr/scripts/night-light-toggle.sh"))

-- Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/random_wallpaper.sh"))

-- PJ (DISABLE the exec notification.sh line for this to work)
-- typing "shift+p+n+ctrl+win+/" will send a notification
hl.bind("CTRL + " .. mainMod .. " + SHIFT + P + N + code:61", hl.dsp.exec_cmd("~/.config/hypr/scripts/pj.sh"))

-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/geometrical-screenshot.sh"))
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/full-screenshot.sh"))

-- Tmux Resurrect
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/tmux_templater.sh"))

-- Screenkey
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("screenkey --no-detach --opacity 0.8 --font-size large"))

-- Emoji Keyboard
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("rofi -show emoji"))

-- eww powermenu
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("eww close powermenu"))

-- Calculator
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("rofi -show calc -no-show-match -no-sort"))

-- Clipboard history
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Hyprpicker
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprpicker"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Volume
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })

-- Cycle through windows
hl.bind("ALT + Tab", hl.dsp.layout("cyclenext"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.layout("cycleprev"))

-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move active window within a workspace
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

-- Resize active window
hl.bind(mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -40 }))
hl.bind(mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 40 }))
hl.bind(mainMod .. " + left", hl.dsp.window.resize({ x = -40, y = 0 }))
hl.bind(mainMod .. " + right", hl.dsp.window.resize({ x = 40, y = 0 }))

-- Layouts
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Switch workspaces / Move active window to a workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through active workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Zoom
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })
