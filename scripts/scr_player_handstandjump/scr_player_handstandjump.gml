function scr_player_handstandjump() {
    landAnim = 0
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    momemtum = 1
    dir = xscale
    if (movespeed < 10 && grounded)
        movespeed += 0.5
    else if (!grounded)
        movespeed = 10
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (move != xscale && move != 0)
        state = (0 << 0)
    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart) && grounded && ((!key_attack) || character == "N") && vsp > 0)
    {
        image_speed = 0.35
        state = (0 << 0)
        grav = 0.5
    }
    if ((floor(image_index) == (image_number - 1) || sprite_index == spr_suplexdashjump || sprite_index == spr_suplexdashjumpstart) && grounded && key_attack && character == "P")
    {
        image_speed = 0.35
        state = (78 << 0)
        grav = 0.5
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_suplexdashjumpstart)
        sprite_index = spr_suplexdashjump
    if (key_down && grounded && vsp > 0)
    {
        grav = 0.5
        sprite_index = spr_crouchslip
        machhitAnim = 0
        state = (76 << 0)
        movespeed = 15
    }
    if ((!grounded) && (sprite_index == spr_suplexdash || sprite_index == spr_shotgunsuplexdash))
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
    }
    if key_jump
        input_buffer_jump = 0
    if (grounded && input_buffer_jump < 8)
    {
        image_index = 0
        sprite_index = spr_suplexdashjumpstart
        scr_soundeffect(sfx_jump)
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -11
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        scr_soundeffect(sfx_bumpwall)
        grav = 0.5
        movespeed = 0
        state = (80 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        scr_soundeffect(sfx_bumpwall)
        grav = 0.5
        movespeed = 0
        state = (80 << 0)
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create((x - 10), (y + 10), obj_bumpeffect)
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale
    }
    if (character == "S")
    {
        if key_attack
        {
            hsp = 0
            if (movespeed < 20)
                movespeed += 0.5
            if (movespeed == 20)
                sprite_index = spr_snick_superpeelout
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2
            else
                sprite_index = spr_snick_walk
        }
        else if (movespeed >= 12)
            state = (92 << 0)
        else
        {
            state = (0 << 0)
            movespeed = 0
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
    }
    image_speed = 0.35
    if key_slap2
    {
        movespeed = 8
        if (!grounded)
            vsp = -5
        image_index = 0
        if (character == "P")
            sprite_index = spr_player_faceplant
        if (character == "N")
            sprite_index = spr_playerN_spin
        state = (95 << 0)
        image_speed = 0.5
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        if (!instance_exists(crazyruneffectid))
        {
            with (instance_create(x, y, obj_crazyrunothereffect))
            {
                playerid = other.object_index
                other.crazyruneffectid = id
            }
        }
    }
}