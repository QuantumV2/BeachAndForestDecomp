if (room == Titlescreen && obj_player.state == (14 << 0))
{
    obj_player1.sprite_index = spr_player_machfreefall
    obj_player1.state = (59 << 0)
    obj_player1.movespeed = 6
    obj_player1.vsp = 5
    obj_player1.xscale = 1
    obj_player1.player_x = 50
    obj_player1.player_y = 50
}
if (obj_player.state == (90 << 0))
{
    with (instance_create((obj_stopsign.x - 480), obj_stopsign.y, obj_taxidud))
        playerid = obj_player1
}
