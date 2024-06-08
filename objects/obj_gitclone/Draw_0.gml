try {
var prev = lightstoDraw
lightstoDraw = 0;
var k = mv_get_data(AudioIDinMV,audio_sound_get_track_position(AudioID),audio_sound_length(AudioID), 100)
for(var i = 0; i < array_length(k);i+=10){
	var length = k[i]
	lightstoDraw += round(length)
}
lightstoDraw = lerp(prev, lightstoDraw, 0.2)
}
catch(e)
{
	show_debug_message(e)	
}