if keyboard_check_pressed(vk_left) && arrayIndex - 1 > -1 && !isDownloading && !creditsMode
{
	audio_play_sound(comboSound, 0, false)
	arrayIndex--
}
else if keyboard_check_pressed(vk_right) && (arrayIndex + 1 < array_length(buildInfo.uploads)) && !isDownloading && !creditsMode
{
	audio_play_sound(comboSound, 0, false)	
	arrayIndex++
}
else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)) && !creditsMode
	audio_play_sound(undo, 0, false)
if keyboard_check_pressed(vk_enter) && !isDownloading && array_length(buildInfo.uploads) != 1 && !creditsMode
{
	channel = buildInfo.uploads[arrayIndex].channel_name
	build = buildInfo.uploads[arrayIndex].filename + " (Version " + string(buildInfo.uploads[arrayIndex].build.version) + ", " + string_split(buildInfo.uploads[arrayIndex].updated_at, " ")[0] + ")"
	audio_play_sound(remote_click, 0, false)
	bleh = http_get("https://itch.io/api/1/Be6Azj8koJauVU2sy5alermeLFE7dS3gg5Y7CrWE/upload/" + string(buildInfo.uploads[arrayIndex].build.upload_id) + "/download");
	isDownloading = true;
}
else if keyboard_check_pressed(vk_enter) && !creditsMode
	audio_play_sound(undo, 0, false)	
if keyboard_check_pressed(ord("C")) && !isDownloading
	{
		audio_play_sound(remote_click, 0, false)
		creditsMode = !creditsMode
	}
selectedBuild = buildInfo.uploads[arrayIndex].channel_name