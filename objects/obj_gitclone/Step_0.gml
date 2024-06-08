searchViz()

if keyboard_check_pressed(vk_left) && arrayIndex - 1 > -1 && !isDownloading && state == states.select
{
	audio_play_sound(comboSound, 0, false)
	arrayIndex--
}
else if keyboard_check_pressed(vk_right) && (arrayIndex + 1 < array_length(buildInfo)) && !isDownloading && state == states.select
{
	audio_play_sound(comboSound, 0, false)	
	arrayIndex++
}
else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)) && state == states.select
	audio_play_sound(undo, 0, false)
if keyboard_check_pressed(vk_enter) && !isDownloading && buildInfo[0].sha != "Loading..." && buildInfo[0].sha != "N/A" && state == states.select
{
	channel = branch
	audio_play_sound(remote_click, 0, false)
	bloh = http_get_file("https://github.com/" + repo + "/archive/" + buildInfo[arrayIndex].sha + ".zip", working_directory + "/temp/" + buildInfo[arrayIndex].sha + ".zip");
	isDownloading = true;
}
else if keyboard_check_pressed(vk_enter) && state = states.search
{
	arrayIndex = 0;
	resetBottom()
	repo = input
	berg = http_get("https://api.github.com/repos/" + repo + "/commits?per_page=100&status=success")
	bent = http_get("https://api.github.com/repos/" + repo)
	buildInfo = loading_clone
	state = states.select;
	instance_create_depth(0, 0, depth - 100, obj_stickers)
}
else if keyboard_check_pressed(vk_enter) && state = states.search2
{
	arrayIndex = 0;
	resetBottom()
	branch = input
	berg = http_get("https://api.github.com/repos/" + repo + "/commits?per_page=100&status=success&sha=" + branch)
	buildInfo = loading_clone
	state = states.select;
	instance_create_depth(0, 0, depth - 100, obj_stickers)
}
else if keyboard_check_pressed(vk_enter) && !creditsMode
	audio_play_sound(undo, 0, false)	
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace)) && state == states.select
	{
		resetBottom()
		audio_play_sound(undo, 0, false)
		isDownloading = false;
	}
if (keyboard_check_pressed(vk_escape)) && state >= states.search
	state = states.select;
if keyboard_check_pressed(ord("S")) && state == states.select && !isDownloading && buildInfo[0].sha != "Loading..."
{
		audio_play_sound(remote_click, 0, false)
		state = states.search;
		keyboard_string = "";
}
if keyboard_check_pressed(ord("B")) && state == states.select && !isDownloading && buildInfo[0].sha != "Loading..."
{
		audio_play_sound(remote_click, 0, false)
		state = states.search2;
		keyboard_string = "";
}
if keyboard_check_pressed(ord("C")) && state <= states.credits && !isDownloading && buildInfo[0].sha != "Loading..."
{
		audio_play_sound(remote_click, 0, false)
		state = (state == states.credits) ? states.select : states.credits;
}
selectedBuild = string_split(buildInfo[arrayIndex].commit.message, "\n\n")[0]

searchLogic()
targetAlpha = (!isDownloading || !object_exists(obj_stickers))
image_alpha = lerp(image_alpha, targetAlpha, 0.2)

if !audio_is_playing(AudioID) || keyboard_check_pressed(ord("Q"))
{
	var wowie = []
	array_copy(wowie, 0, folder_array, 0, array_length(folder_array))
	audio_stop_sound(AudioID)
	var _f = function(_element, _index)
	{
		return (_element != namething)
	}
	wowie = array_filter(wowie, _f)
	namething = wowie[irandom_range(0, array_length(wowie) - 1)]
	var thing = buffer_load(working_directory + "~music/" + namething + "/" + namething + "-metadata.json")
	var file = buffer_read(thing, buffer_string);
	buffer_delete(thing);
	hehe = json_parse(file)
	show_debug_message(hehe.songName)
	show_debug_message(hehe.artist)
	snd = audio_create_stream("~music/" + namething + "/" + namething + ".ogg");
	AudioIDinMV = mv_load(@"~music/" + namething + "/" + namething + ".ogg")
	AudioID = audio_play_sound_on(emitter1, snd, hehe.looped, 0, 1, 0, 1)
	showMusic = true;
	alarm[0] = 120;
}

	targetThingieX = lerp(targetThingieX, (showMusic == true) ? display_get_gui_width()/2 : display_get_gui_width() + 200, 0.2)