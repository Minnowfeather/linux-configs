hl.layer_rule({
    match = { namespace = "selection" },
    no_anim = true,
    name = "Don't animate grim slurp"
})

hl.layer_rule({
    match = { namespace = "rofi" },
    dim_around = on,
    name = "Rofi effects"
})

hl.window_rule({
    name = "Move firefox",
    match = { class = "firefox" },
    workspace = 2
})

hl.window_rule({
    name = "Move discord",
    match = { class = "discord" },
    workspace = 10
})
