if (room == rm_editor)
    return;
switch state
{
    case (97 << 0):
        scr_enemy_idle()
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
        scr_enemy_stun()
        break
    case (100 << 0):
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        scr_enemy_grabbed()
        break
    case (99 << 0):
        scr_enemy_charge()
        break
}

if (state == (109 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
scr_scareenemy()
if (state != (109 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
var targetplayer = obj_player1
if (obj_player1.spotlight == 0)
    targetplayer = obj_player2
if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 60) && y >= (targetplayer.y - 60))
{
    if (state == (105 << 0) || state == (97 << 0))
        activated = 1
}
if ((state == (105 << 0) || state == (97 << 0)) && activated == 1 && sprite_index != spr_banditochicken_wake && sprite_index != spr_banditochicken_scared)
{
    movespeed = 0
    image_xscale = (-(sign((x - targetplayer.x))))
    image_index = 0
    sprite_index = spr_banditochicken_wake
}
if (sprite_index == spr_banditochicken_wake && floor(image_index) == (image_number - 1))
{
    image_xscale *= -1
    sprite_index = spr_banditochicken_chase
    state = (99 << 0)
}
if (state == (99 << 0) && bonebuffer > 0)
    bonebuffer--
if (bonebuffer == 0)
{
    with (instance_create(x, y, obj_banditochicken_projectile))
    {
        vsp = -9
        hsp = ((-image_xscale) * 4)
        image_xscale = other.image_xscale
    }
    bonebuffer = 60
}
if (state == (99 << 0) && movespeed < 5)
    movespeed += 0.1
if (state != (119 << 0))
    depth = 0
if (state != (109 << 0))
    thrown = 0
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
