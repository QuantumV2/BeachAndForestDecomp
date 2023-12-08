hsp = (image_xscale * movespeed)
switch kick
{
    case 0:
        if place_meeting((x + image_xscale), y, obj_solid)
            image_xscale *= -1
        mask_index = spr_player_mask
        if (scr_solid(x, (y + 1)) && vsp > 0)
            movespeed = 0
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_noisebombland)
        {
            sprite_index = spr_playerN_noisebomb
            vsp = -5
            movespeed = 6
        }
        if (place_meeting((x + hsp), (y + vsp), obj_destructibles) || place_meeting(x, y, obj_baddie))
        {
            instance_destroy()
            instance_create(x, y, obj_playerexplosion)
        }
        if (countdown <= 0)
        {
            instance_destroy()
            instance_create(x, y, obj_playerexplosion)
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_noisebombhitwall)
            sprite_index = spr_playerN_noisebomb
        if (sprite_index == spr_playerN_noisebomb && countdown < 60)
            sprite_index = spr_playerN_noisebombflash
        if (!(place_meeting(x, y, obj_player1)))
            playercollision = 0
        if (sprite_index == spr_playerN_noisebomb || sprite_index == spr_playerN_noisebombflash)
            countdown--
        if (grounded && sprite_index != spr_playerN_noisebombland && vsp > 0)
        {
            movespeed = 0
            sprite_index = spr_playerN_noisebombland
            image_index = 0
        }
        break
    case 1:
        mask_index = spr_crouchmask
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        {
            sprite_index = spr_playerN_noisebombhitwall
            image_index = 0
            kick = 0
            hsp = 0
        }
        with (instance_place((x + hsp), y, obj_destructibles))
            instance_destroy()
        with (instance_place(x, y, obj_baddie))
        {
            instance_destroy()
            instance_destroy(other.id)
            instance_create(other.x, other.y, obj_playerexplosion)
        }
        break
}

scr_collide()
