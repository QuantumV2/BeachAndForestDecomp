function scr_player_backbreaker() {
    mach2 = 0
    if (sprite_index != spr_player_machfreefall)
    {
        hsp = 0
        movespeed = 0
    }
    else
        hsp = (xscale * movespeed)
    move = (key_right2 + key_left2)
    landAnim = 0
    if (sprite_index == spr_player_machfreefall && place_meeting(x, (y + 1), obj_solid))
    {
        state = (79 << 0)
        sprite_index = spr_player_crouchslide
    }
    if (sprite_index == spr_taunt || sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
    {
        if ((!instance_exists(parry_inst)) && taunttimer > parry_max)
        {
            parry_inst = instance_create(x, y, obj_parryhitbox)
            var _playerid = obj_solid
            if (object_index == obj_player2)
                _playerid = obj_player
            with (parry_inst)
            {
                player_id = _playerid
                image_xscale = other.xscale
            }
        }
        if (taunttimer < taunt_to_parry_max)
        {
            if instance_exists(parry_inst)
            {
                instance_destroy(parry_inst)
                parry_inst = noone
            }
        }
        if (character == "P")
        {
            if key_down2
            {
                if (paletteselect < 9)
                    paletteselect += 1
                else
                    paletteselect = 1
                taunttimer = 20
            }
        }
        if (character == "N")
        {
            if key_down2
            {
                if (paletteselect < 6)
                    paletteselect += 1
                else
                    paletteselect = 0
                taunttimer = 20
            }
        }
        if (supercharged == 1 && (!instance_exists(obj_tauntaftereffectspawner)))
        {
            instance_create(x, y, obj_tauntaftereffectspawner)
            with (obj_baddie)
            {
                if point_in_rectangle(x, y, __view_get((0 << 0), 0), __view_get((1 << 0), 0), (__view_get((0 << 0), 0) + __view_get((2 << 0), 0)), (__view_get((1 << 0), 0) + __view_get((3 << 0), 0)))
                    instance_destroy()
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            supercharged = 0
        }
        taunttimer--
        vsp = 0
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4))
    {
        if (global.combotime != 0 && global.combo > 0)
        {
            global.combo = 0
            global.combotime = 0
        }
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        if instance_exists(parry_inst)
        {
            instance_destroy(parry_inst)
            parry_inst = noone
        }
    }
    if (sprite_index == spr_taunt && taunttimer == 0)
    {
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        if instance_exists(parry_inst)
        {
            instance_destroy(parry_inst)
            parry_inst = -4
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_Timesup && place_meeting(x, y, obj_exitgate))
        state = (0 << 0)
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete || sprite_index == spr_playerN_victory))
        state = (0 << 0)
    if (key_jump && sprite_index == spr_player_phoneidle)
    {
        global.panic = 1
        sprite_index = spr_bossintro
        image_index = 0
        with (instance_create(x, y, obj_debris))
        {
            image_index = 0
            sprite_index = spr_phonedebris
        }
    }
    if (global.miniboss == 1 && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
        state = (0 << 0)
    image_speed = 0.4
}