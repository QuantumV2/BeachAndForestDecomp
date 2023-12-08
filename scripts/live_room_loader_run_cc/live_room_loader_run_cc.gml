function live_room_loader_run_cc() {
    /*
    WARNING: Recursive script decompilation (for asset type resolution) failed for vm_gml_thread_exec_call
    
    System.InvalidOperationException: The stack got misaligned? Error 2: Attempted to duplicate 16 bytes, only found 8
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2248
       at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 2859
       at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\utmtce\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 1814
    */
    var l_ccPath = argument[1]
    var l_ccProgram = gml_program_create([gml_source_create(l_ccPath, argument[0], l_ccPath)])
    var l_ccError = l_ccProgram[11]
    if (l_ccError == undefined)
    {
        var l_ccThread = gml_program_call_v(l_ccProgram, l_ccPath, array_create(0))
        if (l_ccThread[2] != 3)
        {
            l_ccError = l_ccThread[7]
            if (l_ccError == undefined)
                l_ccError = (l_ccPath + ": unknown execution error")
        }
    }
    gml_program_destroy(l_ccProgram)
    if (l_ccError != undefined)
        live_log(l_ccError)
}