hl.config({
    dwindle = {
        force_split = 2,
        preserve_split = true
    },
    master = {
        new_status = "master",
        new_on_top = true,
        orientation = "left"
    },

    general = {
        gaps_in = 2,
        gaps_out = 10,
        border_size = 1,
        col = {
            active_border = "rgba(ccccccff)",
            inactive_border = "rgba(595959aa)"
        },
        layout = "dwindle",
    },

    -- Deco
    decoration = {
        rounding = 5,
        blur = {
            enabled = false,
            size = 3,
            passes = 1
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },

    animations = {
        enabled = true
    }
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/#curves
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.3 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "fade" })

-- Rofi
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "default", style = "popin 30%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 5, bezier = "default", style = "popin 50%" })
