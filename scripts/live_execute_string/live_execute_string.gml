function live_execute_string() {
    var l_pg = gml_program_create([gml_source_create("execute_string", argument[0], "execute_string")])
    if (l_pg[11] == undefined)
    {
        var l_th = gml_program_call_v(l_pg, "execute_string", array_create(0))
        if (l_th[2] == 3)
        {
            var l_ok = 1
            global.g_live_result = l_th[1]
        }
        else
        {
            l_ok = 0
            global.g_live_result = l_th[7]
            if (global.g_live_result == undefined)
                global.g_live_result = "(unknown error)"
        }
    }
    else
    {
        l_ok = 0
        global.g_live_result = l_pg[11]
    }
    gml_program_destroy(l_pg)
    return l_ok;
}