var checkin = true;
if instance_exists(obj_github)
	checkin = !obj_github.searchMode;
var MS = delta_time/1000
if keyboard_check_pressed(187) && checkin
{
	show()
	audio_play_sound((volume >= 10) ? VolMAX : Volup, 0, false)
	volume += (volume >= 10) ? 0 : 1
	audio_master_gain(volume/10)
}
else if keyboard_check_pressed(189) && checkin
{
	show()
	audio_play_sound((volume <= 0) ? VolMAX : Voldown, 0, false)
	volume -= (volume <= 0) ? 0 : 1
	audio_master_gain(volume/10)
	show()
}
y = coolLerp(y, lerpYPos, 0.1);
image_alpha = coolLerp(image_alpha, alphaTarget, 0.25);
// Animate sound tray thing
if (_timer > 0)
{
      _timer -= (MS / 1000);
      alphaTarget = 1;
}
else if (y >= -height)
{
      lerpYPos = -height - 10;
      alphaTarget = 0;
}

if (y <= -height)
{
      visible = false;
      active = false;
}
else
{
	visible = true;
}