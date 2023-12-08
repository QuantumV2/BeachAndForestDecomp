if (room == rm_editor)
    return;
if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && sprite_index != spr_hungrypillar_angry)
    sprite_index = spr_hungrypillar_angry
else if ((!((obj_player.x > (x - 400) && obj_player.x < (x + 400)))) && sprite_index == spr_hungrypillar_angry)
{
    sprite_index = spr_hungrypillar_happy
    alarm[0] = 100
}
