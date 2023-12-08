function live_script_get_index() {
    var l_q = ds_map_find_value(global.g_live_bug24929_map, argument[0])
    if (l_q == undefined)
        return -1;
    return l_q;
}