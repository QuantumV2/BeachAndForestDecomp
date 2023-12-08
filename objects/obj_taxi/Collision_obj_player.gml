with (other.id)
{
    if (key_up && grounded && (state == (0 << 0) || state == (77 << 0) || state == (78 << 0) || state == (38 << 0) || state == (92 << 0) || state == (73 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (90 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        with (other.id)
        {
            instance_create(x, y, obj_genericpoofeffect)
            obj_player1.visible = false
            obj_player1.sprite_index = obj_player1.spr_idle
            obj_player1.hsp = 0
            obj_player1.vsp = 0
            obj_player1.state = (90 << 0)
            scr_soundeffect(sfx_taxi2)
            playerid = obj_player1
            sprite_index = spr_taximove
            hsp = 10
            obj_player1.cutscene = 1
            if (global.coop == 1)
            {
                obj_player2.sprite_index = obj_player2.spr_idle
                scr_soundeffect(sfx_taxi2)
                playerid = obj_player2
                sprite_index = spr_taximove
                hsp = 10
                obj_player2.visible = false
                obj_player2.hsp = 0
                obj_player2.vsp = 0
                obj_player2.state = (90 << 0)
                obj_player2.cutscene = 1
            }
        }
    }
}
