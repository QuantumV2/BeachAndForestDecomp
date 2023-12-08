function live_async_http_check() {
    var l_e = argument[0]
    return (ds_map_find_value(l_e, "id") == global.g_live_request_id && ds_map_find_value(l_e, "status") <= 0);
}