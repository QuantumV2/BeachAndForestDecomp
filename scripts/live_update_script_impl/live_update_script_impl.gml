function live_update_script_impl() {
    /*
    WARNING: Recursive script decompilation (for asset type resolution) failed for vm_gml_thread_exec_call
    
    System.InvalidOperationException: The stack got misaligned? Error 2: Attempted to duplicate 16 bytes, only found 8
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2248
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2859
       at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1814
    */
    var l_name = argument[0]
    var l_ident = argument[1]
    var l_found = global.g_live_async_http_1_found
    var l_macros = global.g_live_live_macros
    var l_enums = global.g_live_live_enums
    var l_acc = global.g_live_async_http_1_acc
    var l_data = ds_map_find_value(global.g_live_live_map, l_ident)
    if (l_data == undefined)
    {
        l_data = array_create(2)
        l_data[1, 0] = "LiveData"
        l_data[0] = undefined
        l_data[1] = l_ident
        ds_map_set(global.g_live_live_map, l_ident, l_data)
    }
    var l_source = gml_source_create(l_name, argument[2], l_name)
    var l_tokens = gml_parser_run(l_source)
    if (l_tokens == undefined)
    {
        live_log((("Error in " + l_name) + ":"))
        live_log(global.g_gml_parser_error_text)
        return 0;
    }
    ds_map_clear(l_found)
    ds_list_clear(l_acc)
    if (global.g_live_live_globals != undefined)
        ds_list_add(l_acc, global.g_live_live_globals)
    array_set(l_source, 6, l_tokens)
    var l_tokensLen = array_length_1d(l_tokens)
    var l_tokensLen1 = (l_tokensLen - 1)
    var l_tokensPos = -1
    while (++l_tokensPos < l_tokensLen)
    {
        var l_tk = l_tokens[l_tokensPos]
        if (l_tk[0] == 10)
        {
            var l_id = l_tk[2]
            if ds_map_exists(l_found, l_id)
            {
            }
            else
            {
                var l_src = ds_map_find_value(l_macros, l_id)
                if (l_src != undefined)
                {
                    ds_list_add(l_acc, l_src)
                    ds_map_set(l_found, l_id, 1)
                }
                else
                {
                    l_src = ds_map_find_value(l_enums, l_id)
                    if (l_src != undefined)
                    {
                        if (l_tokensPos > 0)
                        {
                            if (gml_std_haxe_boot_wget(l_tokens[(l_tokensPos - 1)], 0) == 5)
                            {
                            }
                            else if (l_tokensPos < l_tokensLen1)
                            {
                                var l__g21 = l_tokens[(l_tokensPos + 1)]
                                if (l__g21[0] == 5)
                                {
                                    var l__g31 = l__g21[1]
                                    ds_list_add(l_acc, l_src)
                                    ds_map_set(l_found, l_id, 1)
                                }
                            }
                            else
                            {
                                ds_list_add(l_acc, l_src)
                                ds_map_set(l_found, l_id, 1)
                            }
                        }
                        else if (l_tokensPos < l_tokensLen1)
                        {
                            var l__g21 = l_tokens[(l_tokensPos + 1)]
                            if (l__g21[0] == 5)
                            {
                                var l__g31 = l__g21[1]
                                ds_list_add(l_acc, l_src)
                                ds_map_set(l_found, l_id, 1)
                            }
                        }
                        else
                        {
                            ds_list_add(l_acc, l_src)
                            ds_map_set(l_found, l_id, 1)
                        }
                    }
                    else
                        ds_map_set(l_found, l_id, 1)
                }
            }
        }
    }
    ds_list_add(l_acc, l_source)
    var l_srci = ds_list_size(l_acc)
    var l_srcs = array_create(l_srci, 0)
    while (--l_srci >= 0)
        array_set(l_srcs, l_srci, ds_list_find_value(l_acc, l_srci))
    var l_pg = gml_program_create(l_srcs)
    if (!l_pg[13])
    {
        live_log((("Error in " + l_name) + ":"))
        live_log(l_pg[11])
        gml_program_destroy(l_pg)
        return 0;
    }
    if (l_pg[11] != undefined)
    {
        live_log((("Warning in " + l_name) + ":"))
        live_log(l_pg[11])
    }
    array_set(l_pg, 14, l_name)
    live_log((("Reloaded " + l_name) + "."))
    if (l_data[0] != undefined)
        gml_program_destroy(l_data[0])
    array_set(l_data, 0, l_pg)
}