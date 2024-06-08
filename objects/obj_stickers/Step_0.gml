frameCounter++
var hehe = irandom_range(0, array_length(sticks) - 1)
for (var i = 0; i < array_length(stickers) - 1; i++)
{
	stickers[i].size = lerp(stickers[i].size, 1, 0.8)
}
if (array_length(sticks) > 0) && (frameCounter >= ((array_length(sticks) == 1) ? 2 : 0))
{
	array_push(stickers, sticks[hehe])
	array_delete(sticks, hehe, 1)
	if (array_length(sticks) > 0) && irandom_range(0, 1)
	{
		hehe = irandom_range(0, array_length(sticks) - 1)
		array_push(stickers, sticks[hehe])
		array_delete(sticks, hehe, 1)
	}
	audio_play_sound(asset_get_index("keyClick" + string(irandom_range(1, 9))), 0, false)
	frameCounter = 0;
}
else if array_length(sticks) <= 0 && frameCounter >= 45
{
	audio_play_sound(asset_get_index("keyClick" + string(irandom_range(1, 9))), 0, false)
	array_delete(stickers, 0, 1)
	if (array_length(stickers) > 0) && irandom_range(0, 1)
		array_delete(stickers, 0, 1)
	if array_length(stickers) <= 0
		instance_destroy();
}