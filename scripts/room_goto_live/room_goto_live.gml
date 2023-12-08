function room_goto_live() {
    var l_rm = argument[0]
    if (ds_map_exists(global.g_live_live_rooms, l_rm) && ds_map_exists(global.g_live_live_room_data, l_rm))
    {
        global.g_live_live_room = l_rm
        if (!room_exists(global.g_live_blank_room))
            show_error("Please add a completely empty room, add live_room_start(); to it's Creation Code, and assign it to live_blank_room in obj_gmlive's create event.", 0)
        room_goto(global.g_live_blank_room)
        return 0;
    }
    room_goto(l_rm)
}