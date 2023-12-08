function live_async_http_0() {
    var l_map = argument[0]
    global.g_live_is_ready = 1
    global.g_live_request_guid = ds_map_find_value(l_map, "guid")
    if (ds_map_find_value(l_map, "version") == undefined || ds_map_find_value(l_map, "version") < 105)
        show_error("Outdated GMLive server detected! Please update the included files from the extension.", 0)
    var l_list = ds_map_find_value(l_map, "shaders")
    var l_n = ds_list_size(l_list)
    for (var l_i = 0; l_i < l_n; l_i++)
    {
        var l_s = ds_list_find_value(l_list, l_i)
        gml_asset_add(l_s, asset_get_index(l_s))
    }
    l_list = ds_map_find_value(l_map, "scripts")
    l_n = ds_list_size(l_list)
    for (l_i = 0; l_i < l_n; l_i += 2)
    {
        var l_scrName = ds_list_find_value(l_list, l_i)
        var l_scrFunc = live_script_get_index(l_scrName)
        if (l_scrFunc == -1)
            l_scrFunc = asset_get_index(l_scrName)
        gml_func_add(ds_list_find_value(l_list, (l_i + 1)), l_scrFunc)
        ds_map_set(global.g_gml_func_script_id, l_scrName, l_scrFunc)
    }
    var l_buf = buffer_create(1024, buffer_grow, 1)
    l_list = ds_map_find_value(l_map, "globals")
    l_n = ds_list_size(l_list)
    if (l_n > 0)
    {
        buffer_seek(l_buf, buffer_seek_start, 0)
        buffer_write(l_buf, buffer_text, "globalvar ")
        buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, 0))
        for (l_i = 1; l_i < l_n; l_i++)
        {
            buffer_write(l_buf, buffer_text, ", ")
            buffer_write(l_buf, buffer_text, ds_list_find_value(l_list, l_i))
        }
        buffer_write(l_buf, buffer_string, ";")
        buffer_seek(l_buf, buffer_seek_start, 0)
        global.g_live_live_globals = gml_source_create("globalvar", buffer_read(l_buf, buffer_string), "globalvar", 1)
    }
    else
        global.g_live_live_globals = undefined
    buffer_delete(l_buf)
    var l_srcMap = global.g_live_live_macros
    ds_map_clear(l_srcMap)
    l_list = ds_map_find_value(l_map, "macros")
    l_n = ds_list_size(l_list)
    for (l_i = 0; l_i < l_n; l_i += 2)
    {
        l_s = ds_list_find_value(l_list, l_i)
        var l_s1 = ("macro:" + l_s)
        ds_map_set(l_srcMap, l_s, gml_source_create(l_s1, ((("#macro " + l_s) + " ") + gml_std_Std_string(ds_list_find_value(l_list, (l_i + 1)))), l_s1, 1))
    }
    l_srcMap = global.g_live_live_enums
    ds_map_clear(l_srcMap)
    l_list = ds_map_find_value(l_map, "enums")
    var l_names = ds_map_find_value(l_map, "enumnames")
    l_n = ds_list_size(l_list)
    for (l_i = 0; l_i < l_n; l_i++)
    {
        l_s = ds_list_find_value(l_list, l_i)
        l_s = ds_list_find_value(l_names, l_i)
        ds_map_set(l_srcMap, l_s, gml_source_create(("enum " + l_s), ds_list_find_value(l_list, l_i), ("enum " + l_s), 1))
    }
    live_log("Ready!")
}