function live_update() {
    if (global.g_live_request_url == undefined)
        return 0;
    if (global.g_live_request_id == undefined)
    {
        var l_now = current_time
        if (l_now > global.g_live_request_time)
        {
            global.g_live_request_time = (l_now + (global.g_live_request_rate * 1000))
            if (global.g_live_request_guid == undefined)
                global.g_live_request_id = http_get(((((((((global.g_live_request_url + "/init?password=") + global.g_live_request_password) + "&config=") + os_get_config()) + "&version=") + string(105)) + "&runtime=") + "2.2.5.378"))
            else
            {
                var l_url = ((global.g_live_request_url + "/update?guid=") + gml_std_Std_string(global.g_live_request_guid))
                var l_sl = global.g_live_live_sprites_stop
                var l_sln = ds_list_size(l_sl)
                if (l_sln > 0)
                {
                    l_url += ((("&sprites" + string(0)) + "=") + sprite_get_name(ds_list_find_value(l_sl, 0)))
                    var l_i = 1
                    var l__g1 = l_sln
                    while (l_i < l__g1)
                    {
                        l_url += ("+" + sprite_get_name(ds_list_find_value(l_sl, l_i)))
                        l_i++
                    }
                    ds_list_clear(l_sl)
                }
                var l_sl1 = global.g_live_live_sprites_start
                var l_sln1 = ds_list_size(l_sl1)
                if (l_sln1 > 0)
                {
                    l_url += ((("&sprites" + string(1)) + "=") + sprite_get_name(ds_list_find_value(l_sl1, 0)))
                    var l_i1 = 1
                    var l__g11 = l_sln1
                    while (l_i1 < l__g11)
                    {
                        l_url += ("+" + sprite_get_name(ds_list_find_value(l_sl1, l_i1)))
                        l_i1++
                    }
                    ds_list_clear(l_sl1)
                }
                var l_sl2 = global.g_live_shader_live_shaders_stop
                var l_sln2 = ds_list_size(l_sl2)
                if (l_sln2 > 0)
                {
                    l_url += ((("&shaders" + string(0)) + "=") + shader_get_name(ds_list_find_value(l_sl2, 0)))
                    var l_i2 = 1
                    var l__g12 = l_sln2
                    while (l_i2 < l__g12)
                    {
                        l_url += ("+" + shader_get_name(ds_list_find_value(l_sl2, l_i2)))
                        l_i2++
                    }
                    ds_list_clear(l_sl2)
                }
                var l_sl3 = global.g_live_shader_live_shaders_start
                var l_sln3 = ds_list_size(l_sl3)
                if (l_sln3 > 0)
                {
                    l_url += ((("&shaders" + string(1)) + "=") + shader_get_name(ds_list_find_value(l_sl3, 0)))
                    var l_i3 = 1
                    var l__g13 = l_sln3
                    while (l_i3 < l__g13)
                    {
                        l_url += ("+" + shader_get_name(ds_list_find_value(l_sl3, l_i3)))
                        l_i3++
                    }
                    ds_list_clear(l_sl3)
                }
                var l_rl = global.g_live_live_rooms_stop
                var l_rln = ds_list_size(l_rl)
                if (l_rln > 0)
                {
                    l_url += ((("&rooms" + string(0)) + "=") + room_get_name(ds_list_find_value(l_rl, 0)))
                    var l_i4 = 1
                    var l__g14 = l_rln
                    while (l_i4 < l__g14)
                    {
                        l_url += ("+" + room_get_name(ds_list_find_value(l_rl, l_i4)))
                        l_i4++
                    }
                    ds_list_clear(l_rl)
                }
                var l_rl1 = global.g_live_live_rooms_start
                var l_rln1 = ds_list_size(l_rl1)
                if (l_rln1 > 0)
                {
                    l_url += ((("&rooms" + string(1)) + "=") + room_get_name(ds_list_find_value(l_rl1, 0)))
                    var l_i5 = 1
                    var l__g15 = l_rln1
                    while (l_i5 < l__g15)
                    {
                        l_url += ("+" + room_get_name(ds_list_find_value(l_rl1, l_i5)))
                        l_i5++
                    }
                    ds_list_clear(l_rl1)
                }
                global.g_live_request_id = http_get(l_url)
            }
        }
    }
}