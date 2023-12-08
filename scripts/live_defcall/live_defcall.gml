function live_defcall() {
    var l_argc = (argument_count - 1)
    var l_def = argument[l_argc]
    if (global.g_live_request_guid == undefined)
        return 0;
    else
    {
        var l_stack = debug_get_callstack()
        var l_origin = l_stack[1]
        var l_data = ds_map_find_value(global.g_live_live_map, l_origin)
        if (l_data == undefined)
        {
            var l_co = gml_std_string_pos_ext(l_origin, ":")
            if (l_co >= 0)
            {
                l_data = ds_map_find_value(global.g_live_live_map, gml_std_string_substr(l_origin, 0, l_co))
                if (l_data != undefined)
                    ds_map_set(global.g_live_live_map, l_origin, l_data)
            }
        }
        if (l_data == undefined)
            return 0;
        else
        {
            var l_pg = l_data[0]
            if (l_pg == undefined)
                return 0;
            else
            {
                var l_pg1 = l_pg[14]
                var l_vals = array_create(l_argc)
                while (--l_argc >= 0)
                    array_set(l_vals, l_argc, argument[l_argc])
                var l_th = gml_program_call_v(l_pg, l_pg1, l_vals, 0)
                if (l_th[2] == 3)
                {
                    global.g_live_result = l_th[1]
                    return 1;
                }
                else if (l_th[2] == 4)
                {
                    global.g_live_result = l_def
                    live_log(("Runtime error: " + gml_thread_get_error(l_th)))
                    return 1;
                }
                else
                    return 0;
            }
        }
    }
}