function live_async_http() {
    if (argument_count > 0)
        var l_e = argument[0]
    else
        l_e = undefined
    if (l_e == undefined)
        l_e = async_load
    if (!live_async_http_check(l_e))
        return 0;
    global.g_live_request_id = undefined
    if (ds_map_find_value(l_e, "status") < 0 || ds_map_find_value(l_e, "result") == undefined)
        return 0;
    var l_json = ds_map_find_value(l_e, "result")
    var l_map = json_decode(l_json)
    if (l_map == -1 || ds_map_exists(l_map, "default"))
    {
        if (string_char_at(l_json, 1) == "{" && string_char_at(l_json, ((string_length(l_json) - 1) + 1)) == "]")
            l_json += "}"
        l_map = json_decode(l_json)
        if (l_map == -1 || ds_map_exists(l_map, "default"))
        {
            live_log((("Invalid JSON response (" + gml_std_Std_string((string_length(l_json) / 1000))) + " bytes)"))
            return 0;
        }
    }
    if (global.g_live_request_guid == undefined)
        live_async_http_0(l_map)
    live_async_http_1(l_map)
    ds_map_destroy(l_map)
}