function drawCredits(){
	draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, "Funkin' Launcher Credits")
	draw_set_font(Font1)
	draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, "The Funkin' Crew, Inc. - Original internal tool\nicomiki - Creator of Funkin' Launcher\nTori - Background Launcher Art")
}

function drawSearch(text = "Search for a new repository."){
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 130, text)
draw_set_font(Font1)
draw_text_scoreboard(display_get_gui_width()/2 - 600, display_get_gui_height()/2 - 50, input)	
}

function drawBottom()
{
	draw_sprite(funkinviz, 0, display_get_gui_width()/2, 700)
	for (var i = 0; i < lightstoDraw; i++)
		draw_sprite(funkinvizlight, 0, display_get_gui_width()/2 - 590 + (i * 12), 730)
	draw_set_font(Font1)
	if string_length(channel) > 11
	draw_text_scoreboard(display_get_gui_width()/2 - 585, 680, string_copy(channel, 0, 9) + "...", 1)
	else
	draw_text_scoreboard(display_get_gui_width()/2 - 585, 680, channel, 1)

	draw_text_scoreboard(display_get_gui_width()/2 - 360, 680, build, 1)
	draw_set_halign(fa_center)
	draw_text_scoreboard(display_get_gui_width()/2 + 502, 680, textlol, 1)

	draw_set_halign(fa_left)	
}

function unzipCheck()
{
	var _id = async_load[? "id"];

	if (_id == bent)
	{
	    var _status = async_load[? "status"];

	    if (_status < 0)
	    {
	        textlol = "Unzip Fail";
	    }
		else
		{
			textlol = "Cleaning up..."
			file_delete(path);
			textlol = "Done!"
		}
		isDownloading = false;
		audio_play_sound(openWindow, 0, false)
	}	
}

function resetBottom()
{
	textlol = "..."
	channel = "..."
	build = "..."	
}

function searchViz()
{
if state >= states.search && emitter1_bus.effects[0] != lopass
{
	lopass.cutoff = 2000;
	emitter1_bus.effects[0] = lopass;	
}
else if state >= states.search && emitter1_bus.effects[0] == lopass
{
	var layerd = layer_get_id("Background")
	var layer_fx = layer_get_fx(layerd);
	lopass.cutoff = lerp(lopass.cutoff, 200, 0.2);
	fx_set_parameter(layer_fx, "g_Radius", lerp(fx_get_parameter(layer_fx, "g_Radius"), 10, 0.2));
}
else
{
	var layerd = layer_get_id("Background")
	var layer_fx = layer_get_fx(layerd);
	lopass.cutoff = lerp(lopass.cutoff, 2000, 0.3);
	if lopass.cutoff > 1500
		emitter1_bus.effects[0] = undefined;	
	fx_set_parameter(layer_fx, "g_Radius", lerp(fx_get_parameter(layer_fx, "g_Radius"), 0, 0.2));
}	
}

function searchLogic()
{
if state >= states.search
{
	if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text()
		keyboard_string += string_replace(clipboard_get_text(), "\n", "")
	input = keyboard_string;
	if keyboard_check_pressed(vk_anykey) && !(keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_control)  || keyboard_check_pressed(vk_alt))
		audio_play_sound(asset_get_index("keyboard" + string(irandom_range(1, 3))), 0, false, 1, 0, random_range(0.8, 1.2))
}
else
	input = "";	
}






#macro loading_clone [{author: {login: "Loading..."}, commit: {message: "Loading..."}, sha: "Loading..."}]
#macro invalid_clone [{author: {login: "N/A"}, commit: {message: "Invalid Repository"}, sha: "N/A"}];

enum states
{
	select,
	credits,
	artifacts,
	search,
	search2
}