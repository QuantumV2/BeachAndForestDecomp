global.breaksound = 0
if ((obj_player1.character == "P" && obj_player1.spotlight == 1) || (obj_player2.character == "P" && obj_player1.spotlight == 0))
    sprite_index = spr_destroyable2
if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
    sprite_index = spr_halloweensmallblock
depth = 1
