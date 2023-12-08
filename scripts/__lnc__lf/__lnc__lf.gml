function __lnc__lf() {
    var l_n = argument_count
    if (l_n == 0)
        return 0;
    var l_r = argument[0]
    for (var l_i = 1; l_i < l_n; l_i++)
    {
        var l_v = argument[l_i]
        if (l_v < l_r)
            l_r = l_v
    }
    return l_r;
}