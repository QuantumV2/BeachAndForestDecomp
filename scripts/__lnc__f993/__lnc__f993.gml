function __lnc__f993() {
    if (argument_count < 4)
    {
        gml_thread_error(("display_set_gui_maximise needs at least 4 arguments, got " + string(argument_count)))
        return 0;
    }
    else
    {
        switch argument_count
        {
            case 4:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3])
                break
            case 5:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4])
                break
            case 6:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5])
                break
            case 7:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6])
                break
            case 8:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7])
                break
            case 9:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8])
                break
            case 10:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9])
                break
            case 11:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10])
                break
            case 12:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11])
                break
            case 13:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12])
                break
            case 14:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13])
                break
            case 15:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14])
                break
            case 16:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15])
                break
            case 17:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16])
                break
            case 18:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16], argument[17])
                break
            case 19:
                display_set_gui_maximise(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16], argument[17], argument[18])
                break
            default:
                gml_thread_error(("display_set_gui_maximise takes at most 20 arguments, got " + string(argument_count)))
        }
    
    }
}