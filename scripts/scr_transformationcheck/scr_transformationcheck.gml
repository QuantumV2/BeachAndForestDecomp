function scr_transformationcheck() {
    var b = 1
    for (i = 0; i < (array_length_1d(transformation) - 1); i += 1)
    {
        if (state == transformation[i])
            b = 0
    }
    return b;
}