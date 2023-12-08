function scr_player_Sjump() {
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    move = (key_right + key_left)
    if (sprite_index == spr_superjump && (character == "N" || character == "P"))
        vsp = -15
    if (character == "V" && image_index > 3)
        vsp = -11
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = (xscale * a)
        vsp = 0
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        a = 0
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland
        if (sprite_index == spr_superjump)
            sprite_index = spr_superjumpland
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        with (obj_baddie)
        {
            if point_in_rectangle(x, y, __view_get((0 << 0), 0), __view_get((1 << 0), 0), (__view_get((0 << 0), 0) + __view_get((2 << 0), 0)), (__view_get((1 << 0), 0) + __view_get((3 << 0), 0)))
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        state = (94 << 0)
        machhitAnim = 0
    }
    else if (key_attack2 && character == "P")
    {
        if (move != 0)
            xscale = move
        sprite_index = spr_mach4
        state = (92 << 0)
        movespeed = 12
    }
    if (character == "N" && key_jump2)
    {
        scr_soundeffect(sfx_jump)
        scr_soundeffect(sfx_woosh)
        jumpstop = 0
        vsp = -15
        state = (66 << 0)
        sprite_index = spr_playerN_noisebombspinjump
        image_index = 0
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
    }
    if (key_attack2 && character == "N")
    {
        scr_soundeffect(sfx_noisewoah)
        state = (73 << 0)
        image_index = 0
        sprite_index = spr_playerN_jetpackstart
        hsp = 0
        vsp = 0
        if (move != 0)
            xscale = move
    }
    if (key_slap2 && (!key_up) && character == "N")
    {
        state = (55 << 0)
        sprite_index = spr_playerN_spin
        image_index = 0
        movespeed = 15
    }
    if (character == "N")
    {
        if (move == 1)
            hsp = 3
        if (move == -1)
            hsp = -3
    }
    if (character == "V" && floor(image_index) == (image_number - 1))
    {
        state = (66 << 0)
        sprite_index = spr_playerV_fall
    }
    image_speed = 0.5
    scr_collide_player()
}