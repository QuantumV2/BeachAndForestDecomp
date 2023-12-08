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
        scr_enemy_stun()
        break
    case (100 << 0):
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        scr_enemy_grabbed()
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
if (state == (105 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (105 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (109 << 0))
    grav = 0.5
else
    grav = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (119 << 0))
    depth = 0
if (state != (99 << 0))
    scr_scareenemy()
if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == (99 << 0))
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_forkhitbox))
            ID = other.id
    }
    sprite_index = spr_ancho_charge
    movespeed = 10
}
var targetplayer = instance_nearest(x, y, obj_player)
if (x != targetplayer.x && state != (99 << 0) && y == ystart)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && y <= (targetplayer.y + 50) && y >= (targetplayer.y - 50))
    {
        if (state == (105 << 0))
        {
            image_index = 0
            image_xscale = (-(sign((x - obj_player.x))))
            state = (99 << 0)
            sprite_index = spr_ancho_chargestart
        }
    }
}
if (state == (109 << 0) || state == (105 << 0))
    movespeed = 0
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
