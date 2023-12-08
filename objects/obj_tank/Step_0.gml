if (room == rm_editor)
    return;
targetplayer = instance_nearest(x, y, obj_player)
if (slide_buffer > 0)
    slide_buffer--
if can_flash
{
    if (flash_count > 0)
        flash_count--
    else
    {
        flash_count = flash_max
        flash = (!flash)
    }
}
else
    flash = 0
if (can_flash_count > 0)
    can_flash_count--
else
    can_flash = 0
if (inv_timer > 0)
    inv_timer--
else
    invincible = 0
if (state == (99 << 0))
{
    if (image_index > (image_number - 1))
    {
        ram_spd = 0
        sprite_index = spr_tank_charge
        image_index = 0
        state = (112 << 0)
    }
}
if (state == (97 << 0))
{
    image_speed = 0.35
    if (!patrolling)
    {
        if (collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4 && ((image_xscale < 0 && targetplayer.x < x) || (image_xscale > 0 && targetplayer.x > x)) && targetplayer.y < (y + threshold_y) && targetplayer.y > (y - threshold_y))
        {
            bombreset = patrolmax
            patrolling = 1
            sprite_index = walkspr
            image_index = 0
            state = (105 << 0)
        }
    }
}
else if (state == (119 << 0))
{
    var player = asset_get_index(("obj_player" + string(grabbedby)))
    with (player)
    {
        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
        image_index = 0
        state = (65 << 0)
        movespeed = 3
        vsp = -3
    }
    can_flash = 1
    can_flash_count = can_flash_max
    if (x != player.x)
        hsp = (sign((x - player.x)) * 4)
    else
        hsp = ((-image_xscale) * 4)
    vsp = -4
    inv_timer = inv_max
    bombreset -= inv_max
    slide_buffer = slide_max
    if (bombreset <= 0)
        bombreset = 0
    hp--
    state = (105 << 0)
    sprite_index = walkspr
    invincible = 1
    if (hp <= 0)
        instance_destroy()
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    scr_soundeffect(sfx_killenemy)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
}
else if (state == (112 << 0))
{
    invincible = 1
    if (ram_spd < ram_spd_max)
        ram_spd += accel
    else
        ram_spd = ram_spd_max
    hsp = (image_xscale * ram_spd)
    if scr_solid((x + sign(hsp)), y)
    {
        bombreset = 200
        invincible = 0
        sprite_index = spr_tank_hitwall
        image_index = 0
        attackmode = 0
        hsp = ((-image_xscale) * 2)
        state = (109 << 0)
        stunned = 30
        vsp = -5
    }
}
switch state
{
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
if (bombreset > 0)
    bombreset--
if (state == (113 << 0))
{
    if (floor(image_index) == 5 && bombreset == 0)
    {
        bombreset = spawnreset
        with (instance_create(x, (y - 19), content))
        {
            depth = (other.depth - 10)
            important = 1
            vsp = -8
            hsp = (-other.image_xscale)
            state = (109 << 0)
            stunned = 50
        }
    }
    if (image_index > (image_number - 1))
    {
        sprite_index = walkspr
        state = (105 << 0)
    }
}
if (state == (105 << 0) && bombreset == 0)
{
    if (targetplayer.x > (x - threshold_x) && targetplayer.x < (x + threshold_x) && targetplayer.y < (y + threshold_y) && targetplayer.y > (y - threshold_x))
    {
        attackmode = choose(0, 0, 1, 2, 2, nextattack)
        switch attackmode
        {
            case 0:
                nextattack = 1
                sprite_index = spr_tank_shoot
                image_index = 0
                if (x != targetplayer.x)
                    image_xscale = (-(sign((x - targetplayer.x))))
                state = (100 << 0)
                break
            case 1:
                nextattack = 2
                if (slide_buffer <= 0)
                    hsp = 0
                sprite_index = spr_tank_spawnenemy
                image_index = 0
                if (x != targetplayer.x)
                    image_xscale = (-(sign((x - targetplayer.x))))
                state = (113 << 0)
                break
            case 2:
                nextattack = 0
                if (x != targetplayer.x)
                    image_xscale = (-(sign((x - targetplayer.x))))
                sprite_index = spr_tank_chargestart
                image_index = 0
                ram_count = ram_max
                state = (99 << 0)
                if (slide_buffer <= 0)
                    hsp = 0
                break
        }

    }
}
if (state == (109 << 0))
{
    if (sprite_index == spr_tank_hitwall && image_index > (image_number - 1))
        image_index = (image_number - 1)
    if (sprite_index == spr_tank_stunstart && image_index > (image_number - 1))
    {
        sprite_index = spr_tank_stun
        image_index = 0
    }
    if (sprite_index != spr_tank_hitwall && sprite_index != spr_tank_stunstart && sprite_index != spr_tank_stun)
    {
        sprite_index = spr_tank_stunstart
        image_index = 0
    }
}
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
