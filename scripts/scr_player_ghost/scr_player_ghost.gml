function scr_player_ghost() {
    move = (key_right + key_left)
    if (sprite_index != spr_player_ghostend)
        hsp = (movespeed * move)
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
        facehurt = 0
    }
    if (vsp > 5 && (!key_down))
        vsp = 5
    else if (vsp > 10 && key_down)
        vsp = 10
    image_speed = 0.35
    if (sprite_index != spr_player_ghostend)
    {
        if key_jump
        {
            vsp = -8
            instance_create(x, (y + 20), obj_cloudeffect)
            image_index = 0
            sprite_index = spr_player_ghostjump
        }
    }
    if (place_meeting(x, y, obj_ghosttransparency) && sprite_index != spr_player_ghostend)
        image_alpha = 0.5
    else
        image_alpha = 1
    if (scr_solid(x, (y + 1)) && sprite_index != spr_player_ghostend)
    {
        vsp = -5
        instance_create(x, (y + 43), obj_cloudeffect)
    }
    if (sprite_index == spr_player_ghostjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_ghostidle
    if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_player_ghostend)
    {
        vsp = 10
        image_alpha = 1
        hsp = 0
        image_index = 0
        grav = 0.5
        movespeed = 0
        sprite_index = spr_player_ghostend
        with (instance_place(x, y, obj_tombstone))
        {
            other.x = x
            other.y = y
        }
    }
    if (sprite_index == spr_player_ghostend && floor(image_index) == (image_number - 1))
        state = (0 << 0)
    if (move != 0 && sprite_index != spr_player_ghostend)
        xscale = move
    if (move != 0)
    {
        if (movespeed < 8)
            movespeed += 0.3
        else if (floor(movespeed) == 8)
            movespeed = 8
    }
    else
        movespeed = 0
    if (movespeed > 8)
        movespeed -= 0.1
}