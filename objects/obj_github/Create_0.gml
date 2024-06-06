window_set_cursor(cr_none)
cursor_sprite = cursor_default
repo = ""
ini_open("launcheroptions.ini")
repo = ini_read_string("Launcher", "GitHubRepository", "ShadowMario/FNF-PsychEngine")
var mode = ini_read_real("Launcher", "Mode", 1)
ini_close()
if !mode
{
	instance_create_depth(0, 0, depth, obj_itch)
	instance_destroy(id)
	exit;
}
berg = http_get("https://api.github.com/repos/" + repo + "/actions/runs?per_page=100&status=success")
bleh = noone;
bloh = noone;
bent = noone;
bang = noone;
textlol = "..."
channel = "..."
build = "..."
selectedBuild = "..."
path = ""
isDownloading = false;
buildInfo = {workflow_runs: [{display_title: "Loading...", name: "Loading...", run_started_at: "Loading...T", head_sha: "Loading...", actor: {login: "Loading..."}, head_commit: {message: "Loading..."}}]};
artifacts = 0;
arrayIndex = 0;
arrayIndex2 = 0;
artifactsMode = false;
searchMode = false;
lopass = audio_effect_create(AudioEffectType.LPF2);
lopass.cutoff = 100000;
input = "";
emitter1 = audio_emitter_create();
emitter1_bus = audio_bus_create();
audio_emitter_bus(emitter1, emitter1_bus);
audio_play_sound_on(emitter1, chartEditorLoop, true, 0, 1, 0, 0.9)
targetAlpha = 0;
lightstoDraw = 0;
creditsMode = false;
