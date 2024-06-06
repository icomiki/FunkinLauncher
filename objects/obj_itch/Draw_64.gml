draw_set_halign(fa_left)
draw_sprite(funkinviz, 0, display_get_gui_width()/2, 700)
for (var i = 0; i < lightstoDraw; i++)
	draw_sprite(funkinvizlight, 0, display_get_gui_width()/2 - 590 + (i * 12), 730)
if creditsMode
{
draw_sprite_ext(funkinviz2, 0, display_get_gui_width()/2, display_get_gui_height()/2, 2.5, 3, 0, c_white, image_alpha)
draw_set_font(Font2)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, "Funkin' Launcher Credits")
draw_set_font(Font1)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, "The Funkin' Crew, Inc. - Original internal tool\nicomiki - Creator of Funkin' Launcher\nTori - Background Launcher Art")
}
else
{
draw_sprite(funkinviz2, 0, display_get_gui_width()/2, display_get_gui_height()/2)
draw_set_font(Font2)
draw_text_scoreboard(display_get_gui_width()/2 - 200, display_get_gui_height()/2 - 30, selectedBuild)
}
draw_set_font(Font1)
draw_text_scoreboard(display_get_gui_width()/2 - 585, 680, channel)
draw_text_scoreboard(display_get_gui_width()/2 - 360, 680, build)
draw_set_halign(fa_center)
draw_text_scoreboard(display_get_gui_width()/2 + 502, 680, textlol)

draw_set_halign(fa_left)
draw_set_color(c_black)
draw_text_ext(20, 20, "Funkin' Launcher v" + GM_version + "\nPress C for credits.", 18, 1000)
draw_set_color(c_white)