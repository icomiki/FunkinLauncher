volume = 10;
lerpYPos = 0;
alphaTarget = 0;
_timer = 0;
height = sprite_get_height(volumebox) / 2
y = -height
function show()
{
    _timer = 1;
    lerpYPos = 10;
    visible = true;
    active = true;
}
depth = depth - 500