if (room == rm_editor)
    return;
switch state
{
    case (97 << 0):
        grav = 0.5
        scr_enemy_idle()
        break
    case (99 << 0):
        grav = 0.5
        scr_enemy_charge()
        break
    case (101 << 0):
        grav = 0.5
        scr_enemy_turn()
        break
    case (105 << 0):
        grav = 0.5
        scr_enemy_walk()
        break
    case (107 << 0):
        grav = 0.5
        scr_enemy_land()
        break
    case (108 << 0):
        grav = 0.5
        scr_enemy_hit()
        break
    case (109 << 0):
        grav = 0.5
        scr_enemy_stun()
        break
    case (100 << 0):
        grav = 0.5
        scr_pizzagoblin_throw()
        break
    case (119 << 0):
        grav = 0.5
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
if (inv_timer > 0)
{
    inv_timer--
    if place_meeting(x, y, obj_player)
    {
        var player_inst = instance_place(x, y, obj_player)
        var player_state = player_inst.state
        if (player_inst.instakillmove == 1 || player_state == (29 << 0))
        {
            scr_hurtplayer(player_inst)
            var abs_hsp = abs(player_inst.hsp)
            if (player_inst.x != x)
                player_inst.hsp = (sign((x - player_inst.x)) * abs_hsp)
            if (state != (118 << 0))
            {
                sprite_index = parryspr
                movespeed = 8
                state = (118 << 0)
                image_index = 0
            }
        }
    }
}
else
    invincible = 0
if (state == (105 << 0))
{
    grav = 0.5
    if (cooldown_count > 0)
    {
        cooldown_count--
        if (instance_exists(taunteffect_inst) && taunteffect_inst.object_index == obj_baddietaunteffect)
        {
            instance_destroy(taunteffect_inst)
            taunteffect_inst = noone
        }
    }
    else
    {
        taunteffect_inst = instance_create(x, y, obj_baddietaunteffect)
        sprite_index = spr_coolpinea_taunt
        image_speed = 0
        image_index = choose(0, 1, 2)
        taunt_count = taunt_max
        taunt_storedstate = state
        taunt_storedmovespeed = movespeed
        taunt_storedhsp = hsp
        state = (59 << 0)
        hsp = 0
        vsp = 0
        grav = 0
    }
}
if (state == (59 << 0))
{
    image_speed = 0
    inv_timer = inv_max
    invincible = 1
    killbyenemy = 0
    hsp = 0
    vsp = 0
    if (taunt_count > 0)
        taunt_count--
    else
    {
        sprite_index = walkspr
        invincible = 0
        killbyenemy = 1
        grav = taunt_storedgrav
        state = taunt_storedstate
        hsp = taunt_storedhsp
        cooldown_count = cooldown_max
        movespeed = taunt_storedmovespeed
    }
}
else if (state == (118 << 0))
{
    image_speed = 0.35
    if (trail_count > 0)
        trail_count--
    else
    {
        with (instance_create(x, y, obj_afterimage))
        {
            sprite_index = other.sprite_index
            image_xscale = other.image_xscale
        }
        trail_count = trail_max
    }
    if (instance_exists(taunteffect_inst) && taunteffect_inst.object_index == obj_baddietaunteffect)
    {
        instance_destroy(taunteffect_inst)
        taunteffect_inst = -4
    }
    inv_timer = inv_max
    invincible = 1
    killbyenemy = 0
    if (movespeed > 0)
        movespeed -= 0.5
    else
        movespeed = 0
    hsp = (movespeed * (-image_xscale))
    if (image_index > (image_number - 1))
    {
        sprite_index = walkspr
        invincible = 0
        killbyenemy = 1
        grav = taunt_storedgrav
        state = taunt_storedstate
        hsp = taunt_storedhsp
        cooldown_count = cooldown_max
        movespeed = taunt_storedmovespeed
    }
}
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
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
