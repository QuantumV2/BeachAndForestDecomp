if ((!pause) && (!instance_exists(obj_fadeout)))
{
    if (obj_player1.key_start && room != rank_room && room != Realtitlescreen && room != timesuproom)
    {
        selected = 0
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout)
if (pause == 1)
{
    scr_getinput()
    application_surface_draw_enable(true)
    if (key_down2 && selected < 2)
    {
        selected += 1
        scr_soundeffect(sfx_step)
    }
    if (key_up2 && selected > 0)
    {
        selected -= 1
        scr_soundeffect(sfx_step)
    }
    if (key_jump && selected == 1)
    {
        var roomname = room_get_name(room)
        if (global.snickchallenge == 0)
        {
            if (string_letters(roomname) == "entrance" || string_letters(roomname) == "entrancesecret")
            {
                instance_activate_all()
                room = entrance_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "medieval" || string_letters(roomname) == "medievalsecret")
            {
                instance_activate_all()
                room = medieval_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            if (string_letters(roomname) == "chateau" || string_letters(roomname) == "chateausecret")
            {
                instance_activate_all()
                room = chateau_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "ruin" || string_letters(roomname) == "ruinsecret")
            {
                instance_activate_all()
                room = ruin_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "dungeon" || string_letters(roomname) == "dungeonsecret")
            {
                instance_activate_all()
                room = dungeon_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "floorroom" || string_letters(roomname) == "floorsecret")
            {
                instance_activate_all()
                room = floor1_room0
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "graveyard" || string_letters(roomname) == "graveyardsecret")
            {
                instance_activate_all()
                room = graveyard_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "farm" || string_letters(roomname) == "farmsecret")
            {
                instance_activate_all()
                room = farm_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "ufo" || string_letters(roomname) == "ufosecret")
            {
                instance_activate_all()
                room = ufo_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "beach" || string_letters(roomname) == "beachsecret")
            {
                instance_activate_all()
                room = beach_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "forest" || string_letters(roomname) == "forestsecret")
            {
                instance_activate_all()
                room = forest_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "dragonlair" || string_letters(roomname) == "dragonlairsecret")
            {
                instance_activate_all()
                room = dragonlair_1
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else if (string_letters(roomname) == "strongcold" || string_letters(roomname) == "strongcoldsecret")
            {
                instance_activate_all()
                room = strongcold_10
                scr_playerreset()
                pause = 0
                obj_player1.targetDoor = "A"
                if instance_exists(obj_player2)
                    obj_player2.targetDoor = "A"
            }
            else
                scr_soundeffect(sfx_enemyprojectile)
        }
        else if (global.snickchallenge == 1)
        {
            instance_activate_all()
            room = medieval_1
            scr_playerreset()
            global.collect = 10000
            global.seconds = 59
            global.minutes = 9
            global.wave = 0
            global.maxwave = (((global.minutes * 60) + global.seconds) * 60)
            if global.panicbg
                scr_panicbg_init()
            obj_player1.state = (69 << 0)
            if (global.coop == 1)
                obj_player2.state = (69 << 0)
            obj_player1.targetDoor = "A"
            global.snickchallenge = 1
            pause = 0
        }
    }
    if (key_jump2 && selected == 2)
    {
        if (room == hub_room1 || room == cowboytask || room == Titlescreen || room == Scootertransition)
        {
            pause = 0
            instance_activate_all()
            room = Realtitlescreen
            with (obj_player1)
            {
                character = "P"
                scr_characterspr()
            }
            scr_playerreset()
            obj_player1.state = (14 << 0)
            obj_player2.state = (14 << 0)
            global.cowboyhat = 0
            obj_player1.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            global.coop = 0
        }
        else
        {
            pause = 0
            instance_activate_all()
            scr_playerreset()
            obj_player.targetDoor = "A"
            if instance_exists(obj_player2)
                obj_player2.targetDoor = "A"
            room = hub_room1
        }
    }
    if (key_jump2 && selected == 0)
    {
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
}
