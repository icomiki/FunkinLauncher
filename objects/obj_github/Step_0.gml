isDownloading = instance_exists(obj_stickers)
if searchMode && emitter1_bus.effects[0] != lopass
{
	lopass.cutoff = 100000;
	emitter1_bus.effects[0] = lopass;	
}
else if searchMode && emitter1_bus.effects[0] == lopass
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
	lopass.cutoff = lerp(lopass.cutoff, 100000, 0.3);
	if lopass.cutoff > 70000
		emitter1_bus.effects[0] = undefined;	
	fx_set_parameter(layer_fx, "g_Radius", lerp(fx_get_parameter(layer_fx, "g_Radius"), 0, 0.2));
}

if artifactsMode
{
if keyboard_check_pressed(vk_left) && arrayIndex2 - 1 > -1
{
	audio_play_sound(comboSound, 0, false)
	arrayIndex2--
}
else if keyboard_check_pressed(vk_right) && (arrayIndex2 + 1 < array_length(artifacts))
{
	audio_play_sound(comboSound, 0, false)	
	arrayIndex2++
}
else if keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)
	audio_play_sound(undo, 0, false)
}
else
{
if keyboard_check_pressed(vk_left) && arrayIndex - 1 > -1 && !isDownloading && !searchMode && !creditsMode
{
	audio_play_sound(comboSound, 0, false)
	arrayIndex--
}
else if keyboard_check_pressed(vk_right) && (arrayIndex + 1 < array_length(buildInfo.workflow_runs)) && !isDownloading && !searchMode && !creditsMode
{
	audio_play_sound(comboSound, 0, false)	
	arrayIndex++
}
else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)) && !searchMode && !creditsMode
	audio_play_sound(undo, 0, false)
}
if keyboard_check_pressed(vk_enter) && artifactsMode
{
	audio_play_sound(remote_click, 0, false)
	channel = artifacts[arrayIndex2].name
	bloh = http_get_file("https://nightly.link/" + repo + "/actions/runs/" + string(buildInfo.workflow_runs[arrayIndex].id) + "/" + channel + ".zip", working_directory + "/temp/" + buildInfo.workflow_runs[arrayIndex].head_sha + ".zip");	
	artifactsMode = false;
}
else if keyboard_check_pressed(vk_enter) && !isDownloading && buildInfo.workflow_runs[0].run_started_at != "Loading...T" && buildInfo.workflow_runs[0].run_started_at != "N/AT" && !searchMode && !creditsMode
{
	channel = "Load..."
	try
	{
	build = buildInfo.workflow_runs[arrayIndex].head_repository.full_name + " (" + string_copy(buildInfo.workflow_runs[arrayIndex].head_sha, 0, 7) + ")"
	}
	catch(e)
	{
	try
	{
	build = buildInfo.workflow_runs[arrayIndex].repository.full_name + " (" + string_copy(buildInfo.workflow_runs[arrayIndex].head_sha, 0, 7) + ")"
	}
	catch(e)
	{
	build = "Error getting repo."	
	}
	}
	audio_play_sound(remote_click, 0, false)
	bleh = http_get("https://api.github.com/repos/" + repo + "/actions/runs/" + string(buildInfo.workflow_runs[arrayIndex].id) + "/artifacts");
	isDownloading = true;
	artifactsMode = 0.5;
}
else if keyboard_check_pressed(vk_enter) && searchMode
{
	arrayIndex = 0;
	textlol = "..."
	channel = "..."
	build = "..."
	repo = input
	berg = http_get("https://api.github.com/repos/" + repo + "/actions/runs?per_page=100&status=success")
	buildInfo = {workflow_runs: [{display_title: "Loading...", name: "Loading...", run_started_at: "Loading...T", head_sha: "Loading...", actor: {login: "Loading..."}, head_commit: {message: "Loading..."}}]};
	searchMode = false;
	instance_create_depth(0, 0, depth - 100, obj_stickers)
}
else if keyboard_check_pressed(vk_enter) && !creditsMode
	audio_play_sound(undo, 0, false)	
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace)) && artifactsMode && !searchMode &&!creditsMode
	{
		textlol = "..."
		channel = "..."
		build = "..."
		audio_play_sound(undo, 0, false)
		artifactsMode = false;
		isDownloading = false;
	}
if (keyboard_check_pressed(vk_escape)) && searchMode
	{
		searchMode = false;
	}
if keyboard_check_pressed(ord("S")) && !searchMode && !artifactsMode && !creditsMode && !isDownloading && buildInfo.workflow_runs[0].run_started_at != "Loading...T"
	{
		audio_play_sound(remote_click, 0, false)
		searchMode = true
		keyboard_string = "";
	}
if keyboard_check_pressed(ord("C")) && !searchMode && !artifactsMode && !isDownloading && buildInfo.workflow_runs[0].run_started_at != "Loading...T"
{
		audio_play_sound(remote_click, 0, false)
		creditsMode = !creditsMode
}
selectedBuild = buildInfo.workflow_runs[arrayIndex].display_title

if searchMode
{
	if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && clipboard_has_text()
		keyboard_string += string_replace(clipboard_get_text(), "\n", "")
	input = keyboard_string;
	if keyboard_check_pressed(vk_anykey) && !(keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_control)  || keyboard_check_pressed(vk_alt))
		audio_play_sound(asset_get_index("keyboard" + string(irandom_range(1, 3))), 0, false, 1, 0, random_range(0.8, 1.2))
}
else
	input = "";
targetAlpha = (!isDownloading || (artifactsMode >= 0.5))
image_alpha = lerp(image_alpha, targetAlpha, 0.2)