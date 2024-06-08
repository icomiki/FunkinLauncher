// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_readable(seconds){
	var basenum = (seconds % 31536000) % 86400;
	var numhours = floor(basenum / 3600);
	var numminutes = floor((basenum % 3600) / 60);
	var numseconds = floor(basenum % 3600) % 60;
	if string_length(string(numseconds)) < 2
		numseconds = "0" + string(numseconds)
	if numhours > 0
	{
		if numminutes < 10
			numminutes = "0" + string(numminutes)
		return string(numhours) + ":" + string(numminutes) + ":" + string(numseconds)
	}
	else
		return string(numminutes) + ":" + string(numseconds)
}

function scr_get_readable_secs(seconds){
	var numhours = floor(seconds / 3600);
	var numminutes = floor((seconds % 3600) / 60);
	var numseconds = floor(seconds % 3600) % 60;
	if string_length(string(numseconds)) < 2
		numseconds = "0" + string(numseconds)
	if numhours > 0
	{
		if numminutes < 10
			numminutes = "0" + string(numminutes)
		return string(numhours) + ":" + string(numminutes) + ":" + string(numseconds)
	}
	else
		return string(numminutes) + ":" + string(numseconds)
}