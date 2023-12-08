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
        scr_enemy_stun()
        break
    case (100 << 0):
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        scr_enemy_grabbed()
        break
}

scr_scareenemy()
if (state == (109 << 0) && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (109 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
var player = instance_nearest(x, y, obj_player)
if (state == (105 << 0) && sprite_index == walkspr && sprite_index != spr_indiancheese_scared)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        state = (97 << 0)
        sprite_index = spr_indiancheese_howl
        jumptimer = 20
        vsp = -5
    }
}
if (jumptimer > 0 && state == (97 << 0) && grounded && sprite_index == spr_indiancheese_howl)
    jumptimer--
if (jumptimer == 0 && state == (97 << 0) && grounded && sprite_index == spr_indiancheese_howl)
{
    movespeed = 4
    vsp = -11
    sprite_index = spr_indiancheese_jump
    image_index = 0
    state = (105 << 0)
    jumptimer = 20
    instance_create(x, y, obj_highjumpcloud2)
}
if ((!grounded) && sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
    image_speed = 0
else if (image_speed == 0)
    image_speed = 0.35
if (grounded && sprite_index == spr_indiancheese_jump && vsp > 0)
{
    movespeed = 1
    instance_create(x, y, obj_landcloud)
    sprite_index = spr_indiancheese_walk
}
if (hitboxcreate == 0 && state == (105 << 0))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id
}
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
