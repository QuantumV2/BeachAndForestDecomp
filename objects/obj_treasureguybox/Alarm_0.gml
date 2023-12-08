if (current_arr > (array_length_1d(content_arr) - 1))
    return;
var _content = content_arr[current_arr]
var _hsp = 0
if ((current_arr % 2) == 0)
    _hsp = 2
else
    _hsp = -2
with (instance_create(x, y, _content))
{
    depth = (other.depth - 1)
    vsp = -8
    hsp = _hsp
}
current_arr++
alarm[0] = count
