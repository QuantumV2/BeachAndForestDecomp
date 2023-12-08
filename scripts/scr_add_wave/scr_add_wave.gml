function scr_add_wave() {
    var _wave = argument[0]
    var _enemynumber = argument[1]
    var _obj = argument[2]
    var _random = argument[3]
    var _spawnpoint = argument[4]
    baddie_arr[_wave, _enemynumber] = _obj
    baddie_random[_wave, _enemynumber] = _random
    if (!_random)
        baddie_spawnpoint[_wave, _enemynumber] = _spawnpoint
}