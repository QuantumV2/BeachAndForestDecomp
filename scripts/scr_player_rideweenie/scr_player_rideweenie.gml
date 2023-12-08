function scr_player_rideweenie() {
    hsp = (xscale * movespeed)
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (grounded && movespeed != 14)
        movespeed = 14
    if (input_buffer_jump < 8 && grounded)
    {
        scr_soundeffect(sfx_jump)
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -11
    }
    if key_jump
        input_buffer_jump = 0
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
    {
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_weeniemount_dead
        sprite_index = spr_hitwall
        scr_soundeffect(sfx_groundpound)
        scr_soundeffect(sfx_bumpwall)
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        hsp = 0
        image_speed = 0.35
        with (obj_baddie)
        {
            if point_in_rectangle(x, y, __view_get((0 << 0), 0), __view_get((1 << 0), 0), (__view_get((0 << 0), 0) + __view_get((2 << 0), 0)), (__view_get((1 << 0), 0) + __view_get((3 << 0), 0)))
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
            }
        }
        flash = 0
        state = (80 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    image_speed = 0.5
}