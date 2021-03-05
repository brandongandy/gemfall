/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("L")))
{
	time_paused = !time_paused;
}

if (draw_daylight)
{
	#region Setup day phases and colors
	var _darks, _colors;
	if (hours > phase.sunrise && hours <= phase.daytime)
	{
		// sunrise
		_darks = [max_darkness, 0.2];
		_colors = [merge_color(c_black, c_navy, 0.3), c_orange];
		phase_start = phase.sunrise;
		phase_end = phase.daytime;
	}
	else if (hours > phase.daytime && hours <= phase.sunset)
	{
		// daytime
		_darks = [0.2, 0, 0, 0, 0.2];
		_colors = [c_orange, c_orange, c_white, c_orange, c_orange];
		phase_start = phase.daytime;
		phase_end = phase.sunset;
	}
	else if (hours > phase.sunset && hours <= phase.nighttime)
	{
		// sunset
		_darks = [0.2, max_darkness];
		_colors = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3)];
		phase_start = phase.sunset;
		phase_end = phase.nighttime;
	}
	else
	{
		// nighttime
		_darks = [max_darkness];
		_colors = [merge_color(c_black, c_navy, 0.3)];
		phase_start = phase.nighttime;
		phase_end = phase.sunrise;			
	}
		
	#endregion
		
	#region Alter darkness and colors
	// colors
	if (phase_start == phase.nighttime)
	{
		light_color = _colors[0];
	}
	else
	{
		var _cc = ((hours - phase_start) / (phase_end - phase_start)) *
			(array_length(_colors) - 1);
		var _c1 = _colors[floor(_cc)];
		var _c2 = _colors[ceil(_cc)];
		
		light_color = merge_color(_c1, _c2, _cc - floor(_cc));
	}		
		
	// darkness
	if (phase_start == phase.nighttime)
	{
		darkness = _darks[0];
	}
	else
	{
		var _dd = ((hours - phase_start) / (phase_end - phase_start)) *
			(array_length(_darks) - 1);
		var _d1 = _darks[floor(_dd)];
		var _d2 = _darks[ceil(_dd)];
		
		darkness = lerp(_d1, _d2, _dd - floor(_dd));
	}
		
	#endregion
}

if (!time_paused)
{
	seconds += time_increment;
	minutes = seconds / 60;
	hours = minutes / 60;

	#region cycle check
	if (hours >= 24)
	{
		seconds = 0;
		day++;
	
		if (day > 30)
		{
			day = 1;
			season++;
		
			if (season > 4)
			{
				season = 1;
				year++;
			}
		}
	}
	#endregion
}