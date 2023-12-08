var my_player = obj_player1.id
if (player_id == obj_player)
    my_player = obj_player2.id
if (my_player.state != (59 << 0) && my_player.state != (118 << 0))
    instance_destroy()
image_xscale = my_player.xscale
