function __lnc__f1425() {
    if (argument_count < 2)
    {
        gml_thread_error(("shader_set_uniform_f needs at least 2 arguments, got " + string(argument_count)))
        return 0;
    }
    else
    {
        switch argument_count
        {
            case 2:
                shader_set_uniform_f(argument[0], argument[1])
                break
            case 3:
                shader_set_uniform_f(argument[0], argument[1], argument[2])
                break
            case 4:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3])
                break
            case 5:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4])
                break
            case 6:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
                break
            case 7:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6])
                break
            case 8:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7])
                break
            case 9:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8])
                break
            case 10:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9])
                break
            case 11:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10])
                break
            case 12:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11])
                break
            case 13:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12])
                break
            case 14:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13])
                break
            case 15:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14])
                break
            case 16:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15])
                break
            case 17:
                shader_set_uniform_f(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16])
                break
            default:
                gml_thread_error(("shader_set_uniform_f takes at most 18 arguments, got " + string(argument_count)))
        }
    
    }
}