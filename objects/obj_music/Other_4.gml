if (global.panic == 0 && global.snickchallenge == 0 && (!instance_exists(obj_hungrypillar)))
{
    if instance_exists(obj_pepperman)
    {
        audio_stop_all()
        scr_sound(mu_chase)
    }
    roomname = room_get_name(room)
    if (room == characterselect)
    {
        if (!audio_is_playing(mu_characterselect))
        {
            audio_stop_all()
            scr_sound(mu_characterselect)
            pausedmusic = 118
        }
    }
    if (string_letters(roomname) == "Realtitlescreen" || string_letters(roomname) == "Realtitlescreen")
    {
        if (!audio_is_playing(mu_title))
        {
            audio_stop_all()
            scr_sound(mu_title)
            pausedmusic = 109
        }
    }
    if (string_letters(roomname) == "hubroom" || string_letters(roomname) == "Titlescreen" || string_letters(roomname) == "halloweenentrance")
    {
        if (!audio_is_playing(mu_hub))
        {
            audio_stop_all()
            scr_sound(mu_hub)
            pausedmusic = 93
        }
    }
    if (string_letters(roomname) == "PProom" || string_letters(roomname) == "PProom")
    {
        if (!audio_is_playing(mu_tutorial))
        {
            audio_stop_all()
            scr_sound(mu_tutorial)
            pausedmusic = 110
        }
    }
    if (string_letters(roomname) == "entrance")
    {
        if (obj_player1.character == "P")
        {
            if (!audio_is_playing(mu_entrance))
            {
                audio_stop_all()
                scr_sound(mu_entrance)
                audio_sound_set_track_position(global.music, fadeoff)
                pausedmusic = 98
            }
        }
        else if (!audio_is_playing(mu_noiseentrance))
        {
            audio_stop_all()
            scr_sound(mu_noiseentrance)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 121
        }
    }
    if (string_letters(roomname) == "dungeon")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("dungeon_" + string(i)) && i <= 8)
            {
                if (!audio_is_playing(mu_dungeon))
                {
                    audio_stop_all()
                    scr_sound(mu_dungeon)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 108
                }
            }
            else if (roomname == ("dungeon_" + string(i)) && i > 8)
            {
                if (!audio_is_playing(mu_dungeondepth))
                {
                    audio_stop_all()
                    scr_sound(mu_dungeondepth)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 116
                }
            }
        }
    }
    if (string_letters(roomname) == "strongcold")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("strongcold_" + string(i)) && i <= 8 && i > 1)
            {
                if (!audio_is_playing(mu_strongcold))
                {
                    audio_stop_all()
                    scr_sound(mu_strongcold)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 119
                }
            }
            else if (roomname == ("strongcold_" + string(i)) && i > 8)
            {
                if (!audio_is_playing(mu_dungeondepth))
                {
                    audio_stop_all()
                    scr_sound(mu_dungeondepth)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 116
                }
            }
            else if (roomname == "strongcold_1")
            {
                if (!audio_is_playing(mu_chateau))
                {
                    audio_stop_all()
                    scr_sound(mu_chateau)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 100
                }
            }
        }
    }
    if (string_letters(roomname) == "medieval")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("medieval_" + string(i)) && i <= 2)
            {
                if (!audio_is_playing(mu_medievalentrance))
                {
                    audio_stop_all()
                    scr_sound(mu_medievalentrance)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 111
                }
            }
            else if (roomname == ("medieval_" + string(i)) && i > 2 && i <= 5)
            {
                if (!audio_is_playing(mu_medievalremix))
                {
                    audio_stop_all()
                    scr_sound(mu_medievalremix)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 101
                }
            }
            else if (roomname == ("medieval_" + string(i)) && i > 5)
            {
                if (!audio_is_playing(mu_medieval))
                {
                    audio_stop_all()
                    scr_sound(mu_medieval)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 99
                }
            }
        }
    }
    if (string_letters(roomname) == "ruin")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("ruin_" + string(i)) && i <= 6)
            {
                if (!audio_is_playing(mu_ruin))
                {
                    audio_stop_all()
                    scr_sound(mu_ruin)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 112
                }
            }
            else if (roomname == ("ruin_" + string(i)) && i > 6)
            {
                if (!audio_is_playing(mu_ruinremix))
                {
                    audio_stop_all()
                    scr_sound(mu_ruinremix)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 113
                }
            }
        }
    }
    if (string_letters(roomname) == "chateau")
    {
        if (!audio_is_playing(mu_chateau))
        {
            audio_stop_all()
            scr_sound(mu_chateau)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 100
        }
    }
    if (string_letters(roomname) == "farm")
    {
        if (!audio_is_playing(mu_farm))
        {
            audio_stop_all()
            scr_sound(mu_farm)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 123
        }
    }
    if (string_letters(roomname) == "graveyard")
    {
        if (!audio_is_playing(mu_graveyard))
        {
            audio_stop_all()
            scr_sound(mu_graveyard)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 125
        }
    }
    if (string_letters(roomname) == "ufo")
    {
        if (!audio_is_playing(mu_pinball))
        {
            audio_stop_all()
            scr_sound(mu_pinball)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 124
        }
    }
    if (string_letters(roomname) == "beach")
    {
        if (!audio_is_playing(mu_beach))
        {
            audio_stop_all()
            scr_sound(mu_beach)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 131
        }
    }
    if (string_letters(roomname) == "forest")
    {
        if (roomname == "forest_4" || roomname == "forest_4b")
        {
            if (!audio_is_playing(mu_gustavo))
            {
                audio_stop_all()
                scr_sound(mu_gustavo)
                audio_sound_set_track_position(global.music, fadeoff)
                pausedmusic = 127
            }
        }
        else if (!audio_is_playing(mu_forest))
        {
            audio_stop_all()
            scr_sound(mu_forest)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 128
        }
    }
    if (string_letters(roomname) == "entrancesecret" || string_letters(roomname) == "chateausecret" || string_letters(roomname) == "strongcoldsecret" || string_letters(roomname) == "medievalsecret")
    {
        if (!audio_is_playing(mu_medievalsecret))
        {
            audio_stop_all()
            scr_sound(mu_medievalsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 94
        }
    }
    if (string_letters(roomname) == "ruinsecret")
    {
        if (!audio_is_playing(mu_ruinsecret))
        {
            audio_stop_all()
            scr_sound(mu_ruinsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 95
        }
    }
    if (string_letters(roomname) == "dungeonsecret")
    {
        if (!audio_is_playing(mu_dungeonsecret))
        {
            audio_stop_all()
            scr_sound(mu_dungeonsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 96
        }
    }
    if (string_letters(roomname) == "dragonlair")
    {
        if (!audio_is_playing(mu_dragonlair))
        {
            audio_stop_all()
            scr_sound(mu_dragonlair)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 120
        }
    }
    if (string_letters(roomname) == "floorroom")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("floor1_room" + string(i)) && i <= 9)
            {
                if (!audio_is_playing(mu_desert))
                {
                    audio_stop_all()
                    scr_sound(mu_desert)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 89
                }
            }
            else if (roomname == ("floor1_room" + string(i)) && i > 9)
            {
                if (!audio_is_playing(mu_ufo))
                {
                    audio_stop_all()
                    scr_sound(mu_ufo)
                    audio_sound_set_track_position(global.music, fadeoff)
                    pausedmusic = 91
                }
            }
        }
    }
    if (string_letters(roomname) == "floorsecret")
    {
        if (!audio_is_playing(mu_desertsecret))
        {
            audio_stop_all()
            scr_sound(mu_desertsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 122
        }
    }
    if (room == custom_lvl_room)
        alarm[0] = 4
    if (string_letters(roomname) == "ufosecret")
    {
        if (!audio_is_playing(mu_pinballsecret))
        {
            audio_stop_all()
            scr_sound(mu_pinballsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 126
        }
    }
    if (string_letters(roomname) == "graveyardsecret")
    {
        if (!audio_is_playing(mu_graveyardsecret))
        {
            audio_stop_all()
            scr_sound(mu_graveyardsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 129
        }
    }
    if (string_letters(roomname) == "farmsecret")
    {
        if (!audio_is_playing(mu_farmsecret))
        {
            audio_stop_all()
            scr_sound(mu_farmsecret)
            audio_sound_set_track_position(global.music, fadeoff)
            pausedmusic = 130
        }
    }
}
