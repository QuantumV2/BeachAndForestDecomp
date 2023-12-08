function __lnc__f1642() {
    if (argument_count < 2)
        return gml_thread_error(("layer_tile_exists needs at least 2 arguments, got " + string(argument_count)));
    else
    {
        switch argument_count
        {
            case 2:
                return layer_tile_exists(argument[0], argument[1]);
            case 3:
                return layer_tile_exists(argument[0], argument[1], argument[2]);
            case 4:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3]);
            case 5:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4]);
            case 6:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
            case 7:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
            case 8:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7]);
            case 9:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
            case 10:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
            case 11:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);
            case 12:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11]);
            case 13:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12]);
            case 14:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13]);
            case 15:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14]);
            case 16:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15]);
            case 17:
                return layer_tile_exists(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10], argument[11], argument[12], argument[13], argument[14], argument[15], argument[16]);
            default:
                return gml_thread_error(("layer_tile_exists takes at most 18 arguments, got " + string(argument_count)));
        }
    
    }
}