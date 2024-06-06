// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_readable(seconds){
var numhours = floor(((seconds % 31536000) % 86400) / 3600);
var numminutes = floor((((seconds % 31536000) % 86400) % 3600) / 60);
var numseconds = floor(((seconds % 31536000) % 86400) % 3600) % 60;
if string_length(string(numseconds)) < 2
	numseconds = "0" + string(numseconds)
if numhours > 0
	return string(numhours) + ":" + string(numminutes) + ":" + string(numseconds)
else
	return string(numminutes) + ":" + string(numseconds)
}