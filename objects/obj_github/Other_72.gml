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