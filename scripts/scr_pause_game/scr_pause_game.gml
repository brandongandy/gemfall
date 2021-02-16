// Scrip
function scr_pause_game()
{	
	global.game_paused = !global.game_paused;
	
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