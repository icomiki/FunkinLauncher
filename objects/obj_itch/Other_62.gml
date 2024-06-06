var r_str = "";
if (ds_map_find_value(async_load, "id") == berg)
{
	if (ds_map_find_value(async_load, "status") == 0)
	{
		r_str = ds_map_find_value(async_load, "result")
		r_str = json_parse(r_str)
		show_debug_message(r_str.uploads[0])
		buildInfo = r_str;
	}
	
}
if (ds_map_find_value(async_load, "id") == bleh)
{
    if (ds_map_find_value(async_load, "status") == 0)
    {
        r_str = ds_map_find_value(async_load, "result");
    }
    else
    {
        r_str = "null";
    }
	show_debug_message(r_str)
	r_str = json_parse(r_str)
	bloh = http_get_file(r_str.url, working_directory + "/temp/" + string_split(buildInfo.uploads[arrayIndex].filename, ".")[0] + "-v" + string(buildInfo.uploads[arrayIndex].build.version) + ".zip");
}

if (ds_map_find_value(async_load, "id") == bloh)
{
    var status = ds_map_find_value(async_load, "status");
    if (status == 0)
    {
        path = ds_map_find_value(async_load, "result");
		textlol = "Unzipping..."
        bent = zip_unzip_async(path, working_directory + string_split(buildInfo.uploads[arrayIndex].filename, ".")[0] + "-v" + string(buildInfo.uploads[arrayIndex].build.version));
    }
	else if (status == 1)
	{
		var uhoh = ds_map_find_value(async_load, "sizeDownloaded");
		var uhoh2 = ds_map_find_value(async_load, "contentLength");
		
		show_debug_message(string((uhoh/uhoh2) * 100) + "%")
		textlol = string((uhoh/uhoh2) * 100) + "% | " + scr_get_readable(get_timer()/1000000)
		lightstoDraw = round((uhoh/uhoh2) * 100)
	}
}