if (global.pizzadelivery && instance_exists(obj_gnomecustomerblock))
{
    other.vsp = 10
    var xx = (x + (customer_x * image_xscale))
    var yy = (y + (customer_y * image_yscale))
    var player = other.id
    var door = id
    xscale = sign(image_xscale)
    if (!instance_exists(obj_cutscene_handler))
    {
        var _xscale = player.xscale
        if (player.x != x)
            _xscale = sign((x - player.x))
        with (instance_create(0, 0, obj_cutscene_handler))
        {
            var door_xscale = (-(sign((door.image_xscale * 16))))
            depth = (other.depth - 1)
            scene_info = [[197, player], [194, player, 634, 0.35, _xscale], [203, player], [194, player, 634, 0.35, _xscale], [203, player], [195, player, (door.x + (door.player_standx * (-door_xscale))), 6, 16], [194, player, 614, 0.35, door_xscale], [193, 30], [207, door, 1], [199, xx, yy, other.spr_idle, other.spr_happy, (-door_xscale)], [193, 5], [194, player, 635, 0.35, door_xscale], [193, 45], [194, player, 551, 0.35, door_xscale], [198, player, door.gnome_id]]
        }
    }
}
