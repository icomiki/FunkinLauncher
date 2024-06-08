var r_str = "";
if (ds_map_find_value(async_load, "id") == berg)
{
	if (ds_map_find_value(async_load, "status") == 0)
	{
		r_str = ds_map_find_value(async_load, "result")
		r_str = json_parse(r_str)
		try
		{
			var hehe = r_str.workflow_runs[0]
		}
		catch(e)
		{
			show_debug_message("Unavailable repo; telling user to try again")
			buildInfo = {workflow_runs: [{display_title: "Invalid repository or no artifacts found", 
				name: "N/A", run_started_at: "N/AT", head_sha: "N/A", actor: {login: "N/A"}, head_commit: {message: "N/A"}}]};
			exit;
		}
		arrayIndex = 0;
		buildInfo = r_str;
		// ok time for precalc Time :thinking:
		array_foreach(buildInfo.workflow_runs, function(e, i)
		{
			// no more Z time
			var tsplit = string_split(string_replace(e.run_started_at, "Z", ""), "T");
			var datesplit = string_split(tsplit[0], "-");
			var timesplit = string_split(tsplit[1], ":");
	
			var year = real(datesplit[0]);
			var month = real(datesplit[1]);
			var day = real(datesplit[2]);
	
			var hour = real(timesplit[0]);
			var minute = real(timesplit[1]);
			var second = real(timesplit[2]);
			
			// do smart timezone adjustment
			var timezone = date_get_timezone();
			date_set_timezone(timezone_utc);
			var date = date_create_datetime(year, month, day, hour, minute, second);
			date_set_timezone(timezone);
			
			// idk if date_date/datetime_string does the americaism thing so
			if (os_get_region() == "us")
			{
				var dayt = month;
				month = day;
				day = dayt;
			}
			buildInfo.workflow_runs[i].run_started_at = $"{date_time_string(date)} {day}/{month}/{year}";
		})
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
	if r_str == pointer_null
	{
		textlol = "Error!"
		exit;
	}
	r_str = json_parse(r_str)
	artifacts = r_str.artifacts
	artifactsMode = true;
	arrayIndex2 = 0;
}

if (ds_map_find_value(async_load, "id") == bloh)
{
    var status = ds_map_find_value(async_load, "status");
    if (status == 0)
    {
        path = ds_map_find_value(async_load, "result");
		textlol = "Unzipping..."
        bent = zip_unzip_async(path, working_directory + repo + buildInfo.workflow_runs[arrayIndex].head_sha);
    }
	else if (status == 1)
	{
		var uhoh = ds_map_find_value(async_load, "sizeDownloaded");
		var uhoh2 = artifacts[arrayIndex2].size_in_bytes
		// uh
		// var time = ((uhoh2 - uhoh)/380928) * 0.02 //my wifi's okay, so this is what i've landed on
		// how about Math instead?
		var microsecspast = get_timer() - startingDownloadTime;
		var percentdone = uhoh / uhoh2;
		var micsecsPerPercent = microsecspast / percentdone;
		var percentleft = 1 - percentdone;
		// microseconds to seconds
		var time = (micsecsPerPercent * percentleft) / 1000000;
		
		//inherrently quirked due to github's size mismatch
		textlol = string(clamp((uhoh/uhoh2) * 100, 0, 100)) + "% | " + scr_get_readable_secs(time)
		lightstoDraw = round(clamp((uhoh/uhoh2) * 100, 0, 100))
	}
}
