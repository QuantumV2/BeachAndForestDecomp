function scr_string_split() {
    my_string = argument[0]
    explode = argument[1]
    numbers = string_count(explode, my_string)
    for (i = 0; i < numbers; i += 1)
    {
        pos = string_pos(explode, my_string)
        array[i] = string_copy(my_string, 1, (pos - 1))
        my_string = string_delete(my_string, 1, pos)
    }
    return array;
}