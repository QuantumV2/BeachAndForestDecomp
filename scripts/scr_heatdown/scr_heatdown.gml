function scr_heatdown() {
    global.baddiespeed -= 1
    if (global.stylethreshold != 2)
        global.baddiepowerup = 0
    if (global.stylethreshold != 3)
        global.baddierage = 0
    with (obj_baddie)
        movespeed = global.baddiespeed
    with (obj_tv)
    {
        message = "HEAT DOWN..."
        alarm[0] = 200
        showtext = 1
    }
    obj_stylebar.toggle = 1
    obj_stylebar.alarm[0] = 5
}