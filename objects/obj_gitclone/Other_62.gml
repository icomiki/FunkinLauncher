var r_str = "";
if (ds_map_find_value(async_load, "id") == berg)
{
	if (ds_map_find_value(async_load, "status") == 0)
	{
		r_str = ds_map_find_value(async_load, "result")
		r_str = json_parse(r_str)
		try
		{
		var hehe = r_str[0].sha
		}
		catch(e)
		{
		show_debug_message("Unavailable repo; telling user to try again");
		buildInfo = invalid_clone;
		exit;
		}
		arrayIndex = 0;
		buildInfo = r_str;
	}
	
}

if (ds_map_find_value(async_load, "id") == bloh)
{
    var status = ds_map_find_value(async_load, "status");
    if (status == 0)
    {
        path = ds_map_find_value(async_load, "result");
		textlol = "Unzipping..."
        bent = zip_unzip_async(path, working_directory + "clones/" + repo);
    }
	else if (status == 1)
	{
		var uhoh = ds_map_find_value(async_load, "sizeDownloaded");
		
		//github doesn't provide a size :(
		textlol = string(uhoh / 1000000) + "MB | N/A"
	}
}

if (ds_map_find_value(async_load, "id") == bang)
{
	if (ds_map_find_value(async_load, "status") == 0)
	{
		r_str = ds_map_find_value(async_load, "result")
		r_str = json_parse(r_str)
		branch = r_str.default_branch
	}
}