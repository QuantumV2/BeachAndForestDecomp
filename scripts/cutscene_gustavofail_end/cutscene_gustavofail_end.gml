function cutscene_gustavofail_end() {
    var time = argument[0]
    timer++
    with (obj_gustavo)
        visible = false
    with (obj_player)
    {
        xscale = -1
        sprite_index = spr_gustavo_pummel
        if (!instance_exists(obj_slapstar))
        {
            instance_create((x - 20), (y - 20), obj_slapstar)
            scr_soundeffect(sfx_pephurt)
            with (instance_create((x - 20), (y - 20), obj_smallnumber))
            {
                negative = 1
                number = "-50"
            }
            if (global.collect > 50)
                global.collect -= 50
            else
                global.collect = 0
            if (global.collect != 0)
            {
                if (character == "P" || character == "V")
                {
                    repeat (10)
                    {
                        with (instance_create(x, y, obj_pizzaloss))
                            sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                    }
                }
                else
                {
                    repeat (10)
                        instance_create(x, y, obj_pizzaloss)
                }
            }
        }
    }
    if (timer >= time)
    {
        with (obj_gustavo)
        {
            visible = true
            sprite_index = spr_gustavo_idle
        }
        scr_hurtplayer(obj_player1)
        obj_player.hsp = 0
        obj_player.movespeed = 0
        obj_player.xscale = 1
        cutscene_end_action()
    }
}