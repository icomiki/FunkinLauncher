window_set_cursor(cr_none)
cursor_sprite = cursor_default
repo = ""
ini_open("launcheroptions.ini")
repo = ini_read_string("Launcher", "GitHubRepository", "ShadowMario/FNF-PsychEngine")
ini_close()
berg = http_get("https://api.github.com/repos/" + repo + "/commits?per_page=100&status=success")
bleh = noone;
bloh = noone;
bent = noone;
bang = http_get("https://api.github.com/repos/" + repo);
textlol = "..."
channel = "..."
build = "..."
selectedBuild = "..."
branch = "Loading..."
path = ""
isDownloading = false;
buildInfo = loading_clone;
artifacts = 0;
arrayIndex = 0;
arrayIndex2 = 0;
state = states.select;
lopass = audio_effect_create(AudioEffectType.LPF2);
lopass.cutoff = 100000;
input = "";
emitter1 = audio_emitter_create();
emitter1_bus = audio_bus_create();
audio_emitter_bus(emitter1, emitter1_bus);
folder_array = []
file = file_find_first("~music/*", fa_directory );
array_push(folder_array, file)
show_debug_message("Adding "+ file
+"to folder_array")

while (file != "")
{
    file = file_find_next();
	if file != ""
	{
    array_push(folder_array, file)
    show_debug_message("Adding "+ file +"to folder_array")
	}
}
randomise();
namething = folder_array[irandom_range(0, array_length(folder_array) - 1)]
var thing = buffer_load(working_directory + "~music/" + namething + "/" + namething + "-metadata.json")
var file = buffer_read(thing, buffer_string);
buffer_delete(thing);
hehe = json_parse(file)
show_debug_message(hehe.songName)
show_debug_message(hehe.artist)
snd = audio_create_stream("~music/" + namething + "/" + namething + ".ogg");
AudioIDinMV = mv_load(@"~music/" + namething + "/" + namething + ".ogg")
AudioID = audio_play_sound_on(emitter1, snd, hehe.looped, 0, 1, 0, 1)
targetAlpha = 0;
showMusic = true;
targetThingieX = display_get_gui_width() + 200;
alarm[0] = 120;
lightstoDraw = 0;
