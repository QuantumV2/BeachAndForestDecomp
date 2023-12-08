function __lnc__std_Std_string() {
    var l_value = argument[0]
    if (l_value == undefined)
        return "null";
    if is_string(l_value)
        return l_value;
    if is_real(l_value)
    {
        var l_s = string_format(l_value, 0, 16)
        var l_n = string_byte_length(l_s)
        var l_i = l_n
        while (l_i > 0)
        {
            switch string_byte_at(l_s, l_i)
            {
                case 48:
                    l_i--
                    continue
                case 46:
                    l_i--
                    break
                default:
                    break
            }
    
        }
        return string_copy(l_s, 1, l_i);
    }
    return string(l_value);
}