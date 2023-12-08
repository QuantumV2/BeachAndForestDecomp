if (room == rm_editor)
    return;
if (index == -1)
    return;
if ((obj_player1.state == (0 << 0) || obj_player1.state == (77 << 0) || obj_player1.state == (38 << 0) || obj_player1.state == (78 << 0) || obj_player1.state == (92 << 0) || obj_player1.state == (73 << 0)) && sprite_index == spr_doorkey && obj_player1.key_up && obj_player1.grounded && global.key_inv == 1 && place_meeting(x, y, obj_player1))
{
    obj_player1.state = (72 << 0)
    obj_player1.image_index = 0
    if (instance_exists(obj_player2) && global.coop == 1)
    {
        obj_player2.x = obj_player1.x
        obj_player2.y = obj_player1.y
        obj_player2.state = (72 << 0)
        obj_player2.image_index = 0
    }
    image_index = 0
    sprite_index = spr_doorkeyopen
    image_speed = 0.35
    instance_create((x + 50), (y + 50), obj_lock)
    global.key_inv = 0
}
if instance_exists(obj_player2)
{
    if (obj_player2.state == (0 << 0) && obj_player2.grounded && obj_player2.key_up && global.key_inv == 1 && place_meeting(x, y, obj_player2))
    {
        obj_player2.state = (72 << 0)
        obj_player2.image_index = 0
        obj_player1.x = obj_player2.x
        obj_player1.y = obj_player2.y
        obj_player1.state = (72 << 0)
        obj_player1.image_index = 0
        image_index = 0
        sprite_index = spr_doorkeyopen
        image_speed = 0.35
        instance_create((x + 50), (y + 50), obj_lock)
        global.key_inv = 0
    }
}
if (sprite_index == spr_doorkeyopen && floor(image_index) == 2)
    image_speed = 0
if (floor(obj_player1.image_index) == (obj_player1.image_number - 4) && obj_player1.state == (72 << 0))
    obj_player.state = (0 << 0)
if (sprite_index == spr_doorkeyopen && image_speed == 0)
{
    opened = 1
    sprite_index = spr_doorvisited
}
