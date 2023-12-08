function __lnc__lf1() {
    var l_n1 = argument_count
    if (l_n1 == 0)
        return 0;
    var l_r1 = argument[0]
    for (var l_i1 = 1; l_i1 < l_n1; l_i1++)
    {
        var l_v1 = argument[l_i1]
        if (l_v1 > l_r1)
            l_r1 = l_v1
    }
    return l_r1;
}