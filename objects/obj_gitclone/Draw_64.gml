draw_set_halign(fa_left)
draw_sprite_ext(funkinviz2, 0, display_get_gui_width()/2, display_get_gui_height()/2, 2.5, 3, 0, c_white, image_alpha)
draw_sprite_ext(funkinviz2, 0, targetThingieX + 420, display_get_gui_height()/2 - 350, -1.6, 0.7, 180, c_white, image_alpha)
draw_text_scoreboard(targetThingieX + 50, display_get_gui_height()/2 - 360, hehe.songName + " - " + hehe.artist)
draw_set_font(Font2)
switch (state)
{
case states.credits:
	drawCredits()
	break;
case states.search:
	drawSearch()
	break;
case states.search2:
	drawSearch("Search for a new branch.")
	break
default:
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, selectedBuild)
draw_set_font(Font1)
draw_set_halign(fa_center)
draw_text_scoreboard(display_get_gui_width()/2 + 535, display_get_gui_height()/2 - 130, string(arrayIndex + 1) + "/" + string(array_length(buildInfo)))
draw_set_halign(fa_left)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, "Hash: " + buildInfo[arrayIndex].sha + "\nAuthor: " + buildInfo[arrayIndex].author.login + "\nBranch: " + branch)
}
drawBottom()
draw_set_color(c_black)
draw_text_ext(20, 20, "Funkin' Launcher v" + GM_version + "\nPress C for credits.\nPress S to switch repos.\nPress B to switch branches.", 18, 1000)
draw_set_color(c_white)