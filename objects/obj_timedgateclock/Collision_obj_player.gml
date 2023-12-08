with (obj_timedgateclock)
{
    if (sprite_index != spr_button_pressed && sprite_index != spr_button_goingpressed)
        sprite_index = spr_button_goingpressed
}
global.timedgate = 1
global.minutes = minutes
global.seconds = seconds
obj_camera.alarm[1] = 60
