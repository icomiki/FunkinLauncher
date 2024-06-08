draw_sprite_ext(volumebox, 0, display_get_gui_width()/2, y, 0.5, 0.5, 0, c_white, image_alpha)
draw_sprite_ext(bars_10, 0, display_get_gui_width()/2, y + 7, 0.5, 0.5, 0, c_white, 0.4 * image_alpha)
if volume
	draw_sprite_ext(asset_get_index("bars_" + string(volume)), 0, display_get_gui_width()/2, y + 7, 0.5, 0.5, 0, c_white, image_alpha)