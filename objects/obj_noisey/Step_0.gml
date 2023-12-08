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
if (global.miniboss == 0)
    instance_destroy()
if (obj_player1.x > (x - 400) && obj_player1.x < (x + 400) && y <= (obj_player1.y + 60) && y >= (obj_player1.y - 60))
{
    if (state != (97 << 0) && obj_player1.state == (92 << 0))
    {
        state = (97 << 0)
        sprite_index = scaredspr
        if (x != obj_player1.x)
            image_xscale = (-(sign((x - obj_player1.x))))
    }
}
if instance_exists(obj_player2)
{
    if (obj_player2.x > (x - 400) && obj_player2.x < (x + 400) && y <= (obj_player2.y + 60) && y >= (obj_player2.y - 60))
    {
        if (state != (97 << 0) && obj_player2.state == (92 << 0))
        {
            state = (97 << 0)
            sprite_index = scaredspr
            if (x != obj_player2.x)
                image_xscale = (-(sign((x - obj_player2.x))))
        }
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
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
