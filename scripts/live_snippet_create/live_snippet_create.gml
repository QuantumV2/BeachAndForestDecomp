function live_snippet_create() {
    if (argument_count > 1)
        var l_name = argument[1]
    else
        l_name = "snippet"
    var l_pg = gml_program_create([gml_source_create(l_name, argument[0], "")])
    if (l_pg[11] == undefined)
        return l_pg;
    else
    {
        global.g_live_result = l_pg[11]
        gml_program_destroy(l_pg)
        return undefined;
    }
}