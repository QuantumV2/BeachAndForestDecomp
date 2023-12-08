function __lnc__f1783() {
    if (argument[2] < 0 || argument[2] > 7)
        return gml_thread_error((("Index (" + __lnc__std_Std_string(argument[2])) + ") is out of range [0..7]"));
    if argument[0]
    {
        view_visible[argument[2]] = argument[1]
        return undefined;
    }
    else
        return view_visible[argument[2]];
}