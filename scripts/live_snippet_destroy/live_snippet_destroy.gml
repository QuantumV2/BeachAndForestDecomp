function live_snippet_destroy() {
    var l_snippet = argument[0]
    if (l_snippet[2] != undefined)
        gml_program_destroy(l_snippet)
    else
        show_error("This snippet is already destroyed", 0)
}