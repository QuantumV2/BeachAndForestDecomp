if (room == rm_editor)
    return;
switch state
{
    case (97 << 0):
        scr_enemy_idle()
        break
    case (99 << 0):
        scr_enemy_charge()
        break
    case (101 << 0):
        scr_enemy_turn()
        break
    case (105 << 0):
        scr_enemy_walk()
        break
    case (107 << 0):
        scr_enemy_land()
        break
    case (108 << 0):
        scr_enemy_hit()
        break
    case (109 << 0):
        image_alpha = 1
        scr_enemy_stun()
        break
    case (100 << 0):
        image_alpha = 1
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        image_alpha = 1
        scr_enemy_grabbed()
        break
    case (112 << 0):
        scr_enemy_chase()
        break
}

if (state == (109 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (109 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (119 << 0))
    depth = 0
if (state != (109 << 0))
    thrown = 0
if (state != (112 << 0) && image_alpha >= 1)
    scr_scareenemy()
if (bombreset > 0)
    bombreset--
if (bombreset == 0 && state == (105 << 0))
{
    attacking = 0
    targetplayer = instance_nearest(x, y, obj_player)
    if (targetplayer.x > (x - threshold_x) && targetplayer.x < (x + threshold_x) && y <= (targetplayer.y + threshold_y) && y >= (targetplayer.y - threshold_y))
    {
        attacking = 1
        pos = sign((x - targetplayer.x))
        state = (112 << 0)
        fade = 1
    }
}
if (state == (112 << 0))
{
    if fade
    {
        if (image_alpha > 0)
        {
            if (hsp < -0.2 || hsp > 0.2)
                hsp *= 0.5
            image_alpha -= fadeout_time
        }
        else if (image_alpha <= 0)
        {
            x = targetplayer.x
            y = targetplayer.y
            if (pos != 0 && (!(scr_solid((x + (pos * attack_offset)), y))))
            {
                x = (targetplayer.x + (pos * attack_offset))
                if place_meeting(x, y, obj_pickle)
                {
                    if (!(scr_solid((x + 32), y)))
                        x += 32
                    else if (!(scr_solid((x - 32), y)))
                        x -= 32
                }
            }
            if (!(scr_solid(x, (y + 1))))
            {
                var yy = y
                var ground = 0
                var i = 1
                while (i < ground_check)
                {
                    if scr_solid(x, (y + i))
                    {
                        ground = 1
                        i--
                        yy = (y + i)
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
                if ground
                    y = yy
            }
            fade = 0
        }
    }
    else
    {
        if (image_alpha < 1)
            image_alpha += fadein_time
        if (image_alpha >= 1)
        {
            image_alpha = 1
            image_index = 0
            sprite_index = spr_pickle_attack
            var old_xscale = image_xscale
            image_xscale = (-(sign((x - targetplayer.x))))
            if (image_xscale == 0)
                image_xscale = old_xscale
            state = (100 << 0)
        }
    }
}
invincible = attacking
if (state == (97 << 0))
{
    if (scaredbuffer > 0 && attacking)
    {
        image_alpha = 0.8
        invincible = 1
    }
}
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
