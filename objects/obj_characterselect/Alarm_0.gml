with (instance_create(x, y, obj_fadeout))
{
    obj_player1.targetRoom = hub_room1
    obj_player1.state = (0 << 0)
    if (global.coop == 1)
        obj_player2.state = (0 << 0)
}
