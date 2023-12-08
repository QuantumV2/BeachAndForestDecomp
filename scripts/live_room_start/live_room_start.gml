function live_room_start() {
    var l_rq = global.g_live_live_room
    if (!room_exists(l_rq))
        show_error("No live room was specified.", 0)
    var l_rd = ds_map_find_value(global.g_live_live_room_data, l_rq)
    if (l_rd == undefined)
    {
        live_log((("Warning: no live data had been received yet for " + room_get_name(l_rq)) + ", transitioning to the regular version."))
        room_goto(l_rq)
        return 0;
    }
    var l_rm2 = json_decode(l_rd)
    live_room_loader_run_impl2(l_rm2)
    ds_map_destroy(l_rm2)
}