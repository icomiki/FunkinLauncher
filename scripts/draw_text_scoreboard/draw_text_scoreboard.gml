// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_scoreboard(a, b, text, alpha = image_alpha){
	text = string_replace(text, "…", "...")
	var lol = (draw_get_font() == Font2) ? 36 : 18
	shader_set(Shader1)
	draw_set_color(#00ccff)
	draw_set_alpha(alpha)
	draw_text_ext(a, b, text, lol, 1000)
	shader_reset()
	draw_set_color(c_white)
	draw_text_ext(a, b, text, lol, 1000)
	draw_set_alpha(1)
}