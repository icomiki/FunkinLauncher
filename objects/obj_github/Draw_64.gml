draw_set_halign(fa_left)
draw_sprite(funkinviz, 0, display_get_gui_width()/2, 700)
for (var i = 0; i < lightstoDraw; i++)
	draw_sprite(funkinvizlight, 0, display_get_gui_width()/2 - 590 + (i * 12), 730)
draw_sprite_ext(funkinviz2, 0, display_get_gui_width()/2, display_get_gui_height()/2, 2.5, 3, 0, artifactsMode ? c_aqua : c_white, image_alpha)
draw_set_font(Font2)
if creditsMode
{
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, "Funkin' Launcher Credits")
draw_set_font(Font1)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, "The Funkin' Crew, Inc. - Original internal tool\nicomiki - Creator of Funkin' Launcher\nTori - Background Launcher Art")
}
else if artifactsMode
{
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, artifacts[arrayIndex2].name)
draw_set_font(Font1)
draw_set_halign(fa_center)
draw_text_scoreboard(display_get_gui_width()/2 + 535, display_get_gui_height()/2 - 130, string(arrayIndex2 + 1) + "/" + string(array_length(artifacts)))
draw_set_halign(fa_left)
}
else if searchMode
{
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, "Search for a new repository.")
draw_set_font(Font1)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, input)
}
else
{
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, selectedBuild)
draw_set_font(Font1)
draw_set_halign(fa_center)
draw_text_scoreboard(display_get_gui_width()/2 + 535, display_get_gui_height()/2 - 130, string(arrayIndex + 1) + "/" + string(array_length(buildInfo.workflow_runs)))
draw_set_halign(fa_left)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, "Workflow: " + buildInfo.workflow_runs[arrayIndex].name + "\nActor: " + buildInfo.workflow_runs[arrayIndex].actor.login + "\nRun at: " + string_split(buildInfo.workflow_runs[arrayIndex].run_started_at, "T")[0] + "\nTriggering commit: " + string_split(buildInfo.workflow_runs[arrayIndex].head_commit.message, "\n\n")[0]  + "\nCommit hash: " + buildInfo.workflow_runs[arrayIndex].head_sha)
}
draw_set_font(Font1)
if string_length(channel) > 11
draw_text_scoreboard(display_get_gui_width()/2 - 585, 680, string_copy(channel, 0, 9) + "...", 1)
else
draw_text_scoreboard(display_get_gui_width()/2 - 585, 680, channel, 1)

draw_text_scoreboard(display_get_gui_width()/2 - 360, 680, build, 1)
draw_set_halign(fa_center)
draw_text_scoreboard(display_get_gui_width()/2 + 502, 680, textlol, 1)

draw_set_halign(fa_left)
draw_set_color(c_black)
draw_text_ext(20, 20, "Funkin' Launcher v" + GM_version + "\nPress C for credits.\nPress S to switch repos.", 18, 1000)
draw_set_color(c_white)