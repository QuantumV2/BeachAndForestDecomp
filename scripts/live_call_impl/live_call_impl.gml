function live_call_impl() {
    /*
    WARNING: Recursive script decompilation (for asset type resolution) failed for vm_gml_thread_exec_call
    
    System.InvalidOperationException: The stack got misaligned? Error 2: Attempted to duplicate 16 bytes, only found 8
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2248
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2859
       at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1814
    */
    if (global.g_live_request_guid == undefined)
        return 0;
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
    var l_pg = l_data[0]
    if (l_pg == undefined)
        return 0;
    var l_th = gml_program_call_v(l_pg, l_pg[14], script_execute(argument[0]), 0)
    if (l_th[2] == 3)
    {
        global.g_live_result = l_th[1]
        return 1;
    }
    else if (l_th[2] == 4)
    {
        global.g_live_result = argument[1]
        live_log(("Runtime error: " + gml_thread_get_error(l_th)))
        return 1;
    }
    else
        return 0;
}