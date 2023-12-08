function room_set_live() {
    var l_rm = argument[0]
    if argument[1]
    {
        if ds_map_exists(global.g_live_live_rooms, l_rm)
            return 0;
        ds_map_set(global.g_live_live_rooms, l_rm, 1)
        var l_i = ds_list_find_index(global.g_live_live_rooms_stop, l_rm)
        if (l_i >= 0)
            ds_list_delete(global.g_live_live_rooms_stop, l_i)
        ds_list_add(global.g_live_live_rooms_start, l_rm)
    }
    else
    {
        if (!(ds_map_exists(global.g_live_live_rooms, l_rm)))
            return 0;
        ds_map_delete(global.g_live_live_rooms, l_rm)
        ds_map_delete(global.g_live_live_room_data, l_rm)
        l_i = ds_list_find_index(global.g_live_live_rooms_start, l_rm)
        if (l_i >= 0)
            ds_list_delete(global.g_live_live_rooms_start, l_i)
        ds_list_add(global.g_live_live_rooms_stop, l_rm)
    }
}