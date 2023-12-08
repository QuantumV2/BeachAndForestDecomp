if (room == rm_editor)
    return;
targetplayer = instance_nearest(x, y, obj_player)
if (bombreset > 0)
    bombreset--
if (inv_timer > 0)
    inv_timer--
else if (state != (55 << 0))
    invincible = 0
if (state == (105 << 0))
{
    if (!chasing)
    {
        if (collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4 && ((image_xscale < 0 && targetplayer.x < x) || (image_xscale > 0 && targetplayer.x > x)) && targetplayer.y < (y + threshold_y) && targetplayer.y > (y - threshold_y))
        {
            chasing = 1
            state = (112 << 0)
            sprite_index = walkspr
            image_index = 0
            bombreset = attackreset
        }
    }
    else
    {
        state = (112 << 0)
        sprite_index = walkspr
        image_index = 0
    }
}
else if (state == (112 << 0))
{
    if (x != targetplayer.x)
        image_xscale = (-(sign((x - targetplayer.x))))
    hsp = (image_xscale * chasespeed)
    if (abs((x - targetplayer.x)) < 78 && grounded)
        hsp = 0
    var inst_front = collision_line(x, y, (x + (sign(hsp) * 64)), y, obj_solid, false, true)
    if (bombreset == 0)
    {
        if (targetplayer.x > (x - attackthreshold_x) && targetplayer.x < (x + attackthreshold_x) && targetplayer.y > (y - attackthreshold_y) && targetplayer.y < (y + attackthreshold_y) && (inst_front == noone || (inst_front != noone && x > inst_front.x && targetplayer.x > inst_front.x) || (inst_front != noone && x < inst_front.x && targetplayer.x < inst_front.x)))
        {
            state = (99 << 0)
            hsp = 0
            attack_count = attack_max
        }
    }
    var inst_upfront = collision_line(x, (y - 100), (x + (sign(hsp) * 64)), (y - 100), obj_solid, false, true)
    var inst_down = collision_line((x + (sign(hsp) * 16)), y, (x + (sign(hsp) * 16)), (y + 64), obj_solid, false, true)
    if ((inst_front != noone || inst_down == -4) && inst_upfront == -4 && targetplayer.y <= (y + 32) && grounded && state != (99 << 0))
        vsp = -11
}
if (state == (99 << 0))
{
    if (attack_count > 0)
        attack_count--
    else
    {
        image_index = 0
        sprite_index = walkspr
        state = (100 << 0)
        hsp = 0
    }
}
if (state == (109 << 0) && (thrown || inv_stun))
{
    invincible = 1
    inv_stun = 1
}
else if (state != (109 << 0))
    inv_stun = 0
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
        chasing = 1
        scr_enemy_stun()
        break
    case (100 << 0):
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        chasing = 1
        scr_enemy_grabbed()
        break
    case (96 << 0):
        scr_enemy_rage()
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
scr_scareenemy()
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
