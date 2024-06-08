for (var i = 0; i < array_length(stickers); i++)
{
	if i == stickLength - 1 {
		stickers[i].x = display_get_gui_width()/2
	stickers[i].y = display_get_gui_height()/2 }
	draw_sprite_ext(stickers[i].index, 0, stickers[i].x, stickers[i].y, stickers[i].size, stickers[i].size, stickers[i].rot, c_white, 1)	
}