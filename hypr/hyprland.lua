-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland; xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GTK_THEME", "oomox-xresources-reverse")
hl.env("XCURSOR_SIZE", "20")    -- 24
hl.env("XCURSOR_THEME", "FossaCursors")
hl.env("HYPRCURSOR_SIZE", "20") -- 24
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

------------------
---- SOURCING ----
------------------
dofile(os.getenv("HOME") .. "/.cache/wal/colors-hyprland.lua")
require("keybindings")
require("animations")

------------------
---- MONITORS ----
------------------
hl.monitor({
    output   = "",
    mode     = "1920x1080@144",
    position = "auto",
    scale    = 1,
})

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    -- Authentication Agent
    hl.exec_cmd("systemctl --user start plasma-polkit-agent")

    -- Ncmpcpp Stuff
    hl.exec_cmd("mpDris2")

    -- MPD Rich Presence
    hl.exec_cmd("mpd-discord-rpc")

    -- Hypridle
    hl.exec_cmd("~/.config/hypr/scripts/hypridle.sh")

    -- Waybar
    hl.exec_cmd("~/.config/waybar/scripts/lauch.sh")

    -- Notification Daemon
    hl.exec_cmd("~/.config/hypr/scripts/notification.sh")

    -- Night-light
    hl.exec_cmd("~/.config/hypr/scripts/night-light-toggle.sh")

    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Wallpaper
    hl.exec_cmd("awww-daemon --format xrgb")
    hl.exec_cmd("~/.config/hypr/scripts/wallpapers_slideshow.sh")

    -- Apps
    hl.exec_cmd("zapzap")
    hl.exec_cmd(
        "env DISPLAY=:0 XAUTHORITY=/home/kritagya-dahal/.Xauthority DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus XDG_RUNTIME_DIR=/run/user/1000 /usr/local/bin/discord-vpn.sh")
    hl.exec_cmd("keepassxc %f")

    -- Screenshare
    hl.exec_cmd("xwaylandvideobridge")
end)



-----------------------
----- PERMISSIONS -----
-----------------------
hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

-- hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/lib/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/hyprpm", type = "plugin", mode = "allow" })


-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 20,
        border_size      = 4,
        col              = {
            active_border   = { colors = { color5, color6, color14 }, angle = 45 },
            inactive_border = color8,
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 8,
        rounding_power   = 10,
        active_opacity   = .85,
        inactive_opacity = .75,
        shadow           = {
            enabled      = true,
            range        = 8,
            render_power = 4,
            color        = 0xee000000,
        },
        blur             = {
            enabled  = true,
            size     = 6,
            passes   = 3,
            vibrancy = 0.18,
        },
    },

    plugin = {
        hyprfocus = {
            mode = "slide",
            slide_height = 15
        },
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    }
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad     = {
            natural_scroll = true,
        },
    },
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
    name = "rofi",
    match = {
        title = "rofi"
    },
    float = true
})

local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*"
    },
    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Screenshare
hl.window_rule({
    name = "xwaylandvideobridge-config",
    match = {
        class = "^(xwaylandvideobridge)$"
    },
    opacity = "0.0 override 0.0 override",
    no_anim = true,
    no_initial_focus = true,
    max_size = { 1, 1 },
    no_blur = true,
})
