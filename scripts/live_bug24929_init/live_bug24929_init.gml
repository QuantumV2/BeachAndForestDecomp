function live_bug24929_init() {
    var l_map = ds_map_create()
    var l_i = scr_player_cheeseball
    while script_exists(l_i)
    {
        ds_map_set(l_map, script_get_name(l_i), l_i)
        l_i++
    }
    return l_map;
}