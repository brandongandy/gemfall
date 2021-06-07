// Script
function scr_toggle_pause_game(_pause)
{	
	if (_pause == undefined)
	{
		global.game_paused = !global.game_paused;
	}
	else
	{
		global.game_paused = _pause;
	}
	
	if (global.game_paused)
	{
		show_debug_message("Pausing the game.");
	}
	else
	{
		show_debug_message("Unpausing the game.");
	}
	
	
	if (global.game_paused)
	{
		with (all)
		{
			game_paused_image_speed = image_speed;
			image_speed = 0;
		}
	}
	else
	{
		with (all)
		{
			if (variable_instance_exists(id, "game_paused_image_speed"))
			{
				image_speed = game_paused_image_speed;
			}
		}
	}
}